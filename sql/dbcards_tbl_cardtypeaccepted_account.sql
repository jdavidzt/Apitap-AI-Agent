CREATE DATABASE  IF NOT EXISTS `dbcards` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbcards`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcards
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
-- Table structure for table `tbl_cardtypeaccepted_account`
--

DROP TABLE IF EXISTS `tbl_cardtypeaccepted_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cardtypeaccepted_account` (
  `tbl_cardtypeaccepted_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_paymentserviceaccount_id` int(11) DEFAULT NULL,
  `tbl_carduser_id` int(11) DEFAULT NULL,
  `tbl_user_nmcId` int(11) NOT NULL,
  `tbl_cardstype_id` int(11) NOT NULL,
  `tbl_location_id` int(11) DEFAULT NULL,
  `tbl_gateway_id` int(11) NOT NULL,
  `tbl_cardtypeaccepted_account_dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`tbl_cardtypeaccepted_account_id`),
  KEY `fk_tbl_acceptedpaymentmethod_has_tbl_paymentserviceaccount__idx` (`tbl_paymentserviceaccount_id`),
  KEY `fk_tbl_cardtypeaccepted_account_tbl_card_idx` (`tbl_carduser_id`),
  KEY `fk_tbl_cardtypeaccepted_account_tbl_cardtypeaccepted_idx` (`tbl_user_nmcId`,`tbl_cardstype_id`),
  CONSTRAINT `fk_tbl_cardtypeaccepted_account_tbl_cardtypeaccepted1` FOREIGN KEY (`tbl_user_nmcId`, `tbl_cardstype_id`) REFERENCES `tbl_cardtypeaccepted` (`tbl_user_nmcId`, `tbl_cardstype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cardtypeaccepted_account_tbl_carduser1` FOREIGN KEY (`tbl_carduser_id`) REFERENCES `tbl_carduser` (`tbl_carduser_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cardtypeaccepted_account_tbl_paymentserviceaccount1` FOREIGN KEY (`tbl_paymentserviceaccount_id`) REFERENCES `tbl_paymentserviceaccount` (`tbl_paymentserviceaccount_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cardtypeaccepted_account`
--

LOCK TABLES `tbl_cardtypeaccepted_account` WRITE;
/*!40000 ALTER TABLE `tbl_cardtypeaccepted_account` DISABLE KEYS */;
INSERT INTO `tbl_cardtypeaccepted_account` VALUES (1,1,NULL,1,61,1,48,'2018-08-17 00:00:00');
/*!40000 ALTER TABLE `tbl_cardtypeaccepted_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:13
