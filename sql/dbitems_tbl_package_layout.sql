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
-- Table structure for table `tbl_package_layout`
--

DROP TABLE IF EXISTS `tbl_package_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_package_layout` (
  `tbl_package_id` int(11) NOT NULL,
  `tbl_layout_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_package_id`,`tbl_layout_id`),
  KEY `fk_tbl_package_layout_tbl_package_idx` (`tbl_package_id`),
  KEY `fk_tbl_package_layout_tbl_layout` (`tbl_layout_id`),
  CONSTRAINT `fk_tbl_package_layout_tbl_layout` FOREIGN KEY (`tbl_layout_id`) REFERENCES `tbl_layout` (`tbl_layout_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_package_layout_tbl_package` FOREIGN KEY (`tbl_package_id`) REFERENCES `tbl_package` (`tbl_package_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_package_layout`
--

LOCK TABLES `tbl_package_layout` WRITE;
/*!40000 ALTER TABLE `tbl_package_layout` DISABLE KEYS */;
INSERT INTO `tbl_package_layout` VALUES (727,499),(728,500),(729,501),(730,503),(737,505),(738,505),(739,505),(744,528),(745,531),(748,534),(749,534),(750,534),(751,535),(752,501),(753,536),(754,535),(755,538),(756,539),(758,541),(759,542),(763,542),(767,549),(770,538),(771,555),(773,536),(775,557),(778,560),(779,561),(780,562),(781,562),(783,565),(785,567),(788,569),(789,542),(790,570),(791,571),(792,563),(794,575),(797,576),(799,576),(800,577),(801,578),(802,579);
/*!40000 ALTER TABLE `tbl_package_layout` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:03
