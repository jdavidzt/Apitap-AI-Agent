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
-- Table structure for table `tbl_user_delivery_options`
--

DROP TABLE IF EXISTS `tbl_user_delivery_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_delivery_options` (
  `tbl_delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_company_id` int(11) DEFAULT NULL,
  `tbl_user_id` bigint(20) DEFAULT NULL,
  `tbl_delivery_company_option` varchar(45) DEFAULT NULL,
  `tbl_delivery_company_service` varchar(45) DEFAULT NULL,
  `tbl_user_delivery_options_tier` text,
  `tbl_delivery_company_price` decimal(15,2) DEFAULT '0.00',
  `tbl_delivery_company_tracking_code` varchar(50) DEFAULT NULL,
  `tbl_user_delivery_default_f` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_delivery_address_required_f` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_user_delivery_range` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbl_delivery_id`),
  KEY `fk_tbl_user_delivery_options_tbl_company_idx` (`tbl_company_id`),
  KEY `fk_tbl_user_delivery_options_tbl_user_idx` (`tbl_user_id`),
  CONSTRAINT `fk_tbl_user_delivery_options_tbl_company` FOREIGN KEY (`tbl_company_id`) REFERENCES `tbl_company` (`tbl_company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3532 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_delivery_options`
--

LOCK TABLES `tbl_user_delivery_options` WRITE;
/*!40000 ALTER TABLE `tbl_user_delivery_options` DISABLE KEYS */;
INSERT INTO `tbl_user_delivery_options` VALUES (170,7,197,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(573,315,1379,'Store','Pick Up',NULL,0.00,NULL,1,1,NULL),(3449,307,1360,'Store','Pick Up',NULL,0.00,NULL,1,1,NULL),(3453,3179,4923,'Store','Pick Up',NULL,0.00,NULL,1,1,NULL),(3485,NULL,5345,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3504,NULL,5613,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3505,NULL,5655,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3506,NULL,5660,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3507,NULL,5661,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3508,NULL,5662,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3509,NULL,5663,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3510,NULL,5664,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3511,NULL,5665,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3512,NULL,5673,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3513,3207,5347,'Store','Pick Up','None',0.00,'',1,1,NULL),(3514,3207,5347,'Own','Delivery','None',5.00,'',0,0,500),(3517,7,197,'UPS','UPS','None',0.00,'',1,0,NULL),(3519,3205,5345,'USPS','USPS','None',0.00,'',1,0,NULL),(3520,307,1360,'UPS','UPS','None',NULL,NULL,1,0,NULL),(3521,3207,5347,'UPS','UPS','None',NULL,NULL,1,0,NULL),(3522,3226,5677,'Pick Up','Pick Up','Pick Up',0.00,'',0,0,NULL),(3523,3227,5678,'Pick Up','Pick Up','Pick Up',0.00,'',0,0,NULL),(3524,NULL,5679,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3525,NULL,5680,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3526,NULL,5682,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3527,NULL,5690,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3528,NULL,5691,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3529,NULL,5692,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3530,NULL,5693,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL),(3531,NULL,5694,'Store','Pick Up','Pick Up',0.00,'',0,1,NULL);
/*!40000 ALTER TABLE `tbl_user_delivery_options` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:36:13
