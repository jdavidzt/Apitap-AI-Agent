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
-- Table structure for table `tbl_merchant_nmi`
--

DROP TABLE IF EXISTS `tbl_merchant_nmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_merchant_nmi` (
  `tbl_merchant_nmi_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) NOT NULL,
  `tbl_merchant_nmi_routingNumber` varchar(45) DEFAULT NULL,
  `tbl_merchant_nmi_bankAccount` varchar(45) DEFAULT NULL,
  `tbl_merchant_nmi_processorName` varchar(255) DEFAULT NULL,
  `tbl_merchant_nmi_platformName` varchar(255) DEFAULT NULL,
  `tbl_merchant_nmi_jsonRequest` text,
  `tbl_merchant_nmi_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`tbl_merchant_nmi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_merchant_nmi`
--

LOCK TABLES `tbl_merchant_nmi` WRITE;
/*!40000 ALTER TABLE `tbl_merchant_nmi` DISABLE KEYS */;
INSERT INTO `tbl_merchant_nmi` VALUES (1,4481,NULL,NULL,'leonsofbeverlyhi1','tsys','{\n  \"id\":4811649,\n  \"processor_id\":\"leonsofbeverlyhi1\",\n  \"platform\":\"tsys\",\n  \"descriptor\":null,\n  \"descriptor_phone\":null,\n  \"descriptor_url\":null,\n  \"default_industry_classification\":\"ecommerce\",\n  \"max_transaction_amount\":\"1000.00\",\n  \"max_monthly_volume\":\"0.00\",\n  \"enable_duplicate_checking\":false,\n  \"allow_duplicate_checking_override\":false,\n  \"duplicate_checking_seconds\":0,\n  \"precheck_method\":\"void\",\n  \"currencies\":null,\n  \"processor_description\":\"Leon\'s of Beverly Hills\",\n  \"mcc\":\"5944\",\n  \"processor_config_1\":\"000000217803\",\n  \"processor_config_2\":\"400097\",\n  \"processor_config_3\":\"0001\",\n  \"processor_config_4\":\"0002\",\n  \"processor_config_5\":\"5944\",\n  \"processor_config_6\":\"90210\",\n  \"processor_config_7\":\"77855967\",\n  \"processor_config_8\":\"000000\",\n  \"processor_config_9\":\"000000\",\n  \"processor_config_10\":\"United States\",\n  \"processor_config_11\":\"Beverly Hills\",\n  \"processor_config_12\":\"CA\",\n  \"processor_config_13\":\"90210\",\n  \"processor_config_14\":null,\n  \"processor_config_16\":\"708\",\n  \"processor_config_17\":\"\",\n  \"processor_config_18\":false,\n  \"processor_config_19\":false,\n  \"settlement_time\":null,\n  \"status\":\"active\",\n  \"processor_config_22\":null,\n  \"processor_config_23\":null,\n  \"processor_config_24\":null,\n  \"processor_config_25\":null,\n  \"processor_config_26\":null,\n  \"processor_config_27\":null,\n  \"processor_config_28\":null,\n  \"processor_config_29\":null,\n  \"processor_config_30\":null,\n  \"processor_config_31\":null,\n  \"processor_config_32\":false,\n  \"required_fields\":\"\",\n  \"payment_types\":\"visa, mastercard, amex, discover, diners_club, jcb\"\n}',1),(2,1360,NULL,NULL,'craftedvisions','piv_g1','{\n  \"id\":4908373,\n  \"processor_id\":\"craftedvisions\",\n  \"platform\":\"piv_g1\",\n  \"descriptor\":null,\n  \"descriptor_phone\":null,\n  \"descriptor_url\":null,\n  \"default_industry_classification\":\"ecommerce\",\n  \"max_transaction_amount\":\"1000.00\",\n  \"max_monthly_volume\":\"0.00\",\n  \"enable_duplicate_checking\":false,\n  \"allow_duplicate_checking_override\":false,\n  \"duplicate_checking_seconds\":0,\n  \"precheck_method\":\"void\",\n  \"currencies\":null,\n  \"processor_description\":\"Crafted Visions\",\n  \"mcc\":\"5999\",\n  \"processor_config_1\":\"59549001\",\n  \"processor_config_2\":\"PIV738450\",\n  \"processor_config_3\":false,\n  \"processor_config_4\":false,\n  \"processor_config_5\":false,\n  \"settlement_time\":null,\n  \"status\":\"active\",\n  \"required_fields\":\"\",\n  \"payment_types\":\"visa, mastercard, amex, discover, diners_club, jcb\"\n}',0),(3,1360,NULL,NULL,'craftedvisions1','piv_g1','{\n  \"id\":4908396,\n  \"processor_id\":\"craftedvisions1\",\n  \"platform\":\"piv_g1\",\n  \"descriptor\":null,\n  \"descriptor_phone\":null,\n  \"descriptor_url\":null,\n  \"default_industry_classification\":\"ecommerce\",\n  \"max_transaction_amount\":\"1000.00\",\n  \"max_monthly_volume\":\"0.00\",\n  \"enable_duplicate_checking\":false,\n  \"allow_duplicate_checking_override\":false,\n  \"duplicate_checking_seconds\":0,\n  \"precheck_method\":\"void\",\n  \"currencies\":null,\n  \"processor_description\":\"Crafted Visions\",\n  \"mcc\":\"5999\",\n  \"processor_config_1\":\"59549001\",\n  \"processor_config_2\":\"PIV738450\",\n  \"processor_config_3\":false,\n  \"processor_config_4\":false,\n  \"processor_config_5\":false,\n  \"settlement_time\":null,\n  \"status\":\"active\",\n  \"required_fields\":\"\",\n  \"payment_types\":\"visa, mastercard, amex, discover, diners_club, jcb\"\n}',0),(4,1360,NULL,NULL,'craftedvisions2','tsys','{\n  \"id\":4908512,\n  \"processor_id\":\"craftedvisions2\",\n  \"platform\":\"tsys\",\n  \"descriptor\":null,\n  \"descriptor_phone\":null,\n  \"descriptor_url\":null,\n  \"default_industry_classification\":\"ecommerce\",\n  \"max_transaction_amount\":\"1000.00\",\n  \"max_monthly_volume\":\"0.00\",\n  \"enable_duplicate_checking\":false,\n  \"allow_duplicate_checking_override\":false,\n  \"duplicate_checking_seconds\":0,\n  \"precheck_method\":\"void\",\n  \"currencies\":null,\n  \"processor_description\":\"Crafted Visions\",\n  \"mcc\":\"5999\",\n  \"processor_config_1\":\"912200738450\",\n  \"processor_config_2\":\"426975\",\n  \"processor_config_3\":\"0627\",\n  \"processor_config_4\":\"0002\",\n  \"processor_config_5\":\"5999\",\n  \"processor_config_6\":\"00001\",\n  \"processor_config_7\":\"78063485\",\n  \"processor_config_8\":\"415310\",\n  \"processor_config_9\":\"000002\",\n  \"processor_config_10\":\"\",\n  \"processor_config_11\":\"\",\n  \"processor_config_12\":\"\",\n  \"processor_config_13\":\"\",\n  \"processor_config_14\":null,\n  \"processor_config_16\":\"\",\n  \"processor_config_17\":\"\",\n  \"processor_config_18\":false,\n  \"processor_config_19\":false,\n  \"settlement_time\":null,\n  \"status\":\"active\",\n  \"processor_config_22\":null,\n  \"processor_config_23\":null,\n  \"processor_config_24\":null,\n  \"processor_config_25\":null,\n  \"processor_config_26\":null,\n  \"processor_config_27\":null,\n  \"processor_config_28\":null,\n  \"processor_config_29\":null,\n  \"processor_config_30\":null,\n  \"processor_config_31\":null,\n  \"processor_config_32\":false,\n  \"required_fields\":\"\",\n  \"payment_types\":\"visa, mastercard, amex, discover, diners_club, jcb\"\n}',1),(5,1360,NULL,NULL,'craftedvisions3','tsys','{\n  \"id\":4908602,\n  \"processor_id\":\"craftedvisions3\",\n  \"platform\":\"tsys\",\n  \"descriptor\":null,\n  \"descriptor_phone\":null,\n  \"descriptor_url\":null,\n  \"default_industry_classification\":\"ecommerce\",\n  \"max_transaction_amount\":\"1000.00\",\n  \"max_monthly_volume\":\"0.00\",\n  \"enable_duplicate_checking\":false,\n  \"allow_duplicate_checking_override\":false,\n  \"duplicate_checking_seconds\":0,\n  \"precheck_method\":\"void\",\n  \"currencies\":null,\n  \"processor_description\":\"Crafted Visions\",\n  \"mcc\":\"5999\",\n  \"processor_config_1\":\"912200738450\",\n  \"processor_config_2\":\"426975\",\n  \"processor_config_3\":\"0627\",\n  \"processor_config_4\":\"0002\",\n  \"processor_config_5\":\"5999\",\n  \"processor_config_6\":\"00001\",\n  \"processor_config_7\":\"78063485\",\n  \"processor_config_8\":\"415310\",\n  \"processor_config_9\":\"000002\",\n  \"processor_config_10\":\"\",\n  \"processor_config_11\":\"\",\n  \"processor_config_12\":\"\",\n  \"processor_config_13\":\"\",\n  \"processor_config_14\":null,\n  \"processor_config_16\":\"\",\n  \"processor_config_17\":\"\",\n  \"processor_config_18\":false,\n  \"processor_config_19\":false,\n  \"settlement_time\":null,\n  \"status\":\"pending\",\n  \"processor_config_22\":null,\n  \"processor_config_23\":null,\n  \"processor_config_24\":null,\n  \"processor_config_25\":null,\n  \"processor_config_26\":null,\n  \"processor_config_27\":null,\n  \"processor_config_28\":null,\n  \"processor_config_29\":null,\n  \"processor_config_30\":null,\n  \"processor_config_31\":null,\n  \"processor_config_32\":false,\n  \"required_fields\":\"\",\n  \"payment_types\":\"visa, mastercard, amex, discover, diners_club, jcb\"\n}',0),(6,4649,NULL,NULL,'fashionzoneezy','tsys','{\n  \"id\":4910438,\n  \"processor_id\":\"fashionzoneezy\",\n  \"platform\":\"tsys\",\n  \"descriptor\":null,\n  \"descriptor_phone\":null,\n  \"descriptor_url\":null,\n  \"default_industry_classification\":\"ecommerce\",\n  \"max_transaction_amount\":\"1000.00\",\n  \"max_monthly_volume\":\"0.00\",\n  \"enable_duplicate_checking\":false,\n  \"allow_duplicate_checking_override\":false,\n  \"duplicate_checking_seconds\":0,\n  \"precheck_method\":\"void\",\n  \"currencies\":null,\n  \"processor_description\":\"Fashion Zone Ezy\",\n  \"mcc\":\"5999\",\n  \"processor_config_1\":\"912200740134\",\n  \"processor_config_2\":\"426975\",\n  \"processor_config_3\":\"0627\",\n  \"processor_config_4\":\"0002\",\n  \"processor_config_5\":\"5999\",\n  \"processor_config_6\":\"00001\",\n  \"processor_config_7\":\"78063153\",\n  \"processor_config_8\":\"415310\",\n  \"processor_config_9\":\"000002\",\n  \"processor_config_10\":\"\",\n  \"processor_config_11\":\"\",\n  \"processor_config_12\":\"\",\n  \"processor_config_13\":\"\",\n  \"processor_config_14\":null,\n  \"processor_config_16\":\"\",\n  \"processor_config_17\":\"\",\n  \"processor_config_18\":false,\n  \"processor_config_19\":false,\n  \"settlement_time\":null,\n  \"status\":\"pending\",\n  \"processor_config_22\":null,\n  \"processor_config_23\":null,\n  \"processor_config_24\":null,\n  \"processor_config_25\":null,\n  \"processor_config_26\":null,\n  \"processor_config_27\":null,\n  \"processor_config_28\":null,\n  \"processor_config_29\":null,\n  \"processor_config_30\":null,\n  \"processor_config_31\":null,\n  \"processor_config_32\":false,\n  \"required_fields\":\"\",\n  \"payment_types\":\"visa, mastercard, amex, discover, diners_club, jcb\"\n}',1);
/*!40000 ALTER TABLE `tbl_merchant_nmi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:43
