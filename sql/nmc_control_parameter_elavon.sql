CREATE DATABASE  IF NOT EXISTS `nmc_control` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nmc_control`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nmc_control
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
-- Table structure for table `parameter_elavon`
--

DROP TABLE IF EXISTS `parameter_elavon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameter_elavon` (
  `parameter_elavon_id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_elavon_name` varchar(45) NOT NULL,
  `parameter_elavon_value` text NOT NULL,
  PRIMARY KEY (`parameter_elavon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_elavon`
--

LOCK TABLES `parameter_elavon` WRITE;
/*!40000 ALTER TABLE `parameter_elavon` DISABLE KEYS */;
INSERT INTO `parameter_elavon` VALUES (1,'TokenExURL','759acc957d37793dbc88976db52e3e58fade6a64eb182bde38c35ca091904288d01e8ec61ede2027584035da992de9b330f08e60fc7692572c5fdaa3a0df350cbc814260'),(2,'elavonURL','b97094a497bfc0c339eab3f5d42a3d72bb43a097de9c29b210b55157b43d913d6ef9a8d7094be9ce6e6baff14a27b09c3d785784c5c1f65393c605e922998548721efc879dce6f34'),(3,'ssl_merchant_id','0d3895afe00f128895763385'),(4,'ssl_user_id','366bd8c2598219cf2ad60c29'),(5,'ssl_pin','66207515960e2c64a35c9649'),(6,'TX_TokenExID','2fa292df4b462e13b83bd56a9a7980355b3c443d'),(7,'TX_APIKey','f6543876b9b7b869228f90c235feb3fe2ea2c809104ea7c9'),(8,'ContentType','5fe8db1e5a7872b691cb980d56b5ba600c7c469af0f6f8043d7ca64973471130a6a0bd4f3ac498ec'),(9,'Authorization','59f25644d2f584b9b34e89d55c764d58b2ef6621393a0b3ec7b34c673c8ea64022480e90b4a14ae101f3b03d1183f4ac63c8702f87cf7b7de18a7e745e45fdf7714cc70a4b9a82b90bef530aa7ee22fc6d08e9b3de492e3783e58311d3c7c4a12ef9b222');
/*!40000 ALTER TABLE `parameter_elavon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:00
