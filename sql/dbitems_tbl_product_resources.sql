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
-- Table structure for table `tbl_product_resources`
--

DROP TABLE IF EXISTS `tbl_product_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product_resources` (
  `tbl_product_resources_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_product_id` int(11) NOT NULL,
  `tbl_product_resources_name` varchar(255) NOT NULL,
  `tbl_product_resources_type_id` int(11) NOT NULL,
  `tbl_product_resources_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tbl_product_resources_id`),
  KEY `fk_tbl_product_resource_tbl_product_idx` (`tbl_product_id`),
  KEY `fk_ tbl_product_resources_ tbl_product_resources_type_idx` (`tbl_product_resources_type_id`),
  CONSTRAINT `fk_ tbl_product_resources_ tbl_product_resources_type` FOREIGN KEY (`tbl_product_resources_type_id`) REFERENCES `tbl_product_resources_type` (`tbl_product_resources_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_product_resource_tbl_product` FOREIGN KEY (`tbl_product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_resources`
--

LOCK TABLES `tbl_product_resources` WRITE;
/*!40000 ALTER TABLE `tbl_product_resources` DISABLE KEYS */;
INSERT INTO `tbl_product_resources` VALUES (2,1871,'Size_chart_8707288875198872075.png',97002,'2022-05-30 16:29:28'),(5,1880,'size-gloves_462496837466032367.jpg',97002,'2022-06-28 10:22:22');
/*!40000 ALTER TABLE `tbl_product_resources` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:45
