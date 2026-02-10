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
-- Table structure for table `tbl_report`
--

DROP TABLE IF EXISTS `tbl_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_report_name` varchar(45) NOT NULL,
  `tbl_report_description` varchar(255) DEFAULT NULL,
  `tbl_report_rol` varchar(4) NOT NULL,
  `tbl_report_rol_view` varchar(4) NOT NULL,
  `tbl_report_link` varchar(255) DEFAULT NULL,
  `tbl_report_link_id` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report`
--

LOCK TABLES `tbl_report` WRITE;
/*!40000 ALTER TABLE `tbl_report` DISABLE KEYS */;
INSERT INTO `tbl_report` VALUES (1,'Merchant Activity','Merchant Activity for Reseller View ','04','3','/aioPortals/admin/customerService/merchantManagement/main.xhtml','53'),(2,'Billing History','Billing History for consumer','04','1',NULL,'121.192'),(3,'Item History','Merchant Item History for merchant','04','2','/aioPortals/merchant/main/directPurchaseItems/main.xhtml','114.144'),(4,'Billing History','Billing History of Merchant','04','2','/aioPortals/merchant/accounting/accountsPayable/main.xhtml','121.192'),(5,'Billing History','Billing History of Merchant Reseller view','04','3','/aioPortals/reseller/settings/accounting/main.xhtml','53'),(6,'Orders History','Orders History between Consumer and Merchant','04','2','/aioPortals/merchant/main/transactions/main.xhtml','121.75'),(7,'User Activity','Merchant User activity ','04','2','/aioPortals/merchant/settings/userManagement/main.xhtml','114.179'),(8,'Merchant Activity','Merchant Activity For Affiliate view','04','6',NULL,'53'),(9,'Ad Campaign ','Ad Campaign ','04','2','/aioPortals/merchant/main/packages/main.xhtml','114.101'),(10,'Most Sold Items ','Merchant Most Sold Items ','04','2','/aioPortals/merchant/main/directPurchaseItems/main.xhtml','114.144'),(11,'Most Favorite Items','Merchant Most Favorite Items','04','2','/aioPortals/merchant/main/directPurchaseItems/main.xhtml','114.144'),(12,'Consignment Program','Consignment Program','04','2','/aioPortals/merchant/main/transactions/main.xhtml','121.75'),(13,'Total Sales and Tax Collected','Total Sales and Tax Collected','04','2','/aioPortals/merchant/main/transactions/main.xhtml','121.75');
/*!40000 ALTER TABLE `tbl_report` ENABLE KEYS */;
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
