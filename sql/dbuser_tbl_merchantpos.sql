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
-- Table structure for table `tbl_merchantpos`
--

DROP TABLE IF EXISTS `tbl_merchantpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchantpos` (
  `tbl_merchantpos_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_merchantpos_contacProvider` varchar(45) NOT NULL,
  `tbl_merchantpos_contacName` varchar(45) DEFAULT NULL,
  `tbl_merchantpos_contacMail` varchar(255) DEFAULT NULL,
  `tbl_merchantpos_contacPhone` bigint(20) NOT NULL DEFAULT '0',
  `tbl_merchant_nmcId` int(11) NOT NULL,
  PRIMARY KEY (`tbl_merchantpos_id`),
  KEY `fk_tbl_merchantpos_tbl_merchant1_idx` (`tbl_merchant_nmcId`),
  KEY `fk_tbl_merchantpos_tbl_merchantposphone_idx` (`tbl_merchantpos_contacPhone`),
  CONSTRAINT `fk_tbl_merchantpos_tbl_merchant1` FOREIGN KEY (`tbl_merchant_nmcId`) REFERENCES `tbl_merchant` (`tbl_merchant_nmcId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchantpos`
--

LOCK TABLES `tbl_merchantpos` WRITE;
/*!40000 ALTER TABLE `tbl_merchantpos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_merchantpos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:35:35
