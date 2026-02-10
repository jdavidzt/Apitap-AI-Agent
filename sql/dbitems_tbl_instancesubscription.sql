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
-- Table structure for table `tbl_instancesubscription`
--

DROP TABLE IF EXISTS `tbl_instancesubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_instancesubscription` (
  `tbl_instancesubscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tbl_instancesubscription_description` text,
  `tbl_instancetype_id` int(11) NOT NULL,
  `tbl_instancedevicetype_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_instancesubscription_id`),
  KEY `fk_tbl_instancesuscription_tbl_instancetype1_idx` (`tbl_instancetype_id`),
  KEY `fk_tbl_instancesuscription_tbl_instancedevicetype1_idx` (`tbl_instancedevicetype_id`),
  CONSTRAINT `fk_tbl_instancesuscription_tbl_instancedevicetype1` FOREIGN KEY (`tbl_instancedevicetype_id`) REFERENCES `tbl_instancedevicetype` (`tbl_instancedevicetype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_instancesuscription_tbl_instancetype1` FOREIGN KEY (`tbl_instancetype_id`) REFERENCES `tbl_instancetype` (`tbl_instancetype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_instancesubscription`
--

LOCK TABLES `tbl_instancesubscription` WRITE;
/*!40000 ALTER TABLE `tbl_instancesubscription` DISABLE KEYS */;
INSERT INTO `tbl_instancesubscription` VALUES (1,'The white label instance is the same as the NMC app but the branding has been replaced by that of the merchant. There is a wizard that will open once this has been selected for the merchant to customize the colour scheme of the app. The white label is intended for companies that do not have access to IT resource to use the wrapper or the SDK. This instance is the easiest to implement.',1201,3101),(2,'Slightly bigger companies may already have their own application and have concerns about releasing a second app alongside their existing app which could divide their customer base. In addition they may not have a big IT department so the SDK option may not be viable for them and/or wanted',1202,3101),(3,'The SDK is also intended for merchants with their own application but the SDK is aimed at companies that have a larger IT department and/or are are willing to tackle a more customised approach to binding their existing application to NMC. This will give the merchant more control over the NMC elements that are active in the released version of the software',1203,3101);
/*!40000 ALTER TABLE `tbl_instancesubscription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:21
