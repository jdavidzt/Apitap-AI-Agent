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
-- Table structure for table `tbl_module_filter`
--

DROP TABLE IF EXISTS `tbl_module_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_module_filter` (
  `tbl_module_filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_module_id` int(11) NOT NULL,
  `tbl_filter_id` int(11) NOT NULL,
  `tbl_subfilter_id` int(11) DEFAULT NULL,
  `tbl_module_filter_value1` varchar(99) NOT NULL,
  `tbl_module_filter_value2` varchar(99) DEFAULT NULL,
  `tbl_module_filter_active_f` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tbl_module_filter_id`),
  KEY `fk_tbl_module_filter_tbl_module_idx` (`tbl_module_id`),
  KEY `fk_tbl_module_filter_tbl_filter_idx` (`tbl_filter_id`),
  KEY `fk_tbl_module_filter_tbl_filter_related_idx` (`tbl_subfilter_id`),
  CONSTRAINT `fk_tbl_module_filter_tbl_filter` FOREIGN KEY (`tbl_filter_id`) REFERENCES `tbl_filter` (`tbl_filter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_module_filter_tbl_filter_related` FOREIGN KEY (`tbl_subfilter_id`) REFERENCES `tbl_filter_related` (`tbl_subfilter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_module_filter_tbl_module` FOREIGN KEY (`tbl_module_id`) REFERENCES `tbl_module` (`tbl_module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_module_filter`
--

LOCK TABLES `tbl_module_filter` WRITE;
/*!40000 ALTER TABLE `tbl_module_filter` DISABLE KEYS */;
INSERT INTO `tbl_module_filter` VALUES (1,1,3,NULL,'190',NULL,1),(3,3,1,1,'21','',1),(5,4,1,1,'23','',1),(7,6,1,2,'dress','',1),(9,7,1,6,'100','',1),(10,5,1,5,'100','',1),(11,4,1,5,'100','',1),(12,4,1,3,'sony','',1),(13,4,2,NULL,'3210',NULL,1),(14,2,3,NULL,'190',NULL,1),(15,1416,1,1,'21','',1);
/*!40000 ALTER TABLE `tbl_module_filter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:39
