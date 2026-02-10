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
-- Table structure for table `tbl_location_seating`
--

DROP TABLE IF EXISTS `tbl_location_seating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_location_seating` (
  `tbl_location_seating_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_location_id` bigint(20) NOT NULL,
  `tbl_location_seating_section` varchar(99) NOT NULL,
  `tbl_location_seating_tables_qty` int(11) NOT NULL,
  `tbl_location_seating_status_f` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tbl_location_seating_id`),
  KEY `fk_tbl_location_seating_tbl_location_idx` (`tbl_location_id`),
  CONSTRAINT `fk_tbl_location_seating_tbl_location` FOREIGN KEY (`tbl_location_id`) REFERENCES `tbl_location` (`tbl_location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_location_seating`
--

LOCK TABLES `tbl_location_seating` WRITE;
/*!40000 ALTER TABLE `tbl_location_seating` DISABLE KEYS */;
INSERT INTO `tbl_location_seating` VALUES (1,697,'Bar',3,1),(2,697,'Rooftop',8,1),(3,697,'First floor',5,1),(4,697,'Second Floor',4,1),(5,4152,'counter',10,1);
/*!40000 ALTER TABLE `tbl_location_seating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:52
