-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2025 at 12:05 AM
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
-- Database: `quickcarz`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `booking_status` enum('pending','confirmed','active','completed','cancelled') DEFAULT 'pending',
  `payment_status` enum('pending','paid','refunded') DEFAULT 'pending',
  `pickup_location` varchar(100) DEFAULT 'Colombo Main Office',
  `special_requests` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `vehicle_id`, `pickup_date`, `return_date`, `total_days`, `total_amount`, `booking_status`, `payment_status`, `pickup_location`, `special_requests`, `created_at`) VALUES
(1, 2, 1, '2024-01-15', '2024-01-17', 2, 9000.00, 'completed', 'paid', 'Colombo Main Office', NULL, '2025-09-30 16:56:58'),
(2, 3, 4, '2024-01-20', '2024-01-22', 2, 16000.00, 'confirmed', 'paid', 'Colombo Main Office', NULL, '2025-09-30 16:56:58'),
(3, 2, 12, '2025-10-02', '2025-10-03', 1, 2000.00, 'active', 'pending', 'Colombo Main Office', '', '2025-09-30 18:43:12'),
(4, 4, 3, '2025-10-09', '2025-10-17', 8, 24000.00, 'confirmed', 'pending', 'Colombo Main Office', '', '2025-09-30 20:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` enum('complaint','suggestion','compliment','support') NOT NULL,
  `status` enum('new','read','resolved') DEFAULT 'new',
  `admin_reply` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `booking_id`, `rating`, `subject`, `message`, `type`, `status`, `admin_reply`, `created_at`) VALUES
(1, 2, 1, 5, 'Excellent Service!', 'The Toyota Axio was in perfect condition and the service was great. Highly recommended!', 'compliment', 'new', NULL, '2025-09-30 16:56:59'),
(2, 3, 2, 4, 'Good Experience', 'The Allion was comfortable and fuel efficient. Will rent again.', 'compliment', 'new', NULL, '2025-09-30 16:56:59'),
(3, 4, NULL, 5, 'bruh', 'this vehicle renting service was ass', 'compliment', 'new', NULL, '2025-09-30 19:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `maintenance_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('scheduled','in_progress','completed') DEFAULT 'scheduled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `payment_method` enum('credit_card','debit_card','cash','bank_transfer') DEFAULT 'cash',
  `payment_amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','completed','failed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `driver_license` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT 'Colombo',
  `role` enum('admin','customer') DEFAULT 'customer',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password_hash`, `first_name`, `last_name`, `phone`, `driver_license`, `address`, `city`, `role`, `is_active`, `created_at`) VALUES
(1, 'admin@quickcarz.lk', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QuickCarz', 'Admin', '+94771234567', 'ADMIN001', NULL, 'Colombo', 'admin', 1, '2025-09-30 16:56:58'),
(2, 'kamal@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Kamal', 'Perera', '+94771234568', 'B1234567', NULL, 'Colombo', 'customer', 1, '2025-09-30 16:56:58'),
(3, 'nimal@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Nimal', 'Silva', '+94771234569', 'B2345678', NULL, 'Colombo', 'customer', 1, '2025-09-30 16:56:58'),
(4, 'kamaal@email.com', '$2y$10$F8GQt8NjZz.eyYOQFKM9LOxVi2mFRHIEArpNZNr99Yu2KsTwwOE/.', 'sahan', 'dissa', '+94556894562', '12455652863', NULL, 'Colombo', 'customer', 1, '2025-09-30 19:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `license_plate` varchar(20) NOT NULL,
  `fuel_type` enum('petrol','diesel','electric','hybrid') NOT NULL,
  `transmission` enum('manual','automatic') NOT NULL,
  `seats` tinyint(4) NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  `features` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `status` enum('active','maintenance') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `brand`, `model`, `year`, `color`, `license_plate`, `fuel_type`, `transmission`, `seats`, `daily_rate`, `features`, `image_url`, `is_available`, `status`, `created_at`) VALUES
(1, 'Toyota', 'Axio', '2023', 'White', 'CAB-1234', 'petrol', 'automatic', 5, 4500.00, 'AC, Power Steering, Bluetooth, Airbags', 'toyota_axio.jpg', 1, 'active', '2025-09-30 16:56:58'),
(2, 'Perodua', 'Axia', '2024', 'Red', 'CAR-5678', 'petrol', 'automatic', 5, 3500.00, 'AC, Fuel Efficient, Compact Size', 'perodua_axia.jpg', 1, 'active', '2025-09-30 16:56:58'),
(3, 'Suzuki', 'Alto', '2023', 'Silver', 'CAR-9012', 'petrol', 'manual', 5, 3000.00, 'AC, Great Mileage, Easy Parking', 'suzuki_alto.jpg', 1, 'active', '2025-09-30 16:56:58'),
(4, 'Toyota', 'Allion', '2024', 'Black', 'CAR-3456', 'petrol', 'automatic', 5, 8000.00, 'AC, Leather Seats, Premium Sound, Sunroof', 'toyota_allion.jpg', 1, 'active', '2025-09-30 16:56:58'),
(5, 'Honda', 'Civic', '2024', 'Blue', 'CAR-7890', 'petrol', 'automatic', 5, 9500.00, 'AC, Sunroof, Navigation, LED Lights', 'honda_civic.jpg', 1, 'active', '2025-09-30 16:56:58'),
(6, 'Toyota', 'Land Cruiser', '2023', 'White', 'SUV-1234', 'diesel', 'automatic', 7, 18000.00, 'AC, 4WD, Spacious, Sunroof', 'toyota_landcruiser.jpg', 1, 'active', '2025-09-30 16:56:58'),
(7, 'Mitsubishi', 'Montero', '2024', 'Black', 'SUV-5678', 'diesel', 'automatic', 7, 15000.00, 'AC, 4WD, Roof Rails, Premium Audio', 'mitsubishi_montero.jpg', 1, 'active', '2025-09-30 16:56:58'),
(8, 'Mercedes-Benz', 'C-Class', '2024', 'Silver', 'LUX-1234', 'petrol', 'automatic', 5, 22000.00, 'Leather Seats, Premium Package, Panoramic Roof', 'mercedes_cclass.jpg', 1, 'active', '2025-09-30 16:56:58'),
(9, 'BMW', '5 Series', '2024', 'Black', 'LUX-5678', 'petrol', 'automatic', 5, 25000.00, 'Premium Sound, Sunroof, Navigation, Sport Package', 'bmw_5series.jpg', 1, 'active', '2025-09-30 16:56:58'),
(10, 'Toyota', 'Hiace', '2023', 'White', 'VAN-1234', 'diesel', 'manual', 12, 12000.00, 'AC, Spacious, Good for Groups', 'toyota_hiace.jpg', 1, 'active', '2025-09-30 16:56:58'),
(11, 'Nissan', 'Caravan', '2024', 'White', 'VAN-5678', 'diesel', 'manual', 10, 10000.00, 'AC, Comfortable Seating, Tour Vehicle', 'nissan_caravan.jpg', 1, 'active', '2025-09-30 16:56:58'),
(12, 'byd', 'atto3', '2025', 'grey', 'vdy-78745', 'electric', 'automatic', 5, 2000.00, 'ac', '68dc1855d4ecc_byd_atto3.jpeg', 1, 'active', '2025-09-30 17:50:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `idx_bookings_dates` (`pickup_date`,`return_date`),
  ADD KEY `idx_bookings_user` (`user_id`),
  ADD KEY `idx_bookings_status` (`booking_status`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `idx_feedback_user` (`user_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `idx_vehicles_available` (`is_available`,`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
