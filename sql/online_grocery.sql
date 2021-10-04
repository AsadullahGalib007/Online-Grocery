-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2021 at 07:00 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_grocery`
--
CREATE DATABASE IF NOT EXISTS `online_grocery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `online_grocery`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_admin`:
--

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `full_name`, `username`, `password`) VALUES
(101, 'Asadullah Al Galib', 'galib', '03847129f14d98cbcba02ab00b8aadf5'),
(102, 'Bushra Sheikh', 'bushra', 'fa0f6f6768c23171b84bcef5aeb1e0c3'),
(108, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(110, 'admin2', 'admin2', 'c84258e9c39059a89ab77d846ddab909');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_category`:
--

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(9, 'Cake', 'Food_Category_788.jpg', 'Yes', 'Yes'),
(17, 'Fucka', 'Food_Category_458.jpg', 'No', 'No'),
(18, 'Pizza', 'Food_Category_857.jpg', 'Yes', 'Yes'),
(21, 'Fucka', 'Food-Category-1005.jpg', 'Yes', 'Yes'),
(25, 'Coffee', 'Food-Category-1004.jpg', 'Yes', 'Yes'),
(26, 'MoMo', 'Food_Category_77.jpg', 'Yes', 'Yes'),
(28, 'Pasta', 'Food-Category--8485.jpg', 'No', 'Yes'),
(29, 'Jhal Muri', 'Food-Category-1003.jpg', 'No', 'No'),
(38, 'nothing2', '', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_food`:
--

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(3, 'Dumplings Specials', 'Chicken Dumpling with herbs from Mountains', '5.00', 'Food-Name-3649.jpg', 6, 'Yes', 'Yes'),
(4, 'Best Burger', 'Burger with Ham, Pineapple and lots of Cheese.', '4.00', 'Food-Name-6340.jpg', 5, 'Yes', 'Yes'),
(5, 'Smoky BBQ Pizza', 'Best Firewood Pizza in Town.', '6.00', 'Food-Name-8298.jpg', 4, 'No', 'Yes'),
(6, 'Sadeko Momo', 'Best Spicy Momo for Winter', '6.00', 'Food-Name-7387.jpg', 6, 'Yes', 'Yes'),
(7, 'Mixed Pizza', 'Pizza with chicken, Ham, Buff, Mushroom and Vegetables', '10.00', 'Food-Name-7833.jpg', 4, 'Yes', 'Yes'),
(9, 'Cake', 'Burst of sweetness. Must Try the RED VELVET.', '19.00', 'Food-Name-3224.jpg', 9, 'Yes', 'Yes'),
(13, 'Pasta', 'Best pasta in town', '7.00', 'Food-Name-1003.jpg', 28, 'No', 'Yes'),
(15, 'Dalgona Coffee', 'Try this icy, fresh, chocolaty dalgona coffee', '5.00', 'Food-Name-1004.jpg', 25, 'Yes', 'Yes'),
(21, 'nothing2', 'fesdfsdfsda', '34222.00', '', 38, 'Yes', 'Yes'),
(22, 'nothing2', 'dsfasdfsdfsd', '11223343.00', 'Food-Name-1063.jpg', 38, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `f_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_order`:
--

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`, `f_id`) VALUES
(1, 'Sadeko Momo', '6.00', 3, '18.00', '2020-11-30 03:49:48', 'Delivered', 'Bradley Farrell', '+1 (576) 504-4657', 'zuhafiq@mailinator.com', 'Duis aliqua Qui lor', 0),
(2, 'Best Burger', '4.00', 4, '16.00', '2020-11-30 03:52:43', 'Delivered', 'Kelly Dillard', '+1 (908) 914-3106', 'fexekihor@mailinator.com', 'Incidunt ipsum ad d', 3),
(3, 'Mixed Pizza', '10.00', 2, '20.00', '2020-11-30 04:07:17', 'Delivered', 'Jana Bush', '+1 (562) 101-2028', 'tydujy@mailinator.com', 'Minima iure ducimus', 0),
(4, 'Cake', '19.00', 1, '19.00', '2021-10-04 14:34:59', 'On Delivery', 'Galib', '01701080021', 'abrgalib@gmail.com', 'asdfsdfsadfsdafd', 9),
(5, 'Dalgona Coffee', '5.00', 1, '5.00', '2021-10-04 14:41:40', 'On Delivery', 'Asadullah', '1234567891011', 'asadullahgalib007@gmail.com', 'dsfsdfsadfsdafwerasdf', 15),
(6, 'Dalgona Coffee', '5.00', 3, '15.00', '2021-10-04 14:49:56', 'Delivered', 'Oishe', '01778799990', 'oishe5949@gmail.com', 'Bogura', 15),
(7, 'Sadeko Momo', '6.00', 1, '6.00', '2021-10-04 18:47:19', 'Ordered', 'Asadullah Bin Rahman Galib', '1234567891901', 'abrgalib@gmail.com', 'abrgalib@gmail.com', 6),
(8, 'Dalgona Coffee', '5.00', 1, '5.00', '2021-10-04 18:47:19', 'Ordered', 'Asadullah Bin Rahman Galib', '1234567891901', 'abrgalib@gmail.com', 'abrgalib@gmail.com', 15),
(9, 'Cake', '19.00', 2, '38.00', '2021-10-04 18:47:19', 'Ordered', 'Asadullah Bin Rahman Galib', '1234567891901', 'abrgalib@gmail.com', 'abrgalib@gmail.com', 9);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor`
--

CREATE TABLE `tbl_vendor` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_vendor`:
--

