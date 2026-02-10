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
-- Table structure for table `tbl_shopping_list`
--

DROP TABLE IF EXISTS `tbl_shopping_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_shopping_list` (
  `tbl_shopping_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) NOT NULL,
  `tbl_shopping_list_text` text NOT NULL,
  `tbl_shopping_list_date` varchar(45) NOT NULL,
  PRIMARY KEY (`tbl_shopping_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shopping_list`
--

LOCK TABLES `tbl_shopping_list` WRITE;
/*!40000 ALTER TABLE `tbl_shopping_list` DISABLE KEYS */;
INSERT INTO `tbl_shopping_list` VALUES (2,254,'Marriage','2018-07-16 12:35:30'),(3,254,'Birthday','2018-07-17 12:06:22'),(4,254,'grand party','2018-07-18 13:41:07'),(5,254,'Retirement','2018-07-18 13:30:29'),(6,254,'Wedding anniversary','2018-07-18 14:49:00'),(7,254,'birthday','2018-08-23 10:47:18'),(8,254,'birthday','2018-08-31 12:02:45'),(9,254,'birthday','2018-08-31 12:24:34'),(10,254,'Red carpet','2019-01-06 10:12:35'),(11,254,'Q','2019-01-28 14:26:48'),(12,5356,'Fruits','2025-09-06 08:38:39');
/*!40000 ALTER TABLE `tbl_shopping_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:52
