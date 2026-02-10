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
-- Table structure for table `tbl_package_shuffle`
--

DROP TABLE IF EXISTS `tbl_package_shuffle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_package_shuffle` (
  `tbl_package_id` int(11) NOT NULL,
  `tbl_shuffle_id` int(11) NOT NULL,
  `tbl_shuffle_name` text,
  `tbl_shuffle_broadcast_mobile` int(11) DEFAULT '1',
  `tbl_shuffle_published` int(11) DEFAULT '1',
  `tbl_shuffle_republished_count` int(11) DEFAULT '0',
  PRIMARY KEY (`tbl_package_id`,`tbl_shuffle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_package_shuffle`
--

LOCK TABLES `tbl_package_shuffle` WRITE;
/*!40000 ALTER TABLE `tbl_package_shuffle` DISABLE KEYS */;
INSERT INTO `tbl_package_shuffle` VALUES (727,1,'Default Shuffle 1',0,0,12),(728,2,'Default Shuffle 2',0,0,8),(729,3,'Default Shuffle 3',0,0,3),(730,4,'Default Shuffle 4',0,0,4),(737,10,'Default Shuffle 10',0,0,17),(738,11,'Default Shuffle 11',0,0,0),(739,12,'Default Shuffle 12',0,0,3),(744,17,'Default Shuffle 17',0,0,0),(745,18,'Default Shuffle 18',0,0,0),(748,21,'Default Shuffle 21',0,0,0),(749,22,'Default Shuffle 22',0,0,0),(750,23,'Default Shuffle 23',0,0,1),(751,24,'Default Shuffle 24',0,0,10),(752,25,'Default Shuffle 25',0,0,2),(753,26,'Default Shuffle 26',0,0,7),(754,27,'Default Shuffle 27',0,1,1),(755,28,'Default Shuffle 28',0,0,0),(756,29,'Default Shuffle 29',0,0,2),(758,31,'Default Shuffle 31',0,0,5),(759,32,'Default Shuffle 32',0,0,8),(763,35,'Default Shuffle 35',0,0,0),(767,36,'Default Shuffle 36',0,0,32),(770,38,'Default Shuffle 38',0,1,6),(771,39,'Default Shuffle 39',0,1,27),(773,40,'Default Shuffle 40',0,1,36),(775,41,'Default Shuffle 41',0,0,4),(778,44,'Default Shuffle 44',0,0,0),(779,45,'Default Shuffle 45',0,0,0),(780,46,'Default Shuffle 46',0,0,0),(781,47,'Default Shuffle 47',0,0,0),(783,49,'Default Shuffle 49',0,0,0),(785,51,'Default Shuffle 51',0,1,17),(788,54,'Default Shuffle 54',0,1,6),(789,55,'Default Shuffle 55',0,0,6),(790,56,'Default Shuffle 56',0,0,5),(791,57,'Default Shuffle 57',0,1,6),(792,58,'Default Shuffle 58',0,1,4),(794,60,'Default Shuffle 60',0,0,4),(797,62,'Default Shuffle 62',0,0,2),(799,63,'Default Shuffle 63',0,1,2),(800,64,'Default Shuffle 64',0,1,3),(801,65,'Default Shuffle 65',0,0,6),(802,66,'Default Shuffle 66',0,0,0);
/*!40000 ALTER TABLE `tbl_package_shuffle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:35
