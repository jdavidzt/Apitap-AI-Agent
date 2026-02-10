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
-- Table structure for table `tbl_services_newsletter`
--

DROP TABLE IF EXISTS `tbl_services_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_services_newsletter` (
  `tbl_newsletter_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_newsletter_message` text,
  `tbl_newsletter_image` varchar(99) DEFAULT NULL,
  `tbl_newsletter_order` int(11) NOT NULL,
  `tbl_newsletter_status_f` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tbl_newsletter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_services_newsletter`
--

LOCK TABLES `tbl_services_newsletter` WRITE;
/*!40000 ALTER TABLE `tbl_services_newsletter` DISABLE KEYS */;
INSERT INTO `tbl_services_newsletter` VALUES (1,'Our profesional teams are available daily to work with you to get the most out of your AIO account',NULL,1,1),(2,NULL,'GraphicDesign.png',2,1),(3,'Focus on running your business and let AIO help you build the best Storefront possible for you',NULL,3,1),(4,NULL,'ProductAndDataEntry.png',4,1),(5,'AIO offers merchants several services to help them with their day to day needs',NULL,5,1),(6,NULL,'WebDesign.png',6,1);
/*!40000 ALTER TABLE `tbl_services_newsletter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:40
