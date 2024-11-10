-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2023 at 07:00 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `funkeybee`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `productId` int NOT NULL,
  `qty` int NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(52, 32, 8, 1, 'xe Ferrari Monza SP1', 459000, '43cf773efc.webp');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'Mô hình xe Acura', 1),
(4, 'Mô hình xe BMW', 1),
(5, 'Mô hình xe Ferrari', 1),
(6, 'Mô hình xe Ford', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(39, 31, '2021-12-07', '2021-12-07', 'Complete'),
(40, 1, '2023-11-27', '2023-12-01', 'Complete'),
(41, 32, '2023-12-01', '2023-12-04', 'Delivering'),
(42, 1, '2023-12-01', '2023-12-09', 'Processed'),
(43, 1, '2023-12-06', '2023-12-09', 'Processed');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `qty` int NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(41, 41, 9, 1, 209000, 'xe BMW M4 Coupe', 'd33736127d.jpg'),
(42, 42, 7, 1, 409000, 'xe Ferrari F12 Berlinetta', '6ddb10d92c.jpg'),
(43, 43, 6, 1, 99000, 'xe Ferrari California T Open Top', 'f617f28048.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int NOT NULL,
  `qty` int NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(2, 'xe Ford Everest Titanium', 1900000, 1899000, '42ca5d766a.webp', 1, '0000-00-00', 6, 96, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 4),
(3, 'xe Ford Ranger FX4 Sport 2019', 430000, 429000, '4d92ac17ad.jpg', 1, '0000-00-00', 6, 9, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 1),
(4, 'xe Ferrari SF90 Spider Assetto Fiorano ', 1700000, 1699000, '3f470d50af.jpg', 1, '0000-00-00', 5, 19, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 1),
(5, 'xe Ferrari 488', 460000, 459000, '2d0eb779c3.jpg', 1, '0000-00-00', 5, 8, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom ', 1, 2),
(6, 'xe Ferrari California T Open Top', 100000, 99000, 'f617f28048.jpg', 1, '0000-00-00', 5, 5, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 5),
(7, 'xe Ferrari F12 Berlinetta', 450000, 409000, '6ddb10d92c.jpg', 1, '2021-12-07', 5, 7, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 3),
(8, 'xe Ferrari Monza SP1', 460000, 459000, '43cf773efc.webp', 1, '2021-12-07', 5, 7, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 3),
(9, 'xe BMW M4 Coupe', 210000, 209000, 'd33736127d.jpg', 1, '2021-12-07', 4, 5, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 5),
(10, 'xe BMW M4 GTS', 410000, 409000, 'e9fecb5200.jpg', 1, '2021-12-07', 4, 10, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(11, 'xe BMW X5M', 260000, 259000, 'b4ce0fd15b.webp', 1, '2021-12-07', 4, 10, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(12, ' xe BMW M3 E30 1988', 410000, 409000, '8256d4866f.jpg', 1, '2021-12-07', 4, 10, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(13, 'xe BMW i8', 430000, 429000, 'c088bbf95c.jpg', 1, '2021-12-07', 4, 20, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(14, 'xe Acura NSX 2017', 450000, 490000, 'af11329021.jpg', 1, '2021-12-07', 2, 15, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(15, 'xe Acura NSX GT3 2017 IMSA Watkins Glen LHD', 300000, 299000, '2ee1648457.jpg', 1, '2021-12-07', 2, 10, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(16, ' xe Acura NSX 2018', 500000, 499000, '7282bbd212.jpg', 1, '2021-12-07', 2, 10, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(17, ' xe Acura NSX GT3 EVO #44 2021', 430000, 429000, '20ad913061.png', 1, '2021-12-07', 2, 10, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom, ... ', 1, 0),
(18, ' Acura NSX 2017', 200000, 199000, '915eefdcb4.webp', 1, '2021-12-07', 2, 5, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom, ...', 1, 0),
(19, 'xe Ford Bronco Badlands 2021 Off Road', 500000, 499000, '37bb1400ff.jpg', 1, '2023-11-28', 6, 10, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(20, 'xe Ford F-150 Raptor Off-Road Kings 2017', 240000, 239000, '4746078652.webp', 1, '2023-11-28', 6, 9, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0),
(21, 'xe Ford F-150 Raptor Off-Road Kings', 250000, 249000, '3fdd887528.jpg', 1, '2023-11-28', 6, 6, ' Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết, được sơn tĩnh điện tinh tế rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint NOT NULL DEFAULT '0',
  `captcha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'ken', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1, ''),
(31, 'hehe@gmail.com', 'hehe', '2021-12-06', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'ok', 1, '56661'),
(32, 'user@gmail.com', 'giang', '2004-06-13', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 'asdasda', 0, '11340'),
(34, 'giangsunshinee@gmail.com', 'NGUYEN TRUONG GIANG', '2004-06-13', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 'DUONG LIEU', 0, '86952');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
