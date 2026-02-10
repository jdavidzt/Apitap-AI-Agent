CREATE DATABASE  IF NOT EXISTS `nmc_control` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nmc_control`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nmc_control
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
-- Table structure for table `parameter_autopay`
--

DROP TABLE IF EXISTS `parameter_autopay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameter_autopay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param` varchar(45) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_autopay`
--

LOCK TABLES `parameter_autopay` WRITE;
/*!40000 ALTER TABLE `parameter_autopay` DISABLE KEYS */;
INSERT INTO `parameter_autopay` VALUES (1,'hourSystemNotice','9'),(2,'alertDay1','11'),(3,'alertDay2','5'),(4,'alertDay3','4'),(5,'AUTOPAY_SERVER','http://10.0.1.5:2039/NmcServerS/nmc-server/post/'),(6,'URL_PHP','http://10.0.1.5:8085/aioTransaction/aio.php'),(10,'daysToQuery','7'),(11,'alertDays','7-4-2'),(12,'BLUEFIN_ACCOUNT_ID','120615845635'),(13,'BLUEFIN_API_ACCESSKEY','c5bb9f43eb900a646ef97503965a72e8');
/*!40000 ALTER TABLE `parameter_autopay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:31:54
