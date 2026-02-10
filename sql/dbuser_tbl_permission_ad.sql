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
-- Table structure for table `tbl_permission_ad`
--

DROP TABLE IF EXISTS `tbl_permission_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_permission_ad` (
  `tbl_permission_ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` bigint(20) NOT NULL,
  `tbl_permission_ad_create_f` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_permission_ad_publish_f` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_permission_item_viewOnly_f` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tbl_permission_ad_id`),
  KEY `fk_tbl_permission_ad_tbl_user_idx` (`tbl_user_id`),
  CONSTRAINT `fk_tbl_permission_ad_tbl_user` FOREIGN KEY (`tbl_user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permission_ad`
--

LOCK TABLES `tbl_permission_ad` WRITE;
/*!40000 ALTER TABLE `tbl_permission_ad` DISABLE KEYS */;
INSERT INTO `tbl_permission_ad` VALUES (42,612,0,0,1),(78,1259,1,1,0),(81,1335,0,0,1),(82,1336,0,0,1),(83,1337,0,0,1),(84,1338,0,0,1),(85,1339,0,0,1),(90,1334,0,0,1),(92,1360,0,0,1),(96,3061,0,0,1),(98,8,0,0,1),(99,3352,0,0,1),(100,4489,1,1,0),(110,4481,0,0,1),(111,4933,1,1,0),(112,4923,0,0,1),(114,5024,0,0,1),(115,5176,0,0,1),(116,5177,0,0,1),(117,5178,0,0,1),(123,5371,0,0,1),(124,5372,0,0,1),(125,5373,0,0,1),(126,5374,1,1,0),(129,5347,0,0,1);
/*!40000 ALTER TABLE `tbl_permission_ad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:35:18
