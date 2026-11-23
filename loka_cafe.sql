-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2026 at 11:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loka_cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `authors` varchar(150) NOT NULL,
  `images` text NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `category_id`, `description`, `content`, `authors`, `images`, `is_published`, `created_at`, `updated_at`) VALUES
(1, 'Nongkrong yang menyenangkan bukan hanya tentang tempat', 1, '', 'Bosan dengan tempat nongkrong yang itu-itu saja? Ingin menghabiskan waktu bersama teman, keluarga, atau pasangan dengan aktivitas yang lebih seru?  Loka Boardgame Cafe hadir sebagai tempat nongkrong yang menggabungkan pengalaman kuliner dengan keseruan bermain boardgame dalam satu tempat.\n\nDi Loka, nongkrong bukan hanya tentang menikmati makanan dan minuman, tetapi juga membangun kebersamaan, menciptakan momen menyenangkan, dan menikmati permainan yang penuh tantangan.\n\n1. Nongkrong Jadi Lebih Seru dengan Boardgame\n\nBoardgame merupakan permainan yang dimainkan secara langsung bersama orang lain menggunakan papan, kartu, atau berbagai perlengkapan permainan. Aktivitas ini dapat menjadi pilihan hiburan yang menarik karena melibatkan komunikasi, strategi, kerja sama, dan persaingan yang menyenangkan.\n\nMelalui konsep boardgame cafe, Loka ingin menghadirkan pengalaman nongkrong yang lebih interaktif. Pengunjung dapat menikmati waktu bersama sambil mencoba berbagai permainan sesuai minat dan suasana kebersamaan.\n\n2. Menikmati Makanan dan Minuman Sambil Bermain\n\nKeseruan bermain tentu semakin lengkap dengan makanan dan minuman favorit. Loka Boardgame Cafe menggabungkan konsep kafe dengan hiburan boardgame sehingga pengunjung dapat menikmati keduanya dalam satu kunjungan.\n\nBaik untuk berkumpul bersama teman, menghabiskan waktu sepulang kuliah, maupun menikmati akhir pekan, kombinasi kuliner dan permainan dapat menciptakan pengalaman yang lebih berkesan.\n\n3. Melatih Strategi dan Membangun Kekompakan\n\nBermain boardgame tidak hanya memberikan hiburan. Beberapa permainan juga dapat membantu melatih kemampuan berpikir strategis, pengambilan keputusan, komunikasi, dan kerja sama tim.\n\nMelalui interaksi langsung selama permainan, pengunjung memiliki kesempatan untuk mengenal karakter dan cara berpikir teman bermain dengan lebih baik.\n\n4. Cocok untuk Berbagai Aktivitas\n\nLoka Boardgame Cafe dapat menjadi pilihan tempat berkumpul untuk berbagai kegiatan, mulai dari nongkrong santai, quality time bersama pasangan, hingga bermain bersama kelompok pertemanan.\n\nDengan menghadirkan aktivitas permainan, waktu berkumpul bisa terasa lebih hidup karena setiap pemain terlibat dalam pengalaman yang sama.\n\n5. Jelajahi Katalog dan Lakukan Pemesanan Melalui Website\n\nUntuk mempermudah pengunjung, website Loka Boardgame Cafe menyediakan fitur katalog menu, katalog boardgame, dan pemesanan.\n\nPengunjung dapat menjelajahi pilihan permainan, melihat informasi menu, serta memanfaatkan fitur pemesanan dan booking yang tersedia melalui website.\n\nKehadiran layanan digital ini menjadi bagian dari upaya Loka untuk memberikan pengalaman yang lebih praktis dan nyaman kepada pengunjung.\n\nYuk, Ciptakan Momen Seru di Loka!\n\nNongkrong yang menyenangkan bukan hanya tentang tempat, tetapi juga tentang pengalaman dan kebersamaan yang tercipta.\n\nLoka Boardgame Cafe — Makan, Minum, Main Bersama!\n\nJelajahi katalog permainan dan menu favoritmu melalui website Loka Boardgame Cafe, lalu rencanakan waktu berkumpul yang menyenangkan bersama orang-orang terdekat.', 'Selvi Tri Jayanti', '', 1, '2026-11-09 22:59:06', '2026-11-10 02:42:34'),
(2, 'Tips Memilih Boardgame Sesuai Jumlah Pemain', NULL, '', 'Pernah datang ke kafe boardgame bareng teman, lalu bingung memilih game karena ternyata cuma cocok untuk dua orang, padahal kalian berlima? Atau sebaliknya, game yang dipilih butuh banyak pemain, tapi kalian cuma berdua?\n\nSupaya nggak salah pilih, ini panduan sederhana memilih boardgame sesuai jumlah pemain.\n\nMain Berdua\n\nCocok untuk pasangan, sahabat, atau sekadar kencan santai. Game untuk dua pemain biasanya lebih fokus pada duel strategi atau saling menebak.\n\nPilih game yang memang dirancang untuk 2 pemain. Hasilnya biasanya lebih seimbang dan seru.\nCari durasi singkat. Game 15 sampai 30 menit memungkinkan kalian main beberapa ronde sambil ngobrol.\nGame kerja sama juga bisa jadi pilihan. Kalian melawan game-nya, bukan saling mengalahkan.\nMain Bertiga sampai Berempat\n\nIni jumlah yang paling ideal untuk kebanyakan boardgame. Semua orang kebagian giliran, dan permainan masih terasa mengalir.\n\nStrategi ringan seperti membangun jalur atau mengumpulkan sumber daya sangat pas di jumlah ini.\nGame kartu juga seru karena interaksi antarpemain terasa pas, tidak terlalu sepi dan tidak terlalu ramai.\nKalau ada pemain baru, pilih game dengan aturan sederhana agar semua cepat paham.\nMain Berlima sampai Delapan\n\nCocok untuk satu geng, arisan, atau acara ulang tahun. Di jumlah sebesar ini, game yang butuh giliran panjang bisa bikin pemain lain bosan menunggu.\n\nPilih game yang gilirannya cepat atau dimainkan serentak.\nGame tim sangat cocok karena semua tetap terlibat, bahkan yang sedang tidak mendapat giliran.\nGame tebak-tebakan dan permainan kata biasanya paling pecah di keramaian.\nMain Ramai-Ramai (Lebih dari 8 Orang)\n\nJangan khawatir, rombongan besar tetap bisa seru. Kuncinya, pilih game yang aturannya mudah dan nggak ada yang menunggu terlalu lama. Kalau jumlahnya terlalu banyak, kamu juga bisa membagi menjadi dua meja dengan game berbeda lalu bertukar di tengah acara.\n\nPertimbangan Lain Selain Jumlah Pemain\nUsia dan pengalaman. Kalau ada anak kecil atau pemain pemula, pilih game dengan aturan ringan.\nWaktu yang tersedia. Lagi punya satu jam atau cuma tiga puluh menit? Sesuaikan durasi game.\nSuasana yang diinginkan. Mau santai sambil ngobrol, atau mau serius adu strategi?\nMasih Bingung? Tanya Saja ke Kami\n\nSetiap kelompok punya selera sendiri, dan tim Loka Boardgame Cafe siap membantu memilihkan game yang paling cocok. Sebutkan jumlah pemain, durasi yang kamu punya, dan suasana yang diinginkan, lalu kami carikan pilihan terbaiknya.\n\nAtau intip dulu koleksi lengkap kami di katalog website, lalu ajak teman-temanmu datang dan mulai bermain.', 'Selvi', '', 1, '2026-11-10 00:17:16', '2026-11-10 00:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `people` tinyint(3) UNSIGNED NOT NULL,
  `status` enum('menunggu','dikonfirmasi','selesai','dibatalkan') NOT NULL DEFAULT 'menunggu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `booking_date`, `booking_time`, `people`, `status`, `created_at`) VALUES
(1, 1, '2026-10-31', '16:07:00', 4, 'menunggu', '2026-10-27 12:15:17'),
(2, 1, '2026-11-02', '16:00:00', 4, 'menunggu', '2026-11-02 12:39:36'),
(3, 1, '2026-11-10', '16:00:00', 4, 'menunggu', '2026-11-10 00:22:09'),
(4, 1, '2026-11-14', '19:00:00', 4, 'menunggu', '2026-11-10 00:47:58'),
(5, 1, '2026-11-10', '16:00:00', 4, 'menunggu', '2026-11-10 03:03:07'),
(6, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 04:56:38'),
(7, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 06:46:58'),
(8, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 06:49:04'),
(9, 2, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 06:50:53'),
(10, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 11:22:43'),
(11, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 11:34:15'),
(12, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 11:42:55'),
(13, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 11:45:33'),
(14, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 11:52:37'),
(15, 1, '2026-11-16', '18:00:00', 4, 'menunggu', '2026-11-16 11:54:16'),
(16, 1, '2026-11-16', '18:00:00', 4, 'menunggu', '2026-11-16 12:05:46'),
(17, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 12:13:57'),
(18, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 12:28:43'),
(19, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 12:39:58'),
(20, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 13:01:46'),
(21, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 13:04:35'),
(22, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 13:04:48'),
(23, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 13:08:56'),
(24, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 13:12:19'),
(25, 1, '2026-11-16', '16:00:00', 4, 'menunggu', '2026-11-16 13:12:29'),
(26, 1, '2026-11-17', '16:00:00', 4, 'dikonfirmasi', '2026-11-17 01:56:33'),
(27, 1, '2026-11-17', '16:00:00', 4, 'menunggu', '2026-11-17 02:05:45'),
(28, 1, '2026-11-17', '16:00:00', 4, 'dikonfirmasi', '2026-11-17 02:06:24'),
(29, 1, '2026-11-17', '16:00:00', 4, 'menunggu', '2026-11-17 03:01:04'),
(30, 1, '2026-11-17', '16:00:00', 4, 'menunggu', '2026-11-17 03:03:18'),
(31, 1, '2026-11-17', '16:00:00', 4, 'menunggu', '2026-11-17 03:04:30'),
(32, 1, '2026-11-17', '16:00:00', 4, 'menunggu', '2026-11-17 03:11:20'),
(33, 1, '2026-11-17', '16:00:00', 4, 'dikonfirmasi', '2026-11-17 03:14:42'),
(34, 1, '2026-11-17', '16:00:00', 4, 'dikonfirmasi', '2026-11-17 03:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Tips & Lifestyle', '', '2026-11-09 22:57:14', '2026-11-09 22:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `genre` varchar(30) NOT NULL,
  `min_players` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `max_players` tinyint(3) UNSIGNED NOT NULL DEFAULT 4,
  `duration` smallint(5) UNSIGNED NOT NULL DEFAULT 30,
  `difficulty` enum('mudah','sedang','sulit') NOT NULL DEFAULT 'mudah',
  `description` varchar(300) NOT NULL DEFAULT '',
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`, `genre`, `min_players`, `max_players`, `duration`, `difficulty`, `description`, `is_available`, `is_active`, `created_at`, `image_url`) VALUES
(1, 'Catan', 'Strategi', 3, 4, 90, 'sedang', 'Bangun desa dan jalan, tukar sumber daya, lalu rebut poin kemenangan lewat negosiasi yang cerdik.', 1, 1, '2026-11-02 12:36:57', 'img/catan game.jpg'),
(2, 'Ticket to Ride', 'Keluarga', 2, 5, 60, 'mudah', 'Kumpulkan kartu kereta dan sambungkan kota-kota lewat jalur rel terpanjang.', 1, 1, '2026-11-02 12:36:57', 'img/Ticket to Ride game.jpeg'),
(3, 'Carcassonne', 'Keluarga', 2, 5, 45, 'mudah', 'Susun ubin demi ubin menjadi kota, jalan, dan ladang, lalu taruh pionmu di tempat paling menguntungkan.', 1, 1, '2026-11-02 12:36:57', 'img/Carcassonne game.jpeg'),
(4, 'Pandemic', 'Kooperatif', 2, 4, 45, 'sedang', 'Satu tim melawan penyebaran penyakit di seluruh dunia. Menang atau kalah bersama-sama.', 1, 1, '2026-11-02 12:36:57', 'img/Pandemic game.jpg'),
(5, 'Forbidden Island', 'Kooperatif', 2, 4, 30, 'mudah', 'Kumpulkan harta dan kabur dari pulau yang perlahan tenggelam sebelum terlambat.', 1, 1, '2026-11-02 12:36:57', 'img/Forbidden Island game.jpg'),
(6, 'Codenames', 'Party', 4, 8, 20, 'mudah', 'Dua tim saling menebak kata rahasia lewat satu petunjuk dari kapten masing-masing.', 1, 1, '2026-11-02 12:36:57', 'img/codenames game.jpeg'),
(7, 'Dixit', 'Party', 3, 6, 30, 'mudah', 'Tebak kartu bergambar surealis dari petunjuk yang tidak terlalu jelas, tapi juga tidak terlalu samar.', 1, 1, '2026-11-02 12:36:57', 'img/Dixit game.jpeg'),
(8, 'Exploding Kittens', 'Party', 2, 5, 15, 'mudah', 'Kartu cepat penuh kejutan. Hindari kucing meledak dan jebak lawanmu.', 1, 1, '2026-11-02 12:36:57', 'img/Exploding Kittens game.jpeg'),
(9, 'Splendor', 'Strategi', 2, 4, 30, 'mudah', 'Kumpulkan permata, beli kartu pengembangan, dan jadilah pedagang paling disegani.', 1, 1, '2026-11-02 12:36:57', 'img/splendor game.jpeg'),
(10, 'Azul', 'Abstrak', 2, 4, 40, 'mudah', 'Pilih ubin warna-warni dan susun mozaik di papanmu dengan perhitungan yang rapi.', 1, 1, '2026-11-02 12:36:57', 'img/azul game.jpeg'),
(11, '7 Wonders', 'Strategi', 3, 7, 30, 'sedang', 'Kembangkan peradabanmu selama tiga zaman lewat kartu, dan bangun keajaiban dunia.', 1, 1, '2026-11-02 12:36:57', 'img/7 wonders game.jpeg'),
(12, 'Terraforming Mars', 'Strategi', 1, 5, 120, 'sulit', 'Ubah Mars menjadi planet layak huni dengan membangun korporasi dan mengelola sumber daya.', 1, 1, '2026-11-02 12:36:57', 'img/Terraforming Mars game.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `hero_sections`
--

CREATE TABLE `hero_sections` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `badge` varchar(100) NOT NULL,
  `title` varchar(150) NOT NULL,
  `highlight` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `catalog_label` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hero_sections`
--

INSERT INTO `hero_sections` (`id`, `badge`, `title`, `highlight`, `description`, `image_url`, `catalog_label`, `created_at`, `updated_at`) VALUES
(1, 'Boardgame Cafe #1 di Kota', 'Makan, Minum &', 'Main Bersama', 'Loka Boardgame Cafe: pesan menu, booking meja, dan sewa boardgame dari satu akun.', 'https://i.pinimg.com/736x/06/ac/71/06ac7184a1c4759c108fe1c298d99b08.jpg', 'Lihat katalog', '2026-11-09 14:38:31', '2026-11-09 23:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `status` enum('berhasil','gagal','keluar') NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`id`, `user_id`, `email`, `status`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 12:12:08'),
(2, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 12:17:29'),
(3, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 12:18:30'),
(4, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 12:34:09'),
(5, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 12:35:16'),
(6, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 12:41:29'),
(7, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 13:22:21'),
(8, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 13:22:35'),
(9, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-10-27 13:22:51'),
(10, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-11-02 12:20:52'),
(11, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-11-02 12:35:17'),
(12, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-11-02 12:35:25'),
(13, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-11-02 12:39:51'),
(14, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-11-02 12:40:34'),
(15, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', '2026-11-02 12:40:48'),
(16, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 12:15:19'),
(17, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 12:35:45'),
(18, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 15:46:52'),
(19, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 15:48:38'),
(20, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 22:53:25'),
(21, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:23:24'),
(22, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:27:30'),
(23, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:28:29'),
(24, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:28:43'),
(25, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:49:59'),
(26, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:50:34'),
(27, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:50:35'),
(28, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:50:39'),
(29, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:53:46'),
(30, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-09 23:54:03'),
(31, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:14:44'),
(32, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:16:36'),
(33, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:21:10'),
(34, 1, 'sjayanti940@gmail.com', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:21:18'),
(35, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:21:21'),
(36, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:29:55'),
(37, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:30:05'),
(38, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:36:05'),
(39, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 00:37:53'),
(40, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 02:34:55'),
(41, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 02:47:08'),
(42, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 02:53:04'),
(43, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 02:53:08'),
(44, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 02:53:18'),
(45, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 02:53:29'),
(46, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 03:02:01'),
(47, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 03:02:13'),
(48, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 03:03:20'),
(49, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 03:04:44'),
(50, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 04:02:52'),
(51, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 04:02:53'),
(52, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 04:02:57'),
(53, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-10 04:03:05'),
(54, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-14 12:04:20'),
(55, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 04:56:22'),
(56, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 06:46:52'),
(57, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 06:49:16'),
(58, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 06:49:23'),
(59, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 06:49:27'),
(60, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 11:22:37'),
(61, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 11:25:02'),
(62, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 11:25:13'),
(63, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 11:33:57'),
(64, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 11:34:07'),
(65, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 13:04:55'),
(66, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 13:05:07'),
(67, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 13:05:11'),
(68, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 13:05:13'),
(69, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 13:05:17'),
(70, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 13:08:36'),
(71, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-16 13:08:45'),
(72, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:53:50'),
(73, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:56:37'),
(74, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:56:52'),
(75, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:56:57'),
(76, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:56:58'),
(77, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:57:02'),
(78, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:57:03'),
(79, 2, 'admin@loka.id', 'gagal', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:57:05'),
(80, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 01:57:10'),
(81, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:04:46'),
(82, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:04:58'),
(83, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:09:09'),
(84, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:09:28'),
(85, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:13:42'),
(86, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:13:52'),
(87, 1, 'sjayanti940@gmail.com', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:14:54'),
(88, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 02:15:03'),
(89, 2, 'admin@loka.id', 'keluar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 03:00:42'),
(90, 1, 'sjayanti940@gmail.com', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', '2026-11-17 03:00:52'),
(91, 2, 'admin@loka.id', 'berhasil', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36 Edg/158.0.0.0', '2026-11-23 09:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `manual_payments`
--

CREATE TABLE `manual_payments` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method` enum('cash','bank') NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `confirmed_by` int(10) UNSIGNED DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manual_payments`
--

INSERT INTO `manual_payments` (`booking_id`, `user_id`, `method`, `amount`, `status`, `confirmed_by`, `confirmed_at`, `created_at`) VALUES
(22, 1, 'cash', 25000, 'pending', NULL, NULL, '2026-11-16 13:04:48'),
(23, 1, 'bank', 25000, 'pending', NULL, NULL, '2026-11-16 13:08:56'),
(24, 1, 'bank', 25000, 'pending', NULL, NULL, '2026-11-16 13:12:19'),
(26, 1, 'bank', 25000, 'paid', 2, '2026-11-17 09:58:45', '2026-11-17 01:56:33'),
(28, 1, 'bank', 25000, 'paid', 2, '2026-11-17 10:47:22', '2026-11-17 02:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `category` varchar(30) NOT NULL DEFAULT 'Makanan',
  `description` varchar(200) NOT NULL DEFAULT '',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `price`, `category`, `description`, `image_url`, `is_active`, `created_at`) VALUES
(1, 'Kopi Susu Loka', 22000, 'Minuman', 'Kopi susu andalan Loka, pas menemani sesi main panjang.', 'img/Kopi susu loka.jpg', 1, '2026-10-27 12:11:26'),
(2, 'Matcha Latte', 25000, 'Minuman', 'Matcha creamy dengan susu, disajikan dingin atau hangat.', 'img/matcha latte.jpg', 1, '2026-10-27 12:11:26'),
(3, 'Es Teh Lemon', 15000, 'Minuman', 'Teh dingin dengan perasan lemon segar.', 'img/es teh lemon.jpg', 1, '2026-10-27 12:11:26'),
(4, 'Kentang Goreng', 20000, 'Cemilan', 'Kentang goreng renyah, enak dimakan sambil main.', 'img/Kentang Goreng.jpg', 1, '2026-10-27 12:11:26'),
(5, 'Mie Goreng Loka', 28000, 'Makanan', 'Mie goreng bumbu rumahan dengan telur dan sayuran.', 'img/Mie Goreng Loka.jpg', 1, '2026-10-27 12:11:26'),
(6, 'Roti Bakar Coklat', 18000, 'Cemilan', 'Roti bakar tebal dengan selai coklat.', 'img/Roti bakar coklat.jpeg', 1, '2026-10-27 12:11:26'),
(7, 'Bakso Loka', 25000, 'Makanan', 'Bakso sapi kenyal dengan mie, bihun, dan kuah kaldu hangat.', 'img/Bakso Loka.jpeg', 1, '2026-11-02 12:33:39'),
(8, 'Mie Ayam Bakso', 27000, 'Makanan', 'Mie ayam dengan topping bakso dan pangsit goreng.', 'img/Mie ayam loka.jpg', 1, '2026-11-02 12:33:39'),
(9, 'Nasi Goreng Spesial', 28000, 'Makanan', 'Nasi goreng dengan telur, ayam suwir, dan acar.', 'img/Nasi Goreng Loka spesial.jpg', 1, '2026-11-02 12:33:40'),
(10, 'Chicken Katsu Rice', 32000, 'Makanan', 'Ayam katsu renyah dengan nasi hangat dan saus spesial.', 'img/chicken katsu loka.jpg', 1, '2026-11-02 12:33:40'),
(11, 'Cappuccino', 24000, 'Minuman', 'Espresso dengan susu berbusa yang lembut.', 'img/capuccino loka.jpg', 1, '2026-11-02 12:33:40'),
(12, 'Es Teh Manis', 8000, 'Minuman', 'Teh dingin manis yang menyegarkan.', 'img/es teh manis.jpg', 1, '2026-11-02 12:33:40'),
(13, 'Es Jeruk', 12000, 'Minuman', 'Jeruk peras dengan es batu.', 'img/es jeruk.jpg', 1, '2026-11-02 12:33:40'),
(14, 'Pisang Goreng', 15000, 'Cemilan', 'Pisang goreng yang renyah di luar, lembut di dalam.', 'img/Pisang Goreng Sambal.jpg', 1, '2026-11-02 12:33:40'),
(15, 'Tahu Crispy', 16000, 'Cemilan', 'Tahu goreng tepung renyah dengan sambal.', 'img/Tahu Crispy.jpeg', 1, '2026-11-02 12:33:40'),
(16, 'Chicken', 20, 'Makanan', '', 'https://tse3.mm.bing.net/th/id/OIP.hCZ5VRM21kS5A0CHaA1VuQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', 1, '2026-11-10 02:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `midtrans_payments`
--

CREATE TABLE `midtrans_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `midtrans_order_id` varchar(80) NOT NULL,
  `midtrans_transaction_id` varchar(100) DEFAULT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','paid','failed','refunded') NOT NULL DEFAULT 'pending',
  `snap_url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `midtrans_payments`
--

INSERT INTO `midtrans_payments` (`id`, `booking_id`, `user_id`, `midtrans_order_id`, `midtrans_transaction_id`, `amount`, `status`, `snap_url`, `created_at`, `updated_at`) VALUES
(1, 11, 1, 'LOKA-11-bfc05297', NULL, 25020, 'pending', 'https://app.sandbox.midtrans.com/snap/v4/redirection/00fc9502-efec-4a51-a3a0-0e471d60f3b3', '2026-11-16 11:34:18', '2026-11-16 11:34:18'),
(2, 18, 1, 'LOKA-18-3a30a8e3', '04c3bea8-0dfc-4fe6-920f-80d854a75e57', 25000, 'pending', 'https://api.sandbox.midtrans.com/v2/qris/04c3bea8-0dfc-4fe6-920f-80d854a75e57/qr-code', '2026-11-16 12:28:45', '2026-11-16 12:30:59'),
(3, 21, 1, 'LOKA-21-b84ca54e', '37f7086b-a33d-42fc-88f9-727dcb212927', 32000, 'pending', 'https://api.sandbox.midtrans.com/v2/qris/37f7086b-a33d-42fc-88f9-727dcb212927/qr-code', '2026-11-16 13:04:38', '2026-11-16 13:04:47'),
(4, 25, 1, 'LOKA-25-511203ce', 'fb82ceda-b925-4b23-867b-0ddb86700cb5', 27000, 'pending', 'https://api.sandbox.midtrans.com/v2/qris/fb82ceda-b925-4b23-867b-0ddb86700cb5/qr-code', '2026-11-16 13:12:31', '2026-11-16 13:12:39'),
(5, 27, 1, 'LOKA-27-87cd030c', 'ede890bd-0fc2-43b5-b425-c196b5340f28', 57000, 'pending', 'https://api.sandbox.midtrans.com/v2/qris/ede890bd-0fc2-43b5-b425-c196b5340f28/qr-code', '2026-11-17 02:05:47', '2026-11-17 02:06:13'),
(6, 30, 1, 'LOKA-30-f395fa29', 'c4251ab3-9b0d-4c30-895a-e05f7b737dbd', 32000, 'pending', 'https://api.sandbox.midtrans.com/v2/qris/c4251ab3-9b0d-4c30-895a-e05f7b737dbd/qr-code', '2026-11-17 03:03:20', '2026-11-17 03:03:57'),
(7, 31, 1, 'LOKA-31-71128fef', 'c1d93568-eb41-4a3f-aece-9065367d9de7', 25000, 'pending', 'https://api.sandbox.midtrans.com/v2/qris/c1d93568-eb41-4a3f-aece-9065367d9de7/qr-code', '2026-11-17 03:04:31', '2026-11-17 03:05:13'),
(8, 32, 1, 'LOKA-32-834a5ede', '7e7df7d9-fabe-4ed8-940d-f8f4cf8d6a64', 25000, 'pending', 'https://api.sandbox.midtrans.com/v2/qris/7e7df7d9-fabe-4ed8-940d-f8f4cf8d6a64/qr-code', '2026-11-17 03:11:22', '2026-11-17 03:14:33'),
(9, 33, 1, 'LOKA-33-763a8fde', 'b14440c6-1d76-479c-85b4-39707fb5d482', 25000, 'paid', 'https://api.sandbox.midtrans.com/v2/qris/b14440c6-1d76-479c-85b4-39707fb5d482/qr-code', '2026-11-17 03:14:44', '2026-11-17 03:17:46'),
(10, 34, 1, 'LOKA-34-74ff9a42', 'c08e8c53-bb9f-4230-93d0-cc810029f279', 25000, 'paid', 'https://api.sandbox.midtrans.com/v2/qris/c08e8c53-bb9f-4230-93d0-cc810029f279/qr-code', '2026-11-17 03:18:28', '2026-11-17 03:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `networkings`
--

CREATE TABLE `networkings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `networkings`
--

INSERT INTO `networkings` (`id`, `name`, `url`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Loka BoardGame Cafe', 'https://www.instagram.com/lokaboardgamecafe/', '', 1, '2026-11-09 23:04:39', '2026-11-09 23:04:39');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `selected_game_id` int(10) UNSIGNED DEFAULT NULL,
  `selected_game_name` varchar(100) DEFAULT NULL,
  `booking_id` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(100) NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `status` enum('baru','diproses','selesai','dibatalkan') NOT NULL DEFAULT 'baru',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `menu_id`, `selected_game_id`, `selected_game_name`, `booking_id`, `item_name`, `qty`, `total`, `status`, `created_at`) VALUES
(1, 1, 5, NULL, NULL, NULL, 'Mie Goreng Loka', 1, 28000, 'baru', '2026-10-27 12:13:41'),
(2, 1, 3, NULL, NULL, NULL, 'Es Teh Lemon', 1, 15000, 'baru', '2026-10-27 12:13:57'),
(3, 1, 3, NULL, NULL, NULL, 'Es Teh Lemon', 1, 15000, 'selesai', '2026-10-27 12:13:59'),
(4, 1, 6, NULL, NULL, NULL, 'Roti Bakar Coklat', 1, 18000, 'baru', '2026-11-02 12:39:19'),
(5, 1, 10, NULL, NULL, NULL, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-02 12:39:19'),
(6, 1, 3, NULL, NULL, NULL, 'Es Teh Lemon', 1, 15000, 'baru', '2026-11-02 12:39:19'),
(7, 1, 10, 10, 'Azul', NULL, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-09 23:56:19'),
(8, 1, 10, 10, 'Azul', NULL, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-09 23:57:00'),
(9, 1, 11, 10, 'Azul', NULL, 'Cappuccino', 1, 24000, 'baru', '2026-11-09 23:57:00'),
(10, 1, 7, 5, 'Forbidden Island', NULL, 'Bakso Loka', 1, 25000, 'baru', '2026-11-10 00:01:52'),
(11, 1, 5, 5, 'Forbidden Island', NULL, 'Mie Goreng Loka', 1, 28000, 'baru', '2026-11-10 00:01:52'),
(12, 1, 10, 5, 'Forbidden Island', NULL, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-10 00:12:05'),
(13, 1, 10, 3, 'Carcassonne', NULL, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-10 00:12:21'),
(14, 1, 10, 3, 'Carcassonne', NULL, 'Chicken Katsu Rice', 2, 64000, 'baru', '2026-11-10 00:12:59'),
(15, 1, 10, 3, 'Carcassonne', NULL, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-10 00:13:29'),
(16, 1, 10, 12, 'Terraforming Mars', NULL, 'Chicken Katsu Rice', 1, 32000, 'diproses', '2026-11-10 00:21:46'),
(17, 1, 10, 10, 'Azul', NULL, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-10 00:38:00'),
(18, 1, 10, 10, 'Azul', 4, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-10 00:47:58'),
(19, 1, 3, 10, 'Azul', 4, 'Es Teh Lemon', 1, 15000, 'baru', '2026-11-10 00:47:58'),
(20, 1, 1, 10, 'Azul', 4, 'Kopi Susu Loka', 1, 22000, 'baru', '2026-11-10 00:47:58'),
(21, 1, 12, 10, 'Azul', 4, 'Es Teh Manis', 1, 8000, 'baru', '2026-11-10 00:47:58'),
(22, 1, 15, 10, 'Azul', 4, 'Tahu Crispy', 1, 16000, 'baru', '2026-11-10 00:47:58'),
(23, 1, 16, 12, 'Terraforming Mars', 5, 'Chicken', 1, 20, 'baru', '2026-11-10 03:03:07'),
(24, 1, 7, 12, 'Terraforming Mars', 5, 'Bakso Loka', 1, 25000, 'baru', '2026-11-10 03:03:07'),
(25, 1, 16, 12, 'Terraforming Mars', 6, 'Chicken', 1, 20, 'baru', '2026-11-16 04:56:38'),
(26, 1, 16, 5, 'Forbidden Island', 7, 'Chicken', 1, 20, 'baru', '2026-11-16 06:46:58'),
(27, 1, 16, NULL, NULL, 8, 'Chicken', 1, 20, 'selesai', '2026-11-16 06:49:04'),
(28, 2, 16, 5, 'Forbidden Island', 9, 'Chicken', 1, 20, 'baru', '2026-11-16 06:50:53'),
(29, 1, 16, 10, 'Azul', 10, 'Chicken', 1, 20, 'dibatalkan', '2026-11-16 11:22:43'),
(30, 1, 16, NULL, NULL, 11, 'Chicken', 1, 20, 'baru', '2026-11-16 11:34:15'),
(31, 1, 7, NULL, NULL, 11, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 11:34:15'),
(32, 1, 16, NULL, NULL, 12, 'Chicken', 1, 20, 'baru', '2026-11-16 11:42:55'),
(33, 1, 16, NULL, NULL, 13, 'Chicken', 2, 40, 'baru', '2026-11-16 11:45:33'),
(34, 1, 7, NULL, NULL, 14, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 11:52:37'),
(35, 1, 7, NULL, NULL, 15, 'Bakso Loka', 2, 50000, 'baru', '2026-11-16 11:54:16'),
(36, 1, 7, NULL, NULL, 16, 'Bakso Loka', 2, 50000, 'baru', '2026-11-16 12:05:46'),
(37, 1, 7, NULL, NULL, 17, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 12:13:57'),
(38, 1, 7, NULL, NULL, 18, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 12:28:43'),
(39, 1, 7, NULL, NULL, 19, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 12:39:58'),
(40, 1, 7, NULL, NULL, 20, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 13:01:46'),
(41, 1, 10, NULL, NULL, 21, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-16 13:04:35'),
(42, 1, 7, NULL, NULL, 22, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 13:04:48'),
(43, 1, 7, NULL, NULL, 23, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 13:08:56'),
(44, 1, 7, NULL, NULL, 24, 'Bakso Loka', 1, 25000, 'baru', '2026-11-16 13:12:19'),
(45, 1, 8, NULL, NULL, 25, 'Mie Ayam Bakso', 1, 27000, 'baru', '2026-11-16 13:12:29'),
(46, 1, 7, NULL, NULL, 26, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 01:56:33'),
(47, 1, 7, NULL, NULL, 27, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 02:05:45'),
(48, 1, 10, NULL, NULL, 27, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-17 02:05:45'),
(49, 1, 7, NULL, NULL, 28, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 02:06:24'),
(50, 1, 7, NULL, NULL, 29, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 03:01:04'),
(51, 1, 10, NULL, NULL, 30, 'Chicken Katsu Rice', 1, 32000, 'baru', '2026-11-17 03:03:18'),
(52, 1, 7, NULL, NULL, 31, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 03:04:30'),
(53, 1, 7, 1, 'Catan', 32, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 03:11:20'),
(54, 1, 7, NULL, NULL, 33, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 03:14:42'),
(55, 1, 7, NULL, NULL, 34, 'Bakso Loka', 1, 25000, 'baru', '2026-11-17 03:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_pages` varchar(150) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `authors` varchar(150) NOT NULL,
  `images` text NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_bank_settings`
--

CREATE TABLE `payment_bank_settings` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `bank_name` varchar(80) NOT NULL DEFAULT '',
  `account_number` varchar(40) NOT NULL DEFAULT '',
  `account_holder` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_bank_settings`
--

INSERT INTO `payment_bank_settings` (`id`, `bank_name`, `account_number`, `account_holder`) VALUES
(1, 'SeaBank', '901474470237', 'Miska');

-- --------------------------------------------------------

--
-- Table structure for table `qris_payments`
--

CREATE TABLE `qris_payments` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(12) NOT NULL DEFAULT 'QRIS',
  `status` enum('menunggu','dilaporkan','terverifikasi','ditolak') NOT NULL DEFAULT 'menunggu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Selvi Tri Jayanti', 'sjayanti940@gmail.com', '08134036651', '$2y$10$gGxZ7qSv7cd6RfqJrdQrgeTeGAtxL9D6F39a9epqHyFzwF2Y80/Uq', 'user', '2026-10-27 12:12:08'),
(2, 'Admin Loka', 'admin@loka.id', '081200000000', '$2y$10$l1jEmIcJlR49.BMEEjVYKuAL4Iaw53V62IUmFCi297r1pAAdj4UFa', 'admin', '2026-10-27 12:16:49');

-- --------------------------------------------------------

--
-- Table structure for table `web_settings`
--

CREATE TABLE `web_settings` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `brand_name` varchar(60) NOT NULL,
  `tagline` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_settings`
--

INSERT INTO `web_settings` (`id`, `site_name`, `brand_name`, `tagline`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Loka Boardgame Cafe', 'Loka', 'Boardgame Cafe', '', '2026-11-09 14:38:31', '2026-11-09 14:38:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_sections`
--
ALTER TABLE `hero_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_login_created` (`created_at`),
  ADD KEY `idx_login_user` (`user_id`);

--
-- Indexes for table `manual_payments`
--
ALTER TABLE `manual_payments`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `idx_manual_status` (`status`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `midtrans_payments`
--
ALTER TABLE `midtrans_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_booking_payment` (`booking_id`),
  ADD UNIQUE KEY `uniq_midtrans_payment_id` (`midtrans_order_id`),
  ADD KEY `idx_payment_user` (`user_id`);

--
-- Indexes for table `networkings`
--
ALTER TABLE `networkings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `idx_selected_game_id` (`selected_game_id`),
  ADD KEY `idx_order_booking` (`booking_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_bank_settings`
--
ALTER TABLE `payment_bank_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qris_payments`
--
ALTER TABLE `qris_payments`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `idx_qris_customer` (`user_id`),
  ADD KEY `idx_qris_status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `web_settings`
--
ALTER TABLE `web_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `midtrans_payments`
--
ALTER TABLE `midtrans_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `networkings`
--
ALTER TABLE `networkings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `manual_payments`
--
ALTER TABLE `manual_payments`
  ADD CONSTRAINT `manual_payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `midtrans_payments`
--
ALTER TABLE `midtrans_payments`
  ADD CONSTRAINT `midtrans_payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `midtrans_payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
