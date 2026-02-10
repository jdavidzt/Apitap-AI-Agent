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
-- Table structure for table `tbl_filter_related`
--

DROP TABLE IF EXISTS `tbl_filter_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_filter_related` (
  `tbl_subfilter_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_filter_id` int(11) NOT NULL,
  `tbl_subfilter_name` varchar(99) NOT NULL,
  `tbl_subfilter_active_f` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tbl_subfilter_id`),
  KEY `fk_tbl_filter_related_tbl_filter_idx` (`tbl_filter_id`),
  CONSTRAINT `fk_tbl_filter_related_tbl_filter` FOREIGN KEY (`tbl_filter_id`) REFERENCES `tbl_filter` (`tbl_filter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_filter_related`
--

LOCK TABLES `tbl_filter_related` WRITE;
/*!40000 ALTER TABLE `tbl_filter_related` DISABLE KEYS */;
INSERT INTO `tbl_filter_related` VALUES (1,1,'Type',1),(2,1,'Name',1),(3,1,'Brand',1),(4,1,'Date',0),(5,1,'Price max',1),(6,1,'Price min',1),(7,1,'Date max',1),(8,1,'Date min',1);
/*!40000 ALTER TABLE `tbl_filter_related` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:47
