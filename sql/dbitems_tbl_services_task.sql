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
-- Table structure for table `tbl_services_task`
--

DROP TABLE IF EXISTS `tbl_services_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_services_task` (
  `tbl_task_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_job_id` int(11) DEFAULT NULL,
  `tbl_services_id` int(11) NOT NULL,
  `tbl_user_id` int(11) NOT NULL,
  `tbl_task_assigned` int(11) DEFAULT NULL,
  `tbl_task_status_id` int(11) NOT NULL,
  `tbl_task_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbl_task_quantity` int(11) NOT NULL DEFAULT '0',
  `tbl_task_date` datetime DEFAULT NULL,
  `tbl_task_dateStart` datetime DEFAULT NULL,
  `tbl_task_dateEnd` datetime DEFAULT NULL,
  `tbl_task_dateEstimated` datetime DEFAULT NULL,
  `tbl_task_rate` int(11) DEFAULT NULL,
  `tbl_task_review` text,
  `tbl_task_rejected_comments` text,
  `tbl_task_cancel_comments` text,
  PRIMARY KEY (`tbl_task_id`),
  KEY `fk_tbl_task_tbl_task_status_idx` (`tbl_task_status_id`),
  KEY `fk_tbl_task_tbl_services_idx` (`tbl_services_id`),
  KEY `fk_tbl_task_tbl_job_idx` (`tbl_job_id`),
  CONSTRAINT `fk_tbl_task_tbl_job` FOREIGN KEY (`tbl_job_id`) REFERENCES `tbl_services_job` (`tbl_job_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_task_tbl_services` FOREIGN KEY (`tbl_services_id`) REFERENCES `tbl_services` (`tbl_services_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_task_tbl_task_status` FOREIGN KEY (`tbl_task_status_id`) REFERENCES `tbl_services_task_status` (`tbl_task_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_services_task`
--

LOCK TABLES `tbl_services_task` WRITE;
/*!40000 ALTER TABLE `tbl_services_task` DISABLE KEYS */;
INSERT INTO `tbl_services_task` VALUES (1,NULL,4,197,NULL,91001,20.00,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_services_task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:28
