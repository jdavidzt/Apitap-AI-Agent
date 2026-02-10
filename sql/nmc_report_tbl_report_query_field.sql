CREATE DATABASE  IF NOT EXISTS `nmc_report` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nmc_report`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nmc_report
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
-- Table structure for table `tbl_report_query_field`
--

DROP TABLE IF EXISTS `tbl_report_query_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_report_query_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_report_report_query_id` int(11) DEFAULT NULL,
  `tbl_report_field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tbl_report_field_idx` (`tbl_report_field_id`),
  KEY `tbl_report_report_query1_idx` (`tbl_report_report_query_id`),
  CONSTRAINT `tbl_report_field_1` FOREIGN KEY (`tbl_report_field_id`) REFERENCES `tbl_report_field` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_report_report_query1` FOREIGN KEY (`tbl_report_report_query_id`) REFERENCES `tbl_report_report_query` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_report_query_field`
--

LOCK TABLES `tbl_report_query_field` WRITE;
/*!40000 ALTER TABLE `tbl_report_query_field` DISABLE KEYS */;
INSERT INTO `tbl_report_query_field` VALUES (1,1,1),(2,1,2),(3,1,3),(5,1,5),(7,1,7),(8,1,8),(9,1,9),(11,1,11),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,2,20),(21,2,21),(30,2,30),(31,2,31),(32,2,32),(34,2,34),(35,3,35),(36,3,36),(37,3,37),(38,3,38),(39,3,39),(40,3,40),(41,3,41),(42,3,42),(44,3,44),(45,4,45),(46,4,46),(47,4,47),(48,4,48),(52,4,52),(53,4,53),(56,4,56),(57,4,57),(59,5,59),(60,5,60),(61,5,61),(62,5,62),(64,5,64),(65,5,65),(66,5,66),(67,5,67),(69,5,69),(70,5,70),(71,5,71),(73,6,73),(74,6,74),(75,6,75),(77,6,77),(78,6,78),(79,6,79),(82,6,82),(83,6,83),(84,6,84),(85,6,85),(86,6,86),(87,6,87),(88,1,88),(89,1,89),(90,1,90),(91,7,91),(93,7,93),(95,7,95),(97,7,97),(98,7,98),(99,7,99),(100,7,100),(101,7,101),(102,7,102),(103,7,103),(104,7,104),(105,7,105),(106,7,106),(107,7,107),(108,7,108),(109,7,109),(110,7,110),(111,7,111),(112,7,112),(113,8,113),(115,8,115),(117,8,117),(119,8,119),(120,8,120),(121,8,121),(122,8,122),(123,8,123),(124,8,124),(125,8,125),(126,8,126),(127,8,127),(128,8,128),(129,8,129),(130,8,130),(131,8,131),(132,8,132),(133,8,133),(134,8,134),(135,3,135),(136,3,136),(137,2,137),(138,6,138),(139,9,139),(140,9,140),(141,9,141),(142,9,142),(143,9,143),(144,9,144),(145,9,145),(146,9,146),(147,9,147),(148,9,148),(149,9,149),(150,9,150),(151,9,151),(152,10,152),(153,10,153),(154,10,154),(155,10,155),(156,10,156),(157,10,157),(158,10,158),(159,10,159),(160,10,160),(161,11,161),(162,11,162),(163,11,163),(164,11,164),(165,11,165),(166,11,166),(167,11,167),(168,11,168),(169,11,169),(170,3,170),(171,3,171),(172,2,172),(173,2,173),(174,12,174),(175,12,175),(176,12,176),(177,12,177),(178,12,178),(179,13,179),(180,13,180),(181,13,181),(182,13,182),(183,13,183);
/*!40000 ALTER TABLE `tbl_report_query_field` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:20
