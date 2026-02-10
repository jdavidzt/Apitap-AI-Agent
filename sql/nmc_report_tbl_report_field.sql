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
-- Table structure for table `tbl_report_field`
--

DROP TABLE IF EXISTS `tbl_report_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_report_field` (
  `id` int(11) NOT NULL,
  `field_label` varchar(45) DEFAULT NULL,
  `field_type` enum('String','Long','NmcId','Date') DEFAULT 'String',
  `field_filter` tinyint(1) DEFAULT NULL,
  `field_order` varchar(2) DEFAULT NULL,
  `field_visible` tinyint(1) DEFAULT NULL,
  `field_tycoon` varchar(45) DEFAULT NULL,
  `tbl_field_hexa_f` tinyint(1) DEFAULT '0',
  `field_nmcType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report_field`
--

LOCK TABLES `tbl_report_field` WRITE;
/*!40000 ALTER TABLE `tbl_report_field` DISABLE KEYS */;
INSERT INTO `tbl_report_field` VALUES (1,'Reseller Id','String',1,'11',0,'53',0,NULL),(2,'Company Name','String',1,'01',1,'114.70',1,NULL),(3,'Merchant Id','String',1,'12',0,'114.179',0,NULL),(5,'Status','NmcId',1,'10',1,'114.143',0,'USERSTATUS'),(7,'LocationID','Long',1,'13',0,'114.47',0,NULL),(8,'Location Store Number','String',1,'3',1,'122.119',0,NULL),(9,'Active Products','Long',1,'4',1,'114.121',0,NULL),(11,'Active Offers','Long',1,'6',1,'121.13',0,NULL),(13,'No. Items Sold','Long',1,'8',1,'114.132',0,NULL),(14,'Owner Id','NmcId',0,'14',0,'127.10',0,NULL),(15,'Position','String',0,'15',0,'122.91',0,NULL),(16,'Department','String',0,'16',0,'127.92',0,NULL),(17,'Supervisor','String',0,'17',0,'121.145',1,NULL),(18,'Active Catalog','String',0,'18',0,'127.34',0,NULL),(19,'Contact Phone','String',0,'19',0,'48.28',0,NULL),(20,'Invoice Id','String',1,'02',1,'121.192',0,NULL),(21,'Date','Date',1,'01',1,'120.31',0,NULL),(22,'Merchant Id','String',1,'11',0,'114.179',0,NULL),(24,'LocationID','Long',1,'12',0,'114.47',0,NULL),(25,'Location Store Number','String',1,'03',0,'122.119',0,NULL),(26,'Consumer Id','String',1,'13',0,'127.35',0,NULL),(29,'Payment Type','NmcId',1,'14',0,'120.7',0,'CREDITCARDTYPE'),(30,'Card Used','NmcId',1,'02',1,'48.2',0,NULL),(31,'Transaction Type','NmcId',0,'03',1,'48.29',0,'TRANSACTIONTYPE'),(32,'Status','NmcId',1,'04',1,'114.143',0,'INVOICESTATUS'),(33,'Quantity of Items','Long',1,'07',0,'122.148',0,NULL),(34,'Total','Long',1,'05',1,'55.3',0,NULL),(35,'Item ID','Long',1,'01',1,'114.144',0,NULL),(36,'SKU ','String',1,'06',1,'121.102',0,NULL),(37,'Title','String',1,'05',1,'120.83',1,NULL),(38,'Type','NmcId',1,'02',1,'114.112',0,'PRODUCTTYPE'),(39,'Sub-Category','String',1,'04',1,'120.45',0,NULL),(40,'Category','String',1,'03',1,'114.53',0,NULL),(41,'Status','NmcId',1,'07',1,'114.143',0,'DIRECTPURCHASESTATUS'),(42,'Price','String',1,'10',1,'114.98',0,NULL),(44,'Purchases','String',1,'09',1,'114.121',0,NULL),(45,'Bill Number','Long',1,'9',0,'121.41',0,NULL),(46,'Date','Date',1,'1',1,'121.140',0,NULL),(47,'Invoice Id','String',1,'2',1,'121.75',0,NULL),(48,'Merchant Id','String',1,'10',0,'114.179',0,NULL),(52,'Price','String',1,'5',1,'120.84',0,NULL),(53,'Payment Method','NmcId',1,'6',1,'48.3',0,NULL),(56,'Status','NmcId',1,'8',1,'114.143',0,'INVOICESTATUS'),(57,'Reseller Id','String',0,'13',0,'53',0,NULL),(59,'Bill Id','Long',1,'11',0,'121.192',0,NULL),(60,'Date','Date',1,'1',1,'121.140',0,NULL),(61,'Invoice Id','String',1,'2',1,'121.75',0,NULL),(62,'Merchant Id','String',1,'12',0,'114.179',0,NULL),(64,'Subscription Id','String',1,'13',0,'122.116',0,NULL),(65,'Title','String',1,'5',1,'120.83',1,NULL),(66,'Price','String',1,'6',1,'120.84',0,NULL),(67,'Payment Method','NmcId',1,'7',1,'48.3',0,NULL),(69,'Frequency','NmcId',1,'9',1,'121.73',0,NULL),(70,'Status','NmcId',1,'14',1,'114.143',0,'PACKAGESTATUS'),(71,'Reseller Id','String',1,'15',0,'53',0,NULL),(73,'Invoice Id','String',1,'02',1,'121.75',0,NULL),(74,'Date','Date',1,'01',1,'120.31',0,NULL),(75,'Merchant Id','String',1,'10',0,'114.179',0,NULL),(77,'LocationID','Long',1,'11',0,'114.47',0,NULL),(78,'Location Store Number','String',1,'03',1,'122.119',0,NULL),(79,'Consumer Id','String',1,'12',0,'127.35',0,NULL),(82,'Payment Type','NmcId',0,'13',0,'120.7',0,NULL),(83,'Card Used','NmcId',0,'14',0,'48.2',0,NULL),(84,'Transaction Type','NmcId',1,'05',1,'48.29',0,NULL),(85,'Status','NmcId',1,'06',1,'114.143',0,'DIRECTPURCHASESTATUS'),(86,'Quantity of Items','Long',1,'07',1,'122.148',0,NULL),(87,'Amount','Long',1,'08',1,'55.3',0,NULL),(88,'Name [First Name]','String',0,'20',0,'114.3',1,NULL),(89,'Name [Last Name]','String',0,'21',0,'114.5',1,NULL),(90,'Parent Id','String',0,'22',0,'114.150',0,NULL),(91,'Reseller Id','String',0,'10',0,'53',0,NULL),(93,'Merchant Id','String',1,'12',0,'114.179',0,NULL),(95,'Status','NmcId',1,'9',1,'114.143',0,'DIRECTPURCHASESTATUS'),(97,'LocationID','Long',1,'13',0,'114.47',0,NULL),(98,'Location Store Number','String',1,'6',1,'122.119',0,NULL),(99,'Active Products','Long',0,'14',0,'114.121',0,NULL),(100,'Active Services','Long',0,'15',0,'114.132',0,NULL),(101,'Active Discounts','Long',0,'16',0,'122.144',0,NULL),(102,'Active Memberships','Long',0,'17',0,'122.148',0,NULL),(103,'No. Items Sold','Long',0,'18',0,'122.146',0,NULL),(104,'Owner Id','NmcId',1,'19',0,'127.10',0,NULL),(105,'Position','String',1,'3',1,'122.91',0,NULL),(106,'Department','String',1,'4',1,'120.157',1,NULL),(107,'Supervisor','String',1,'5',1,'121.145',1,NULL),(108,'Active Catalog','String',0,'20',0,'127.34',0,NULL),(109,'Contact Phone','String',1,'8',1,'48.28',0,NULL),(110,'Name [First Name]','String',1,'2',1,'114.3',1,NULL),(111,'Name [Last Name]','String',1,'2',1,'114.5',1,NULL),(112,'Parent Id','String',1,'21',0,'114.150',0,NULL),(113,'Reseller Id','String',0,'12',0,'53',0,NULL),(115,'Merchant Id','String',1,'14',0,'114.179',0,NULL),(117,'Status','NmcId',1,'11',1,'114.143',0,'USERSTATUS'),(119,'LocationID','Long',1,'15',0,'114.47',0,NULL),(120,'Location Store Number','String',1,'2',1,'122.119',0,NULL),(121,'Active Products','Long',1,'4',1,'114.121',0,NULL),(122,'Active Services','Long',1,'5',1,'114.132',0,NULL),(123,'Active Discounts','Long',1,'6',1,'122.144',0,NULL),(124,'Active Memberships','Long',1,'7',1,'122.148',0,NULL),(125,'No. Items Sold','Long',1,'9',1,'122.146',0,NULL),(126,'Owner Id','NmcId',1,'3',1,'127.10',0,NULL),(127,'Position','String',0,'16',0,'122.91',0,NULL),(128,'Department','String',0,'17',0,'120.157',1,NULL),(129,'Supervisor','String',0,'18',0,'121.145',1,NULL),(130,'Active Catalog','Long',1,'8',1,'127.34',0,NULL),(131,'Contact Phone','String',0,'19',0,'48.28',0,NULL),(132,'Name [First Name]','String',0,'20',0,'114.3',1,NULL),(133,'Name [Last Name]','String',0,'21',0,'114.5',1,NULL),(134,'Parent Id','String',0,'22',0,'114.150',0,NULL),(135,'Merchant Id','String',1,'11',0,'114.179',0,NULL),(136,'Brand','String',1,'08',1,'114.149',1,NULL),(137,'Customer Name','String',1,'06',1,'114.53',1,NULL),(138,'Customer Name','String',1,'04',1,'114.53',1,'USERNAME'),(139,'Package Id','String',1,'01',0,'114.101',0,NULL),(140,'Package Name','String',1,'02',1,'114.156',1,NULL),(141,'Start Date','Date',1,'03',1,'114.138',0,NULL),(142,'End Date','Date',1,'04',1,'114.139',0,NULL),(143,'Items','String',1,'05',1,'127.120',0,NULL),(144,'Images','String',1,'06',1,'127.115',0,NULL),(145,'Videos','String',1,'07',1,'127.116',0,NULL),(146,'Locations','String',1,'08',1,'127.118',0,NULL),(147,'Devices','String',1,'09',1,'127.119',0,NULL),(148,'Likes','String',1,'10',1,'114.121',0,NULL),(149,'Dislikes','String',1,'11',1,'114.132',0,NULL),(150,'Republish','String',1,'12',1,'127.117',0,NULL),(151,'Merchant Id','String',1,'13',0,'53',0,NULL),(152,'Item ID','Long',1,'01',1,'114.144',0,NULL),(153,'Type','NmcId',1,'02',1,'114.112',0,'PRODUCTTYPE'),(154,'Category','String',1,'03',1,'114.53',0,NULL),(155,'Sub-Category','String',1,'04',1,'120.45',0,NULL),(156,'Title','String',1,'05',1,'120.83',1,NULL),(157,'Price','String',1,'06',1,'114.98',0,NULL),(158,'Store Name','String',1,'07',1,'121.150',0,NULL),(159,'Purchases','String',1,'08',1,'114.121',0,NULL),(160,'Merchant Id','String',1,'09',0,'114.179',0,NULL),(161,'Item ID','Long',1,'01',1,'114.144',0,NULL),(162,'Type','NmcId',1,'02',1,'114.112',0,'PRODUCTTYPE'),(163,'Category','String',1,'03',1,'114.53',0,NULL),(164,'Sub-Category','String',1,'04',1,'120.45',0,NULL),(165,'Title','String',1,'05',1,'120.83',1,NULL),(166,'Price','String',1,'06',1,'114.98',0,NULL),(167,'Store Name','String',1,'07',1,'114.98',0,NULL),(168,'Favorite Quantity','String',1,'08',1,'114.121',0,NULL),(169,'Merchant Id','String',1,'09',0,'114.179',0,NULL),(170,'Views Qty','Long',1,'10',1,'127.20',0,NULL),(171,'Views Date','String',1,'11',1,'118.6',0,NULL),(172,'Commission Payment Date','String',1,'07',1,'116.101',0,NULL),(173,'Commission Amount','Long',1,'08',1,'120.22',0,NULL),(174,'Invoice id','Long',1,'01',1,'121.75',0,NULL),(175,'Invoice Date','Date',1,'02',1,'120.31',0,NULL),(176,'Invoice Amount','String',1,'03',1,'55.3',0,NULL),(177,'Commission Payment Date','Date',0,'04',1,'116.101',0,NULL),(178,'Commission Amount','Long',0,'05',1,'120.22',0,NULL),(179,'Invoice Id','String',1,'01',1,'121.75',0,NULL),(180,'Date','Date',1,'03',1,'120.31',0,NULL),(181,'Transaction Type','String',1,'04',1,'121.72',0,NULL),(182,'Total Amount','Long',1,'05',1,'55.3',0,NULL),(183,'Tax Amount','Long',1,'06',1,'121.97',0,NULL),(184,'Invoice Number','String',1,'02',1,'121.41',0,NULL);
/*!40000 ALTER TABLE `tbl_report_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:11
