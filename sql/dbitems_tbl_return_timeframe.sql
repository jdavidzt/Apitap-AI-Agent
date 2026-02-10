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
-- Table structure for table `tbl_return_timeframe`
--

DROP TABLE IF EXISTS `tbl_return_timeframe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_return_timeframe` (
  `tbl_return_timeframe_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_return_timeframe_name` varchar(45) NOT NULL,
  `tbl_return_timeframe_value` int(11) NOT NULL,
  `tbl_return_timeframe_bundle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tbl_return_timeframe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_return_timeframe`
--

LOCK TABLES `tbl_return_timeframe` WRITE;
/*!40000 ALTER TABLE `tbl_return_timeframe` DISABLE KEYS */;
INSERT INTO `tbl_return_timeframe` VALUES (89001,'No Refunds',0,'3780'),(89002,'Same Day',0,'3781'),(89003,'Next Day',1,'3782'),(89004,'3 Days',3,'5129'),(89005,'5 Days',5,'5130'),(89006,'7 Days',7,'3783'),(89007,'14 Days',14,'3784'),(89008,'30 Days',30,'3785');
/*!40000 ALTER TABLE `tbl_return_timeframe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:34
