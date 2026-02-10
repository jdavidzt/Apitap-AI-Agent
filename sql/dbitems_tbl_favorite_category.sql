CREATE DATABASE  IF NOT EXISTS `dbitems` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbitems`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbitems
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
-- Table structure for table `tbl_favorite_category`
--

DROP TABLE IF EXISTS `tbl_favorite_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_favorite_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tbl_favorite_category_user_id` bigint(20) NOT NULL,
  `tbl_favorite_category_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_category` (`tbl_favorite_category_user_id`,`tbl_favorite_category_category_id`),
  KEY `fk_tbl_categoryfav_category` (`tbl_favorite_category_category_id`),
  CONSTRAINT `fk_tbl_categoryfav_category` FOREIGN KEY (`tbl_favorite_category_category_id`) REFERENCES `tbl_category` (`tbl_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_favorite_category`
--

LOCK TABLES `tbl_favorite_category` WRITE;
/*!40000 ALTER TABLE `tbl_favorite_category` DISABLE KEYS */;
INSERT INTO `tbl_favorite_category` VALUES (72,11,725),(6,11,726),(7,11,727),(9,11,728),(4,76,1097),(83,192,726),(82,192,3083),(352,254,3125),(353,254,3126),(354,254,3127),(355,254,3128),(356,254,3129),(357,254,3130),(358,254,3131),(359,254,3132),(360,254,3133),(361,254,3134),(362,254,3135),(363,254,3136),(364,254,3137),(365,254,3138),(366,254,3139),(367,254,3140),(368,254,3141),(369,254,4783),(342,254,4784),(343,254,4785),(349,254,4786),(345,254,4787);
/*!40000 ALTER TABLE `tbl_favorite_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:37
