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
-- Table structure for table `tbl_productoffer_schedule`
--

DROP TABLE IF EXISTS `tbl_productoffer_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productoffer_schedule` (
  `tbl_productoffer_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_product_id` int(11) NOT NULL,
  `tbl_day_of_the_week` int(11) DEFAULT NULL,
  `tbl_24_hour` tinyint(1) DEFAULT '0',
  `tbl_closed_flag` tinyint(1) DEFAULT '0',
  `tbl_hour_open` varchar(45) DEFAULT '00:00',
  `tbl_hour_close` varchar(45) DEFAULT '00:00',
  `tbl_timezone` varchar(11) DEFAULT NULL,
  `tbl_start_date` date DEFAULT NULL,
  `tbl_end_date` date DEFAULT NULL,
  PRIMARY KEY (`tbl_productoffer_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productoffer_schedule`
--

LOCK TABLES `tbl_productoffer_schedule` WRITE;
/*!40000 ALTER TABLE `tbl_productoffer_schedule` DISABLE KEYS */;
INSERT INTO `tbl_productoffer_schedule` VALUES (99,22,0,1,0,'00:00:00','24:00:00','-0000000420','2017-10-06','2018-01-31'),(100,22,1,1,0,'00:00:00','24:00:00','-0000000420','2017-10-06','2018-01-31'),(101,22,2,1,0,'00:00:00','24:00:00','-0000000420','2017-10-06','2018-01-31'),(102,22,3,1,0,'00:00:00','24:00:00','-0000000420','2017-10-06','2018-01-31'),(103,22,4,1,0,'00:00:00','24:00:00','-0000000420','2017-10-06','2018-01-31'),(104,22,5,1,0,'00:00:00','24:00:00','-0000000420','2017-10-06','2018-01-31'),(105,22,6,1,0,'00:00:00','24:00:00','-0000000420','2017-10-06','2018-01-31');
/*!40000 ALTER TABLE `tbl_productoffer_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:14
