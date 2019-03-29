-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2019 at 02:48 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(20) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first post', '123444', 'first post', '2019-03-24 12:18:43', 'firstpost@gmail.com'),
(2, 'ram', '98987223', 'hkjhkh', '2019-03-25 02:04:35', 'ram@email.com'),
(3, 'Karan', '97979793', 'hi', '2019-03-25 02:13:41', 'karan@email.com'),
(4, 'mera_naam', '989834986745', 'ho jaye\r\n', '2019-03-25 12:11:41', 'meranaam@gmail.com'),
(5, 'gyan', '9893855224', 'ho ja', '2019-03-25 12:18:50', 'gyan223@gmail.com'),
(6, 'gyan', '98789798', 'hkhkjhkh', '2019-03-25 12:23:03', 'gyanendratiwari29@gmail.com'),
(7, 'ipoi', '80809808', 'jljljlk', '2019-03-25 12:38:01', 'ipoipio@oijijo'),
(8, 'udffgg', '80808', 'oihkhk', '2019-03-25 13:03:23', 'jlljlj@jljlj'),
(9, 'udffgg', '80808', 'oihkhk', '2019-03-25 13:12:45', 'jlljlj@jljlj'),
(10, 'Ravindra Kumar Sharma', '98979879', 'hkhj', '2019-03-25 13:13:21', 'jljljlj@lkjljlkj'),
(11, 'udffgg', '6686868687', 'ihkkhkj', '2019-03-25 13:15:28', 'fffjljl@lkjlkjlj'),
(12, 'hkkjhkj', '97987897897', 'hkjhkj', '2019-03-25 13:16:38', 'jjhgjhgjhg@hkhkhk'),
(13, 'khkhk', '9809798797', 'lkkhkh', '2019-03-25 13:19:20', 'hkhkh@hkhkhk'),
(14, 'khkhk', '9809798797', 'lkkhkh', '2019-03-25 13:22:32', 'hkhkh@hkhkhk'),
(15, 'Gyanendra Tiwari', '+91 9893935995', 'gfgffg', '2019-03-25 13:23:26', 'gyanendratiwari29@gmail.com'),
(16, 'trrre', '907907', 'hkhkjh', '2019-03-25 14:44:01', 'yiyiy@hkh'),
(17, 'Gyanendra Tiwari', '987987987', 'jgjgj', '2019-03-25 14:45:23', 'fffdfdfd@vfdggg'),
(18, 'faiz', '122198232', 'ho jao', '2019-03-25 14:47:28', 'faiz12345@gmail.com'),
(19, 'mera_naam', '989834986745', 'hkhkhhkjh', '2019-03-25 14:57:03', 'meranaam@gmail.com'),
(20, 'this_name', '8223547645', 'khkhkhkhkj', '2019-03-25 14:58:10', 'this@email.com'),
(21, 'jai', '1234567891', 'ho jao', '2019-03-25 15:11:34', 'jai@gmail.com'),
(22, 'jai', '1234567891', 'ho jo', '2019-03-25 15:12:47', 'jai@gmail.com'),
(23, 'this_name', '8223547645', '7797979', '2019-03-25 15:14:23', 'this@email.com'),
(24, 'hkkh', '9879798', 'kjgggjh', '2019-03-25 15:15:27', 'hkjhkjh@khkh'),
(25, 'hkkh', '9879798', 'hkhkh', '2019-03-25 15:16:31', 'hkjhkjh@khkh'),
(26, 'hkkh', '9879798', 'hkhkh', '2019-03-25 15:18:36', 'hkjhkjh@khkh'),
(27, 'jai', '1234567891', 'gfhgghhg', '2019-03-25 15:41:37', 'jai@gmail.com'),
(28, 'Karan Sahu', '9685900856', 'I have Done...', '2019-03-25 15:46:13', 'karan@gmail.com'),
(29, 'Mo.Fahad MD', '958055512345', 'i am login here!', '2019-03-25 16:02:41', 'fahad@gmail.com'),
(30, 'jai', '1234567891', 'gfhgghhg', '2019-03-26 10:35:15', 'jai@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(20) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Lets learn about python', 'this is first python', 'first1-2post', '    The stock (python_project) of a corporation is all of the shares into which ownership of the corporation is divided.[1] In American English, the shares are commonly known as \"stocks.\"[1] A single share of the stock represents fractional ownership of the corporation in proportion to the total number of shares    ', 'home-bg.jpg', '2019-03-27 20:15:21'),
(2, 'This is Second Post', 'post second ever', 'second-post', 'In the United Kingdom, Republic of Ireland, South Africa, and Australia, stock can also refer to completely different financial instruments such as government bonds or, less commonly, to all kinds of marketable securities', 'about-bg.jpg', '2019-03-26 10:42:47'),
(3, 'third post', 'headling third', 'third-post', 'New equity issue may have specific legal clauses attached that differentiate them from previous issues of the issuer. Some shares of common stock may be issued without the typical voting rights, for instance, or some shares may have special rights unique to them and issued only to certain parties. Often, new issues that have not been registered with a securities governing body may be restricted from resale for certain periods of time.', '', '2019-03-26 11:01:36'),
(4, 'Stock derivatives', 'fouth headling test', 'fouth-post', 'A stock option is a class of option. Specifically, a call option is the right (not obligation) to buy stock in the future at a fixed price and a put option is the right (not obligation) to sell stock in the future at a fixed price. Thus, the value of a stock option changes in reaction to the underlying stock of which it is a derivative. The most popular method of valuing stock options is the Black Scholes model.[7] Apart from call options granted to employees, most stock options are transferable.', '', '2019-03-26 11:01:36'),
(5, 'header line fifth post', 'Shareholder', 'five-post', 'The innovation of joint ownership made a great deal of Europe\'s economic growth possible following the Middle Ages. The technique of pooling capital to finance the building of ships, for example, made the Netherlands a maritime superpower. Before adoption of the joint-stock corporation, an expensive venture such as the building of a merchant ship could be undertaken only by governments or by very wealthy individuals or families', '', '2019-03-26 11:04:51'),
(7, 'Title Edit  Post', 'new post tline', 'new-post', 'hkhkhkhk', 'k.jpg', '2019-03-27 10:22:28'),
(9, 'khkhkh', 'khkhkh', 'hkjhkjh', 'kjhkjhkhk', 'jdd.jpg', '2019-03-27 10:32:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
