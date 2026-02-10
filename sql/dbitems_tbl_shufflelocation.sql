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
-- Table structure for table `tbl_shufflelocation`
--

DROP TABLE IF EXISTS `tbl_shufflelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_shufflelocation` (
  `tbl_shuffle_id` int(11) NOT NULL,
  `tbl_location_id` int(11) NOT NULL,
  `tbl_shufflelocation_allterminal_f` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tbl_shuffle_id`,`tbl_location_id`),
  KEY `fk_tbl_package_has_tbl_location_tbl_package1_idx` (`tbl_shuffle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shufflelocation`
--

LOCK TABLES `tbl_shufflelocation` WRITE;
/*!40000 ALTER TABLE `tbl_shufflelocation` DISABLE KEYS */;
INSERT INTO `tbl_shufflelocation` VALUES (2,948,0),(3,948,0),(4,928,0),(10,697,0),(10,948,0),(23,948,0),(24,928,0),(24,948,0),(25,697,0),(25,948,0),(27,697,0),(29,1750,0),(31,1750,0),(32,948,0),(36,3399,0),(38,948,0),(39,3399,0),(40,948,0),(41,928,0),(41,948,0),(41,1686,0),(49,3412,0),(51,3412,0),(55,948,0),(56,927,0),(58,1750,0),(60,928,0);
/*!40000 ALTER TABLE `tbl_shufflelocation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:27
