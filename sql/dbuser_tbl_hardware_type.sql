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
-- Table structure for table `tbl_hardware_type`
--

DROP TABLE IF EXISTS `tbl_hardware_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_hardware_type` (
  `tbl_hardware_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_hardware_type_name` varchar(45) NOT NULL,
  `tbl_hardware_type_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbl_hardware_type_status_f` tinyint(1) NOT NULL DEFAULT '1',
  `tbl_hardware_type_stock` int(11) NOT NULL DEFAULT '0',
  `tbl_hardware_type_shipped` int(11) NOT NULL DEFAULT '0',
  `tbl_hardware_type_ref` varchar(45) DEFAULT NULL,
  `tbl_hardware_type_status` varchar(45) DEFAULT NULL,
  `tbl_hardware_type_dueDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tbl_hardware_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hardware_type`
--

LOCK TABLES `tbl_hardware_type` WRITE;
/*!40000 ALTER TABLE `tbl_hardware_type` DISABLE KEYS */;
INSERT INTO `tbl_hardware_type` VALUES (75001,'In-Store Ad Player',189.99,1,10,5,'','1123321321',''),(75002,'Tablet 7´',0.00,0,0,0,'','',''),(75003,'Tablet 10´',0.00,0,0,0,'','',''),(75004,'TV 32´',0.00,0,0,0,'','',''),(75005,'TV 42´',0.00,0,0,0,'','',''),(75006,'TV 55´',0.00,0,0,0,'','',''),(75007,'Insurance',1.50,1,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_hardware_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:35:44
