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
-- Table structure for table `version_update`
--

DROP TABLE IF EXISTS `version_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_update` (
  `version_update_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) NOT NULL,
  `version_dongle` varchar(45) DEFAULT NULL,
  `version_dongle_name` varchar(45) DEFAULT NULL,
  `version_mobile` varchar(45) DEFAULT NULL,
  `version_mobile_name` varchar(45) DEFAULT NULL,
  `version_date` datetime NOT NULL,
  `version_dongle_size` int(11) NOT NULL DEFAULT '0',
  `version_publish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`version_update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_update`
--

LOCK TABLES `version_update` WRITE;
/*!40000 ALTER TABLE `version_update` DISABLE KEYS */;
INSERT INTO `version_update` VALUES (102,3,'18.0705.568','Production(05-07-18_568).apk','00000000001','Mobile.apk','2018-09-29 12:08:51',15634,'2018-09-29 12:18:46'),(106,3,'18.1005.577','Production(05-10-18_577)(HTTP).apk','00000000001','Mobile.apk','2018-10-05 14:19:39',15635,'2018-10-05 14:20:39'),(107,3,'18.1007.581','Production(07-10-18_581)(HTTP).apk','00000000001','Mobile.apk','2018-10-06 16:54:53',15639,'2018-10-06 16:55:43'),(108,3,'18.1007.582','Production(07-10-18_582)(HTTP).apk','00000000001','Mobile.apk','2018-10-07 03:55:07',15635,NULL),(109,3,'18.1007.583','Production(07-10-18_583)(HTTP).apk','00000000001','Mobile.apk','2018-10-07 04:14:41',15635,'2018-10-07 04:14:45'),(110,3,'18.1007.585','Production(07-10-18_585)(HTTP).apk','00000000001','Mobile.apk','2018-10-07 09:19:02',15637,'2018-10-07 09:19:41'),(111,3,'18.1007.586','Production(07-10-18_586).apk','00000000001','Mobile.apk','2018-10-07 12:28:26',15637,'2018-10-07 12:28:51'),(112,3,'18.1007.587','Production(07-10-18_587).apk','00000000001','Mobile.apk','2018-10-07 12:31:15',15637,'2018-10-07 12:31:55'),(113,3,'18.1007.588','Production(07-10-18_588).apk','00000000001','Mobile.apk','2018-10-07 12:58:07',15640,'2018-10-07 12:58:38'),(114,3,'18.1007.590','Production(07-10-18_590).apk','00000000001','Mobile.apk','2018-10-07 18:20:44',15641,'2018-10-07 18:21:02'),(115,3,'18.1009.592','Production(09-10-18_592).apk','00000000001','Mobile.apk','2018-10-08 15:51:38',15641,'2018-10-08 15:52:25'),(116,3,'18.1009.595','Production(09-10-18_595).apk','00000000001','Mobile.apk','2018-10-08 16:28:22',15637,'2018-10-08 16:28:27'),(117,3,'20.0212.510','Terminal(Production)(20.0212.510).apk','00000000001','Mobile.apk','2020-02-12 15:22:41',15819,'2020-02-13 15:53:37'),(118,3,'20.0212.511','Terminal(Production)(20.0212.511).apk','00000000001','Mobile.apk','2020-02-13 11:14:04',15819,NULL),(119,3,'20.0212.512','Terminal(Production)(20.0212.510).apk','00000000001','Mobile.apk','2020-02-13 14:57:42',15819,'2020-02-13 15:53:37'),(120,3,'20.0214.515','Terminal(Production)(20.0214.515).apk','00000000001','Mobile.apk','2020-02-14 12:03:11',15819,'2020-12-16 14:30:39'),(121,3,'21.0721.526','Terminal(Production)(21.0721.526).apk','00000000001','Mobile.apk','2021-07-20 22:15:38',14885,'2021-07-20 22:15:47'),(122,3,'21.0917.537','Terminal(Production)(21.0917.537).apk','00000000001','Mobile.apk','2021-09-18 06:37:01',14945,NULL),(123,3,'22.0113.559','Terminal(Production)(22.0113.559).apk','00000000001','Mobile.apk','2022-01-13 10:40:48',16092,'2022-02-07 21:22:44'),(124,3,'22.0208.561','Terminal(Production)(22.0208.561).apk','00000000001','Mobile.apk','2022-02-08 12:16:56',15282,'2022-02-08 12:17:46'),(125,3,'22.0217.566','Terminal(Production)(22.0217.566).apk','00000000001','Mobile.apk','2022-02-18 10:10:33',15284,'2022-02-18 10:11:20');
/*!40000 ALTER TABLE `version_update` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:31:55
