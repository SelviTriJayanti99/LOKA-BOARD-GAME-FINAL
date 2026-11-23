-- Jalankan satu kali melalui phpMyAdmin pada database loka_cafe.
CREATE TABLE IF NOT EXISTS midtrans_payments (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  booking_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  midtrans_order_id VARCHAR(80) NOT NULL,
  midtrans_transaction_id VARCHAR(100) NULL,
  amount INT UNSIGNED NOT NULL,
  status ENUM('pending','paid','failed','refunded') NOT NULL DEFAULT 'pending',
  snap_url TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uniq_booking_payment (booking_id),
  UNIQUE KEY uniq_midtrans_payment_id (midtrans_order_id),
  INDEX idx_payment_user (user_id),
  FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
