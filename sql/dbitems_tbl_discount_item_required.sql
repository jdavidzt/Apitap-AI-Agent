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
-- Table structure for table `tbl_discount_item_required`
--

DROP TABLE IF EXISTS `tbl_discount_item_required`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_discount_item_required` (
  `tbl_product_discount_id` int(11) NOT NULL,
  `tbl_product_id` int(11) NOT NULL,
  KEY `tbl_discount_r` (`tbl_product_discount_id`),
  CONSTRAINT `tbl_discount_r` FOREIGN KEY (`tbl_product_discount_id`) REFERENCES `tbl_product_discount` (`tbl_product_discount_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_discount_item_required`
--

LOCK TABLES `tbl_discount_item_required` WRITE;
/*!40000 ALTER TABLE `tbl_discount_item_required` DISABLE KEYS */;
INSERT INTO `tbl_discount_item_required` VALUES (19,18),(19,17),(267,251),(482,476),(1990,1981),(1996,1993),(2005,1995),(2005,1993),(2009,1995),(2009,1993),(2020,1995),(2020,1993),(2007,1995),(2007,1988),(2013,1995),(2013,1981),(2013,1991),(2024,1995),(2024,1989),(2022,1995),(2022,1988),(2017,1991),(2017,1989),(2033,1995),(2033,1991),(2033,1989),(2015,1995),(2015,1991),(2023,1995),(2023,1981),(2025,1995),(2025,1991),(2025,1989);
/*!40000 ALTER TABLE `tbl_discount_item_required` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:10
