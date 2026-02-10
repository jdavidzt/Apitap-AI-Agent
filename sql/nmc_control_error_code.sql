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
-- Table structure for table `error_code`
--

DROP TABLE IF EXISTS `error_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_code` (
  `error_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) NOT NULL,
  `message` varchar(250) NOT NULL,
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`error_code_id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_code`
--

LOCK TABLES `error_code` WRITE;
/*!40000 ALTER TABLE `error_code` DISABLE KEYS */;
INSERT INTO `error_code` VALUES (1,'0000','Transaction Approved',0),(2,'1001','Card Expired',0),(3,'1002','Card Suspicious',0),(4,'1003','Card Suspended',0),(5,'1004','Card Stolen - pickup',0),(6,'1005','Card Lost',0),(7,'1011','Card Not Found',0),(8,'1012','Cardholder Not Found',0),(9,'1014','Account Not Found',0),(10,'1015','Invalid Request',0),(11,'1016','Not Sufficient Funds',0),(12,'1017','Previously Reversed',0),(13,'1019','Further activity prevents reversal',0),(14,'1020','Further activity prevents void',0),(15,'1021','Original transaction has been voided',0),(16,'1802','Missing fields',0),(17,'1803','Extra fields exist',0),(18,'1804','Duplicated Payment Method ',0),(19,'1806','Card not active',0),(20,'1808','Card not configured',0),(21,'1810','Invalid amount',0),(22,'1811','System Error, Database',0),(23,'1812','System Error, Transaction',0),(24,'1813','Cardholder not active',0),(25,'1814','Cardholder not configured',0),(26,'1815','CardHolder expired',0),(27,'1816','Original not found',0),(28,'1817','Usage Limit Reached',0),(29,'1818','Configuration error',0),(30,'1819','Invalid terminal',0),(31,'1820','Inactive terminal',0),(32,'1821','Invalid merchant',0),(33,'1822','Duplicate entity',0),(34,'1823','Invalid Acquirer',0),(35,'1824','Invalid Custumer/consumer',0),(36,'1825','Invalid Password',0),(37,'1826','S.O.S',0),(38,'1827','Phone Killed',0),(39,'1828','Phone Locked',0),(40,'1921','Wrong Data',0),(41,'2012','Not Approved',0),(42,'3000','Account Expired',0),(43,'3001','Account Not Valid',0),(44,'3002','Email Not Send',0),(45,'5001','Json Parse Error ',0),(46,'5002','Json Unsupported Operation Error',0),(47,'5003','DataBase Error: ERROR ',0),(48,'5004','Unknown Error: ERROR ',0),(49,'5005','Protocol Error: Client Id is not allowed',0),(50,'5006','Protocol Error: The client send wrong data',0),(51,'5007','The Operation Return No Data',0),(52,'5100','The operation 101 not exists',0),(53,'2013','Temporal User Forgot Password',0),(54,'2014','Database Manipulation',0),(55,'2015','Non Temporal User Must Change Password',0),(56,'2016','Invalid Item Id',0),(57,'2017','User Does Not Have Devices',0),(58,'2018','Invalid location',0),(59,'2019','Temporal Password and no assigned device',0),(60,'3003','Email Sent',0),(61,'2020','Duplicated Name',0),(62,'2021','Invalid QRCode',0),(63,'2022','Item Images is Missing',0),(64,'2023','Item Condition is Missing',0),(65,'2024','Item Locations is Missing',0),(66,'2025','Item Schedule is Missing',0),(67,'2026','Item Inventory is Missing',0),(68,'2027','Item Delivery is Missing',0),(69,'2028','Duplicated Model Name',0),(70,'2029','Invalid Category',0),(71,'2030','Invalid Amount Type',0),(72,'2031','Invalid Condition Type',0),(73,'2032','Invalid Membership',0),(74,'2033','Invalid Product',0),(75,'2034','Invalid Delivery option',0),(76,'2035','Invalid BarCode Type',0),(77,'2036','Invalid Item Type',0),(78,'2037','This address cannot be deleted because it is in use',0),(79,'0003','Invalid Value',0),(80,'0005','Invalid Length',0),(81,'2038','Invalid Quantity',0),(82,'7823','Invalid Format',0),(83,'7824','Invalid Tycoon Id',0),(84,'7825','Format Json error',0),(85,'2039','Not enough items in stock',0),(86,'2040','Invalid Payment Method',0),(87,'2041','Category In Use',0),(88,'2042','Duplicated Category Name',0),(89,'2043','Duplicated Location',0),(90,'2044','Duplicated Category',0),(91,'2045','Duplicated Merchant',0),(92,'2046','Wrong Protocol',0),(93,'2047','Wrong Protocol',0),(94,'2048','Wrong Protocol',0),(95,'2049','Wrong Protocol',0),(96,'2050','Wrong Protocol',0),(97,'2051','Wrong Protocol',0),(98,'2052','Wrong Protocol',0),(99,'2053','Email already exists',0),(100,'2054','Wrong Protocol',0),(101,'2055','Wrong Protocol',0),(102,'6000','Invalid Server Request',0),(103,'1025','Transaction Time Out',0),(104,'6001','Invalid Server Request',0),(105,'1829','Phone Locked',0),(106,'2056','Duplicated Nickname',0),(107,'2057','User Not Allowed to Create Category in this level',0),(108,'2058','Invalid Request',0),(109,'2059','Invalid Request',0),(110,'2060','Invalid Request',0),(111,'2061','Invalid Subscription',0),(112,'2062','There is not Admin',0),(113,'2063','Missing receiver',0),(114,'2064','Missing Invoice',0),(115,'9001','Invalid Merchant',0),(116,'9002','Invalid Terminal',0),(117,'0006','Time Out',0),(118,'0007','Transaction Rejected',0),(119,'2065','Item Not available at this moment, try again later',0),(120,'2066','The account is Pending for Approval',0),(121,'2067','Duplicated Company Name',0),(122,'1010','File Not Found',0),(123,'2068','Delivery in Use',0),(124,'2069','Duplicated Package Name',0),(125,'2070','Advertising Already Liked',0),(126,'2071','Advertising Already Disliked',0),(127,'2072','Subscription Required',0),(128,'2073','Credit Card dont created',0),(129,'2074','Crdit Card dont exists',0),(130,'2075','Pay dont acepted',0),(131,'2076','Nothing to play',0),(132,'2077','Wrong orientation',0),(133,'2078','Invalid Address Name',0),(134,'2079','Invalid Zipcode',0);
/*!40000 ALTER TABLE `error_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:31:58
