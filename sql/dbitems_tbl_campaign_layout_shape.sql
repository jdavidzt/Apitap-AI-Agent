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
-- Table structure for table `tbl_campaign_layout_shape`
--

DROP TABLE IF EXISTS `tbl_campaign_layout_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_campaign_layout_shape` (
  `tbl_campaign_layout_shape_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_campaign_layout_shape_name` varchar(45) NOT NULL,
  `tbl_campaign_layout_shape_row` int(11) NOT NULL,
  `tbl_campaign_layout_shape_column` int(11) NOT NULL,
  `tbl_campaign_layout_shape_bundle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tbl_campaign_layout_shape_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88072 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_campaign_layout_shape`
--

LOCK TABLES `tbl_campaign_layout_shape` WRITE;
/*!40000 ALTER TABLE `tbl_campaign_layout_shape` DISABLE KEYS */;
INSERT INTO `tbl_campaign_layout_shape` VALUES (88001,'Square 1x1',1,1,NULL),(88002,'Square 2x2',2,2,NULL),(88003,'Square 3x3',3,3,NULL),(88004,'Square 4x4',4,4,NULL),(88005,'Square 5x5',5,5,NULL),(88006,'Square 6x6',6,6,NULL),(88007,'Rectangle 1x2',1,2,NULL),(88008,'Rectangle 1x3',1,3,NULL),(88009,'Rectangle 1x4',1,4,NULL),(88010,'Rectangle 1x5',1,5,NULL),(88011,'Rectangle 1x6',1,6,NULL),(88012,'Rectangle 2x3',2,3,NULL),(88013,'Rectangle 2x4',2,4,NULL),(88014,'Rectangle 2x5',2,5,NULL),(88015,'Rectangle 2x6',2,6,NULL),(88016,'Rectangle 3x4',3,4,NULL),(88017,'Rectangle 3x5',3,5,NULL),(88018,'Rectangle 3x6',3,6,NULL),(88019,'Rectangle 4x5',4,5,NULL),(88020,'Rectangle 4x6',4,6,NULL),(88021,'Rectangle 5x6',4,3,NULL),(88022,'Rectangle 2x1',6,1,NULL),(88023,'Rectangle 3x1',3,1,NULL),(88024,'Rectangle 4x1',4,1,NULL),(88025,'Rectangle 5x1',5,1,NULL),(88026,'Rectangle 6x1',6,1,NULL),(88027,'Rectangle 3x2',3,2,NULL),(88028,'Rectangle 4x2',4,2,NULL),(88029,'Rectangle 5x2',5,2,NULL),(88030,'Rectangle 6x2',6,2,NULL),(88031,'Rectangle 4x3',4,3,NULL),(88032,'Rectangle 5x3',5,3,NULL),(88033,'Rectangle 6x3',6,3,NULL),(88034,'Rectangle 5x4',5,4,NULL),(88035,'Rectangle 6x4',6,4,NULL),(88036,'Rectangle 6x5',6,5,NULL),(88037,'Oval 1x2',1,2,NULL),(88038,'Oval 1x3',1,3,NULL),(88039,'Oval 1x4',1,4,NULL),(88040,'Oval 1x5',1,5,NULL),(88041,'Oval 1x6',1,6,NULL),(88042,'Oval 2x3',2,3,NULL),(88043,'Oval 2x4',2,4,NULL),(88044,'Oval 2x5',2,5,NULL),(88045,'Oval 2x6',2,6,NULL),(88046,'Oval 3x4',3,4,NULL),(88047,'Oval 3x5',3,5,NULL),(88048,'Oval 3x6',3,6,NULL),(88049,'Oval 4x5',4,5,NULL),(88050,'Oval 4x6',4,6,NULL),(88051,'Oval 5x6',5,6,NULL),(88052,'Oval 2x1',2,1,NULL),(88053,'Oval 3x1',3,1,NULL),(88054,'Oval 4x1',4,1,NULL),(88055,'Oval 5x1',5,1,NULL),(88056,'Oval 6x1',6,1,NULL),(88057,'Oval 3x2',3,2,NULL),(88058,'Oval 4x2',4,2,NULL),(88059,'Oval 5x2',5,2,NULL),(88060,'Oval 6x2',6,2,NULL),(88061,'Oval 4x3',4,3,NULL),(88062,'Oval 5x3',5,3,NULL),(88063,'Oval 6x3',6,3,NULL),(88064,'Oval 5x4',5,4,NULL),(88065,'Oval 6x4',6,4,NULL),(88066,'Cicle 1x1',1,1,NULL),(88067,'Cicle 2x2',2,2,NULL),(88068,'Cicle 3x3',3,3,NULL),(88069,'Cicle 4x4',4,4,NULL),(88070,'Cicle 5x5',5,5,NULL),(88071,'Cicle 6x6',6,6,NULL);
/*!40000 ALTER TABLE `tbl_campaign_layout_shape` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:57
