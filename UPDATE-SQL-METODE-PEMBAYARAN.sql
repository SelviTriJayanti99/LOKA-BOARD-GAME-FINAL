-- Jalankan setelah UPDATE-SQL-MIDTRANS.sql pada database LOKA yang sama.
CREATE TABLE IF NOT EXISTS manual_payments (
 booking_id INT UNSIGNED NOT NULL PRIMARY KEY,
 user_id INT UNSIGNED NOT NULL,
 method ENUM('cash','bank') NOT NULL,
 amount INT UNSIGNED NOT NULL,
 status ENUM('pending','paid') NOT NULL DEFAULT 'pending',
 confirmed_by INT UNSIGNED NULL,
 confirmed_at DATETIME NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE,
 INDEX idx_manual_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE IF NOT EXISTS payment_bank_settings (
 id TINYINT UNSIGNED NOT NULL PRIMARY KEY,
 bank_name VARCHAR(80) NOT NULL DEFAULT '',
 account_number VARCHAR(40) NOT NULL DEFAULT '',
 account_holder VARCHAR(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT IGNORE INTO payment_bank_settings (id) VALUES (1);
