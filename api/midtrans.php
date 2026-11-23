<?php
// Pembayaran Midtrans Snap REST API, tanpa dependensi Composer.
require_once __DIR__ . '/bootstrap.php';
function mid_config(): array {
    $f = __DIR__ . '/midtrans-config.php';
    if (!is_file($f)) fail('Midtrans belum dikonfigurasi. Salin api/midtrans-config.example.php menjadi api/midtrans-config.php dan masukkan Server Key.', 503);
    $c = require $f;
    if (empty($c['server_key']) || str_contains($c['server_key'], 'ISI_SERVER_KEY')) fail('Server Key Midtrans belum diisi.', 503);
    return $c;
}
function mid_request(string $url, string $method = 'GET', ?array $payload = null): array {
    if (!function_exists('curl_init')) fail('Aktifkan ekstensi PHP cURL pada php.ini.', 503);
    $config = mid_config();
    $ch = curl_init($url);
    curl_setopt_array($ch, [CURLOPT_RETURNTRANSFER=>true, CURLOPT_TIMEOUT=>25, CURLOPT_CONNECTTIMEOUT=>8,
        CURLOPT_CUSTOMREQUEST=>$method, CURLOPT_HTTPHEADER=>['Accept: application/json','Content-Type: application/json'],
        CURLOPT_USERPWD=>$config['server_key'].':', CURLOPT_HTTPAUTH=>CURLAUTH_BASIC,
        CURLOPT_SSL_VERIFYPEER=>true]);
    if ($payload !== null) curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload, JSON_UNESCAPED_UNICODE));
    $response = curl_exec($ch);
    $status = (int)curl_getinfo($ch, CURLINFO_RESPONSE_CODE);
    $error = curl_error($ch);
    curl_close($ch);
    if ($response === false) { error_log('Midtrans connection: '.$error); fail('Gagal menghubungi Midtrans. Coba lagi.', 502); }
    $data = json_decode($response, true);
    if ($status < 200 || $status >= 300 || !is_array($data)) {
        error_log('Midtrans HTTP '.$status.' response '.substr((string)$response, 0, 500));
        fail('Midtrans tidak menerima permintaan (HTTP '.$status.'). Periksa Server Key dan mode Sandbox.', 502);
    }
    return $data;
}
function mid_base(bool $snap=false): string {
    $c=mid_config();
    return ($snap ? ($c['production'] ? 'https://app.midtrans.com/snap/v1/transactions' : 'https://app.sandbox.midtrans.com/snap/v1/transactions') : ($c['production'] ? 'https://api.midtrans.com/v2' : 'https://api.sandbox.midtrans.com/v2'));
}
/**
 * Midtrans can return QR actions on its current Midtrans domain or
 * its older Veritrans sandbox domain. Never accept arbitrary URLs.
 */
