-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 01:50 PM
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
-- Database: `cooking_recipe`
--

-- --------------------------------------------------------

--
-- Table structure for table `benefit`
--

CREATE TABLE `benefit` (
  `rid` int(11) NOT NULL,
  `rname` varchar(10) NOT NULL,
  `calorie` int(11) DEFAULT NULL,
  `benefits` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `benefit`
--

INSERT INTO `benefit` (`rid`, `rname`, `calorie`, `benefits`) VALUES
(1, 'pastries', 160, 'supports heart health ,brain function'),
(2, 'Pasta', 300, 'contribute to weight gain if consumed in large amount'),
(3, 'Rajmal cha', 300, 'High in protein, fiber, and complex carbohydrates.Provides essential nutrients like iron, potassium, and folate.');

--
-- Triggers `benefit`
--
DELIMITER $$
CREATE TRIGGER `count` AFTER INSERT ON `benefit` FOR EACH ROW insert into recipe values(null,new.rid,'inserted',now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `rid` int(11) DEFAULT NULL,
  `cat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ing_id` int(11) NOT NULL,
  `rid` int(11) DEFAULT NULL,
  `quan` varchar(50) DEFAULT NULL,
  `ing_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instruction`
--

CREATE TABLE `instruction` (
  `i_id` int(11) NOT NULL,
  `rid` int(11) DEFAULT NULL,
  `sno` int(11) DEFAULT NULL,
  `instru` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `rc`
-- (See below for the actual view)
--
CREATE TABLE `rc` (
`rname` varchar(20)
,`calorie` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `rid` int(11) NOT NULL,
  `rname` varchar(20) NOT NULL,
  `prep_time` varchar(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `serving_with` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`rid`, `rname`, `prep_time`, `description`, `serving_with`) VALUES
(1, 'pastries', '30 min', 'Pastry is a category of baked goods characterized by its flaky, tender, or crumbly texture. Pastry can be used in both sweet and savory dishes, ranging from pies and tarts to croissants and pasties', 'chocolate sauce'),
(2, 'Pasta', '20 min', 'Pasta is a collective name for a category of food made from wheat flour and water', 'Toast'),
(3, 'Rajmal chawal', '1.5 hr', 'Rajma Chawal is a classic Punjabi dish featuring red kidney beans cooked in a thick and flavorful tomato-based gravy. It is served with steamed rice.', 'Sclided onions ,curry'),
(4, 'Idli', '30 min', 'made with batter', 'chutney'),
(5, 'dosa', '20 min', 'Make it on tawa', 'coconut chutney'),
(7, 'puri', '20 min', 'made with wheat flour', 'sagu'),
(8, 'poha', '20 min', 'made with rice', 'curd');

--
-- Triggers `recipe`
--
DELIMITER $$
CREATE TRIGGER `alert_message` AFTER INSERT ON `recipe` FOR EACH ROW BEGIN
insert into recipe_alert values(new.rid,new.rname,new.prep_time,new.description,new.serving_with,NOW());
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `r_trigger` AFTER INSERT ON `recipe` FOR EACH ROW insert into recipe_trigger values(null,new.rid,'inserted',now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_alert`
--

CREATE TABLE `recipe_alert` (
  `rid` int(11) NOT NULL,
  `rname` varchar(10) NOT NULL,
  `prep_time` varchar(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `serving_with` varchar(50) DEFAULT NULL,
  `dateof` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_alert`
--

INSERT INTO `recipe_alert` (`rid`, `rname`, `prep_time`, `description`, `serving_with`, `dateof`) VALUES
(1, 'pastries', '30 min', 'Pastry is a category of baked goods characterized by its flaky, tender, or crumbly texture. Pastry can be used in both sweet and savory dishes, ranging from pies and tarts to croissants and pasties', 'chocolate sauce', NULL),
(2, 'Pasta', '20 min', 'Pasta is a collective name for a category of food made from wheat flour and water', 'Toast', NULL),
(3, 'Rajmal cha', '1.5 hr', 'Rajma Chawal is a classic Punjabi dish featuring red kidney beans cooked in a thick and flavorful tomato-based gravy. It is served with steamed rice.', 'Sclided onions ', NULL),
(4, 'Idli', '30 min', 'made with batter', 'chutney', NULL),
(5, 'dosa', '20 min', 'Make it on tawa', 'coconut chutney', '2024-02-28'),
(6, 'puri', '30 min', '76tgujhbxsxxzu', 'Sclided onions and chutney', '2024-02-29'),
(7, 'puri', '20 min', 'mytghbij', 'Toast', '2024-02-29'),
(8, 'poha', '20 min', 'made with rice', 'curd', '2024-02-29');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_trigger`
--

CREATE TABLE `recipe_trigger` (
  `id` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `description` varchar(70) NOT NULL,
  `dateofinsertion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_trigger`
--

INSERT INTO `recipe_trigger` (`id`, `rid`, `description`, `dateofinsertion`) VALUES
(1, 7, 'inserted', '2024-02-29'),
(2, 8, 'inserted', '2024-02-29');

-- --------------------------------------------------------

--
-- Stand-in structure for view `recp`
-- (See below for the actual view)
--
CREATE TABLE `recp` (
`rname` varchar(20)
,`prep_time` varchar(11)
);

-- --------------------------------------------------------

--
-- Structure for view `rc`
--
DROP TABLE IF EXISTS `rc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rc`  AS SELECT `r`.`rname` AS `rname`, `b`.`calorie` AS `calorie` FROM (`recipe` `r` join `benefit` `b`) WHERE `r`.`rid` = `b`.`rid` ;

-- --------------------------------------------------------

--
-- Structure for view `recp`
--
DROP TABLE IF EXISTS `recp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recp`  AS SELECT `recipe`.`rname` AS `rname`, `recipe`.`prep_time` AS `prep_time` FROM `recipe` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `benefit`
--
ALTER TABLE `benefit`
  ADD PRIMARY KEY (`rid`,`rname`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ing_id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `instruction`
--
ALTER TABLE `instruction`
  ADD PRIMARY KEY (`i_id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`rid`,`rname`);

--
-- Indexes for table `recipe_alert`
--
ALTER TABLE `recipe_alert`
  ADD PRIMARY KEY (`rid`,`rname`);

--
-- Indexes for table `recipe_trigger`
--
ALTER TABLE `recipe_trigger`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `recipe_alert`
--
ALTER TABLE `recipe_alert`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `recipe_trigger`
--
ALTER TABLE `recipe_trigger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `benefit`
--
ALTER TABLE `benefit`
  ADD CONSTRAINT `benefit_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `recipe` (`rid`) ON DELETE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `recipe` (`rid`) ON DELETE CASCADE;

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `recipe` (`rid`) ON DELETE CASCADE;

--
-- Constraints for table `instruction`
--
ALTER TABLE `instruction`
  ADD CONSTRAINT `instruction_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `recipe` (`rid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
