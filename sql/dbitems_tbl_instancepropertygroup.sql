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
-- Table structure for table `tbl_instancepropertygroup`
--

DROP TABLE IF EXISTS `tbl_instancepropertygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_instancepropertygroup` (
  `idtbl_instancepropertygroup_id` int(11) NOT NULL,
  `tbl_instancepropertygroup_name` varchar(45) NOT NULL,
  `tbl_instancepropertygroup_bundle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtbl_instancepropertygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_instancepropertygroup`
--

LOCK TABLES `tbl_instancepropertygroup` WRITE;
/*!40000 ALTER TABLE `tbl_instancepropertygroup` DISABLE KEYS */;
INSERT INTO `tbl_instancepropertygroup` VALUES (3201,'Select Platform','987'),(3202,'Logo Image','988'),(3203,'Enable Module in App','989'),(3204,'Screen Background','990'),(3205,'Font','991'),(3206,'Pin Keyboard','992'),(3207,'Type 1 class controls','993'),(3208,'Type 2 class controls','994'),(3209,'Type 3 class controls','995'),(3210,'Type 4 class controls','996'),(3211,'Type 5 class controls','997'),(3212,'Text Areas','998'),(3213,'Title Bar','999'),(3214,'ListView','1000'),(3215,'Toolbar','1001'),(3216,'Menu','1002'),(3217,'Preview & Download','1003'),(3218,'Paginator','1160');
/*!40000 ALTER TABLE `tbl_instancepropertygroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:51
