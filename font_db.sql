-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2021 at 02:47 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `font_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `posters_font`
--

CREATE TABLE `posters_font` (
  `poster_font_id` int(11) NOT NULL,
  `poster_name` varchar(100) NOT NULL,
  `poster_link` varchar(255) NOT NULL,
  `poster_combination_font` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `web_font`
--

CREATE TABLE `web_font` (
  `web_font_id` int(11) NOT NULL,
  `website_link` varchar(255) NOT NULL,
  `combination_font` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_font`
--

INSERT INTO `web_font` (`web_font_id`, `website_link`, `combination_font`) VALUES
(6, 'https://www.tokopedia.com', ' [\' apple system\', \'BlinkMacSystemFont\', \'Segoe UI\', \'Roboto\', \'Oxygen\', \'Ubuntu\', \'Cantarell\', \'Fira Sans\', \'Droid Sans\', \'Helvetica Neue\', \'sans serif\'] '),
(8, 'https://www.google.com', ' [\'Arial\', \'Helvetica\', \'sans serif\'] '),
(9, ' https://www.lazada.com', ' [\'Times New Roman\', \'lato\', \'Roboto\', \'Helvetica Neue\', \'Helvetica\', \'Tahoma\', \'Arial\', \'PingFang SC\', \'Microsoft YaHei\', \'NotoSans SemiBold\', \'sans serif\', \'NotoSans Medium\'] '),
(10, ' https://www.digitalocean.com', ' [\'Times New Roman\', \'Inter Regular\', \'system ui\', \' apple system\', \'BlinkMacSystemFont\', \'Segoe UI\', \'Roboto\', \'Helvetica Neue\', \'Helvetica\', \'Arial\', \'sans serif\', \'Inter Bold\', \'san serif\'] '),
(11, ' https://www.facebook.com', ' [\'Times New Roman\', \'sans serif\'] '),
(12, ' https://www.tribunnews.com/', ' [\'Times New Roman\', \'lucida grande\', \'tahoma\', \'verdana\', \'arial\', \'sans serif\', \'Open Sans\', \'Arial\', \'Questrial\'] '),
(13, ' https://www.bukalapak.com/', ' [\' apple system\', \'BlinkMacSystemFont\', \'Helvetica Neue\', \'Roboto\', \'Segoe UI\', \'Oxygen\', \'Ubuntu\', \'Cantarell\', \'Open Sans\', \'sans serif\'] '),
(14, ' https://www.detik.com/ ', ' [\'Montserrat\', \'Montserrat FF\', \'Arial\', \'Tahoma\', \'sans serif\', \'Helvetica\', \'Helvetica FF\'] '),
(15, ' https://www.kompas.com/ ', ' [\'Times New Roman\', \'Roboto\', \'sans serif\'] '),
(16, ' https://www.youtube.com/ ', ' [\'Roboto\', \'Arial\', \'sans serif\', \'YouTube Noto\', \'Helvetica\'] '),
(17, ' https://github.com/ ', ' [\' apple system\', \'BlinkMacSystemFont\', \'Segoe UI\', \'Helvetica\', \'Arial\', \'sans serif\', \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Alliance No.1\', \'Segoe UI Symbol\'] '),
(18, ' https://shopee.co.id/ ', ' [\' apple system\', \'Helvetica Neue\', \'Helvetica\', \'Roboto\', \'Droid Sans\', \'Arial\', \'sans serif\'] '),
(20, ' https://lazada.com ', ' [\'Times New Roman\', \'lato\', \'Roboto\', \'Helvetica Neue\', \'Helvetica\', \'Tahoma\', \'Arial\', \'PingFang SC\', \'Microsoft YaHei\', \'NotoSans SemiBold\', \'sans serif\', \'NotoSans Medium\'] '),
(21, '  https://blibli.com  ', ' [\'Arial\', \'Helvetica\', \'sans serif\'] '),
(22, ' https://www.ruangguru.com/ ', ' [\'sans serif\', \' apple system\', \'BlinkMacSystemFont\', \'Segoe UI\', \'Roboto\', \'Helvetica Neue\', \'Arial\', \'Noto Sans\', \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\', \'Open Sans\', \'Inter\'] '),
(23, ' https://id.duolingo.com/ ', ' [\'din round\', \'sans serif\'] '),
(24, ' https://dribbble.com/ ', ' [\'Times New Roman\', \'Haas Grot Text R Web\', \'Helvetica Neue\', \'Helvetica\', \'Arial\', \'sans serif\'] '),
(25, ' https://team3d.io/ ', ' [\'Audiowide\', \'monospace\'] '),
(26, ' https://www.bayer.com/en/ ', ' [\'sans serif\', \'Neue Helvetica\', \'Arial\', \'Roboto\'] '),
(27, ' https://www.bp.com/ ', ' [\'Univers\', \'sans serif\'] '),
(29, ' https://www.shell.com/ ', ' [\'Times New Roman\', \'Arial\', \'Roboto\', \'Helvetica\', \'sans serif\', \'type font\', \'open sans\'] '),
(30, ' https://www.lukoil.com/ ', ' [\'OpenSans\', \'sans serif\', \'Cuprum Regular\', \'Cuprum Bold\'] '),
(31, ' https://www.unilever.com/ ', ' [\'sans serif\', \'UnileverShilling\', \'Arial\', \'Helvetica\', \'UnileverShillingMedium\'] '),
(32, ' https://www.hsbc.com/ ', ' [\'sans serif\', \'UniversNext\', \'Helvetica Neue\', \'Helvetica\', \'Arial\'] '),
(33, ' https://www.gsk.com/en-gb/home/ ', ' [\'sans serif\', \'Akzidenz Grotesk Pro Regular\', \'Arial\', \'Akzidenz Grotesk Pro Medium\', \'serif\'] '),
(34, ' https://truelinkswear.com/ ', ' [\'sans serif\', \'Montserrat\', \' apple system\', \'BlinkMacSystemFont\', \'Segoe UI\', \'Roboto\', \'Oxygen\', \'Ubuntu\', \'Cantarell\', \'Open Sans\', \'Helvetica Neue\'] '),
(35, ' https://www.blissworld.com/ ', ' [\'sans serif\', \'Archer A\', \'Archer B\', \'open sans\', \'Helvetica Neue\', \'Helvetica\', \'Arial\', \'Nunito\'] '),
(36, ' http://freshfronks.com/ ', ' [\'Karla\', \'Arial\', \'Helvetica\', \'sans serif\', \'Mark\'] '),
(37, ' https://www.zugucase.com/ ', ' [\'Times New Roman\', \'Matter\', \' apple system\', \'BlinkMacSystemFont\', \'Segoe UI\', \'Roboto\', \'Oxygen Sans\', \'Ubuntu\', \'Cantarell\', \'Helvetica Neue\', \'sans serif\'] '),
(38, ' https://kvellhome.com/ ', ' [\'FarnhamDisplay\', \'serif\'] '),
(39, ' https://babyzania.com/ ', ' [\'Open Sans\'] '),
(40, ' https://bro.do/ ', ' [\'sans serif\', \'Maven Pro\', \'HelveticaNeue Light\', \'Helvetica Neue Light\', \'Helvetica Neue\', \'Helvetica\', \'Arial\'] '),
(41, ' https://www.wormholestore.com/ ', ' [\'sans serif\', \'Helvetica\', \'Helvetica Neue\', \'Arial\', \'Lucida Grande\', \'Roboto\'] '),
(47, ' https://www.newchapter.com/ ', ' [\'sans serif\', \'Merriweather\', \'Arial\', \'Helvetica\', \'Poppins SemiBold\', \'Montserrat\', \'Poppins Medium\', \'Poppins Regular\'] '),
(50, ' https://www.coca-colacompany.com/ ', ' [\'TCCC UnityText Regular\', \'TCCC UnityText\', \'sans serif\', \'Arial\'] ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posters_font`
--
ALTER TABLE `posters_font`
  ADD PRIMARY KEY (`poster_font_id`);

--
-- Indexes for table `web_font`
--
ALTER TABLE `web_font`
  ADD PRIMARY KEY (`web_font_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posters_font`
--
ALTER TABLE `posters_font`
  MODIFY `poster_font_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_font`
--
ALTER TABLE `web_font`
  MODIFY `web_font_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
