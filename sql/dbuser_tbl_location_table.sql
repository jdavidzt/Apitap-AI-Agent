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
-- Table structure for table `tbl_location_table`
--

DROP TABLE IF EXISTS `tbl_location_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_location_table` (
  `tbl_location_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_location_seating_id` int(11) NOT NULL,
  `tbl_location_table_name` varchar(45) DEFAULT NULL,
  `tbl_location_table_seats_qty` int(11) NOT NULL DEFAULT '0',
  `tbl_location_table_QRCode` varchar(99) DEFAULT NULL,
  `tbl_location_table_status_f` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tbl_location_table_id`),
  KEY `fk_tbllocation_tbl_location_seating_idx` (`tbl_location_seating_id`),
  CONSTRAINT `fk_tbllocation_tbl_location_seating` FOREIGN KEY (`tbl_location_seating_id`) REFERENCES `tbl_location_seating` (`tbl_location_seating_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_location_table`
--

LOCK TABLES `tbl_location_table` WRITE;
/*!40000 ALTER TABLE `tbl_location_table` DISABLE KEYS */;
INSERT INTO `tbl_location_table` VALUES (1,1,'Table 1',1,NULL,1),(2,1,'Table 2',1,NULL,1),(3,1,'Table 3',1,NULL,1),(4,2,'Table 1',1,NULL,1),(5,2,'Table 2',1,NULL,1),(6,2,'Table 3',1,NULL,1),(7,2,'Table 4',1,NULL,1),(8,2,'Table 5',1,NULL,1),(9,2,'Table 6',1,NULL,1),(10,2,'Table 7',1,NULL,1),(11,2,'Table 8',1,NULL,1),(12,3,'Table 1',1,NULL,1),(13,3,'Table 2',1,NULL,1),(14,3,'Table 3',1,NULL,1),(15,3,'Table 4',1,NULL,1),(16,3,'Table 5',1,NULL,1),(17,4,'Table 1',1,NULL,1),(18,4,'Table 2',1,NULL,1),(19,4,'Table 3',1,NULL,1),(20,4,'Table 4',1,NULL,1),(21,5,'Table 1',1,NULL,1),(22,5,'Table 2',1,NULL,1),(23,5,'Table 3',1,NULL,1),(24,5,'Table 4',1,NULL,1),(25,5,'Table 5',1,NULL,1),(26,5,'Table 6',1,NULL,1),(27,5,'Table 7',1,NULL,1),(28,5,'Table 8',1,NULL,1),(29,5,'Table 9',1,NULL,1),(30,5,'Table 10',1,NULL,1);
/*!40000 ALTER TABLE `tbl_location_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:36:10
