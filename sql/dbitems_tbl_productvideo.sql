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
-- Table structure for table `tbl_productvideo`
--

DROP TABLE IF EXISTS `tbl_productvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productvideo` (
  `tbl_productvideo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_product_id` int(11) NOT NULL,
  `tbl_productvideo_NMCname` text NOT NULL,
  `tbl_productvideo_name` text NOT NULL,
  `tbl_productvideo_date` datetime NOT NULL,
  PRIMARY KEY (`tbl_productvideo_id`),
  KEY `fk_tbl_productvideo_tbl_product_idx` (`tbl_product_id`),
  CONSTRAINT `fk_tbl_productvideo_tbl_product` FOREIGN KEY (`tbl_product_id`) REFERENCES `tbl_product` (`tbl_product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productvideo`
--

LOCK TABLES `tbl_productvideo` WRITE;
/*!40000 ALTER TABLE `tbl_productvideo` DISABLE KEYS */;
INSERT INTO `tbl_productvideo` VALUES (22,251,'video_playback_1641062454370481045.mp4','video_playback.mp4','2019-08-26 14:34:32'),(24,49,'video5074513313440173486.mp4','video5074513313440173486.mp4','2020-11-17 13:50:34'),(25,270,'video3578103311985184193.mp4','video3578103311985184193.mp4','2020-12-29 14:43:24'),(27,50,'video1737550048359435458.mp4','video1737550048359435458.mp4','2021-01-29 16:04:34'),(29,667,'video1348645353223953611.mp4','video1348645353223953611.mp4','2022-06-03 04:28:54');
/*!40000 ALTER TABLE `tbl_productvideo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:40
