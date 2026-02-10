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
-- Table structure for table `tbl_layout`
--

DROP TABLE IF EXISTS `tbl_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_layout` (
  `tbl_layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) NOT NULL,
  `tbl_layout_title` varchar(70) DEFAULT NULL,
  `tbl_layout_description` text,
  `tbl_layout_length` varchar(45) NOT NULL DEFAULT '0',
  `tbl_layout_width` varchar(45) NOT NULL DEFAULT '0',
  `tbl_layout_background` varchar(70) DEFAULT NULL,
  `tbl_layout_template` varchar(70) DEFAULT NULL,
  `tbl_layout_thumbnail` varchar(70) DEFAULT NULL,
  `tbl_layout_background_size` int(11) DEFAULT '0',
  `tbl_layout_background_colour` varchar(45) DEFAULT NULL,
  `tbl_layout_position` int(11) DEFAULT '69002',
  `tbl_layout_componentQty` int(11) DEFAULT NULL,
  `tbl_layout_version` int(11) NOT NULL DEFAULT '1',
  `tbl_layout_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tbl_layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_layout`
--

LOCK TABLES `tbl_layout` WRITE;
/*!40000 ALTER TABLE `tbl_layout` DISABLE KEYS */;
INSERT INTO `tbl_layout` VALUES (499,197,'David Test Final a','Testing update build','365','650','la_mng2965088818286587026.jpg','','la_ct6032098821054285307.png',0,'',69002,2,17,'2020-02-13 11:12:59'),(500,197,'David test B','second run with 515 to 516 and ad playback','365','650','','','la_ct6865601177638445562.png',0,'#000000',69002,3,3,'2020-02-18 14:08:18'),(501,197,'David Test C','check in test','365','650','la_mng3975484831778677438.jpg','','la_ct5106928017805982952.png',0,'',69002,1,8,'2020-02-18 14:24:52'),(502,197,'David time Test 1','15 min','365','650','','','la_ct4379312768870328893.png',0,'#000000',69002,2,13,'2020-02-19 11:10:26'),(503,197,'demo 3','Rene demo 1','365','650','la_mng8963706991009047307.gif','','la_ct3514240978172809468.png',0,'',69002,2,12,'2020-02-21 16:17:00'),(505,197,'Demo 4','Demo 4','600','337','la_mng5406917284817099797.jpg','','la_ct5662383288776770045.png',0,'',69001,3,12,'2020-10-06 09:46:14'),(528,197,'art','art','365','650','la_mng5406917284817099797.jpg','','la_ct8988466092565336300.png',0,'',69002,2,11,'2021-02-24 13:09:44'),(531,3,'David 1','homepage test','365','650','AmWThvw_4803444242218397129.jpg','','la_ct3536182199706178868.png',0,'',69002,1,5,'2021-03-06 13:13:29'),(534,197,'KT','new','365','650','tmp_ie3822164106846480703.png','','la_ct3150757183574464654.png',0,'',69002,1,17,'2021-07-20 10:19:26'),(535,197,'Cake','Cake','365','650','','','la_ct4259917901380530937.png',0,'#000000',69002,1,3,'2021-07-26 07:03:29'),(536,197,'TERM1_LY','Terminal 1 Layout','365','650','','','la_ct2223327721399785565.png',0,'#000000',69002,2,28,'2021-09-09 01:07:48'),(537,197,'xmas','xmas','0','0',NULL,NULL,NULL,0,NULL,69002,NULL,1,'2021-09-30 10:22:25'),(538,197,'sample','sample','365','650','','','la_ct7717518169184844577.png',0,'#000000',69002,1,9,'2021-10-06 14:53:15'),(539,1360,'Food 1','ad for italian food','365','650','','','la_ct2426269561132135996.png',0,'#FFFFFF',69002,1,4,'2021-11-04 12:08:22'),(541,1360,'Test 3','Test 3','365','650','la_mng7040619789029053273.jpg','','la_ct8770376856103020081.png',0,'',69002,2,4,'2021-12-17 13:09:27'),(542,197,'Krestina Demo','Krestina Demo','365','650','','','la_ct5341627295894880581.png',0,'#000000',69002,2,6,'2021-12-18 09:10:36'),(546,197,'Jesus Demo','demo','0','0',NULL,NULL,NULL,0,NULL,69002,NULL,1,'2021-12-20 06:29:12'),(549,3311,'Lobby','designer','365','650','','','la_ct1674847212583670864.png',0,'#FFFFFF',69002,1,10,'2022-01-13 17:03:11'),(551,1360,'demo 2','showcase of features\r\n','365','650','la_mng82379555601760991.jpg','','la_ct1643670933424548928.png',444,'',69002,3,6,'2022-01-14 11:46:02'),(552,1360,'video 1','demo ','365','650','','','la_ct6071273842223170682.png',0,'#FFFFFF',69002,2,5,'2022-01-14 12:00:00'),(555,3311,'Lobby Showcase','Designers','365','650','','','la_ct2173363477398082589.png',0,'#FFFFFF',69002,1,2,'2022-02-12 11:24:45'),(557,197,'TERM1_LY2','Term2','365','650','','','la_ct455168580570311598.png',0,'#000000',69002,1,3,'2022-02-16 18:35:34'),(560,197,'toys','gun','365','650','la_mng111114492475010799.jpg','','la_ct461690508842274174.png',0,'',69002,3,5,'2022-03-18 11:48:44'),(561,1360,'Mobile Ads','mobile ads - landacape','365','650','','','la_ct1361137241190324533.png',0,'#FFFFFF',69002,1,2,'2022-03-24 11:41:32'),(562,1360,'Web Ads','web Ads - landscape','365','650','','','la_ct6765470231903933145.png',0,'#FFFFFF',69002,1,2,'2022-03-24 11:42:07'),(563,1360,'Digital Ads','all ads - landscape','365','650','','','la_ct6069669234063540250.png',0,'#000000',69002,3,11,'2022-03-24 11:42:32'),(565,3386,'TV 1920 x1080','Front Register','0','0',NULL,NULL,NULL,0,NULL,69002,NULL,1,'2022-04-01 15:51:08'),(567,3386,'Pure Banner','Pure Banner','365','650','','','la_ct1579591008146517834.png',0,'#FFFFFF',69002,1,11,'2022-04-04 17:11:28'),(569,4481,'Digital ','1','365','650','','','la_ct489940770429504787.png',0,'#FFFFFF',69002,1,6,'2022-04-13 16:49:10'),(570,197,'TestingDefinitions','Different products to display as definitions and sizes','406','700','','','la_ct6335668128714240359.png',0,'#000000',69002,0,28,'2022-04-19 20:11:53'),(571,3,'Apitap Main','Apitap Main','365','650','','','la_ct965227749602659981.png',0,'#FFFFFF',69002,1,3,'2022-04-21 14:21:21'),(572,4481,'lily ads','lily','0','0',NULL,NULL,NULL,0,NULL,69002,NULL,1,'2022-05-05 11:33:26'),(573,197,'test 19','test 19','365','650','la_mng802692413268553038.JPG','','la_ct6448735903700700797.png',13,'',69002,2,4,'2022-05-19 06:31:47'),(575,197,'MxStore1','Mx Store Test 01','365','650','','','la_ct3588042139055202158.png',0,'#000000',69002,1,2,'2022-05-25 14:27:01'),(576,4649,'spandex','1','365','650','','','la_ct1330963608661028619.png',0,'#FFFFFF',69002,1,2,'2022-05-31 15:28:15'),(577,4923,'Video Camp','Video Camp','365','650','','','la_ct266960873415516290.png',0,'#FFFFFF',69002,1,4,'2022-07-08 15:06:11'),(578,4649,'one day only sale 20% off','one day only sale 20% off','365','650','','','la_ct382272069465730370.png',0,'#FFFFFF',69002,1,3,'2022-08-25 14:28:23'),(579,5347,'1','test','0','0',NULL,NULL,NULL,0,NULL,69002,NULL,1,'2025-05-23 08:29:34'),(580,5347,'2','test 2','0','0',NULL,NULL,NULL,0,NULL,69002,NULL,1,'2025-05-23 08:32:28');
/*!40000 ALTER TABLE `tbl_layout` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:33:11
