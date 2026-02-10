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
-- Table structure for table `tbl_cardtypeaccepted`
--

DROP TABLE IF EXISTS `tbl_cardtypeaccepted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cardtypeaccepted` (
  `tbl_user_nmcId` int(11) NOT NULL,
  `tbl_cardstype_id` int(11) NOT NULL,
  `tbl_cardtypeaccepted_dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`tbl_user_nmcId`,`tbl_cardstype_id`),
  KEY `fk_tbl_cardtypeaccepted_tbl_cardstype_type1_idx` (`tbl_cardstype_id`),
  CONSTRAINT `fk_tbl_cardtypeaccepted_tbl_cardstype_type1` FOREIGN KEY (`tbl_cardstype_id`) REFERENCES `tbl_cardstype` (`tbl_cardstype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cardtypeaccepted`
--

LOCK TABLES `tbl_cardtypeaccepted` WRITE;
/*!40000 ALTER TABLE `tbl_cardtypeaccepted` DISABLE KEYS */;
INSERT INTO `tbl_cardtypeaccepted` VALUES (1,61,'2018-08-17 00:00:00'),(197,61,'2018-08-01 14:43:47'),(197,62,'2018-08-10 08:16:51'),(197,63,'2018-08-10 08:17:01'),(197,65,'2018-09-05 07:58:05'),(477,66,'2018-09-05 11:44:50');
/*!40000 ALTER TABLE `tbl_cardtypeaccepted` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:05
