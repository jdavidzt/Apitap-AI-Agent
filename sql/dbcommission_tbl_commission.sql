CREATE DATABASE  IF NOT EXISTS `dbcommission` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbcommission`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcommission
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
-- Table structure for table `tbl_commission`
--

DROP TABLE IF EXISTS `tbl_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_commission` (
  `tbl_commission_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_commission_agent_nmcId` int(11) NOT NULL,
  `tbl_commission_date` datetime NOT NULL,
  `tbl_commission_refNumber` varchar(45) DEFAULT NULL,
  `tbl_commission_status_id` int(11) NOT NULL,
  PRIMARY KEY (`tbl_commission_id`),
  KEY `fk_tbl_commission_tbl_commission_status_idx` (`tbl_commission_status_id`),
  CONSTRAINT `fk_tbl_commission_tbl_commission_status` FOREIGN KEY (`tbl_commission_status_id`) REFERENCES `tbl_commission_status` (`tbl_commission_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_commission`
--

LOCK TABLES `tbl_commission` WRITE;
/*!40000 ALTER TABLE `tbl_commission` DISABLE KEYS */;
INSERT INTO `tbl_commission` VALUES (23,1259,'2021-10-18 16:27:08','ref-00000001259',72001),(24,3,'2021-10-25 15:15:19','ref-00000000003',72001),(30,1334,'2021-11-01 14:30:04','ref-00000001334',72001),(31,3,'2021-11-01 15:24:41','ref-00000000003',72001),(33,2533,'2021-12-15 11:32:18','ref-00000002533',72001),(36,2533,'2022-01-05 17:11:42','ref-00000002533',72001),(38,3352,'2022-02-04 12:01:58','ref-00000003352',72001),(39,477,'2022-02-14 16:34:39','ref-00000000477',72001),(41,8,'2022-02-19 14:52:03','ref-8',72001),(42,3,'2022-02-21 13:34:40','ref-00000000003',72001),(44,477,'2022-03-02 12:29:25','ref-00000000477',72001),(45,8,'2022-03-19 12:27:12','ref-8',72001),(48,8,'2025-07-22 09:17:49','ref-8',72001),(49,8,'2025-08-22 19:48:22','ref-8',72001),(50,8,'2025-09-22 19:22:19','ref-8',72001),(51,8,'2025-10-22 21:05:29','ref-8',72001);
/*!40000 ALTER TABLE `tbl_commission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:24
