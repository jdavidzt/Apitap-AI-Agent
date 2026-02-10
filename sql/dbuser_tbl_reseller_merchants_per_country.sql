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
-- Table structure for table `tbl_reseller_merchants_per_country`
--

DROP TABLE IF EXISTS `tbl_reseller_merchants_per_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reseller_merchants_per_country` (
  `tbl_reseller_user_id` bigint(20) NOT NULL,
  `tbl_country_id` bigint(20) DEFAULT NULL,
  `tbl_merchants_per_country` varchar(45) DEFAULT NULL,
  KEY `tbl_country_id_idx` (`tbl_country_id`),
  KEY `tbl_user_percountry_idx` (`tbl_reseller_user_id`),
  CONSTRAINT `tbl_country_id` FOREIGN KEY (`tbl_country_id`) REFERENCES `tbl_country` (`tbl_country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_user_percountry` FOREIGN KEY (`tbl_reseller_user_id`) REFERENCES `tbl_reseller` (`tbl_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reseller_merchants_per_country`
--

LOCK TABLES `tbl_reseller_merchants_per_country` WRITE;
/*!40000 ALTER TABLE `tbl_reseller_merchants_per_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reseller_merchants_per_country` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:49
