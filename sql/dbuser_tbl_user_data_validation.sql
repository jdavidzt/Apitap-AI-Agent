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
-- Table structure for table `tbl_user_data_validation`
--

DROP TABLE IF EXISTS `tbl_user_data_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_data_validation` (
  `tbl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_description` text,
  `tbl_entity` int(11) DEFAULT NULL,
  `tbl_level` int(11) DEFAULT NULL,
  `tbl_query` text,
  `tbl_message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tbl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_data_validation`
--

LOCK TABLES `tbl_user_data_validation` WRITE;
/*!40000 ALTER TABLE `tbl_user_data_validation` DISABLE KEYS */;
INSERT INTO `tbl_user_data_validation` VALUES (1,'Merchant Logo Validation',2,2,'SELECT (select (if(length((select tbl_merchant.tbl_merchant_logoimage from dbuser.tbl_merchant where tbl_user_id= \'PARAMUSERID\' limit 1))=0 or (select tbl_merchant.tbl_merchant_logoimage from dbuser.tbl_merchant where tbl_user_id= \'PARAMUSERID\' limit 1) = \'icnCamara.png\', \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'1\') AS MESSAGE_RESPONSE',1),(2,'Merchant Categories Validation',2,1,'SELECT (select (if((select tbl_merchantbusinesscategory.tbl_merchant_nmcId from dbuser.tbl_merchantbusinesscategory where tbl_merchant_nmcId= \'PARAMUSERID\' limit 1) is null, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'2\') AS MESSAGE_RESPONSE',2),(5,'Merchant Expired Subscription',2,1,'SELECT (select (if((select tbl_usersubscription_id from dbitems.tbl_usersubscription where tbl_usersubscription_user_nmcid = \'PARAMUSERID\' and tbl_usersubscription_date_expiration <= NOW() limit 1) is not null, \'true\',\'false\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'28\') AS MESSAGE_RESPONSE',5),(7,'Consumer Payment Account',1,1,'SELECT (select (if((select tbl_carduser_id from dbcards.tbl_carduser where tbl_user_nmcId = \'PARAMUSERID\' and tbl_paymentnaturetype_id= 35001 limit 1) is null, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'7\') AS MESSAGE_RESPONSE',7),(8,'Consumer pay With NMCID',1,2,'SELECT (select (if((select tbl_user_pay_nmcId from dbuser.tbl_user where tbl_user_id= \'PARAMUSERID\' limit 1)=\'\' or (select tbl_user_pay_nmcId from dbuser.tbl_user where tbl_user_id= \'PARAMUSERID\' limit 1)IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'8\') AS MESSAGE_RESPONSE',8),(9,'Advertiser Subscription',8,1,'SELECT (select (if((select tbl_usersubscription_id from dbitems.tbl_usersubscription  where tbl_usersubscription_user_nmcid = \'PARAMUSERID\'     limit 1) is null, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'9\') AS MESSAGE_RESPONSE',9),(10,'Merchant users',2,2,'SELECT (select (if( (SELECT tbl_user_id FROM dbuser.tbl_user where tbl_user_parentId = \'PARAMUSERID\'  limit 1) IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'10\') AS MESSAGE_RESPONSE',10),(11,'Reseller users',3,2,'SELECT (select (if( (SELECT tbl_user_id FROM dbuser.tbl_user where tbl_user_parentId = \'PARAMUSERID\'  limit 1) IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'11\') AS MESSAGE_RESPONSE',11),(14,'Merchant Mobile phone',2,2,'SELECT (select (if( (SELECT tbl_phone_id FROM dbuser.tbl_phone where tbl_phone_nmcId = \'PARAMUSERID\'  and tbl_phonetype_id = 4003  limit 1) IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'14\') AS MESSAGE_RESPONSE',14),(18,'Merchant Store Locations',2,1,'SELECT (select (if( ( SELECT tbl_location_id FROM dbuser.tbl_location where tbl_location_userId = \'PARAMUSERID\' limit 1) IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'18\') AS MESSAGE_RESPONSE',18),(21,'Merchant Tax Id',2,1,'SELECT (select (if( (select A.tbl_user_id from dbuser.tbl_merchant as A where A.tbl_user_id = \'PARAMUSERID\' and A.tbl_merchant_taxIdNumber is not null and A.tbl_merchant_taxIdNumber !=\'\' limit 1) is null, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'21\') AS MESSAGE_RESPONSE',21),(22,'Reseller Type of business',3,1,'SELECT (select (if( (SELECT tbl_reseller_nmcId FROM dbuser.tbl_resellerbusinesscategory where tbl_reseller_nmcId = \'PARAMUSERID\'  limit 1) IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'22\') AS MESSAGE_RESPONSE',22),(23,'Reseller Payment Account',3,1,'SELECT (select (if((SELECT tbl_user_nmcid FROM dbcards.tbl_cardtypeaccepted where tbl_user_nmcid =\'PARAMUSERID\'  limit 1) is null, \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'23\') AS MESSAGE_RESPONSE',23),(24,'Merchant Location Subscription',2,2,'SELECT (select (if((select tbl_usersubscription_id from dbitems.tbl_usersubscription where tbl_usersubscription_user_nmcid = \'PARAMUSERID\' and tbl_subscription_id = 16 and tbl_usersubscription_date_expiration >= NOW() and tbl_location_id is null limit 1) is not null, \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'24\') AS MESSAGE_RESPONSE',24),(25,'Merchant Shippo',2,1,'SELECT (select (if( (select tbl_user_shippo_token from dbuser.tbl_user where tbl_user_id = \'PARAMUSERID\' limit 1)is null, \'false\',\'true\')))AS VALIDATION,(\'64002\') AS TBL_LEVEL,(\'25\') AS MESSAGE_RESPONSE',25),(26,'Merchant Sphere',2,1,'SELECT (select (if((SELECT A.tbl_user_sphere_id FROM dbuser.tbl_user as A left join dbuser.tbl_merchant as B on A.tbl_user_id = B.tbl_user_id where A.tbl_user_id = \'PARAMUSERID\'  and B.tbl_merchant_sellApitapWebsite_f = 1 limit 1) IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'26\') AS MESSAGE_RESPONSE',26),(27,'Merchant TaxJar',2,1,'SELECT (select (if((SELECT B.tbl_merchant_taxJar_token FROM dbuser.tbl_user as A left join dbuser.tbl_merchant as B on A.tbl_user_id = B.tbl_user_id where A.tbl_user_id = \'PARAMUSERID\' and length(B.tbl_merchant_taxJar_token) > 0 limit 1) IS NULL, \'false\',\'true\')))AS VALIDATION,(\'64001\') AS TBL_LEVEL,(\'27\') AS MESSAGE_RESPONSE',27);
/*!40000 ALTER TABLE `tbl_user_data_validation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:36:07
