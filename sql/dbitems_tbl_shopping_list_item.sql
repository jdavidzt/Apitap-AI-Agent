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
-- Table structure for table `tbl_shopping_list_item`
--

DROP TABLE IF EXISTS `tbl_shopping_list_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_shopping_list_item` (
  `tbl_shopping_list_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_shopping_list_id` int(11) NOT NULL,
  `tbl_shopping_list_item_txt` text NOT NULL,
  `tbl_shopping_list_item_date` datetime NOT NULL,
  PRIMARY KEY (`tbl_shopping_list_item_id`),
  KEY `fk_ tbl_shopping_list_idx` (`tbl_shopping_list_id`),
  CONSTRAINT `fk_ tbl_shopping_list` FOREIGN KEY (`tbl_shopping_list_id`) REFERENCES `tbl_shopping_list` (`tbl_shopping_list_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shopping_list_item`
--

LOCK TABLES `tbl_shopping_list_item` WRITE;
/*!40000 ALTER TABLE `tbl_shopping_list_item` DISABLE KEYS */;
INSERT INTO `tbl_shopping_list_item` VALUES (2,2,'cake','2018-07-17 15:05:20'),(3,3,'cake','2018-07-17 13:45:05'),(4,3,'pastry','2018-07-17 13:45:24'),(5,2,'Pastry','2018-07-17 15:05:35'),(6,4,'cake','2018-07-18 13:13:49'),(7,4,'mombatti','2018-07-18 13:46:53'),(9,4,'pastry','2018-07-18 13:47:02'),(10,5,'balloons','2018-07-18 14:32:17'),(11,2,'dragon','2018-07-19 15:41:06'),(12,4,'dragon','2018-07-29 13:23:06'),(13,4,'chicken','2018-07-31 11:58:48'),(14,3,'dragon','2018-08-13 11:35:39'),(15,10,'pastry','2019-01-06 10:43:50'),(20,10,'Baloons','2019-01-06 11:00:00');
/*!40000 ALTER TABLE `tbl_shopping_list_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:25
