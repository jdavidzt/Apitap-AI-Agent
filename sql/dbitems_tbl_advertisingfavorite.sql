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
-- Table structure for table `tbl_advertisingfavorite`
--

DROP TABLE IF EXISTS `tbl_advertisingfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_advertisingfavorite` (
  `tbl_advertising_id` bigint(20) NOT NULL,
  `tbl_shuffle_id` int(11) DEFAULT NULL,
  `tbl_location_id` bigint(20) NOT NULL,
  `tbl_terminal_id` bigint(20) NOT NULL,
  `tbl_advertisingfavorite_usernmcid` int(11) NOT NULL,
  `tbl_advertisingfavorite_ownerid` varchar(3) NOT NULL,
  `tbl_advertisingfavorite_date` datetime NOT NULL,
  `tbl_advertisingfavorite_like` int(1) NOT NULL,
  PRIMARY KEY (`tbl_advertising_id`,`tbl_location_id`,`tbl_terminal_id`,`tbl_advertisingfavorite_date`),
  CONSTRAINT `fk_tbl_advertisingfavorite_tbl_advertising` FOREIGN KEY (`tbl_advertising_id`) REFERENCES `tbl_advertising` (`tbl_advertising_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_advertisingfavorite`
--

LOCK TABLES `tbl_advertisingfavorite` WRITE;
/*!40000 ALTER TABLE `tbl_advertisingfavorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_advertisingfavorite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:20
