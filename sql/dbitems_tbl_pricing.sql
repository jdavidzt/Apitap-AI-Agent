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
-- Table structure for table `tbl_pricing`
--

DROP TABLE IF EXISTS `tbl_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pricing` (
  `tbl_pricing` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_subscription_id` int(11) NOT NULL,
  `tbl_reseller_nmcId` bigint(20) DEFAULT NULL,
  `tbl_merchant_nmcId` bigint(20) DEFAULT NULL,
  `tbl_current_price` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`tbl_pricing`),
  KEY `fk_tbl_subscription_id_idx` (`tbl_subscription_id`),
  CONSTRAINT `fk_tbl_subscription_id` FOREIGN KEY (`tbl_subscription_id`) REFERENCES `tbl_subscription` (`tbl_subscription_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pricing`
--

LOCK TABLES `tbl_pricing` WRITE;
/*!40000 ALTER TABLE `tbl_pricing` DISABLE KEYS */;
INSERT INTO `tbl_pricing` VALUES (2,16,287,NULL,375.00),(4,16,606,NULL,375.00),(5,16,4492,NULL,175.00),(6,18,4492,NULL,900.00),(11,23,5354,NULL,1.00),(12,23,3123,NULL,19.00),(13,20,5413,NULL,0.00);
/*!40000 ALTER TABLE `tbl_pricing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:39
