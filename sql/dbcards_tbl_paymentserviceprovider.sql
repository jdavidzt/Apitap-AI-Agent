CREATE DATABASE  IF NOT EXISTS `dbcards` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbcards`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcards
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
-- Table structure for table `tbl_paymentserviceprovider`
--

DROP TABLE IF EXISTS `tbl_paymentserviceprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_paymentserviceprovider` (
  `tbl_paymentserviceprovider_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_paymentserviceprovider_name` varchar(45) DEFAULT NULL,
  `tbl_paymentserviceprovidertype_id` int(11) NOT NULL,
  `tbl_paymentserviceprovider_delete` int(1) DEFAULT NULL,
  `tbl_paymentserviceprovider_order` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_paymentserviceprovider_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tbl_paymentserviceprovider_id`),
  KEY `fk_tbl_paymentserviceprovider_tbl_paymentserviceprovidertyp_idx` (`tbl_paymentserviceprovidertype_id`),
  CONSTRAINT `fk_tbl_paymentserviceprovider_tbl_paymentserviceprovidertype1` FOREIGN KEY (`tbl_paymentserviceprovidertype_id`) REFERENCES `tbl_paymentserviceprovidertype` (`tbl_paymentserviceprovidertype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paymentserviceprovider`
--

LOCK TABLES `tbl_paymentserviceprovider` WRITE;
/*!40000 ALTER TABLE `tbl_paymentserviceprovider` DISABLE KEYS */;
INSERT INTO `tbl_paymentserviceprovider` VALUES (1,'Authorize.Net',37001,1,0,NULL),(2,'Beanstream',37001,1,0,NULL),(3,'Braintree Blue',37001,1,0,NULL),(4,'Chase NetConnect',37001,1,0,NULL),(5,'Cyber-Source',37001,1,0,NULL),(6,'Doku',37001,1,0,NULL),(7,'Elavon',37001,0,0,NULL),(8,'Element',37001,1,0,NULL),(9,'Epx',37001,1,0,NULL),(10,'Federated',37001,1,0,NULL),(11,'Federated Canada',37001,1,0,NULL),(12,'First Data Compass',37001,1,0,NULL),(13,'First Data E4G',37001,1,0,NULL),(14,'Global CloudPay',37001,1,0,NULL),(15,'Global Collect',37001,1,0,NULL),(16,'Global OnePay',37001,1,0,NULL),(17,'Global Payments',37001,1,0,NULL),(18,'Is Bank',37001,1,0,NULL),(19,'Litle',37001,1,0,NULL),(20,'Lucy',37001,1,0,NULL),(21,'Maxipago',37001,1,0,NULL),(22,'Merchant E-Solutions',37001,1,0,NULL),(23,'Merchant Link',37001,1,0,NULL),(24,'Moneris',37001,1,0,NULL),(25,'Moneris Us',37001,1,0,NULL),(26,'Nmi',37001,1,0,NULL),(27,'Optimal Payment Netbanx',37001,1,0,NULL),(28,'Orbital',37001,1,0,NULL),(29,'PayDollar',37001,1,0,NULL),(30,'PayTrace',37001,1,0,NULL),(31,'Payflow',37001,1,0,NULL),(32,'Payment Express',37001,1,0,NULL),(33,'Paymill ',37001,1,0,NULL),(34,'Pay-U Latam',37001,1,0,NULL),(35,'Promise Pay',37001,1,0,NULL),(36,'Qbms',37001,1,0,NULL),(37,'Q-valent',37001,1,0,NULL),(38,'Sage',37001,1,0,NULL),(39,'SagePay',37001,1,0,NULL),(40,'SecureNet',37001,1,0,NULL),(41,'Six',37001,1,0,NULL),(42,'Stripe',37001,1,0,NULL),(43,'Tns',37001,1,0,NULL),(44,'TransFirst',37001,1,0,NULL),(45,'T-sys',37001,1,0,NULL),(46,'Usa E-pay ',37001,1,0,NULL),(47,'Worldpay',37001,1,0,NULL),(48,'Worldpay Us',37001,1,0,NULL),(49,'Iats Payments',37001,1,0,NULL);
/*!40000 ALTER TABLE `tbl_paymentserviceprovider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:12
