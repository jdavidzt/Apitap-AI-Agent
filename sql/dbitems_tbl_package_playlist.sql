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
-- Table structure for table `tbl_package_playlist`
--

DROP TABLE IF EXISTS `tbl_package_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_package_playlist` (
  `tbl_package_playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_package_id` int(11) NOT NULL,
  `tbl_playlist_id` int(11) NOT NULL,
  `tbl_playlist_title` varchar(255) NOT NULL,
  `tbl_playlist_description` text NOT NULL,
  `tbl_playlist_url` text,
  `tbl_playlist_url_text` text,
  `tbl_playlist_mobile_f` tinyint(1) NOT NULL DEFAULT '0',
  `tbl_playlist_website_f` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tbl_package_playlist_id`),
  KEY `fk_package_playlist_tbl_package_idx` (`tbl_package_id`),
  KEY `fk_package_playlist_tbl_playlist_idx` (`tbl_playlist_id`),
  CONSTRAINT `fk_package_playlist_tbl_package` FOREIGN KEY (`tbl_package_id`) REFERENCES `tbl_package` (`tbl_package_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_package_playlist_tbl_playlist` FOREIGN KEY (`tbl_playlist_id`) REFERENCES `tbl_package_layout_component_playlist` (`tbl_playlist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_package_playlist`
--

LOCK TABLES `tbl_package_playlist` WRITE;
/*!40000 ALTER TABLE `tbl_package_playlist` DISABLE KEYS */;
INSERT INTO `tbl_package_playlist` VALUES (1,739,22490,'Eclipse','Eclipse',NULL,NULL,1,1),(2,739,22491,'Moon','Moon',NULL,NULL,1,1),(3,739,22492,'Noon','Noon',NULL,NULL,1,1),(4,739,22493,'Walking by','Walking by',NULL,NULL,1,1),(5,739,22494,'Moonlight','Moonlight',NULL,NULL,1,1),(6,739,22495,'Mountain','Mountain',NULL,NULL,1,1),(18,745,22609,'Stock Image','Taken from gallery',NULL,NULL,1,1),(19,745,22610,'star wars','movie premiere Chinese Theater',NULL,NULL,1,1),(23,751,22659,'cake','cake',NULL,NULL,1,1),(30,730,22527,'background','background',NULL,NULL,1,1),(31,730,22528,'background','background',NULL,NULL,1,1),(32,730,22529,'background','background',NULL,NULL,1,1),(33,730,22530,'background','background',NULL,NULL,1,1),(34,778,22944,'calvin and hobbs','toys',NULL,NULL,1,0),(35,779,22948,'NEW ARRIVALS','Frsh off teh truck',NULL,NULL,1,0),(36,779,22949,'spooky night sale','miodniught sakle',NULL,NULL,1,0),(37,779,22950,'\0','\0',NULL,NULL,1,0),(38,779,22951,'\0','\0',NULL,NULL,1,0),(39,780,22952,'\0','\0',NULL,NULL,0,0),(40,781,22952,'\0','\0',NULL,NULL,0,1),(76,785,22998,'\0','\0',NULL,NULL,1,1),(79,785,22996,'\0','\0','\0','\0',0,0),(80,785,22995,'\0','\0',NULL,NULL,1,1),(86,791,23145,'APITAP','Welcome to Apitap, the first, true all-In-one Social Commerce platform. Apitap combines the best features of digital marketing, social media, and sales together into one environment. It provides a wide range of features that covers the needs of most merchants, so you can easily close most sales with any merchant and build your revenue. From in-store advertising and mobile marketing to enhanced print ads, direct sales and customer messaging, merchants will have the product and service offering they need to take their business into the 21st-century.','https://aiodm.com/',NULL,1,1),(87,791,23146,'APITAP','Welcome to Apitap, the first, true all-In-one Social Commerce platform. Apitap combines the best features of digital marketing, social media, and sales together into one environment. It provides a wide range of features that covers the needs of most merchants, so you can easily close most sales with any merchant and build your revenue. From in-store advertising and mobile marketing to enhanced print ads, direct sales and customer messaging, merchants will have the product and service offering they need to take their business into the 21st-century.','https://aiodm.com/','Click Here to go AIODM Site',1,1),(88,791,23147,'Leon\'s of Beverly Hills','\0','https://www.apitap.com/merchant/3030303132303243303030303030303034343831:F','\0',1,1),(89,791,23148,'Leon\'s of Beverly Hills','\0','https://www.apitap.com/merchant/3030303132303243303030303030303034343831:F',NULL,1,1),(90,791,23149,'PANDAMONIUM','\0','https://www.apitap.com/merchant/3030303132303241303030303030303033333836:F','\0',0,0),(91,791,23150,'PANDAMONIUM','\0','https://www.apitap.com/merchant/3030303132303241303030303030303033333836:F',NULL,1,1),(97,789,23102,'title','description','url',NULL,0,0),(102,792,23170,'Crafted Visions Banner','Our Goal, our motto, ,. Crafting Imagination into Reality','\0','\0',0,0),(103,792,23171,'Crafted Visions Logo','Our Logo Our Goal, our motto, ,. Crafting Imagination into Reality','\0','\0',1,1),(106,797,23172,'\0','\0','\0','\0',1,1),(108,799,23172,'\0','\0','\0','\0',1,1),(109,788,23175,'\0','\0','\0','\0',1,1),(110,788,23176,'\0','\0','\0','\0',1,1),(111,788,23177,'\0','\0','\0','\0',1,1),(112,788,23174,'\0','\0','\0','\0',1,1),(114,800,23180,'\0','\0','\0','\0',1,1),(115,801,23182,'one day sale 20% off','one day sale 20% off','\0','\0',1,1),(116,792,23169,'\0','\0','\0','\0',0,0);
/*!40000 ALTER TABLE `tbl_package_playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:46
