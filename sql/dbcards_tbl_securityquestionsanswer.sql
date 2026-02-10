CREATE DATABASE  IF NOT EXISTS `dbcards` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbcards`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcards
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
-- Table structure for table `tbl_securityquestionsanswer`
--

DROP TABLE IF EXISTS `tbl_securityquestionsanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_securityquestionsanswer` (
  `tbl_securityquestionsanswer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tbl_securityquestionsanswer_answer` varchar(255) DEFAULT NULL,
  `tbl_securityquestions_id` int(11) NOT NULL,
  `tbl_cardsconsumer_nmcId` int(11) NOT NULL,
  PRIMARY KEY (`tbl_securityquestionsanswer_id`),
  KEY `fk_tbl_securityquestionsanswer_tbl_securityquestions1_idx` (`tbl_securityquestions_id`),
  CONSTRAINT `fk_tbl_securityquestionsanswer_tbl_securityquestions1` FOREIGN KEY (`tbl_securityquestions_id`) REFERENCES `tbl_securityquestions` (`tbl_securityquestions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_securityquestionsanswer`
--

LOCK TABLES `tbl_securityquestionsanswer` WRITE;
/*!40000 ALTER TABLE `tbl_securityquestionsanswer` DISABLE KEYS */;
INSERT INTO `tbl_securityquestionsanswer` VALUES (17,'aaaa',1,1),(18,'aaaa',4,1),(19,'aaaa',5,1),(20,'aaaa',7,1),(21,'Aa1#aaaa',1,197),(22,'Aa1#aaaa',2,197),(23,'Aa1#aaaa',5,197),(24,'Aa1#aaaa',7,197);
/*!40000 ALTER TABLE `tbl_securityquestionsanswer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:07
