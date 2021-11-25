-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 22, 2021 at 06:18 AM
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
-- Creation: Sep 15, 2021 at 07:20 AM
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
-- Creation: Sep 15, 2021 at 07:20 AM
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
(9, 'Sweets', 'Food_Category_788.jpg', 'Yes', 'Yes'),
(39, 'Fruits', 'Food_Category_979.jpg', 'Yes', 'Yes'),
(40, 'Fast Foods', 'Food_Category_344.jpg', 'No', 'Yes'),
(41, 'Vegetables', 'Food_Category_980.jpg', 'No', 'Yes'),
(42, 'Coffee', 'Food-Category-1004.jpg', 'Yes', 'Yes'),
(43, 'Oil', 'Food_Category_1025.jpg', 'No', 'Yes'),
(44, 'Frozen meat & fish', 'Food_Category_1023.jpg', 'No', 'Yes'),
(45, 'nothing', '', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--
-- Creation: Sep 16, 2021 at 07:52 AM
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
(9, 'Cake', 'Burst of sweetness. Must Try the RED VELVET. (2 Pound)', '899.00', 'Food-Name-3224.jpg', 9, 'Yes', 'Yes'),
(23, 'Mango', 'Taste the delicious seasonal mangoes. Top quality Langra / Himsagor mango will be delivered depending on current availability.', '300.00', 'Food-Name-1020.jpg', 39, 'Yes', 'Yes'),
(24, 'Burger', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a nisl bibendum nulla tincidunt tincidunt. Mauris ullamcorper, orci et lobortis semper, enim ligula aliquet augue.', '250.00', 'Food-Name-6340.jpg', 40, 'Yes', 'Yes'),
(25, 'Pizza L', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consequat ipsum ipsum, quis suscipit dui lobortis in. Sed scelerisque nulla a pulvinar gravida. Donec pulvinar. ', '550.00', 'Food-Name-7833.jpg', 40, 'Yes', 'Yes'),
(26, 'Ajwa date', ' Azwa dates are black and medium in size. In terms of nutrition, dates also have all the necessary nutrients. According to nutritionists, dates contain protein, carbohydrates, calories, sodium, iron and many other nutrients. Dates have the ability to prevent disease. Its sunnah to take 6 dates at breakfast.(500gm)', '690.00', 'Food_Name_979.png', 39, 'Yes', 'Yes'),
(27, 'Orange', 'Fresh orange. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer consequat ipsum ipsum, quis suscipit dui lobortis in. Sed scelerisque nulla a pulvinar gravida. Donec pulvinar.(1 KG)', '240.00', 'Food-Name-1011.jpg', 39, 'No', 'Yes'),
(28, 'Apple', 'An Apple a day, keep the doctor away.', '10.00', 'Food-Name-1012.jpg', 39, 'Yes', 'Yes'),
(29, 'Grape', 'Ask no questions, hear no lies. Who says grapes are sour...!!!', '17.00', 'Food-Name-1013.jpg', 39, 'Yes', 'Yes'),
(30, 'Lemon', 'Lemon reduces body fat.', '3.00', 'Food-Name-998.jpg', 39, 'Yes', 'Yes'),
(31, 'Banana', 'BaaaaaaaaaaaaNnnnnnAaaaaaaaaaaNnnnnnnAaaaaaaaaa.....!!!!!', '1.00', 'Food-Name-999.jpg', 39, 'No', 'Yes'),
(32, 'Carrot', 'Carrot', '3.00', 'Food-Name-1015.jpg', 41, 'No', 'Yes'),
(33, 'cucumber', 'cucumber', '2.00', 'Food-Name-1016.jpg', 41, 'No', 'Yes'),
(34, 'Spice', 'Spice', '23.00', 'Food-Name-1017.jpg', 41, 'Yes', 'Yes'),
(35, 'Onion', 'Onion', '2.00', 'Food-Name-1018.jpg', 41, 'No', 'Yes'),
(36, 'Garlic', 'Garlic', '2.00', 'Food-Name-1019.jpg', 9, 'No', 'Yes'),
(37, 'Nescafe Classic', 'Nescafe Classic', '5.00', 'Food-Name-1010.jpg', 42, 'No', 'Yes'),
(38, 'Nescafe Gold', 'Nescafe Gold', '50.00', 'Food-Name-1021.jpg', 42, 'Yes', 'Yes'),
(39, 'Mustard oil', 'Mustard oil', '3.00', 'Food-Name-1025.jpg', 43, 'Yes', 'Yes'),
(40, 'Soybean oil', 'Soybean oil', '3.00', 'Food-Name-1026.jpg', 43, 'No', 'Yes'),
(41, 'Black seed oil', 'It is said that black seed oil can cure anything except death.', '5.00', 'Food-Name-1027.jpg', 43, 'Yes', 'Yes'),
(42, 'Frozen Meat', 'Frozen Meat. 1 kg 500 bdt', '500.00', 'Food-Name-1023.jpg', 44, 'No', 'Yes'),
(43, 'Frozen Fish', 'Frozen fish', '200.00', 'Food-Name-1024.jpg', 9, 'No', 'Yes'),
(44, 'Momo', 'Try out the delicious Nepali momos', '100.00', 'Food-Name-3649.jpg', 40, 'Yes', 'Yes'),
(45, 'Pasta', 'Pasta', '100.00', 'Food-Name-4999.jpg', 40, 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--
-- Creation: Oct 04, 2021 at 07:49 AM
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
(9, 'Cake', '19.00', 2, '38.00', '2021-10-04 18:47:19', 'Ordered', 'Asadullah Bin Rahman Galib', '1234567891901', 'abrgalib@gmail.com', 'abrgalib@gmail.com', 9),
(10, 'Dumplings Specials', '5.00', 1, '5.00', '2021-11-19 11:11:08', 'Ordered', 'phoenix', '1234567890', 'phoenix@phoenix.com', 'phoenix', 3),
(11, 'Sadeko Momo', '6.00', 1, '6.00', '2021-11-19 11:11:08', 'Ordered', 'phoenix', '1234567890', 'phoenix@phoenix.com', 'phoenix', 6),
(12, 'Cake', '19.00', 1, '19.00', '2021-11-19 11:11:08', 'On Delivery', 'phoenix', '1234567890', 'phoenix@phoenix.com', 'phoenix', 9),
(13, 'Spice', '23.00', 1, '23.00', '2021-11-21 06:13:04', 'Ordered', 'qqqq', '0145886688', 'abc@abc.com', 'abc@abc.com', 34),
(14, 'Banana', '4.00', 1, '4.00', '2021-11-21 06:13:04', 'Ordered', 'qqqq', '0145886688', 'abc@abc.com', 'abc@abc.com', 31),
(15, 'Dalgona Coffee', '5.00', 1, '5.00', '2021-11-21 06:13:04', 'On Delivery', 'qqqq', '0145886688', 'abc@abc.com', 'abc@abc.com', 15),
(16, 'Carrot', '3.00', 1, '3.00', '2021-11-21 16:33:48', 'Ordered', 'admin', '12344556', 'abc@abc.com', 'abc@abc.com', 32);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor`
--
-- Creation: Sep 15, 2021 at 07:27 AM
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
(3, 'Asadullah Bin Rahman', 'galib', '03847129f14d98cbcba02ab00b8aadf5'),
(23, 'Taxi Burger', 'taxiburger', '57f256c6382a5bacf0a90469a3941921'),
(24, 'Fruit & nut seller', 'nutseller', '500ad62f95785f606a2ab6177942188e'),
(25, 'vendor3', 'vendor3', '667b726d8e50cf22d10e5915040319b1'),
(27, 'vendor4', 'vendor4', '2c1f4274bd08a975d58e7ea42f9950ab'),
(28, 'vendor2', 'vendor2', 'd8c11be202a0d24f7aeefbcecfd8e843'),
(29, 'vendor5', 'vendor5', 'b81c80cebc2ee8f056e5702742c7563b'),
(30, 'vendor10', 'vendor10', 'c19f7c1b25a181d740c70722bd01c00d');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_c`
--
-- Creation: Sep 18, 2021 at 01:25 PM
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
(23, 40),
(25, 41),
(27, 42),
(28, 43),
(29, 44);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_f`
--
-- Creation: Sep 18, 2021 at 01:28 PM
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
(23, 25),
(24, 26),
(24, 27),
(24, 28),
(24, 29),
(24, 30),
(24, 31),
(25, 32),
(25, 33),
(25, 34),
(25, 35),
(25, 36),
(27, 37),
(27, 38),
(28, 39),
(28, 40),
(28, 41),
(29, 42),
(29, 43),
(23, 44),
(23, 45);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_v_o`
--
-- Creation: Sep 18, 2021 at 01:30 PM
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_vendor`
--
ALTER TABLE `tbl_vendor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
