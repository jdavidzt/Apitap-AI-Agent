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
-- Table structure for table `tbl_user_schedule`
--

DROP TABLE IF EXISTS `tbl_user_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_schedule` (
  `tbl_user_schedule_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tbl_user_id` bigint(20) NOT NULL,
  `tbl_location_id` bigint(20) DEFAULT NULL,
  `tbl_day_of_the_week` int(11) DEFAULT NULL,
  `tbl_hour_open` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tbl_hour_close` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`tbl_user_schedule_id`) USING BTREE,
  KEY `fk_tbl_user_tbl_user_schedule_idx` (`tbl_user_id`) USING BTREE,
  KEY `fk_ tbl_user_schedule_tbl_location_idx` (`tbl_location_id`) USING BTREE,
  CONSTRAINT `fk_ tbl_user_schedule_tbl_location` FOREIGN KEY (`tbl_location_id`) REFERENCES `tbl_location` (`tbl_location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_user_tbl_user_schedule` FOREIGN KEY (`tbl_user_id`) REFERENCES `tbl_user` (`tbl_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci ROW_FORMAT=DYNAMIC COMMENT='{"singular”:”UserSchedule”,”plural":"UserSchedules”,”modulo":["aioposschedule"]}';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_schedule`
--

LOCK TABLES `tbl_user_schedule` WRITE;
/*!40000 ALTER TABLE `tbl_user_schedule` DISABLE KEYS */;
INSERT INTO `tbl_user_schedule` VALUES (133,5176,697,0,'10:00','20:00'),(134,5176,697,1,'10:00','20:00'),(135,5176,697,2,'10:00','20:00'),(136,5176,697,3,'10:00','20:00'),(137,5176,697,4,'10:00','20:00'),(138,5176,697,5,'10:00','20:00'),(139,5176,697,6,'10:00','20:00'),(140,5177,697,0,'10:00','20:00'),(141,5177,697,1,'10:00','20:00'),(142,5177,697,2,'10:00','20:00'),(143,5177,697,3,'10:00','20:00'),(144,5177,697,4,'10:00','20:00'),(145,5177,697,5,'10:00','20:00'),(146,5177,697,6,'10:00','20:00'),(147,5178,697,0,'10:00','20:00'),(148,5178,697,1,'10:00','20:00'),(149,5178,697,2,'10:00','20:00'),(150,5178,697,3,'10:00','20:00'),(151,5178,697,4,'10:00','20:00'),(152,5178,697,5,'10:00','20:00'),(153,5178,697,6,'10:00','20:00'),(154,5371,4152,1,'08:00','16:30'),(155,5371,4152,2,'08:00','16:30'),(156,5371,4152,3,'08:00','16:30'),(157,5371,4152,4,'08:00','16:30'),(158,5371,4152,5,'08:00','16:30'),(159,5372,4152,0,'09:00','17:00'),(160,5372,4152,1,'09:00','17:00'),(161,5372,4152,2,'09:00','19:00'),(162,5372,4152,3,'09:00','19:00'),(163,5372,4152,4,'09:00','19:00'),(164,5372,4152,5,'09:00','19:00'),(165,5373,4152,4,'10:00','19:04'),(166,5373,4152,5,'10:00','20:06'),(167,5373,4152,6,'10:00','19:04'),(168,5374,4152,2,'07:30','18:30'),(169,5374,4152,1,'07:30','18:30'),(170,5374,4152,0,'07:30','18:30'),(171,5374,4152,5,'07:30','18:30'),(172,5374,4152,6,'07:30','18:30'),(180,5347,4152,0,'07:30','22:00'),(181,5347,4152,1,'07:30','22:00'),(182,5347,4152,5,'07:30','22:00'),(183,5347,4152,6,'07:30','22:00'),(191,5372,4152,6,'09:00','19:00'),(192,5373,4152,1,'10:00','20:06'),(193,5373,4152,3,'10:00','20:06'),(194,5373,4152,0,'08:00','18:00');
/*!40000 ALTER TABLE `tbl_user_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:51
