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
-- Table structure for table `tbl_commission_rates`
--

DROP TABLE IF EXISTS `tbl_commission_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_commission_rates` (
  `tbl_commission_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) DEFAULT NULL,
  `tbl_agent_type_id` int(11) DEFAULT NULL,
  `tbl_commission_id` int(11) DEFAULT NULL,
  `tbl_commission_rates_payPeriod_start` date DEFAULT NULL,
  `tbl_commission_rates_payPeriod_end` date DEFAULT NULL,
  `tbl_commission_rates_bonuses_start` date DEFAULT NULL,
  `tbl_commission_rates_bonuses_end` date DEFAULT NULL,
  `tbl_commission_rates_payPeriod_accountsGoal` int(11) DEFAULT NULL,
  `tbl_commission_rates_payPeriod_bonusGoal` int(11) DEFAULT NULL,
  `tbl_commission_rates_subs` decimal(15,2) DEFAULT NULL,
  `tbl_commission_rates_devices` decimal(15,2) DEFAULT NULL,
  `tbl_commission_rates_signing` decimal(15,2) DEFAULT NULL,
  `tbl_commission_rates_overGoalBonus` decimal(15,2) DEFAULT NULL,
  `tbl_commission_rates_goalMet` decimal(15,2) DEFAULT NULL,
  `tbl_commission_rates_tier1` decimal(15,2) DEFAULT NULL,
  `tbl_commission_rates_tier2` decimal(15,2) DEFAULT NULL,
  `tbl_commission_rates_tier3` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`tbl_commission_rates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_commission_rates`
--

LOCK TABLES `tbl_commission_rates` WRITE;
/*!40000 ALTER TABLE `tbl_commission_rates` DISABLE KEYS */;
INSERT INTO `tbl_commission_rates` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,8,15.00,15.00,40.00,20.00,100.00,25.00,50.00,75.00),(2,NULL,74001,NULL,NULL,NULL,NULL,NULL,20,0,15.00,15.00,0.00,0.00,100.00,25.00,50.00,75.00),(3,NULL,74002,NULL,NULL,NULL,NULL,NULL,20,0,15.00,15.00,0.00,0.00,0.00,25.00,50.00,75.00),(4,NULL,74003,NULL,NULL,NULL,NULL,NULL,10,8,15.00,15.00,40.00,20.00,100.00,25.00,50.00,75.00),(5,NULL,74004,NULL,NULL,NULL,NULL,NULL,20,0,15.00,15.00,0.00,0.00,100.00,25.00,50.00,75.00);
/*!40000 ALTER TABLE `tbl_commission_rates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:25
