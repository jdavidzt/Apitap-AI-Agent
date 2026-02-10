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
-- Table structure for table `tbl_rating_user`
--

DROP TABLE IF EXISTS `tbl_rating_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_rating_user` (
  `tbl_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_rating_user_id_rated` int(11) DEFAULT NULL,
  `tbl_rating_user_id_rater` int(11) DEFAULT NULL,
  `tbl_rating_rating` int(11) DEFAULT NULL,
  `tbl_rating_subject` tinytext,
  `tbl_rating_description` text,
  `tbl_rating_user_type_rated` int(11) DEFAULT NULL,
  `tbl_rating_user_type_rater` int(11) DEFAULT NULL,
  `tbl_rating_date_added` datetime DEFAULT NULL,
  `tbl_rating_date_last_modified` datetime DEFAULT NULL,
  `tbl_rating_status` int(11) DEFAULT NULL,
  `tbl_rating_read` varchar(45) DEFAULT NULL,
  `tbl_rating_reply` text,
  `tbl_rating_replier` int(11) DEFAULT NULL,
  `tbl_rating_report_f` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_rating_report_comment` text,
  PRIMARY KEY (`tbl_rating_id`),
  KEY `fk_ratingtype_idx` (`tbl_rating_rating`),
  CONSTRAINT `fk_ratingtype` FOREIGN KEY (`tbl_rating_rating`) REFERENCES `tbl_ratingsandreviewstype` (`tbl_ratingsandreviewstype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rating_user`
--

LOCK TABLES `tbl_rating_user` WRITE;
/*!40000 ALTER TABLE `tbl_rating_user` DISABLE KEYS */;
INSERT INTO `tbl_rating_user` VALUES (11,NULL,197,2103,'pepe','pepe pepe',NULL,20,'2018-07-13 09:18:39','2018-07-13 09:18:39',1,'0',NULL,NULL,0,NULL),(12,NULL,197,2101,'pepe','pepe2',NULL,20,'2018-07-13 09:19:18','2018-07-13 09:19:18',1,'0',NULL,NULL,0,NULL),(13,NULL,197,2104,'gsdfgfdg','sdfgfg',NULL,20,'2018-07-13 09:24:11','2018-07-13 09:24:11',1,'0',NULL,NULL,0,NULL),(14,NULL,197,2101,'sakdjsak','asdkljsakdlja',NULL,20,'2018-07-13 10:08:06','2018-07-13 10:08:06',1,'0',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `tbl_rating_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:35:07
