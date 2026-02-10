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
-- Table structure for table `tbl_languagescreenlock`
--

DROP TABLE IF EXISTS `tbl_languagescreenlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_languagescreenlock` (
  `tbl_languagescreenlock_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_consumer_nmcId` int(11) NOT NULL,
  `tbl_language_idApp` int(11) NOT NULL,
  `tbl_language_idWebsite` int(11) NOT NULL,
  `tbl_sleeptype_idApp` int(11) NOT NULL,
  `tbl_sleeptype_idWebsite` int(11) NOT NULL,
  PRIMARY KEY (`tbl_languagescreenlock_id`),
  KEY `fk_tbl_languageScreenLock_tbl_consumer1_idx` (`tbl_consumer_nmcId`),
  KEY `fk_tbl_languageScreenLock_tbl_language1_idx` (`tbl_language_idApp`),
  KEY `fk_tbl_languageScreenLock_tbl_language2_idx` (`tbl_language_idWebsite`),
  KEY `fk_tbl_languageScreenLock_tbl_sleeptype1_idx` (`tbl_sleeptype_idApp`),
  KEY `fk_tbl_languageScreenLock_tbl_sleeptype2_idx` (`tbl_sleeptype_idWebsite`),
  CONSTRAINT `fk_tbl_languageScreenLock_tbl_consumer1` FOREIGN KEY (`tbl_consumer_nmcId`) REFERENCES `tbl_consumer` (`tbl_consumer_nmcId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_languageScreenLock_tbl_language1` FOREIGN KEY (`tbl_language_idApp`) REFERENCES `tbl_language` (`tbl_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_languageScreenLock_tbl_language2` FOREIGN KEY (`tbl_language_idWebsite`) REFERENCES `tbl_language` (`tbl_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_languageScreenLock_tbl_sleeptype1` FOREIGN KEY (`tbl_sleeptype_idApp`) REFERENCES `tbl_sleeptype` (`tbl_sleeptype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_languageScreenLock_tbl_sleeptype2` FOREIGN KEY (`tbl_sleeptype_idWebsite`) REFERENCES `tbl_sleeptype` (`tbl_sleeptype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_languagescreenlock`
--

LOCK TABLES `tbl_languagescreenlock` WRITE;
/*!40000 ALTER TABLE `tbl_languagescreenlock` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_languagescreenlock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:36
