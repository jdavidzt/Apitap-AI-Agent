CREATE DATABASE  IF NOT EXISTS `nmc_report` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nmc_report`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nmc_report
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
-- Table structure for table `tbl_report_report_query`
--

DROP TABLE IF EXISTS `tbl_report_report_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_report_report_query` (
  `id` int(11) NOT NULL,
  `tbl_report_id` int(11) NOT NULL,
  `tbl_report_query_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_report_query_idx` (`tbl_report_id`),
  KEY `tbl_report_query_idx1` (`tbl_report_query_id`),
  CONSTRAINT `tbl_report` FOREIGN KEY (`tbl_report_id`) REFERENCES `tbl_report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_report_query` FOREIGN KEY (`tbl_report_query_id`) REFERENCES `tbl_report_query` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report_report_query`
--

LOCK TABLES `tbl_report_report_query` WRITE;
/*!40000 ALTER TABLE `tbl_report_report_query` DISABLE KEYS */;
INSERT INTO `tbl_report_report_query` VALUES (1,1,8),(2,2,2),(3,3,3),(4,4,4),(5,5,9),(6,6,2),(7,7,1),(8,8,1),(9,9,5),(10,10,6),(11,11,7),(12,12,10),(13,13,13);
/*!40000 ALTER TABLE `tbl_report_report_query` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:12
