-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_v2
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_cart_user` (`userId`),
  KEY `fk_cart_store` (`storeId`),
  CONSTRAINT `fk_cart_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`),
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (6,1,13,'2022-12-17 08:01:02','2022-12-17 08:01:02'),(9,9,14,'2022-12-19 02:52:10','2022-12-19 02:52:10');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_cartItem_card` (`cartId`),
  KEY `fk_cartItem_product` (`productId`),
  CONSTRAINT `fk_cartItem_card` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`),
  CONSTRAINT `fk_cartItem_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (24,9,18,1,'2022-12-19 02:52:10','2022-12-19 02:52:10');
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Văn học',0,'2022-11-16 08:13:28','2022-12-19 03:14:32'),(2,'Sách tham khảo',1,'2022-11-16 08:13:28','2022-12-10 08:16:31'),(3,'Kinh tế',0,'2022-11-16 08:13:28','2022-11-16 08:13:28'),(4,'Sách chính trị',0,'2022-12-10 08:32:39','2022-12-10 08:32:39');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Vân chuyển nhanh','Giao hàng trong vòng 24h',20000,0,'2022-11-18 13:42:55','2022-11-18 13:42:55'),(2,'Giao hàng bình thường','Giao hàng trong 3 ngày',10000,0,'2022-11-18 13:42:55','2022-11-18 13:42:55');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_product`
--

DROP TABLE IF EXISTS `image_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_product` (`productId`),
  CONSTRAINT `fk_image_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_product`
--

LOCK TABLES `image_product` WRITE;
/*!40000 ALTER TABLE `image_product` DISABLE KEYS */;
INSERT INTO `image_product` VALUES (129,'1669112827319.jpg',14),(130,'1669112827320.jpg',14),(131,'1669112827321.jpg',14),(132,'1669112827322.jpg',14),(133,'1669275367014.jpg',15),(134,'1669275367026.jpg',15),(135,'1669275367026.jpg',15),(136,'1669275367027.jpg',15),(173,'1669275806853.jpg',16),(174,'1669275806859.jpg',16),(175,'1669275806860.jpg',16),(176,'1669275806861.jpg',16),(185,'1669112698727.jpg',13),(186,'1669112698728.jpg',13),(187,'1669112698729.jpg',13),(188,'1669112698731.jpg',13),(265,'1668747663112.jpg',8),(266,'1668747663139.jpg',8),(267,'1668747663140.jpg',8),(268,'1668747663140.jpg',8),(301,'1671266863135.jpg',19),(302,'1671266837076.jpg',19),(303,'1671266837078.jpg',19),(304,'1671266837079.jpg',19),(309,'1669112476012.jpg',11),(310,'1669112476034.jpg',11),(311,'1669112476035.jpg',11),(312,'1669112476036.jpg',11),(337,'1671412595812.jpg',20),(338,'1671412595824.jpg',20),(339,'1671412595827.jpg',20),(340,'1671412595828.jpg',20),(341,'1671412715074.jpg',21),(342,'1671412715075.jpg',21),(343,'1671412715076.jpg',21),(344,'1671412715077.jpg',21),(345,'1671412813829.jpg',22),(346,'1671412813832.jpg',22),(347,'1671412813833.jpg',22),(348,'1671412813833.jpg',22),(349,'1669112591892.jpg',12),(350,'1669112591894.jpg',12),(351,'1669112591894.jpg',12),(352,'1669112591895.jpg',12),(353,'1668754483739.jpg',5),(354,'1668602856201.jpg',5),(355,'1668602856202.jpg',5),(356,'1668701135149.jpg',5),(357,'1669620632389.jpg',18),(358,'1669620632401.jpg',18),(359,'1669620632402.jpg',18),(360,'1669620632403.jpg',18);
/*!40000 ALTER TABLE `image_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_store`
--

DROP TABLE IF EXISTS `image_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `storeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_store` (`storeId`),
  CONSTRAINT `fk_image_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_store`
--

