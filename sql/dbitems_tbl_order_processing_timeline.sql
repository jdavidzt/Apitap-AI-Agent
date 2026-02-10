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
-- Table structure for table `tbl_order_processing_timeline`
--

DROP TABLE IF EXISTS `tbl_order_processing_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_order_processing_timeline` (
  `tbl_order_id` int(11) NOT NULL,
  `tbl_location_id` int(11) NOT NULL,
  `tbl_order_momentum` datetime DEFAULT NULL,
  `tbl_elapsed_time` text,
  PRIMARY KEY (`tbl_order_id`,`tbl_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order_processing_timeline`
--

LOCK TABLES `tbl_order_processing_timeline` WRITE;
/*!40000 ALTER TABLE `tbl_order_processing_timeline` DISABLE KEYS */;
INSERT INTO `tbl_order_processing_timeline` VALUES (403,4152,'2025-07-10 22:40:00','null'),(424,4152,'2025-07-22 10:55:30','02:39'),(425,4152,'2025-07-22 11:01:06','01:34'),(426,4152,'2025-07-22 11:04:01','12:12'),(427,4152,'2025-07-22 11:17:24','00:25'),(428,4152,'2025-07-22 12:39:45','02:38'),(429,4152,'2025-07-22 12:38:36','null'),(430,4152,'2025-07-24 10:39:33','null'),(431,4152,'2025-07-28 11:50:20','02:37'),(432,4152,'2025-07-29 11:28:00','null'),(433,4152,'2025-07-30 12:58:29','null'),(434,4152,'2025-07-30 12:59:41','null'),(435,4152,'2025-07-30 13:37:51','null'),(436,4152,'2025-07-30 13:44:46','null'),(437,4152,'2025-07-30 14:40:18','null'),(438,4152,'2025-07-30 16:12:58','null'),(439,4152,'2025-07-30 20:16:11','null'),(440,4152,'2025-07-30 20:16:32','null'),(441,4152,'2025-07-31 11:00:10','null'),(442,4152,'2025-08-01 11:50:52','null'),(443,4152,'2025-08-02 00:59:29','null'),(444,4152,'2025-08-02 02:49:03','null'),(445,4152,'2025-08-02 03:58:19','null'),(446,4152,'2025-08-02 05:19:45','null'),(447,4152,'2025-08-02 05:20:28','null'),(448,4152,'2025-08-02 05:21:37','null'),(449,4152,'2025-08-02 05:32:29','null'),(450,4152,'2025-08-02 05:36:58','null'),(451,4152,'2025-08-02 05:48:03','null'),(452,4152,'2025-08-02 05:53:41','null'),(453,4152,'2025-08-02 05:55:01','null'),(454,4152,'2025-08-02 05:55:46','null'),(455,4152,'2025-08-02 05:55:46','null'),(456,4152,'2025-08-02 05:55:46','null'),(457,4152,'2025-08-02 06:35:14','null'),(458,4152,'2025-08-02 07:24:01','null'),(459,4152,'2025-08-02 07:26:42','null'),(460,4152,'2025-08-02 07:29:52','null'),(461,4152,'2025-08-02 08:09:39','null'),(462,4152,'2025-08-02 08:17:24','null'),(463,4152,'2025-08-02 08:22:16','null'),(464,4152,'2025-08-02 08:25:54','null'),(465,4152,'2025-08-02 08:27:41','null'),(466,4152,'2025-08-02 10:26:29','null'),(467,4152,'2025-08-03 10:31:36','00:33'),(468,4152,'2025-08-02 16:18:03','null'),(469,4152,'2025-08-02 16:18:03','null'),(470,4152,'2025-08-02 16:18:03','null'),(471,4152,'2025-08-02 16:18:03','null'),(472,4152,'2025-08-07 13:44:28','null'),(473,4152,'2025-08-07 13:45:22','null'),(474,4152,'2025-08-07 14:42:29','null'),(475,4152,'2025-08-07 14:50:47','03:27'),(476,4152,'2025-08-09 03:10:06','null'),(477,4152,'2025-08-09 10:09:06','null'),(478,4152,'2025-08-11 10:29:28','null'),(479,4152,'2025-08-11 11:50:54','null'),(480,4152,'2025-08-11 11:53:05','null'),(481,4152,'2025-08-11 13:56:13','null'),(482,4152,'2025-08-11 14:09:21','null'),(483,4152,'2025-08-11 14:12:50','null'),(484,4152,'2025-08-11 14:24:48','null'),(485,4152,'2025-08-11 20:39:25','3d 16:33:22'),(486,4152,'2025-08-12 12:36:44','3d 00:36:01'),(487,4152,'2025-08-13 12:05:37','2d 01:07:04'),(488,4152,'2025-08-13 13:10:14','2d 00:02:04'),(489,4152,'2025-08-15 13:42:47','null'),(490,4152,'2025-08-18 09:28:53','null'),(491,4152,'2025-08-18 12:38:39','null'),(492,4152,'2025-08-18 12:44:26','null'),(493,4152,'2025-08-19 11:44:32','null'),(494,4152,'2025-08-19 12:05:54','null'),(495,4152,'2025-08-19 12:19:14','00:40'),(496,4152,'2025-08-19 12:23:48','00:24'),(497,4152,'2025-08-20 09:22:09','null'),(502,697,'2025-09-04 16:32:13','05:06'),(507,4152,'2025-10-05 05:32:51','null'),(508,4152,'2025-10-05 06:23:38','null');
/*!40000 ALTER TABLE `tbl_order_processing_timeline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:45
