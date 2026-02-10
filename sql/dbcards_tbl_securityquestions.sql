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
-- Table structure for table `tbl_securityquestions`
--

DROP TABLE IF EXISTS `tbl_securityquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_securityquestions` (
  `tbl_securityquestions_id` int(11) NOT NULL,
  `tbl_securityquestions_name` varchar(255) NOT NULL,
  PRIMARY KEY (`tbl_securityquestions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_securityquestions`
--

LOCK TABLES `tbl_securityquestions` WRITE;
/*!40000 ALTER TABLE `tbl_securityquestions` DISABLE KEYS */;
INSERT INTO `tbl_securityquestions` VALUES (1,'What was your childhood nickname?'),(2,'In what city did you meet your spouse/significant other?'),(3,'What is the name of your favorite childhood friend?'),(4,'What street did you live on in third grade?'),(5,'What is the middle name of your oldest child?'),(6,'What is your oldest sibling\'s middle name?'),(7,'What school did you attend for sixth grade?'),(8,'What was the name of your first stuffed animal?'),(9,'In what city or town did your mother and father meet?'),(10,'What was the last name of your second grade teacher?'),(11,'What is your maternal grandmother\'s maiden name?'),(12,'In what city or town was your first job?'),(13,'What is the name of the place your wedding reception was held?'),(14,'What street did you live on growing up?'),(15,'What hospital were you born in?');
/*!40000 ALTER TABLE `tbl_securityquestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:14
