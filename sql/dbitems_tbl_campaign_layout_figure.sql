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
-- Table structure for table `tbl_campaign_layout_figure`
--

DROP TABLE IF EXISTS `tbl_campaign_layout_figure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_campaign_layout_figure` (
  `tbl_campaign_layout_figure_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_campaign_layout_id` int(11) NOT NULL,
  `tbl_campaign_layout_shape_id` int(11) NOT NULL,
  `tbl_campaign_layout_figure_position` int(11) NOT NULL,
  PRIMARY KEY (`tbl_campaign_layout_figure_id`),
  KEY `fk_tbl_campaign_layout_idx` (`tbl_campaign_layout_id`),
  KEY `fk_tbl_campaign_layout_shape_idx` (`tbl_campaign_layout_shape_id`),
  CONSTRAINT `fk_tbl_campaign_layout` FOREIGN KEY (`tbl_campaign_layout_id`) REFERENCES `tbl_campaign_layout` (`tbl_campaign_layout_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_campaign_layout_shape` FOREIGN KEY (`tbl_campaign_layout_shape_id`) REFERENCES `tbl_campaign_layout_shape` (`tbl_campaign_layout_shape_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_campaign_layout_figure`
--

LOCK TABLES `tbl_campaign_layout_figure` WRITE;
/*!40000 ALTER TABLE `tbl_campaign_layout_figure` DISABLE KEYS */;
INSERT INTO `tbl_campaign_layout_figure` VALUES (1,1,88006,1),(2,2,88003,1),(3,2,88003,4),(4,2,88003,19),(5,2,88003,22),(6,3,88033,1),(7,3,88003,4),(8,3,88003,22),(9,4,88030,1),(10,4,88015,3),(11,4,88015,5),(12,5,88068,1),(13,5,88003,4),(14,5,88033,19);
/*!40000 ALTER TABLE `tbl_campaign_layout_figure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:59
