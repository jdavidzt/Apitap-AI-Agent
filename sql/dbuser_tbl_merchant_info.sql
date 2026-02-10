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
-- Table structure for table `tbl_merchant_info`
--

DROP TABLE IF EXISTS `tbl_merchant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_info` (
  `tbl_merchant_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_company_id` int(11) DEFAULT NULL,
  `tbl_user_id` bigint(20) DEFAULT NULL,
  `tbl_merchant_logo` varchar(70) DEFAULT NULL,
  `tbl_merchant_brand` varchar(99) DEFAULT NULL,
  `tbl_merchant_skin` varchar(70) DEFAULT NULL,
  `tbl_merchant_phone` varchar(20) DEFAULT NULL,
  `tbl_merchant_email` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`tbl_merchant_info_id`),
  KEY `fk_tbl_merchant_info_tbl_company_idx` (`tbl_company_id`),
  KEY `fk_tbl_merchant_info_tbl_user_idx` (`tbl_user_id`),
  CONSTRAINT `fk_tbl_merchant_info_tbl_company` FOREIGN KEY (`tbl_company_id`) REFERENCES `tbl_company` (`tbl_company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_merchant_info_tbl_user` FOREIGN KEY (`tbl_user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_info`
--

LOCK TABLES `tbl_merchant_info` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_info` DISABLE KEYS */;
INSERT INTO `tbl_merchant_info` VALUES (1,NULL,NULL,NULL,NULL,'skin-3.css',NULL,NULL);
/*!40000 ALTER TABLE `tbl_merchant_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:36:11
