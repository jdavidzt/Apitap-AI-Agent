CREATE DATABASE  IF NOT EXISTS `dbuser` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbuser`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbuser
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
-- Table structure for table `tbl_merchantfav`
--

DROP TABLE IF EXISTS `tbl_merchantfav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchantfav` (
  `tbl_merchant_nmcId` bigint(20) NOT NULL,
  `tbl_consumer_nmcId` bigint(20) NOT NULL,
  `tbl_merchantfav_date` datetime NOT NULL,
  PRIMARY KEY (`tbl_merchant_nmcId`,`tbl_consumer_nmcId`),
  KEY `fk_tbl_merchantfav_tbl_merchant1_idx` (`tbl_merchant_nmcId`),
  KEY `fk_tbl_merchantfav_tbl_consumer1_idx` (`tbl_consumer_nmcId`),
  CONSTRAINT `fk_tbl_merchantfav_tbl_consumer1` FOREIGN KEY (`tbl_consumer_nmcId`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_merchantfav_tbl_merchant1` FOREIGN KEY (`tbl_merchant_nmcId`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchantfav`
--

LOCK TABLES `tbl_merchantfav` WRITE;
/*!40000 ALTER TABLE `tbl_merchantfav` DISABLE KEYS */;
INSERT INTO `tbl_merchantfav` VALUES (197,1323,'2021-12-27 12:27:42'),(197,1333,'2024-06-06 11:08:53'),(1360,1323,'2023-02-14 13:52:33'),(3311,1323,'2022-07-11 19:06:39'),(3386,1323,'2022-04-01 16:20:11'),(3386,4507,'2022-10-18 09:39:58'),(3386,4980,'2022-07-28 14:15:39'),(4481,1323,'2022-05-25 13:04:57'),(4481,4587,'2022-05-26 14:20:20'),(4649,1323,'2022-07-29 12:39:53'),(4649,4507,'2022-08-10 13:24:37'),(4649,4587,'2022-06-15 13:14:04'),(4649,4980,'2022-07-28 14:14:39'),(5345,1323,'2025-03-03 09:44:26'),(5347,1323,'2025-04-07 10:03:28'),(5347,4507,'2025-09-02 13:58:40');
/*!40000 ALTER TABLE `tbl_merchantfav` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:57
