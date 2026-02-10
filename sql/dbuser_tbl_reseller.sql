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
-- Table structure for table `tbl_reseller`
--

DROP TABLE IF EXISTS `tbl_reseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reseller` (
  `tbl_reseller_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tbl_reseller_nmcId` int(11) NOT NULL,
  `tbl_user_id` bigint(20) NOT NULL,
  `tbl_reseller_clientsNumber` int(11) NOT NULL,
  `tbl_reseller_taxNumber` varchar(45) DEFAULT NULL,
  `tbl_reseller_time_id` int(11) DEFAULT '95002',
  `tbl_reseller_servicesProvider_f` tinyint(1) NOT NULL,
  `tbl_reseller_comments` text,
  `tbl_reseller_admin_approval` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_reseller_iso_type` int(11) DEFAULT NULL,
  `tbl_reseller_years_in_business` varchar(10) DEFAULT NULL,
  `tbl_reseller_flag_account_merchant_management` tinyint(1) DEFAULT '0',
  `tbl_reseller_account_merchant_management_id` int(11) DEFAULT NULL,
  `tbl_reseller_account_merchant_management_other` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`tbl_reseller_id`),
  KEY `tbl_reseller_nmcId_idx` (`tbl_reseller_nmcId`),
  KEY `fk_tbl_reseller_tbl_resellertemp1_idx` (`tbl_user_id`),
  KEY `fk_tbl_reseller_time_idx` (`tbl_reseller_time_id`),
  CONSTRAINT `fk_tbl_reseller_tbl_user` FOREIGN KEY (`tbl_user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_reseller_time` FOREIGN KEY (`tbl_reseller_time_id`) REFERENCES `tbl_reseller_time` (`tbl_reseller_time_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reseller`
--

LOCK TABLES `tbl_reseller` WRITE;
/*!40000 ALTER TABLE `tbl_reseller` DISABLE KEYS */;
INSERT INTO `tbl_reseller` VALUES (45,477,477,2000,'12345678',95002,0,NULL,1,5432,NULL,0,NULL,NULL),(78,2533,2533,0,NULL,95002,0,NULL,1,NULL,NULL,0,NULL,NULL),(79,2534,2534,0,NULL,95002,0,NULL,1,NULL,NULL,0,NULL,NULL),(85,3061,3061,0,NULL,NULL,0,NULL,1,NULL,NULL,0,NULL,NULL),(90,8,8,0,'1234',NULL,0,NULL,1,NULL,NULL,0,NULL,NULL),(95,4423,4423,0,NULL,95002,0,NULL,1,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `tbl_reseller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:45
