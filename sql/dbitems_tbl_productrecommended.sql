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
-- Table structure for table `tbl_productrecommended`
--

DROP TABLE IF EXISTS `tbl_productrecommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productrecommended` (
  `tbl_productrecommended_productId` int(11) NOT NULL,
  `tbl_productrecommended_productrecoId` int(11) NOT NULL,
  PRIMARY KEY (`tbl_productrecommended_productId`,`tbl_productrecommended_productrecoId`),
  KEY `fk_tbl_productrecommended_productfav_idx` (`tbl_productrecommended_productrecoId`),
  CONSTRAINT `fk_tbl_productrecommended_product` FOREIGN KEY (`tbl_productrecommended_productId`) REFERENCES `tbl_product` (`tbl_product_id`),
  CONSTRAINT `fk_tbl_productrecommended_productreco` FOREIGN KEY (`tbl_productrecommended_productrecoId`) REFERENCES `tbl_product` (`tbl_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productrecommended`
--

LOCK TABLES `tbl_productrecommended` WRITE;
/*!40000 ALTER TABLE `tbl_productrecommended` DISABLE KEYS */;
INSERT INTO `tbl_productrecommended` VALUES (251,13),(251,15),(251,17),(17,18),(13,22),(251,22),(50,49),(13,50),(18,50),(270,50),(270,251),(478,270),(256,370),(256,371),(1234,1078),(1234,1090),(1135,1141),(1234,1151),(1910,1871),(1910,1875),(1910,1877),(1910,1878),(1910,1882),(1910,1883),(1910,1884),(1910,1885),(1910,1886),(1910,1887),(1910,1888),(1910,1890),(1910,1891),(1910,1892),(1910,1894),(1910,1895),(1910,1896),(1910,1898),(1910,1899),(1910,1900),(1910,1901),(1910,1902),(1910,1903),(1910,1904),(1910,1905),(1910,1906),(1910,1907),(1910,1908),(1910,1909),(1910,1910),(1910,1911),(1910,1913),(1910,1914),(1910,1915),(1910,1917),(1910,1918),(1910,1919),(1910,1920),(1910,1921),(1987,1980),(1989,1981),(1987,1986),(1987,1987),(1989,1988),(1993,1988),(1993,1995);
/*!40000 ALTER TABLE `tbl_productrecommended` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:26