--
-- Dumping data for table `tbl_vendor`
--

INSERT INTO `tbl_vendor` (`id`, `full_name`, `username`, `password`) VALUES
(1, 'Rahim Mia', 'iamRahim', '9733b92d7d60ecac9ad32ff7a5c87a3c'),
(2, 'Karim Mia', 'iamKarim', '2167a6ac80340b69f3b05b800417d6c7'),
(3, 'Asadullah Bin Rahman', 'galib', '03847129f14d98cbcba02ab00b8aadf5');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_c`
--

CREATE TABLE `tbl_v_c` (
  `v_id` int(10) UNSIGNED NOT NULL,
  `c_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_v_c`:
--   `c_id`
--       `tbl_category` -> `id`
--   `v_id`
--       `tbl_vendor` -> `id`
--   `v_id`
--       `tbl_vendor` -> `id`
--   `c_id`
--       `tbl_category` -> `id`
--

--
-- Dumping data for table `tbl_v_c`
--

INSERT INTO `tbl_v_c` (`v_id`, `c_id`) VALUES
(3, 21),
(3, 25),
(3, 26);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_f`
--

CREATE TABLE `tbl_v_f` (
  `v_id` int(10) UNSIGNED DEFAULT NULL,
  `f_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_v_f`:
--   `v_id`
--       `tbl_vendor` -> `id`
--   `f_id`
--       `tbl_food` -> `id`
--   `v_id`
--       `tbl_vendor` -> `id`
--   `f_id`
--       `tbl_food` -> `id`
--

--
-- Dumping data for table `tbl_v_f`
--

INSERT INTO `tbl_v_f` (`v_id`, `f_id`) VALUES
(3, 9),
(3, 6),
(3, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_o`
--

CREATE TABLE `tbl_v_o` (
  `v_id` int(10) UNSIGNED NOT NULL,
  `o_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONSHIPS FOR TABLE `tbl_v_o`:
--   `v_id`
--       `tbl_vendor` -> `id`
--   `o_id`
--       `tbl_order` -> `id`
--   `v_id`
--       `tbl_vendor` -> `id`
--   `o_id`
--       `tbl_order` -> `id`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_vendor`
--
ALTER TABLE `tbl_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_v_c`
--
ALTER TABLE `tbl_v_c`
  ADD KEY `id_ibfk_1` (`c_id`),
  ADD KEY `id_ibfk_2` (`v_id`);

--
-- Indexes for table `tbl_v_f`
--
ALTER TABLE `tbl_v_f`
  ADD KEY `id_ibfk_3` (`v_id`),
  ADD KEY `id_ibfk_4` (`f_id`);

--
-- Indexes for table `tbl_v_o`
--
ALTER TABLE `tbl_v_o`
  ADD KEY `id_ibfk_5` (`v_id`),
  ADD KEY `id_ibfk_6` (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_vendor`
--
ALTER TABLE `tbl_vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_v_c`
--
ALTER TABLE `tbl_v_c`
  ADD CONSTRAINT `id_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `tbl_vendor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_v_c_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `tbl_vendor` (`id`),
  ADD CONSTRAINT `tbl_v_c_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `tbl_category` (`id`);

--
-- Constraints for table `tbl_v_f`
--
ALTER TABLE `tbl_v_f`
  ADD CONSTRAINT `id_ibfk_3` FOREIGN KEY (`v_id`) REFERENCES `tbl_vendor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_ibfk_4` FOREIGN KEY (`f_id`) REFERENCES `tbl_food` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_v_f_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `tbl_vendor` (`id`),
  ADD CONSTRAINT `tbl_v_f_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `tbl_food` (`id`);

--
-- Constraints for table `tbl_v_o`
--
ALTER TABLE `tbl_v_o`
  ADD CONSTRAINT `id_ibfk_5` FOREIGN KEY (`v_id`) REFERENCES `tbl_vendor` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_ibfk_6` FOREIGN KEY (`o_id`) REFERENCES `tbl_order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_v_o_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `tbl_vendor` (`id`),
  ADD CONSTRAINT `tbl_v_o_ibfk_2` FOREIGN KEY (`o_id`) REFERENCES `tbl_order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
