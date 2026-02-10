CREATE DATABASE  IF NOT EXISTS `dbitems` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbitems`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbitems
-- ------------------------------------------------------
-- Server version	5.7.29-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_productfav`
--

DROP TABLE IF EXISTS `tbl_productfav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productfav` (
  `tbl_productfav_nmcid` int(11) NOT NULL,
  `tbl_product_id` int(11) NOT NULL,
  `tbl_productfav_date` datetime NOT NULL,
  PRIMARY KEY (`tbl_productfav_nmcid`,`tbl_product_id`),
  KEY `fk_tbl_productfav_productid_idx` (`tbl_product_id`),
  CONSTRAINT `fk_tbl_productfav_productid` FOREIGN KEY (`tbl_product_id`) REFERENCES `tbl_product` (`tbl_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productfav`
--

LOCK TABLES `tbl_productfav` WRITE;
/*!40000 ALTER TABLE `tbl_productfav` DISABLE KEYS */;
INSERT INTO `tbl_productfav` VALUES (4,13,'2017-08-01 14:53:29'),(254,15,'2018-04-13 07:42:47'),(254,17,'2018-05-17 13:36:57'),(254,18,'2018-07-13 13:34:11'),(254,19,'2017-11-28 04:45:03'),(254,47,'2018-06-06 12:41:10'),(254,49,'2017-12-04 04:38:26'),(254,50,'2017-12-06 00:04:03'),(254,51,'2018-03-30 05:02:38'),(254,70,'2017-11-28 05:16:24'),(254,148,'2019-01-26 23:15:28'),(254,251,'2020-04-27 05:40:46'),(254,371,'2021-02-01 00:22:36'),(588,270,'2021-10-18 03:50:57'),(1048,446,'2021-09-16 22:33:25'),(1323,446,'2021-10-18 11:44:59'),(1323,461,'2021-10-18 11:44:59'),(1323,1875,'2022-06-16 10:11:48'),(1333,270,'2022-01-19 02:13:05'),(1333,370,'2024-06-06 11:02:20'),(4589,1004,'2022-05-27 08:34:52'),(4614,1234,'2022-05-27 08:08:07'),(4699,1875,'2022-06-16 11:04:11'),(4980,1877,'2022-07-27 23:23:17');
/*!40000 ALTER TABLE `tbl_productfav` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:50
