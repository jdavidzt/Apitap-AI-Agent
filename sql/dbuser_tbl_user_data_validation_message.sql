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
-- Table structure for table `tbl_user_data_validation_message`
--

DROP TABLE IF EXISTS `tbl_user_data_validation_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_data_validation_message` (
  `tbl_user_data_validation_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_data_validation_message_description` text,
  `tbl_user_data_validation_url` text,
  PRIMARY KEY (`tbl_user_data_validation_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_data_validation_message`
--

LOCK TABLES `tbl_user_data_validation_message` WRITE;
/*!40000 ALTER TABLE `tbl_user_data_validation_message` DISABLE KEYS */;
INSERT INTO `tbl_user_data_validation_message` VALUES (1,'1735','/merchant/settings/profile/main.xhtml'),(2,'1736','/merchant/settings/businessCategories/main.xhtml'),(5,'1739','/merchant/settings/subscriptions/main.xhtml'),(7,'1741','/consumer/settings/accounts/main.xhtml'),(8,'1742','/consumer/settings/profile/main.xhtml'),(9,'1739','/advertiser/main/subscription/main.xhtml'),(10,'1832','/merchant/settings/userManagement/main.xhtml'),(11,'1832','/reseller/settings/userManagement/main.xhtml'),(14,'1846','/merchant/settings/profile/main.xhtml'),(18,'2054','/merchant/settings/locations/main.xhtml'),(20,'3016','/merchant/settings/completeMerchant/main.xhtml'),(21,'3026','/merchant/settings/profile/main.xhtml'),(22,'3093','/reseller/settings/profile/main.xhtml'),(23,'3094','/reseller/settings/accounting/main.xhtml'),(24,'3125','/merchant/settings/locations/main.xhtml'),(25,'3541','/merchant/settings/profile/main.xhtml'),(26,'3946','/merchant/settings/profile/main.xhtml'),(27,'3960','/merchant/settings/profile/main.xhtml');
/*!40000 ALTER TABLE `tbl_user_data_validation_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:36:09