function mid_valid_qr_url(string $url): bool {
    $parts = parse_url($url);
    if (!is_array($parts) || strtolower($parts['scheme'] ?? '') !== 'https') return false;
    if (isset($parts['user']) || isset($parts['pass']) || isset($parts['port'])) return false;
    $config=mid_config();
    $allowed = !empty($config['production'])
        ? ['api.midtrans.com', 'api.veritrans.co.id']
        : ['api.sandbox.midtrans.com', 'api.sandbox.veritrans.co.id'];
    if (!in_array(strtolower($parts['host'] ?? ''), $allowed, true)) return false;
    $path=$parts['path'] ?? '';
    return (bool)preg_match('~^/v[24]/(?:qris|gopay)/[A-Za-z0-9_-]+(?:/[A-Za-z0-9_-]+)*/qr-code(?:/)?$~', $path);
}
function mid_get_qris_url(array $charge): string {
    $actions = $charge['actions'] ?? [];
    if (!is_array($actions)) return '';
    foreach (['generate-qr-code-v2', 'generate-qr-code'] as $wanted) {
        foreach ($actions as $action) {
            if (!is_array($action) || ($action['name'] ?? '') !== $wanted) continue;
            $url=(string)($action['url'] ?? '');
            if (mid_valid_qr_url($url)) return $url;
        }
    }
    // Only non-sensitive diagnostics: action names and payment status.
    $names=array_map(static fn($a) => is_array($a) ? (string)($a['name'] ?? 'unknown') : 'invalid', $actions);
    error_log('LOKA Midtrans QRIS: no accepted QR image URL; action names='.json_encode($names).' payment_type='.($charge['payment_type']??'missing').' transaction_status='.($charge['transaction_status']??'missing'));
    return '';
}
function mid_status(string $value, ?string $fraud=''): string {
    if ($value==='settlement' || ($value==='capture' && $fraud!=='challenge')) return 'paid';
    if ($value==='capture') return 'pending';
    if (in_array($value, ['deny','cancel','expire','failure'], true)) return 'failed';
    if ($value==='refund'||$value==='partial_refund') return 'refunded';
    return 'pending';
}
function mid_apply(array $data): array {
    $orderId=(string)($data['order_id']??'');
    $gross=(int)($data['gross_amount']??0);
    $s=db()->prepare('SELECT * FROM midtrans_payments WHERE midtrans_order_id=?');
    $s->execute([$orderId]); $record=$s->fetch();
    if (!$record || $gross !== (int)$record['amount']) return ['matched'=>false];
    $state=mid_status((string)($data['transaction_status']??''),(string)($data['fraud_status']??''));
    // Jangan turunkan status pembayaran berhasil jika notif lama datang terlambat.
    if ($record['status']==='paid' && $state!=='refunded') $state='paid';
    db()->prepare('UPDATE midtrans_payments SET status=?, midtrans_transaction_id=?, updated_at=NOW() WHERE id=?')
        ->execute([$state, (string)($data['transaction_id']??''), $record['id']]);
    if ($state==='paid') {
        // Booking terpadu dikonfirmasi hanya setelah pembayaran tervalidasi.
        db()->prepare("UPDATE bookings SET status='dikonfirmasi' WHERE id=? AND status='menunggu'")->execute([(int)$record['booking_id']]);
    }
    return ['matched'=>true,'status'=>$state,'booking_id'=>(int)$record['booking_id']];
}
$act=action();
if ($act==='notification') {
    if ($_SERVER['REQUEST_METHOD']!=='POST') fail('Metode tidak valid.',405);
    $data=body(); $c=mid_config();
    $expected=hash('sha512', (string)($data['order_id']??'').(string)($data['status_code']??'').(string)($data['gross_amount']??'').$c['server_key']);
    if (empty($data['signature_key']) || !hash_equals($expected, (string)$data['signature_key'])) fail('Signature tidak valid.',403);
    $result=mid_apply($data);
    if (!$result['matched']) fail('Transaksi tidak ditemukan atau nominal tidak cocok.',404);
    out(['received'=>true]);
}
$u=require_login(); $uid=(int)$u['id'];
if ($act==='initiate') {
    if ($_SERVER['REQUEST_METHOD']!=='POST') fail('Metode tidak valid.',405);
    $bookingId=(int)(body()['booking_id']??0);
    $manual=db()->prepare('SELECT status FROM manual_payments WHERE booking_id=?');$manual->execute([$bookingId]);
    if ($manual->fetch()) fail('Booking ini menggunakan pembayaran manual.',409);
    $s=db()->prepare("SELECT b.id, b.status, u.name,u.email,u.phone, COALESCE(SUM(o.total),0) AS total FROM bookings b JOIN users u ON u.id=b.user_id LEFT JOIN orders o ON o.booking_id=b.id WHERE b.id=? AND b.user_id=? GROUP BY b.id,b.status,u.name,u.email,u.phone");
    $s->execute([$bookingId,$uid]);$booking=$s->fetch();
    if (!$booking || $booking['status']==='dibatalkan' || (int)$booking['total']<=0) fail('Booking tidak ditemukan atau tidak dapat dibayar.',404);
    $payId='LOKA-'.$bookingId;
    $lock=db()->prepare('SELECT status, snap_url FROM midtrans_payments WHERE booking_id=?');$lock->execute([$bookingId]);$old=$lock->fetch();
    if ($old && $old['status']==='paid') out(['status'=>'paid','booking_id'=>$bookingId]);
    if ($old && $old['status']==='pending' && $old['snap_url']) {
        if (str_contains($old['snap_url'], '/qr-code')) out(['status'=>'pending','qr_url'=>$old['snap_url'],'booking_id'=>$bookingId,'amount'=>(int)$booking['total']]);
        fail('Booking ini masih memakai transaksi Snap sebelumnya. Selesaikan dari tautan pembayaran lama atau buat booking baru.',409);
    }
    // Buat ID transaksi baru bila Midtrans membatalkan/mengakhiri pembayaran sebelumnya.
    $payId.='-'.bin2hex(random_bytes(4));
    $payload=['payment_type'=>'qris','qris'=>['acquirer'=>'gopay'],'transaction_details'=>['order_id'=>$payId,'gross_amount'=>(int)$booking['total']],
       'customer_details'=>['first_name'=>mb_substr($booking['name'],0,50),'email'=>$booking['email'],'phone'=>$booking['phone']],
       'item_details'=>[['id'=>'BOOKING-'.$bookingId,'price'=>(int)$booking['total'],'quantity'=>1,'name'=>'Menu & booking Loka #'.$bookingId]]];
    // Core API langsung menghasilkan QRIS dinamis, tanpa halaman daftar metode Snap.
    $snap=mid_request(mid_base().'/charge','POST',$payload);
    $qrUrl=mid_get_qris_url($snap);
    if (!$qrUrl) fail('Midtrans berhasil dihubungi, tetapi URL gambar QRIS tidak tersedia atau tidak sesuai. Periksa log PHP untuk nama action yang dikembalikan, dan pastikan QRIS Sandbox aktif.',502);
    if ($old) db()->prepare("UPDATE midtrans_payments SET midtrans_order_id=?,amount=?,status='pending',snap_url=?,midtrans_transaction_id=NULL,updated_at=NOW() WHERE booking_id=?")
        ->execute([$payId,$booking['total'],$qrUrl,$bookingId]);
    else db()->prepare("INSERT INTO midtrans_payments (booking_id,user_id,midtrans_order_id,amount,status,snap_url) VALUES (?,?,?,?, 'pending',?)")
        ->execute([$bookingId,$uid,$payId,$booking['total'],$qrUrl]);
    out(['status'=>'pending','booking_id'=>$bookingId,'qr_url'=>$qrUrl,'amount'=>(int)$booking['total']]);
}
if ($act==='status') {
    $bookingId=(int)($_GET['booking_id']??0);
    $s=db()->prepare('SELECT * FROM midtrans_payments WHERE booking_id=? AND user_id=?');$s->execute([$bookingId,$uid]);$pay=$s->fetch();
    if (!$pay) out(['status'=>'not_started']);
    if ($pay['status']==='pending') {
        // Konfirmasi status ke server Midtrans, bukan mempercayai browser.
        $remote=mid_request(mid_base().'/'.rawurlencode($pay['midtrans_order_id']).'/status');
        mid_apply($remote);
        $s->execute([$bookingId,$uid]);$pay=$s->fetch();
    }
    out(['status'=>$pay['status'],'booking_id'=>$bookingId]);
}
fail('Aksi pembayaran tidak dikenal.',404);
