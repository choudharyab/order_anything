-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2018 at 03:03 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_order_anything`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(120) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Food and Beverages', '2018-12-22', '2018-12-22'),
(2, 'Pharmacy', '2018-12-22', '2018-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `food_with_address`
--

CREATE TABLE `food_with_address` (
  `id` int(11) NOT NULL,
  `location` varchar(120) NOT NULL,
  `food_with_category_id` int(50) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_with_address`
--

INSERT INTO `food_with_address` (`id`, `location`, `food_with_category_id`, `created_at`, `updated_at`) VALUES
(1, '24x7 Sector 54, Gurgaon, Lat - 12.21, Long - 28.72', 1, '2018-12-22', '2018-12-22'),
(2, 'Big Bazaar, Sector 25, Gurgaon, Lat - 12.23, Long - 28.79', 1, '2018-12-22', '2018-12-22'),
(3, 'Apollo Medicine, Sector 63, Gurgaon, Lat - 12.25, Long - 28.52', 2, '2018-12-22', '2018-12-22'),
(4, 'Apollo Medicine, Sector 22, Gurgaon, Lat - 12.20, Long - 28.29', 2, '2018-12-22', '2018-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `food_with_categories`
--

CREATE TABLE `food_with_categories` (
  `id` int(11) NOT NULL,
  `food_name` varchar(120) NOT NULL,
  `category_id` int(120) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_with_categories`
--

INSERT INTO `food_with_categories` (`id`, `food_name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Chips ', 1, '2018-12-22', '2018-12-22'),
(2, 'Disprin ', 2, '2018-12-22', '2018-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `item_order`
--

CREATE TABLE `item_order` (
  `id` int(11) NOT NULL,
  `order_id` int(50) NOT NULL,
  `item_id` int(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_order`
--

INSERT INTO `item_order` (`id`, `order_id`, `item_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '2018-12-22', '2018-12-22'),
(2, 1, 2, 2, '2018-12-22', '2018-12-22'),
(3, 2, 2, 3, '2018-12-22', '2018-12-22'),
(4, 2, 1, 5, '2018-12-22', '2018-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `delivery_person_id` int(50) NOT NULL,
  `order_stages_id` int(50) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `delivery_person_id`, `order_stages_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, '2018-12-22', '2018-12-23'),
(2, 0, 2, 2, '2018-12-22', '2018-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `order_stages`
--

CREATE TABLE `order_stages` (
  `id` int(11) NOT NULL,
  `order_stages` varchar(120) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_stages`
--

INSERT INTO `order_stages` (`id`, `order_stages`, `created_at`, `updated_at`) VALUES
(1, 'Task Created', '2018-12-22', '2018-12-22'),
(2, 'Reached Store', '2018-12-22', '2018-12-22'),
(3, 'Items Picked', '2018-12-22', '2018-12-22'),
(4, 'Enroute', '2018-12-22', '2018-12-22'),
(5, 'Delivered ', '2018-12-22', '2018-12-22'),
(6, 'Canceled', '2018-12-22', '2018-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_type_id` int(120) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type_id`, `phone_no`, `password`, `created_at`, `updated_at`) VALUES
(1, 3, '9503476868', '123456', '2018-12-22', '2018-12-22'),
(3, 1, '9503476867', '123456', '2018-12-22', '2018-12-22'),
(4, 2, '9503476865', '123456', '2018-12-22', '2018-12-22');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Customer', '2018-12-22', '2018-12-22'),
(2, 'Delivery Person', '2018-12-22', '2018-12-22'),
(3, 'Admin', '2018-12-22', '2018-12-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_with_address`
--
ALTER TABLE `food_with_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_with_categories`
--
ALTER TABLE `food_with_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_order`
--
ALTER TABLE `item_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_stages`
--
ALTER TABLE `order_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `food_with_address`
--
ALTER TABLE `food_with_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `food_with_categories`
--
ALTER TABLE `food_with_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `item_order`
--
ALTER TABLE `item_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order_stages`
--
ALTER TABLE `order_stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