LOCK TABLES `image_store` WRITE;
/*!40000 ALTER TABLE `image_store` DISABLE KEYS */;
INSERT INTO `image_store` VALUES (81,'1669618578873.jpg',14),(82,'1669618578876.jpg',14),(83,'1669618578878.jpg',14),(84,'1669796238478.jpg',15),(85,'1669796238481.jpg',15),(86,'1669796238481.jpg',15),(132,'1671266646609.jpg',13),(133,'1670394816460.jpg',13),(134,'1671419061577.jpg',13);
/*!40000 ALTER TABLE `image_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `deliveryId` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'not-processed',
  `amountFromUser` double NOT NULL,
  `amountToStore` double NOT NULL,
  `amountToGD` double NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_orders_user` (`userId`),
  KEY `fk_orders_store` (`storeId`),
  KEY `fk_oder_delivery` (`deliveryId`),
  CONSTRAINT `fk_oder_delivery` FOREIGN KEY (`deliveryId`) REFERENCES `delivery` (`id`),
  CONSTRAINT `fk_orders_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`),
  CONSTRAINT `fk_orders_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,1,13,1,'KTX khu B','0964294799','delivered',200000,160000,20000,'2022-11-27 02:49:49','2022-12-13 07:24:21'),(8,2,13,2,'KTX khu B','0964294799','delivered',100000,60000,20000,'2022-11-27 02:49:49','2022-12-17 09:02:53'),(9,2,13,2,'KTX khu B','0964294799','cancelled',100000,60000,20000,'2022-11-27 02:49:49','2022-11-27 02:49:49'),(10,2,13,2,'KTX khu B','0964294799','delivered',100000,60000,20000,'2022-11-27 02:49:49','2022-11-27 02:49:49'),(11,3,13,2,'KTX khu A','0964294709','delivered',100000,60000,20000,'2022-11-27 02:49:49','2022-12-17 09:03:08'),(12,4,13,1,'Đồng Nai','0964294709','shipped',100000,60000,20000,'2022-11-27 02:49:49','2022-11-27 02:49:49'),(13,9,13,1,'Biên Hòa','0964298709','delivered',100000,60000,20000,'2022-11-30 14:27:33','2022-12-19 03:06:09'),(14,1,13,1,'ký túc xá khu B đại học quốc gia','0964294799','shipped',136000,132600,3400,'2022-12-09 07:20:47','2022-12-10 08:58:40'),(15,1,14,1,'ký túc xá khu B đại học quốc gia','0964294799','not-processed',63000,61425,1575,'2022-12-10 08:35:34','2022-12-11 02:53:36'),(16,1,13,1,'An Hảo, Tri Tôn, An Giang','0367456788','not-processed',128000,124800,3200,'2022-12-10 17:37:23','2022-12-11 02:53:36'),(17,1,13,2,'ký túc xá khu B đại học quốc gia','0964294799','not-processed',109000,106275,2725,'2022-12-13 07:26:03','2022-12-13 07:26:03'),(18,1,13,1,'Địa chỉ','0964294799','delivered',86000,83850,2150,'2022-12-15 02:41:53','2022-12-19 01:23:16'),(19,1,13,1,'Địa chỉ','0964294799','not-processed',86000,83850,2150,'2022-12-15 02:42:03','2022-12-15 02:42:03'),(20,33,13,1,'ký túc xá khu B đại học quốc gia','0964294799','not-processed',128000,124800,3200,'2022-12-19 01:21:57','2022-12-19 01:21:57'),(21,9,13,1,'Thu Duc','0971211817','not-processed',86000,83850,2150,'2022-12-19 03:00:01','2022-12-19 03:00:01');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersitem`
--

DROP TABLE IF EXISTS `ordersitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordersitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordersId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_ordersItem_orders` (`ordersId`),
  KEY `fk_ordersItem_product` (`productId`),
  CONSTRAINT `fk_ordersItem_orders` FOREIGN KEY (`ordersId`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_ordersItem_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersitem`
--

LOCK TABLES `ordersitem` WRITE;
/*!40000 ALTER TABLE `ordersitem` DISABLE KEYS */;
INSERT INTO `ordersitem` VALUES (9,7,5,20,'2022-11-27 02:50:36','2022-11-27 02:50:36'),(10,8,8,20,'2022-11-27 02:50:36','2022-11-27 02:50:36'),(11,9,5,20,'2022-11-27 02:50:36','2022-11-27 02:50:36'),(12,10,8,20,'2022-11-27 02:50:36','2022-11-27 02:50:36'),(13,11,5,20,'2022-11-27 02:50:36','2022-11-27 02:50:36'),(14,12,8,10,'2022-11-27 02:50:36','2022-11-27 02:50:36'),(15,11,8,20,'2022-11-27 03:36:19','2022-11-27 03:36:19'),(16,13,8,7,'2022-11-30 14:28:22','2022-11-30 14:28:22'),(17,14,5,1,'2022-12-09 07:20:47','2022-12-09 07:20:47'),(18,14,13,1,'2022-12-09 07:20:47','2022-12-09 07:20:47'),(19,15,18,1,'2022-12-10 08:35:34','2022-12-10 08:35:34'),(20,16,12,1,'2022-12-10 17:37:23','2022-12-10 17:37:23'),(21,17,8,1,'2022-12-13 07:26:03','2022-12-13 07:26:03'),(22,18,5,1,'2022-12-15 02:41:53','2022-12-15 02:41:53'),(23,20,12,1,'2022-12-19 01:21:58','2022-12-19 01:21:58'),(24,21,5,1,'2022-12-19 03:00:01','2022-12-19 03:00:01');
/*!40000 ALTER TABLE `ordersitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `promotionalPrice` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `categoryId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `rating` int(11) DEFAULT '3',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_product_store` (`storeId`),
  KEY `fk_product_category` (`categoryId`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'Nhà giả kim','Tác giả:Paulo Coelho\r\nTái bản mới nhất: 2022',70000,66000,0,11,1,1,13,5,'2022-11-16 12:48:36','2022-12-21 01:10:23'),(8,'Elon Musk: How the Billionaire CEO of SpaceX and Tesla is Shaping our Future','Tác giả:Ashlee Vance',110000,99000,115,22,1,3,13,3,'2022-11-18 05:01:03','2022-12-13 07:25:29'),(11,'Sách tham khảo Hóa Học','Sách hay',70000,60000,7,0,1,2,13,3,'2022-11-22 10:21:16','2022-12-19 00:51:56'),(12,'Cây Cam Ngọt Của Tôi','Tác giả:José Mauro de Vasconcelos',120000,108000,8,9,1,1,13,3,'2022-11-22 10:23:11','2022-12-19 01:21:58'),(13,'Giết Con Chim Nhại','Tác giả:Harper Lee',70000,50000,7,5,1,1,13,1,'2022-11-22 10:24:58','2022-12-11 03:05:45'),(14,'Think And Grow Rich - Nghĩ Giàu Và Làm Giàu','Tác giả:Napoleon Hill',168000,102000,10,8,1,3,13,3,'2022-11-22 10:27:07','2022-11-28 02:33:50'),(15,'Làm Bạn Với Bầu Trời','Tác giả:Nguyễn Nhật Ánh',110000,88000,8,0,1,1,13,3,'2022-11-24 07:36:07','2022-11-24 07:36:07'),(16,'Dấu Chân Trên Cát','Tác giả:Nguyên Phong',148000,118000,8,0,1,1,13,3,'2022-11-24 07:43:26','2022-12-06 02:16:06'),(18,'Đời Ngắn Đừng Ngủ Dài','Tác giả: Robin Sharma',75000,43000,198,0,1,1,14,3,'2022-11-28 07:30:32','2022-12-19 02:52:10'),(19,'Nền Kinh Tế Tăng Trưởng Và Sụp Đổ Như Thế Nào?','Tác giả:Peter D Schiff, Andrew J Schiff',152000,129000,20,0,1,3,13,3,'2022-12-17 08:47:17','2022-12-17 08:47:17'),(20,'Hội Chứng Tuổi Thanh Xuân ','Tác giả:Hajime KAMOSHIDA, Keji MIZOGUCHI',70000,65000,12,0,1,1,15,3,'2022-12-19 01:16:35','2022-12-19 01:16:35'),(21,'Thiên Thần Và Ác Quỷ (Tái Bản 2020)','Tác giả:Dan Brown',209000,167000,200,0,1,1,15,3,'2022-12-19 01:18:35','2022-12-19 01:18:35'),(22,'Người Bán Hàng Vĩ Đại Nhất Thế Giới','Tác giả:Og Mandino',148000,125000,100,0,1,3,15,3,'2022-12-19 01:20:13','2022-12-19 01:20:13');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `ordersId` int(11) NOT NULL,
  `content` varchar(1001) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `stars` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_review_user` (`userId`),
  KEY `fk_review_product` (`productId`),
  KEY `fk_review_store` (`storeId`),
  KEY `fk_review_orders` (`ordersId`),
  CONSTRAINT `fk_review_orders` FOREIGN KEY (`ordersId`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,12,13,16,'Sách hay đáng để đọc',3,'2022-12-10 17:43:52','2022-12-10 17:43:52'),(2,1,5,13,7,'Sách đẹp giống như hình. Giao hành nhanh',5,'2022-12-11 03:05:04','2022-12-11 03:05:04'),(3,1,13,13,14,'Giao hàng chậm, sách bị rách bìa',1,'2022-12-11 03:05:44','2022-12-11 03:05:44'),(4,1,8,13,17,'Sản phẩm ok ',4,'2022-12-13 07:26:45','2022-12-13 07:26:45'),(5,9,5,13,21,'Sach tot',4,'2022-12-19 03:00:50','2022-12-19 03:00:50');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bio` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ownerId` int(11) NOT NULL,
  `isOpen` tinyint(1) DEFAULT '1',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT '3',
  `eWallet` double DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_owner` (`ownerId`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`ownerId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (13,'Shop sách cũ','Bán sách cũ giá rẽ free ship',1,1,'1671266595542.jpg',3,403575,'2022-11-14 17:05:04','2022-12-19 03:31:14'),(14,'Shop Amazon','Chi nhánh uy tín số 1 Việt Nam',8,1,'1669618578859.webp',3,61425,'2022-11-28 06:56:18','2022-12-10 08:35:34'),(15,'Bán Sách','Giá cả hợp lý',9,1,'1669796238461.webp',3,0,'2022-11-30 08:17:18','2022-11-30 08:17:18');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `isUp` tinyint(1) NOT NULL,
  `amount` double NOT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_user` (`userId`),
  KEY `fk_transaction_store` (`storeId`),
  CONSTRAINT `fk_transaction_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`),
  CONSTRAINT `fk_transaction_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,13,0,100000,'2022-12-06 09:42:25','2022-12-06 09:42:25'),(2,2,13,0,60000,'2022-12-06 09:43:24','2022-12-06 09:43:24'),(3,1,13,1,10000,'2022-12-06 09:43:24','2022-12-06 09:43:24'),(4,3,13,0,65000,'2022-12-06 09:43:24','2022-12-06 09:43:24'),(5,1,13,0,105000,'2022-12-06 10:32:13','2022-12-06 10:32:13'),(6,1,13,0,40000,'2022-12-06 18:58:18','2022-12-06 18:58:18'),(7,1,13,1,40000,'2022-12-06 19:00:30','2022-12-06 19:00:30'),(8,1,13,1,55000,'2022-12-07 01:15:42','2022-12-07 01:15:42'),(9,1,13,1,55000,'2022-12-07 01:28:40','2022-12-07 01:28:40'),(10,1,13,1,20000,'2022-12-10 08:34:19','2022-12-10 08:34:19'),(11,1,14,1,61425,'2022-12-10 08:35:34','2022-12-10 08:35:34'),(12,1,13,1,124800,'2022-12-10 17:37:24','2022-12-10 17:37:24'),(13,1,13,1,55000,'2022-12-13 07:24:36','2022-12-13 07:24:36'),(14,1,13,1,106275,'2022-12-13 07:26:03','2022-12-13 07:26:03'),(15,1,13,1,83850,'2022-12-15 02:42:03','2022-12-15 02:42:03'),(16,1,13,1,55000,'2022-12-17 09:06:32','2022-12-17 09:06:32'),(17,33,13,1,124800,'2022-12-19 01:21:58','2022-12-19 01:21:58'),(18,9,13,1,83850,'2022-12-19 03:00:02','2022-12-19 03:00:02'),(19,1,13,1,40000,'2022-12-19 03:06:52','2022-12-19 03:06:52');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_card` varchar(9) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `isEmailActive` tinyint(1) DEFAULT '0',
  `isPhoneActive` tinyint(1) DEFAULT '0',
  `password` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'USER',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `eWallet` double DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_card` (`id_card`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tran','Man','352563972','cristran040702@gmail.com','0964294799',0,0,'252F107DBFF38E4E8E2BAFFE4A416EFBF9481494B98CD6DFD1058EDF74E14A6C','USER','1671268179510.jpg',345000,'2022-11-10 05:04:50','2023-05-24 04:29:58','Nam'),(2,'Tran','Minh',NULL,'man@gmail.com',NULL,0,0,'1234','USER',NULL,0,'2022-11-10 05:04:50','2023-05-24 04:38:33','Nam'),(3,'Tran','Minh',NULL,NULL,NULL,0,0,'1234','USER',NULL,0,'2022-11-10 05:06:21','2022-12-10 07:40:10','Nữ'),(4,'Ngoc','Tuyen',NULL,NULL,NULL,0,0,'1234','USER',NULL,0,'2022-11-18 23:37:01','2022-12-10 07:40:10','Đang cập nhật'),(5,'Le','Hai',NULL,NULL,NULL,0,0,'1234','USER',NULL,0,'2022-11-18 23:37:01','2022-12-10 07:40:10','Nam'),(6,'Cong','Minh',NULL,NULL,NULL,0,0,'1234','USER',NULL,0,'2022-11-18 23:37:01','2022-12-10 07:40:10','Nữ'),(7,'admin','admin',NULL,'admin@admin',NULL,0,0,'1234','ADMIN',NULL,0,'2022-11-27 01:08:54','2022-12-10 07:40:10','Đang cập nhật'),(8,'Minh','Man',NULL,'man@man',NULL,0,0,'1234','USER',NULL,0,'2022-11-27 01:09:35','2022-12-10 07:40:10','Đang cập nhật'),(9,'Tran Minh','Man',NULL,'mantm040702@gmail.com',NULL,0,0,'252F107DBFF38E4E8E2BAFFE4A416EFBF9481494B98CD6DFD1058EDF74E14A6C','USER',NULL,914000,'2022-11-30 07:02:28','2023-05-24 04:33:50','Nam'),(33,'Tran Minh','Man',NULL,'20110301@student.hcmute.edu.vn',NULL,0,0,'1989266E5CC2BC3E8249ECF43A9D03D375D03D3DFE1F1D5AB39624A0F3D35F6C','USER',NULL,172000,'2022-12-08 03:59:51','2023-05-24 04:34:27','Nam'),(43,'admin1','admin1',NULL,'admin1@admin',NULL,0,0,'7ADD2214B8CCE36B680E2FA64B360C0C98C4CBDB1E7D386F57D2ECE4A41A60DE','ADMIN',NULL,0,'2023-05-24 04:35:49','2023-05-24 04:35:49',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_address` (
  `addressId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`addressId`,`userId`),
  KEY `fk_user` (`userId`),
  CONSTRAINT `fk_address` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfollowproduct`
--

DROP TABLE IF EXISTS `userfollowproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userfollowproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userfollowproduct_product` (`productId`),
  KEY `fk_userfollowproduct_user` (`userId`),
  CONSTRAINT `fk_userfollowproduct_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_userfollowproduct_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfollowproduct`
--

LOCK TABLES `userfollowproduct` WRITE;
/*!40000 ALTER TABLE `userfollowproduct` DISABLE KEYS */;
INSERT INTO `userfollowproduct` VALUES (2,1,5,NULL,NULL),(3,33,12,NULL,NULL),(4,33,5,NULL,NULL),(5,33,14,NULL,NULL),(6,33,18,NULL,NULL),(8,9,5,NULL,NULL);
/*!40000 ALTER TABLE `userfollowproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userfollowstore`
--

DROP TABLE IF EXISTS `userfollowstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userfollowstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `storeId` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userfollowstore_store` (`storeId`),
  KEY `fk_userfollowstore_user` (`userId`),
  CONSTRAINT `fk_userfollowstore_store` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`),
  CONSTRAINT `fk_userfollowstore_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfollowstore`
--

LOCK TABLES `userfollowstore` WRITE;
/*!40000 ALTER TABLE `userfollowstore` DISABLE KEYS */;
INSERT INTO `userfollowstore` VALUES (1,1,13,NULL,NULL),(2,2,13,NULL,NULL),(3,3,13,NULL,NULL),(4,4,13,NULL,NULL),(5,6,13,NULL,NULL),(6,8,13,NULL,NULL),(8,5,13,NULL,NULL),(9,9,13,NULL,NULL);
/*!40000 ALTER TABLE `userfollowstore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 11:40:10
