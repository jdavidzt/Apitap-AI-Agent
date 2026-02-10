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
-- Table structure for table `tbl_shuffleterminal`
--

DROP TABLE IF EXISTS `tbl_shuffleterminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_shuffleterminal` (
  `tbl_shuffle_id` int(11) NOT NULL,
  `tbl_terminal_id` int(11) NOT NULL,
  `tbl_shuffleterminal_dateDownload` datetime DEFAULT NULL,
  PRIMARY KEY (`tbl_shuffle_id`,`tbl_terminal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shuffleterminal`
--

LOCK TABLES `tbl_shuffleterminal` WRITE;
/*!40000 ALTER TABLE `tbl_shuffleterminal` DISABLE KEYS */;
INSERT INTO `tbl_shuffleterminal` VALUES (10,353,NULL),(10,360,NULL),(23,359,'2021-08-29 22:50:16'),(27,358,'2021-09-09 01:46:18'),(32,363,NULL),(32,375,NULL),(36,373,NULL),(39,372,'2022-04-04 12:06:51'),(39,373,NULL),(39,374,'2022-03-09 15:11:06'),(39,381,NULL),(40,389,NULL),(40,390,NULL),(40,395,NULL),(40,397,NULL),(40,398,NULL),(40,399,'2025-10-25 00:06:37'),(41,382,'2022-02-20 09:24:00'),(51,387,'2022-07-14 08:28:33'),(55,389,NULL),(55,390,NULL),(56,388,'2022-04-20 09:42:15'),(58,391,NULL),(60,392,'2022-05-25 15:11:08');
/*!40000 ALTER TABLE `tbl_shuffleterminal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:59
