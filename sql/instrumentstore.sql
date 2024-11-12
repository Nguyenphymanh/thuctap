-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 12, 2024 lúc 10:31 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `funkeybee`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'MLB', 1),
(4, 'Adidas', 1),
(5, 'Puma', 1),
(6, 'Nike', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(45, 1, '2024-11-12', '2024-11-12', 'Complete'),
(46, 1, '2024-11-12', NULL, 'Processing'),
(47, 32, '2024-11-12', NULL, 'Processing'),
(48, 32, '2024-11-12', NULL, 'Processing');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
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
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(64, 45, 2, 2, 3000000, 'Nike Air Force 1 07 EasyOn', '6be7903efd.png'),
(65, 45, 17, 1, 4390000, 'MLB - Giày sneakers unisex cổ thấp Chunky Liner Mid Classic Monogram', '867fa4ce9c.webp'),
(66, 45, 12, 1, 2600000, 'Adidas Stan Smith', 'a62f393a22.avif'),
(67, 45, 23, 1, 2700000, 'Adidas Samba OG', '752758f29a.avif'),
(68, 45, 20, 1, 4699000, 'Nike Jordan Spizike Low', 'b24f529b9f.jpeg'),
(69, 46, 6, 1, 1699000, 'Puma sneakers cổ thấp unisex Shuffle Trainers', 'd7d7603e60.webp'),
(70, 47, 9, 1, 2500000, 'Adidas Handball Spezial Shoes', '94b7bdd33f.avif'),
(71, 47, 4, 1, 3399000, 'PUMA sneakers unisex cổ thấp Clyde OG', '68cc36869b.webp'),
(72, 48, 14, 1, 3589999, 'MLB - Giày sneakers unisex cổ thấp Chunky Runner Basic', '0393d088cc.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
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
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(2, 'Nike Air Force 1 07 EasyOn', 3500000, 3000000, '6be7903efd.png', 1, '0000-00-00', 6, 93, 'PHONG CÁCH HUYỀN THOẠI TINH TẾ.\r\nSự rạng rỡ vẫn tồn tại trên đôi giày Nike Air Force , đôi giày bóng rổ nguyên bản mang đến luồng gió mới cho những gì bạn biết rõ nhất: lớp phủ được khâu bền chắc, lớp hoàn thiện sạch sẽ và độ lấp lánh hoàn hảo giúp bạn tỏa sáng.\r\nNhững lợi ích\r\nLớp phủ khâu ở phía trên mang lại phong cách truyền thống, độ bền và khả năng hỗ trợ.\r\nĐược thiết kế ban đầu cho mục đích chơi bóng rổ, đệm Nike Air mang lại sự thoải mái nhẹ nhàng suốt cả ngày.\r\nKiểu dáng cắt thấp mang đến vẻ ngoài gọn gàng, thanh lịch.\r\nCổ áo có đệm tạo cảm giác mềm mại và thoải mái.\r\nChi tiết sản phẩm\r\nĐế giữa bằng bọt\r\nLỗ thủng ở ngón chân\r\nĐế cao su\r\nMàu sắc hiển thị: Trắng/Trắng\r\nKiểu dáng: CW2288-111\r\nQuốc gia/Khu vực xuất xứ: Ấn Độ, Việt Nam', 1, 7),
(3, 'Nike Air Jordan 1 High Metallic Burgundy', 7000000, 5900000, '637ed3887f.png', 1, '0000-00-00', 6, 85, 'Phần trên bằng da nguyên tấm bền và có khả năng hỗ trợ tốt với vẻ ngoài OG cao cấp.\r\nĐế Nike Air ở gót giày mang lại khả năng đệm nhẹ.\r\nCấu trúc đế giày bền và có khả năng hỗ trợ tốt.\r\nĐế ngoài bằng cao su tăng độ bám đường.\r\nChi tiết sản phẩm\r\nMàu sắc hiển thị: Trắng/Trắng/Đỏ đội\r\nKiểu dáng: BQ4422-161\r\nQuốc gia/Khu vực xuất xứ: Trung Quốc', 1, 2),
(4, 'PUMA sneakers unisex cổ thấp Clyde OG', 4000000, 3399000, '68cc36869b.webp', 1, '0000-00-00', 5, 179, 'Thương hiệu: PUMA\r\nXuất xứ: Đức\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ thấp\r\nMàu sắc: Yellow, White, Black/Red\r\nChất liệu: Da lộn\r\nĐế: Cao su', 1, 3),
(5, 'PUMA sneakers unisex cổ thấp CA Pro The Ghost Trophy', 3700000, 2, '360dec8345.webp', 1, '0000-00-00', 5, 70, 'Thương hiệu: Puma\r\nXuất xứ: Đức\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ thấp \r\nMàu sắc: White/Grey/Light Blue\r\nChất liệu: Synthetic\r\nĐế: Rubber\r\nLớp lót: Mesh', 1, 3),
(6, 'Puma sneakers cổ thấp unisex Shuffle Trainers', 3000000, 1699000, 'd7d7603e60.webp', 1, '0000-00-00', 5, 119, 'Thương hiệu: Puma\r\nXuất xứ: Đức\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneaker cổ thấp\r\nMàu sắc: White/Green, White/Grey, White/White, White/Black,...\r\nChất liệu: Da tổng hợp', 1, 7),
(7, 'Puma sneakers unisex cổ cao Court Classic Vulc Mid', 2300000, 1699000, 'e912680603.webp', 1, '2021-12-07', 5, 60, 'Thương hiệu: PUMA\r\nXuất xứ: Đức\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ cao\r\nMàu sắc: Grey, White\r\nChất liệu: Canvas', 1, 4),
(8, 'Giày sneakers nam cổ thấp Easy Rider Vintage', 3000000, 2499000, 'd299e09181.webp', 1, '2021-12-07', 5, 6, 'Thương hiệu: Puma\r\nXuất xứ: Đức\r\nGiới tính: Nam\r\nKiểu dáng: Giày sneakers cổ thấp \r\nMàu sắc: Red\r\nChất liệu: 68.19% Cow leather, 31.81% Textile\r\nLớp lót: 100% Textile\r\nĐế: 100% Rubber', 1, 4),
(9, 'Adidas Handball Spezial Shoes', 2900000, 2500000, '94b7bdd33f.avif', 1, '2021-12-07', 4, 407, 'Chi tiết\r\nVừa vặn thông thường\r\nĐóng ren\r\nPhần trên bằng da lộn và các chi tiết tổng hợp\r\nLớp lót tổng hợp\r\nĐế ngoài bằng cao su\r\nMàu sắc: Trắng mây / Đen lõi / Kẹo cao su\r\nMã sản phẩm: IE3403', 1, 7),
(10, 'Adidas Superstar Shoes', 3000000, 2600000, '70adea8fa0.avif', 1, '2021-12-07', 4, 910, 'Chi tiết\r\nĐóng ren\r\nPhần trên bằng da\r\nGiày da biểu tượng\r\nĐế ngoài bằng cao su\r\nMàu sắc: Trắng mây / Đen lõi / Trắng mây\r\nMã sản phẩm: EG4958', 1, 1),
(11, 'Adidas Forum Low Classic Shoes', 3000000, 2600000, '32523cc32a.avif', 1, '2021-12-07', 4, 680, 'Chi tiết\r\nĐóng ren\r\nPhần trên bằng da nguyên tấm, da nubuck và da phủ\r\nLớp lót dệt\r\nĐế ngoài bằng cao su\r\nSản phẩm này có chứa vật liệu da lợn\r\nMàu sắc: Trắng phấn / Trắng mây / Trắng mây\r\nMã sản phẩm: ID6858', 1, 1),
(12, 'Adidas Stan Smith', 3000000, 2600000, 'a62f393a22.avif', 1, '2021-12-07', 4, 679, 'Chi tiết\r\nVừa vặn thông thường\r\nĐóng ren\r\nLớp lót tổng hợp\r\nĐế ngoài bằng cao su\r\nThuần chay\r\nMàu sắc: Trắng mây / Trắng mây / Xanh nước biển Collegiate\r\nMã sản phẩm: FX5501', 1, 2),
(13, 'Adidas Samba XLG Shoes', 3500000, 2900000, 'ee2fc51c70.avif', 1, '2021-12-07', 4, 190, 'Vừa vặn thông thường\r\nĐóng ren\r\nPhần trên bằng da lộn\r\nLưỡi đúc đệm\r\nLớp lót bằng da\r\nEVA thả vào\r\nĐế ngoài bằng cao su\r\nMàu sắc: Ngà / Xanh Collegiate / Kẹo cao su\r\nMã sản phẩm: IE3911', 1, 1),
(14, 'MLB - Giày sneakers unisex cổ thấp Chunky Runner Basic', 4200000, 3589999, '0393d088cc.webp', 1, '2021-12-07', 2, 139, 'Thương hiệu: MLB\r\nXuất xứ: Hàn Quốc\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ thấp\r\nMàu sắc: Ivory, Cream\r\nChất liệu: Da tổng hợp\r\nĐế: Cao su\r\nThiết kế:\r\nĐế cao chunky cá tính\r\nPhom ôm chân, dễ dàng di chuyển\r\nCộng hưởng cùng chi tiết logo bóng chày in nổi bật ở má ngoài\r\nGam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện\r\nLogo: Được in trên lót trong  \r\nMũi giày tròn\r\nDây quai: Dây thắt mảnh, có thể điều chỉnh\r\nThoáng khí: Có lớp lót thoáng khí  \r\nThích hợp dùng trong các dịp: Trang trọng, phù hợp vào buổi tối\r\nXu hướng theo mùa: Sử dụng được tất cả các mùa trong năm', 1, 2),
(15, 'MLB - Giày sneakers unisex cổ thấp Chunky Liner Monogram', 4200000, 3790000, '42b9ffd1dc.webp', 1, '2021-12-07', 2, 89, 'Thương hiệu: MLB\r\nXuất xứ: Hàn Quốc\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ thấp\r\nMàu sắc: Black, Sand\r\nChất liệu: Da tổng hợp \r\nĐế: Cao su\r\nThiết kế:\r\nCộng hưởng cùng họa tiết monogram in sắc nét\r\nĐế cao su với độ bền cao, mang lại độ ma sát tốt\r\nGam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện\r\nLogo: Được in trên lót trong  \r\nMũi giày tròn\r\nDây quai: Dây thắt mảnh, có thể điều chỉnh dễ dàng   \r\nThoáng khí: Có lớp lót thoáng khí  \r\nThích hợp dùng trong các dịp: Đi làm, đi chơi,...\r\nXu hướng theo mùa: Sử dụng được tất cả các mùa trong năm', 1, 1),
(16, 'MLB - Giày sneakers unisex cổ thấp Chunky Liner Mid Denim', 5000000, 4290000, '778237f53f.webp', 1, '2021-12-07', 2, 90, 'Thương hiệu: MLB\r\nXuất xứ: Hàn Quốc\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ thấp\r\nMàu sắc: Blue, Navy\r\nChất liệu: Da tổng hợp\r\nĐế: EVA & Rubber\r\nThiết kế:\r\nĐế chunky cá tính\r\nPhom ôm chân, dễ dàng di chuyển\r\nPhối quai ngang khóa dán tiện dụng\r\nKết hợp chất liệu denim với họa tiết monogram cá tính\r\nGam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện\r\nLogo: Được in nổi bật ở má ngoài\r\nMũi giày tròn\r\nDây quai: Dây thắt mảnh, có thể điều chỉnh\r\nThoáng khí: Có lớp lót thoáng khí  \r\nThích hợp dùng trong các dịp: Trang trọng, phù hợp vào buổi tối\r\nXu hướng theo mùa: Sử dụng được tất cả các mùa trong năm', 1, 1),
(17, 'MLB - Giày sneakers unisex cổ thấp Chunky Liner Mid Classic Monogram', 5200000, 4390000, '867fa4ce9c.webp', 1, '2021-12-07', 2, 89, 'Thương hiệu: MLB\r\nXuất xứ: Hàn Quốc\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ thấp\r\nMàu sắc: Black, Grey, Navy, Pink, Beige\r\nChất liệu: Synthetic leather\r\nĐế: EVA, Rubber\r\nThiết kế:\r\n\r\nKiểu dáng giày sneakers đế chunky cá tính\r\nPhom ôm chân, dễ dàng di chuyển\r\nCộng hưởng cùng họa tiết monogram thời thượng\r\nĐế cao su với độ bền cao, chắc chắn mang lại độ ma sát tốt\r\nGam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện\r\nLogo: Được in ở lót trong\r\nMũi giày tròn, đế vừa\r\nDây quai: Dây thắt mảnh và quai khóa dán có thể điều chỉnh\r\nThoáng khí: Có lớp lót thoáng khí  \r\nThích hợp dùng trong các dịp: Đi làm, đi chơi,...\r\nXu hướng theo mùa: Sử dụng được tất cả các mùa trong năm', 1, 2),
(18, 'MLB - Giày sneakers unisex cổ thấp Chunky Liner Wide', 5000000, 4190000, '11bfa01434.webp', 1, '2021-12-07', 2, 140, 'Thương hiệu: MLB\r\nXuất xứ: Hàn Quốc\r\nGiới tính: Unisex\r\nKiểu dáng: Giày sneakers cổ thấp\r\nMàu sắc: Black, Aqua Blue\r\nChất liệu: Synthetic Leather\r\nĐế: EVA & Rubber  \r\nThiết kế:\r\nĐế cao chunky cá tính\r\nPhom ôm chân, dễ dàng di chuyển\r\nCộng hưởng cùng chi tiết logo bóng chày nổi bật ở má ngoài\r\nGam màu hiện đại dễ dàng phối với nhiều trang phục và phụ kiện\r\nLogo: Được in trên lót trong  \r\nMũi giày tròn\r\nDây quai: Dây thắt mảnh, có thể điều chỉnh\r\nThoáng khí: Có lớp lót thoáng khí  \r\nThích hợp dùng trong các dịp: Đi làm, đi chơi,...\r\nXu hướng theo mùa: Sử dụng được tất cả các mùa trong năm', 1, 1),
(19, ' Nike Air Jordan 1 Low', 3700000, 3200000, '5cd10de219.png', 1, '2023-11-28', 6, 111, 'LUÔN TƯƠI MỚI.\r\n\r\nLấy cảm hứng từ phiên bản gốc ra mắt năm 1985, Air Jordan 1 Low mang đến vẻ ngoài sạch sẽ, cổ điển, quen thuộc nhưng luôn mới mẻ. Với thiết kế mang tính biểu tượng đôi giày này đảm bảo bạn sẽ luôn đúng phong cách.\r\n\r\nNhững lợi ích\r\nĐế giày Air-Sole được bọc kín mang lại khả năng đệm nhẹ.\r\nPhần trên bằng da thật mang lại độ bền và vẻ ngoài cao cấp.\r\nĐế ngoài bằng cao su đặc tăng cường lực bám trên nhiều bề mặt.\r\nChi tiết sản phẩm\r\nMàu sắc hiển thị: Trắng/Trắng/Trắng\r\nKiểu dáng: 553558-136\r\nQuốc gia/Khu vực xuất xứ: Việt Nam', 1, 1),
(20, 'Nike Jordan Spizike Low', 5400000, 4699000, 'b24f529b9f.jpeg', 1, '2023-11-28', 6, 89, 'Spizike lấy các yếu tố của năm đôi Jordan cổ điển, kết hợp chúng lại và mang đến cho bạn một đôi giày thể thao mang tính biểu tượng. Đây là sự tôn vinh Spike Lee khi chính thức giới thiệu Hollywood và bóng rổ trong một khoảnh khắc văn hóa. Bạn sẽ có một đôi giày tuyệt đẹp với một chút lịch sử. Bạn còn có thể yêu cầu gì hơn nữa? Bạn có muốn không?\r\n\r\nNhững lợi ích\r\nPhần trên bằng da thật và da tổng hợp cùng vải dệt giúp tăng độ bền.\r\nCông nghệ Nike Air hấp thụ lực tác động để tạo sự đệm cho mỗi bước đi.\r\nĐế ngoài bằng cao su đặc mang lại độ bền và lực kéo.\r\nChi tiết sản phẩm\r\nMàu sắc hiển thị: Trắng/Xám sói/Than/Xanh đại học\r\nKiểu dáng: FQ1759-141\r\nQuốc gia/Khu vực xuất xứ: Việt Nam', 1, 2),
(21, 'Nike Air Force 1 Low EVO', 5000000, 3800000, 'a8a1deb090.png', 1, '2023-11-28', 6, 100, 'Thoải mái, bền bỉ và vượt thời gian—nó là số 1 vì một lý do. Các chi tiết cắt rời để lộ logo Swoosh bằng vải cao cấp và các đơn vị Air toàn chiều dài ở đế ngoài, thể hiện Air Force 1 theo một cách mới. Cấu trúc cổ điển của thập niên 80 kết hợp với các chi tiết táo bạo để tạo nên phong cách theo dõi dù bạn đang ở trên sân hay đang di chuyển.\r\n\r\nNhững lợi ích\r\nThân giày bằng da với điểm nhấn là vải dệt tạo nên vẻ ngoài cổ điển và bền lâu.\r\nĐược thiết kế ban đầu cho mục đích biểu diễn, đệm khí có thể nhìn thấy mang lại sự thoải mái lâu dài.\r\nĐế ngoài bằng cao su với các vòng tròn xoay truyền thống tăng thêm lực bám và độ bền.\r\nCổ áo khoét sâu, có đệm trông rất đẹp và tạo cảm giác thoải mái.\r\nChi tiết sản phẩm\r\nMàu sắc hiển thị: Trắng/Trắng đỉnh/Xanh đại học\r\nKiểu dáng: HF3630-101\r\nQuốc gia/Khu vực xuất xứ: Indonesia', 1, 1),
(22, 'Adidas Samba OG', 3100000, 2700000, '80f421eae0.avif', 1, '2024-11-10', 4, 628, 'Chi tiết\r\nVừa vặn thông thường\r\nĐóng ren\r\nPhần trên bằng da nguyên tấm với da lộn nhám và chi tiết lá vàng\r\nLớp lót bằng da tổng hợp; Đế cao su\r\nĐế giữa bằng cao su\r\nMàu sắc: Trắng mây / Đen lõi / Đá granit trong suốt\r\nMã sản phẩm: B75806', 1, 0),
(23, 'Adidas Samba OG', 3100000, 2700000, '752758f29a.avif', 1, '2024-11-10', 4, 627, 'Chi tiết\r\nVừa vặn thông thường\r\nĐóng ren\r\nPhần trên bằng da nguyên tấm với da lộn nhám và chi tiết lá vàng\r\nLớp lót bằng da tổng hợp; Đế cao su\r\nĐế giữa bằng cao su\r\nMàu sắc: Trắng mây / Đen lõi / Đá granit trong suốt\r\nMã sản phẩm: B75806', 1, 1),
(24, 'Nike Air Force 1 Low Evo Summit White University Red', 5000000, 4050000, '2862485207.webp', 1, '2024-11-10', 6, 468, 'Màu đỏ \r\nThương hiệu Nike\r\nKiểu Thể thao\r\nPhong cách Giày thể thao\r\nChất liệu đế ngoài Tổng hợp\r\nĐặc trưng\r\nCó thể điều chỉnh, Thoáng khí, Thoải mái, Có đệm, Phiên bản giới hạn, Hiệu suất\r\nChiều rộng giày Tiêu chuẩn\r\nMùa thu, mùa xuân, mùa hè, mùa đông', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'admin', '2021-11-01', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1, ''),
(31, 'hehe@gmail.com', 'hehe', '2021-12-06', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'ok', 1, '56661'),
(32, 'user@gmail.com', 'user\r\n', '2004-06-13', 'e10adc3949ba59abbe56e057f20f883e', 2, 1, 'asdasda', 0, '11340');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
