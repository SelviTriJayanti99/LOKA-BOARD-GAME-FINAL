<?php
require __DIR__ . '/bootstrap.php';
$admin = require_admin();

const OSTAT = ['baru', 'diproses', 'selesai', 'dibatalkan'];
const BSTAT = ['menunggu', 'dikonfirmasi', 'selesai', 'dibatalkan'];

function one(string $sql, array $p = []) {
    $s = db()->prepare($sql);
    $s->execute($p);
    return $s->fetchColumn();
}

switch (action()) {
    case 'manual_payments':
        $r=db()->query("SELECT m.booking_id,m.method,m.amount,m.status,u.name AS user_name FROM manual_payments m JOIN users u ON u.id=m.user_id ORDER BY m.created_at DESC LIMIT 500")->fetchAll();
        $bank=db()->query('SELECT bank_name,account_number,account_holder FROM payment_bank_settings WHERE id=1')->fetch();
        out(['payments'=>$r,'bank'=>$bank]);

    case 'bank_settings':
        if ($_SERVER['REQUEST_METHOD']!=='POST') fail('Metode tidak valid.',405);
        $d=body();
        $name=trim((string)($d['bank_name']??''));$num=trim((string)($d['account_number']??''));$holder=trim((string)($d['account_holder']??''));
        if (mb_strlen($name)>80 || mb_strlen($num)>40 || mb_strlen($holder)>100) fail('Data rekening terlalu panjang.');
        if ($num!=='' && !preg_match('/^[0-9 -]{5,40}$/',$num)) fail('Nomor rekening tidak valid.');
        db()->prepare('UPDATE payment_bank_settings SET bank_name=?,account_number=?,account_holder=? WHERE id=1')->execute([$name,$num,$holder]);
        out(['ok'=>true]);

    case 'confirm_manual_payment':
        if ($_SERVER['REQUEST_METHOD']!=='POST') fail('Metode tidak valid.',405);
        $id=(int)(body()['booking_id']??0);
        $pdo=db();$pdo->beginTransaction();
        try {
            $s=$pdo->prepare('SELECT method,status FROM manual_payments WHERE booking_id=? FOR UPDATE');$s->execute([$id]);$pmt=$s->fetch();
            if (!$pmt) { $pdo->rollBack();fail('Pembayaran manual tidak ditemukan.',404); }
            if ($pmt['status']==='paid') {$pdo->commit();out(['ok'=>true]);}
            $b=$pdo->prepare('SELECT status FROM bookings WHERE id=? FOR UPDATE');$b->execute([$id]);
            if ($b->fetchColumn()==='dibatalkan') {$pdo->rollBack();fail('Booking sudah dibatalkan.',409);}
            $pdo->prepare("UPDATE manual_payments SET status='paid',confirmed_by=?,confirmed_at=NOW() WHERE booking_id=?")->execute([(int)$admin['id'],$id]);
            $pdo->prepare("UPDATE bookings SET status='dikonfirmasi' WHERE id=? AND status='menunggu'")->execute([$id]);
            $pdo->commit();out(['ok'=>true]);
        } catch(Throwable $e){if ($pdo->inTransaction()) $pdo->rollBack();throw $e;}

    case 'stats':
        out([
            'users' => (int)one("SELECT COUNT(*) FROM users WHERE role = 'user'"),
            'orders' => (int)one('SELECT COUNT(*) FROM orders'),
            'bookings' => (int)one('SELECT COUNT(*) FROM bookings'),
            'revenue' => (int)one("SELECT COALESCE(SUM(total), 0) FROM orders WHERE status = 'selesai'"),
            'orders_new' => (int)one("SELECT COUNT(*) FROM orders WHERE status = 'baru'"),
            'bookings_pending' => (int)one("SELECT COUNT(*) FROM bookings WHERE status = 'menunggu'"),
            'logins_today' => (int)one("SELECT COUNT(*) FROM login_history WHERE status = 'berhasil' AND DATE(created_at) = CURDATE()"),
        ]);

    case 'orders':
        $r = db()->query('SELECT o.id, o.item_name, o.qty, o.total, o.status, o.created_at, COALESCE(NULLIF(o.selected_game_name, \'\'), g.title) AS game_title, o.booking_id, b.booking_date, b.booking_time, u.name AS user_name, u.email AS user_email
            FROM orders o LEFT JOIN bookings b ON b.id = o.booking_id LEFT JOIN games g ON g.id = o.selected_game_id JOIN users u ON u.id = o.user_id ORDER BY o.created_at DESC, o.id DESC LIMIT 500')->fetchAll();
        out(['orders' => $r]);

    case 'order_status':
        $d = body();
        if (!in_array($d['status'] ?? '', OSTAT, true)) fail('Status tidak valid.');
        if (in_array($d['status'], ['diproses','selesai'], true)) {
            $chk=db()->prepare("SELECT COUNT(*) FROM orders o JOIN midtrans_payments m ON m.booking_id=o.booking_id WHERE o.id=? AND m.status<>'paid'");
            $chk->execute([(int)($d['id']??0)]);
            if ((int)$chk->fetchColumn()) fail('Pesanan QRIS belum lunas.',409);
            $chk=db()->prepare("SELECT COUNT(*) FROM orders o JOIN manual_payments m ON m.booking_id=o.booking_id WHERE o.id=? AND m.status<>'paid'");
            $chk->execute([(int)($d['id']??0)]);
            if ((int)$chk->fetchColumn()) fail('Pembayaran manual belum dikonfirmasi.',409);
            $chk=db()->prepare("SELECT COUNT(*) FROM orders o LEFT JOIN midtrans_payments q ON q.booking_id=o.booking_id LEFT JOIN manual_payments m ON m.booking_id=o.booking_id WHERE o.id=? AND o.booking_id IS NOT NULL AND (q.status IS NULL OR q.status<>'paid') AND (m.status IS NULL OR m.status<>'paid')");
            $chk->execute([(int)($d['id']??0)]);
            if ((int)$chk->fetchColumn()) fail('Pembayaran booking belum lunas.',409);
        }
        $s = db()->prepare('UPDATE orders SET status = ? WHERE id = ?');
        $s->execute([$d['status'], (int)($d['id'] ?? 0)]);
        out(['ok' => true]);

    case 'bookings':
        $r = db()->query('SELECT b.id, b.booking_date, b.booking_time, b.people, b.status, (SELECT COUNT(*) FROM orders o WHERE o.booking_id = b.id) AS order_count, u.name AS user_name, u.phone AS user_phone
            FROM bookings b JOIN users u ON u.id = b.user_id ORDER BY b.booking_date DESC, b.booking_time DESC, b.id DESC LIMIT 500')->fetchAll();
        out(['bookings' => $r]);

    case 'booking_status':
        $d = body();
        if (!in_array($d['status'] ?? '', BSTAT, true)) fail('Status tidak valid.');
        $id = (int)($d['id'] ?? 0);
        $pdo = db();
        $pdo->beginTransaction();
        try {
            if (in_array($d['status'], ['dikonfirmasi','selesai'], true)) {
                $chk=$pdo->prepare("SELECT COUNT(*) FROM bookings b JOIN orders o ON o.booking_id=b.id LEFT JOIN midtrans_payments m ON m.booking_id=b.id WHERE b.id=? AND (m.id IS NULL OR m.status<>'paid')");
                $chk->execute([$id]);
                $unpaidQris=(int)$chk->fetchColumn();
                $manual=$pdo->prepare("SELECT status FROM manual_payments WHERE booking_id=?");$manual->execute([$id]);
                $manualState=$manual->fetchColumn();
                $qr=$pdo->prepare("SELECT status FROM midtrans_payments WHERE booking_id=?");$qr->execute([$id]);
                $qrisState=$qr->fetchColumn();
                if ($unpaidQris || ($manualState!=='paid' && $qrisState!=='paid')) fail('Booking tidak boleh dikonfirmasi sebelum pembayaran lunas.',409);
            }
            $s = $pdo->prepare('UPDATE bookings SET status = ? WHERE id = ?');
            $s->execute([$d['status'], $id]);
            if ($d['status'] === 'dibatalkan') {
                $check = $pdo->prepare("SELECT COUNT(*) FROM orders WHERE booking_id = ? AND status IN ('diproses','selesai')");
                $check->execute([$id]);
                if ((int)$check->fetchColumn()) { $pdo->rollBack(); fail('Masih ada pesanan yang diproses/selesai. Selesaikan terlebih dahulu.', 409); }
                $pdo->prepare("UPDATE orders SET status = 'dibatalkan' WHERE booking_id = ? AND status = 'baru'")->execute([$id]);
            }
            $pdo->commit();
        } catch (Throwable $e) {if ($pdo->inTransaction()) $pdo->rollBack(); throw $e;}
        out(['ok' => true]);

    case 'menu':
        out(['menu' => db()->query('SELECT id, name, price, category, description, image_url, is_active FROM menu ORDER BY name')->fetchAll()]);

    case 'menu_save':
        $d = body();
        $name = trim((string)($d['name'] ?? ''));
        $price = (int)($d['price'] ?? 0);
        $cat = (string)($d['category'] ?? '');
        $desc = trim((string)($d['description'] ?? ''));
        $img = trim((string)($d['image_url'] ?? ''));
        $active = !empty($d['active']) ? 1 : 0;
        if ($name === '' || mb_strlen($name) > 100 || $price < 1) fail('Nama dan harga menu belum benar.');
        if (!in_array($cat, ['Makanan', 'Minuman', 'Cemilan'], true)) fail('Kategori tidak valid.');
        if (mb_strlen($desc) > 200) fail('Deskripsi maksimal 200 karakter.');
        if ($img !== '' && (strlen($img) > 255 || !preg_match('#^(https?://|img/)[^"\'<>\r\n]+$#', $img))) fail('Foto harus berupa alamat https://... atau path img/nama.jpg.');
        if (!empty($d['id'])) {
            db()->prepare('UPDATE menu SET name = ?, price = ?, category = ?, description = ?, image_url = ?, is_active = ? WHERE id = ?')
                ->execute([$name, $price, $cat, $desc, $img, $active, (int)$d['id']]);
        } else {
            db()->prepare('INSERT INTO menu (name, price, category, description, image_url, is_active) VALUES (?, ?, ?, ?, ?, ?)')
                ->execute([$name, $price, $cat, $desc, $img, $active]);
        }
        out(['ok' => true]);

    case 'menu_delete':
        $d = body();
        db()->prepare('DELETE FROM menu WHERE id = ?')->execute([(int)($d['id'] ?? 0)]);
        out(['ok' => true]);

    case 'games':
        out(['games' => db()->query('SELECT id, title, genre, min_players, max_players, duration, difficulty, description, image_url, is_available, is_active
            FROM games ORDER BY title')->fetchAll()]);

    case 'game_save':
        $d = body();
        $title = trim((string)($d['title'] ?? ''));
        $genre = trim((string)($d['genre'] ?? ''));
        $desc = trim((string)($d['description'] ?? ''));
        $img = trim((string)($d['image_url'] ?? ''));
        $min = (int)($d['min_players'] ?? 0);
        $max = (int)($d['max_players'] ?? 0);
        $dur = (int)($d['duration'] ?? 0);
        $diff = (string)($d['difficulty'] ?? '');
        $avail = !empty($d['available']) ? 1 : 0;
        $active = !empty($d['active']) ? 1 : 0;
        if ($title === '' || mb_strlen($title) > 100) fail('Judul game belum benar.');
        if ($genre === '' || mb_strlen($genre) > 30) fail('Genre belum benar (maks. 30 karakter).');
        if ($min < 1 || $max < $min || $max > 20) fail('Jumlah pemain belum benar.');
        if ($dur < 5 || $dur > 480) fail('Durasi harus 5-480 menit.');
        if (!in_array($diff, ['mudah', 'sedang', 'sulit'], true)) fail('Tingkat kesulitan tidak valid.');
        if (mb_strlen($desc) > 300) fail('Deskripsi maksimal 300 karakter.');
        if ($img !== '' && (strlen($img) > 255 || !preg_match('#^(https?://|img/)[^"\'< >\r\n]+$#', $img) || str_contains($img, '../'))) fail('Foto game harus menggunakan URL HTTPS atau path img/nama-file.jpg.');
        if (!empty($d['id'])) {
            db()->prepare('UPDATE games SET title = ?, genre = ?, min_players = ?, max_players = ?, duration = ?, difficulty = ?, description = ?, image_url = ?, is_available = ?, is_active = ? WHERE id = ?')
                ->execute([$title, $genre, $min, $max, $dur, $diff, $desc, $img, $avail, $active, (int)$d['id']]);
        } else {
            db()->prepare('INSERT INTO games (title, genre, min_players, max_players, duration, difficulty, description, image_url, is_available, is_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)')
                ->execute([$title, $genre, $min, $max, $dur, $diff, $desc, $img, $avail, $active]);
        }
        out(['ok' => true]);

    case 'game_delete':
        $d = body();
        db()->prepare('DELETE FROM games WHERE id = ?')->execute([(int)($d['id'] ?? 0)]);
        out(['ok' => true]);

    case 'users':
        $r = db()->query('SELECT u.id, u.name, u.email, u.phone, u.role,
                (SELECT COUNT(*) FROM orders o WHERE o.user_id = u.id) AS orders,
                (SELECT COUNT(*) FROM bookings b WHERE b.user_id = u.id) AS bookings
            FROM users u ORDER BY u.created_at DESC, u.id DESC')->fetchAll();
        out(['users' => $r]);

    case 'user_delete':
        $d = body();
        $id = (int)($d['id'] ?? 0);
        if ($id === (int)$admin['id']) fail('Tidak bisa menghapus akun sendiri.');
        $s = db()->prepare("DELETE FROM users WHERE id = ? AND role = 'user'");
        $s->execute([$id]);
        if (!$s->rowCount()) fail('Pengguna tidak ditemukan atau bukan akun pelanggan.', 404);
        out(['ok' => true]);

    case 'logins':
        $r = db()->query('SELECT h.id, h.email, h.status, h.ip_address, h.user_agent, h.created_at, u.name AS user_name
            FROM login_history h LEFT JOIN users u ON u.id = h.user_id
            ORDER BY h.created_at DESC, h.id DESC LIMIT 300')->fetchAll();
        out(['logins' => $r]);

    default:
        fail('Aksi tidak dikenal.', 404);
}
