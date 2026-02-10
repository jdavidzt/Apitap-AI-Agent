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
-- Table structure for table `tbl_merchant_payfactory`
--

DROP TABLE IF EXISTS `tbl_merchant_payfactory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_payfactory` (
  `tbl_merchant_payfactory_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) DEFAULT NULL,
  `tbl_company_id` int(11) DEFAULT NULL,
  `tbl_payfactory_appId` varchar(45) DEFAULT NULL,
  `tbl_payfactory_type` varchar(45) DEFAULT NULL,
  `tbl_payfactory_message` varchar(45) DEFAULT NULL,
  `tbl_payfactory_externalId` varchar(45) DEFAULT NULL,
  `tbl_payfactory_timestamp` varchar(45) DEFAULT NULL,
  `tbl_payfactory_merchantName` varchar(45) DEFAULT NULL,
  `tbl_payfactory_gatewayName` varchar(45) DEFAULT NULL,
  `tbl_payfactory_gateway_credentials_accountId` varchar(45) DEFAULT NULL,
  `tbl_payfactory_gateway_credentials_apiAccessKey` varchar(45) DEFAULT NULL,
  `tbl_payfactory_sessionId` varchar(45) DEFAULT NULL,
  `tbl_payfactory_validUntil` varchar(45) DEFAULT NULL,
  `tbl_payfactory_complete` varchar(45) DEFAULT NULL,
  `tbl_payfactory_url` varchar(255) DEFAULT NULL,
  `tbl_payfactory_expired` varchar(45) DEFAULT NULL,
  `tbl_payfactory_gp_merchantid` varchar(45) DEFAULT NULL,
  `tbl_payfactory_gp_merchantname` varchar(45) DEFAULT NULL,
  `tbl_payfactory_json` text,
  PRIMARY KEY (`tbl_merchant_payfactory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_payfactory`
--

LOCK TABLES `tbl_merchant_payfactory` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_payfactory` DISABLE KEYS */;
INSERT INTO `tbl_merchant_payfactory` VALUES (5,4649,NULL,'7ZHH-YFOQ',NULL,NULL,'0001202C000000004649',NULL,NULL,NULL,NULL,NULL,'4NkoKUSLiJtB','2025-02-14T21:36:14.3946211Z','false','https://dev-apply.payfactory.app/4NkoKUSLiJtB','false',NULL,NULL,NULL),(6,5337,NULL,'YVVE-P296',NULL,NULL,'0001202C000000005337',NULL,NULL,NULL,NULL,NULL,'2ZD1jmgunkqU','2025-02-18T17:08:27.2557899Z','false','https://apply.payfactory.app/2ZD1jmgunkqU','false',NULL,NULL,NULL),(7,5340,NULL,'DQH5-0N0Z',NULL,NULL,'0001202A000000005340',NULL,NULL,NULL,NULL,NULL,'JgHNGmhXUeMg','2025-02-20T17:08:36.2527142Z','false','https://apply.payfactory.app/JgHNGmhXUeMg','false',NULL,NULL,NULL),(8,4649,3177,'7VC4-XPD2',NULL,NULL,'0001202C000000004649',NULL,NULL,NULL,'120615845635','c5bb9f43eb900a646ef97503965a72e8','EXcEgOnXt6Mj','2025-02-20T23:58:08.2674147Z','false','https://apply.payfactory.app/EXcEgOnXt6Mj','false',NULL,NULL,NULL),(9,5341,3201,'ML2G-K1V1',NULL,NULL,'0001202A000000005341',NULL,NULL,NULL,NULL,NULL,'HsiFdZVhzaNQ','2025-02-21T16:23:31.7738568Z','false','https://apply.payfactory.app/HsiFdZVhzaNQ','false',NULL,NULL,NULL),(10,5345,3205,'OS92-OO7L',NULL,NULL,'0001202A000000005345',NULL,NULL,NULL,NULL,NULL,'ogZJc5u2xmSX','2025-02-24T21:37:42.6116376Z','false','https://apply.payfactory.app/ogZJc5u2xmSX','false',NULL,NULL,NULL),(13,197,7,'21AN-9DK8',NULL,NULL,'0001202A000000000197',NULL,NULL,NULL,NULL,NULL,'lhzjKl0bSr7r','2025-02-26T18:16:23.189391Z','false','https://apply.payfactory.app/lhzjKl0bSr7r','false',NULL,NULL,NULL),(14,5346,3206,'D5IO-G07D',NULL,NULL,'0001202C000000005346',NULL,NULL,NULL,NULL,NULL,'fgiU19faHKNv','2025-02-28T15:29:03.9195475Z','false','https://apply.payfactory.app/fgiU19faHKNv','false',NULL,NULL,NULL),(15,5347,3207,'VQWZ-C1EZ','ApplicationApproved',NULL,'0001202C000000005347',NULL,NULL,NULL,'120615845635','c5bb9f43eb900a646ef97503965a72e8','Jn84cm3yhwY0','2025-02-28T19:43:02.1355121Z','true','https://apply.payfactory.app/Jn84cm3yhwY0','true',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_merchant_payfactory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:36:14
