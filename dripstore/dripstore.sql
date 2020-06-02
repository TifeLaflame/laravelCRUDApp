-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 01, 2020 at 02:59 PM
-- Server version: 5.7.26
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dripstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `strUsername` varchar(255) NOT NULL,
  `strPassword` varchar(255) NOT NULL,
  `strEmail` varchar(255) NOT NULL,
  `nLevel` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `strUsername`, `strPassword`, `strEmail`, `nLevel`) VALUES
(1, 'nathan', '2ed02e792f8ecd95b6570b687274afeb', 'nathan@vanarts.com', 0),
(2, 'mrdrip', 'dripdrip', 'obideyib@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `strCategory` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `strCategory`) VALUES
(1, 'Country Jersey'),
(2, 'Club Jersey');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strUsername` varchar(255) NOT NULL,
  `strEmail` varchar(255) NOT NULL,
  `strPassword` varchar(255) NOT NULL,
  `strFName` varchar(255) NOT NULL,
  `strLName` varchar(255) NOT NULL,
  `acl` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
CREATE TABLE IF NOT EXISTS `genders` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `strGender` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `strGender`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `strHash` varchar(255) NOT NULL,
  `nTotal` float NOT NULL,
  `nCustomerId` int(11) NOT NULL,
  `bPaid` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `nProductId` int(11) NOT NULL,
  `nQty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `otherimages`
--

DROP TABLE IF EXISTS `otherimages`;
CREATE TABLE IF NOT EXISTS `otherimages` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `strImage` varchar(255) NOT NULL,
  `nProductId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otherimages`
--

INSERT INTO `otherimages` (`id`, `strImage`, `nProductId`) VALUES
(1, 'chelsea3_1.jpg', '1'),
(2, 'chelsea3_2.jpg', '1'),
(3, 'chelsea3_3.jpg', '1'),
(4, 'chelsea3_4.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `strName` varchar(255) NOT NULL,
  `strCoverImage` varchar(50) NOT NULL,
  `nPrice` decimal(6,2) NOT NULL,
  `strDesc` mediumtext NOT NULL,
  `bFeatured` tinyint(1) NOT NULL,
  `nGendersID` mediumint(9) NOT NULL,
  `nCategoryID` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `strName`, `strCoverImage`, `nPrice`, `strDesc`, `bFeatured`, `nGendersID`, `nCategoryID`) VALUES
(1, 'Chelsea FC 19/20 Third Jersey', 'chelsea3_1.jpg', '90.00', 'The Chelsea FC Stadium Third Jersey features team details on highly breathable fabric to help keep you cool and dry on the field or in the stands cheering for your team. The retro-inspired colorway also features an allover \"CFC\" jacquard pattern that alternates between matte and shine.', 1, 1, 1),
(2, 'Montreal Home Jersey', 'montrealwomen_1.jpg', '85.00', 'This Impact Montreal soccer jersey features a fresh take on the club\'s traditional stripes. Players wear one like it when crushing the opposition at home. A soft, moisture-wicking build offers quick-drying comfort in all conditions.', 1, 2, 1),
(3, 'Kaizer Chiefs FC Third Jersey', 'kaizer3_1.jpg', '55.99', 'The Kaizer Chiefs F.C. Stadium Third Jersey features team details on highly breathable fabric to help keep you cool and dry on the field or in the stands cheering for your team. The black kit with gold trim celebrates the 50th anniversary of Kaizer Chiefs returning to South Africa.', 1, 1, 1),
(4, 'Tottenham FC Third Jersey', 'hotspur3_1.jpg', '60.00', 'The Tottenham Hotspur Stadium Third Jersey features team details on highly breathable fabric to help keep you cool and dry on the field or in the stands cheering for your team. A linear graphic depicts the club\'s nickname \"Spurs\" for iconic throwback pride.', 0, 1, 1),
(5, 'FC Barcelona Third Jersey ', 'barca3_1.jpg', '55.99', 'The FC Barcelona Stadium Third Jersey brings team pride details together with performance elements like highly breathable fabric to help you stay dry and cool. Channeling the pride of Barcelona, an allover diamond-shaped jacquard pattern is inspired by the city\'s coat of arms.', 1, 1, 1),
(6, 'Toronto FC Home Jersey', 'torontowomen_1.jpg', '90.00', 'Home and away, Toronto FC know victory. This soccer jersey is made for fans to cheer their club to victory at home games. A soft moisture-wicking build offers quick-drying comfort. An \"All for One\" graphic across the back collar celebrates the club mantra.', 0, 2, 1),
(7, 'Nike FC Women Jersey', 'NikeFCwomen_1.jpg', '65.00', 'The Nike F.C. Jersey celebrates soccer culture and Nike history with a throwback look inspired by the classic Total 90 line from the year 2000. Soft, lightweight fabric is breathable and comfortable.', 1, 2, 1),
(8, 'Paris Saint-Germain Home Jersey', 'psgwomen_1.jpg', '55.99', 'The Paris Saint-Germain Stadium Home Jersey features team details on highly breathable fabric to help keep you cool and dry on the field or in the stands cheering for your team. Featuring the club\'s iconic hechter stripe, the jersey marks 30 years of partnership between Paris Saint-Germain and Nike.', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productvariants`
--

DROP TABLE IF EXISTS `productvariants`;
CREATE TABLE IF NOT EXISTS `productvariants` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nProductId` mediumint(9) NOT NULL,
  `nSizeId` mediumint(9) NOT NULL,
  `nQty` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productvariants`
--

INSERT INTO `productvariants` (`id`, `nProductId`, `nSizeId`, `nQty`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 5),
(3, 1, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
CREATE TABLE IF NOT EXISTS `sizes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `strSName` char(20) NOT NULL,
  `strSize` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `strSName`, `strSize`) VALUES
(1, 'S', 'Small'),
(2, 'M', 'Medium'),
(3, 'L', 'Large');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
