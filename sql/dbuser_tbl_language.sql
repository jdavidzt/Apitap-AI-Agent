CREATE DATABASE  IF NOT EXISTS `dbuser` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbuser`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbuser
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
-- Table structure for table `tbl_language`
--

DROP TABLE IF EXISTS `tbl_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_language` (
  `tbl_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_language_name` varchar(45) NOT NULL,
  `tbl_language_cod` varchar(2) DEFAULT NULL,
  `tbl_language_lcid` text,
  `tbl_language_image` text,
  `tbl_language_active_f` tinyint(1) NOT NULL,
  PRIMARY KEY (`tbl_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_language`
--

LOCK TABLES `tbl_language` WRITE;
/*!40000 ALTER TABLE `tbl_language` DISABLE KEYS */;
INSERT INTO `tbl_language` VALUES (1,'Afrikaans','af','af',NULL,0),(2,'Albanian','sq','sq',NULL,0),(3,'Amharic','am','am',NULL,0),(4,'Arabic - Algeria','ar','ar_DZ',NULL,0),(5,'Arabic - Bahrain','ar','ar_BH',NULL,0),(6,'Arabic - Egypt','ar','ar_EG',NULL,0),(7,'Arabic - Iraq','ar','ar_IQ',NULL,0),(8,'Arabic - Jordan','ar','ar_JO',NULL,0),(9,'Arabic - Kuwait','ar','ar_KW',NULL,0),(10,'Arabic - Lebanon','ar','ar_LB',NULL,0),(11,'Arabic - Libya','ar','ar_LY',NULL,0),(12,'Arabic - Morocco','ar','ar_MA',NULL,0),(13,'Arabic - Oman','ar','ar_OM',NULL,0),(14,'Arabic - Qatar','ar','ar_QA',NULL,0),(15,'Arabic - Saudi Arabia','ar','ar_SA',NULL,0),(16,'Arabic - Syria','ar','ar_SY',NULL,0),(17,'Arabic - Tunisia','ar','ar_TN',NULL,0),(18,'Arabic - United Arab Emirates','ar','ar_AE',NULL,0),(19,'Arabic - Yemen','ar','ar_YE',NULL,0),(20,'Armenian','hy','hy',NULL,0),(21,'Assamese','as','as',NULL,0),(22,'Azeri - Cyrillic','az','az_AZ',NULL,0),(23,'Azeri - Latin','az','az_AZ',NULL,0),(24,'Basque','eu','eu',NULL,0),(25,'Belarusian','be','be',NULL,0),(26,'Bengali - Bangladesh','bn','bn',NULL,0),(27,'Bengali - India','bn','bn',NULL,0),(28,'Bosnian','bs','bs',NULL,0),(29,'Bulgarian','bg','bg',NULL,0),(30,'Burmese','my','my',NULL,0),(31,'Catalan','ca','ca',NULL,0),(32,'Chinese - China','zh','zh_CN',NULL,0),(33,'Chinese - Hong Kong SAR','zh','zh_HK',NULL,0),(34,'Chinese - Macau SAR','zh','zh_MO',NULL,0),(35,'Chinese - Singapore','zh','zh_SG',NULL,0),(36,'Chinese - Taiwan','zh','zh_TW',NULL,0),(37,'Croatian','hr','hr',NULL,0),(38,'Czech','cs','cs',NULL,0),(39,'Danish','da','da',NULL,0),(40,'Divehi Dhivehi Maldivian','dv','dv',NULL,0),(41,'Dutch - Belgium','nl','nl_BE',NULL,0),(42,'Dutch - Netherlands','nl','nl_NL',NULL,0),(43,'Edo','','',NULL,0),(44,'English - Australia','en','en_AU',NULL,0),(45,'English - Belize','en','en_BZ',NULL,0),(46,'English - Canada','en','en_CA',NULL,0),(47,'English - Caribbean','en','en_CB',NULL,0),(48,'English - Great Britain','en','en_GB',NULL,0),(49,'English - India','en','en_IN',NULL,0),(50,'English - Ireland','en','en_IE',NULL,0),(51,'English - Jamaica','en','en_JM',NULL,0),(52,'English - New Zealand','en','en_NZ',NULL,0),(53,'English - Phillippines','en','en_PH',NULL,0),(54,'English - Southern Africa','en','en_ZA',NULL,0),(55,'English - Trinidad','en','en_TT',NULL,0),(56,'English - United States','en','en_US',NULL,1),(57,'English - Zimbabwe','en','en',NULL,0),(58,'Estonian','et','et',NULL,0),(59,'Faroese','fo','fo',NULL,0),(60,'Farsi - Persian','fa','fa',NULL,0),(61,'Filipino','','',NULL,0),(62,'Finnish','fi','fi',NULL,0),(63,'French - Belgium','fr','fr_BE',NULL,0),(64,'French - Cameroon','fr','fr',NULL,0),(65,'French - Canada','fr','fr_CA',NULL,0),(66,'French - Congo','fr','fr',NULL,0),(67,'French - Cote d Ivoire','fr','fr',NULL,0),(68,'French - France','fr','fr_FR',NULL,0),(69,'French - Luxembourg','fr','fr_LU',NULL,0),(70,'French - Mali','fr','fr',NULL,0),(71,'French - Monaco','fr','fr',NULL,0),(72,'French - Morocco','fr','fr',NULL,0),(73,'French - Senegal','fr','fr',NULL,0),(74,'French - Switzerland','fr','fr_CH',NULL,0),(75,'French - West Indies','fr','fr',NULL,0),(76,'Frisian - Netherlands','','',NULL,0),(77,'FYRO Macedonia','mk','mk',NULL,0),(78,'Gaelic - Ireland','gd','gd_IE',NULL,0),(79,'Gaelic - Scotland','gd','gd',NULL,0),(80,'Galician','gl','gl',NULL,0),(81,'Georgian','ka','ka',NULL,0),(82,'German - Austria','de','de_AT',NULL,0),(83,'German - Germany','de','de_DE',NULL,0),(84,'German - Liechtenstein','de','de_LI',NULL,0),(85,'German - Luxembourg','de','de_LU',NULL,0),(86,'German - Switzerland','de','de_CH',NULL,0),(87,'Greek','el','el',NULL,0),(88,'Guarani - Paraguay','gn','gn',NULL,0),(89,'Gujarati','gu','gu',NULL,0),(90,'Hebrew','he','he',NULL,0),(91,'HID (Human Interface Device)','','',NULL,0),(92,'Hindi','hi','hi',NULL,0),(93,'Hungarian','hu','hu',NULL,0),(94,'Icelandic','is','is',NULL,0),(95,'Igbo - Nigeria','','',NULL,0),(96,'Indonesian','id','id',NULL,0),(97,'Italian - Italy','it','it_IT',NULL,0),(98,'Italian - Switzerland','it','it_CH',NULL,0),(99,'Japanese','ja','ja',NULL,0),(100,'Kannada','kn','kn',NULL,0),(101,'Kashmiri','ks','ks',NULL,0),(102,'Kazakh','kk','kk',NULL,0),(103,'Khmer','km','km',NULL,0),(104,'Konkani','','',NULL,0),(105,'Korean','ko','ko',NULL,0),(106,'Kyrgyz - Cyrillic','','',NULL,0),(107,'Lao','lo','lo',NULL,0),(108,'Latin','la','la',NULL,0),(109,'Latvian','lv','lv',NULL,0),(110,'Lithuanian','lt','lt',NULL,0),(111,'Malay - Brunei','ms','ms_BN',NULL,0),(112,'Malay - Malaysia','ms','ms_MY',NULL,0),(113,'Malayalam','ml','ml',NULL,0),(114,'Maltese','mt','mt',NULL,0),(115,'Manipuri','','',NULL,0),(116,'Maori','mi','mi',NULL,0),(117,'Marathi','mr','mr',NULL,0),(118,'Mongolian','mn','mn',NULL,0),(119,'Mongolian','mn','mn',NULL,0),(120,'Nepali','ne','ne',NULL,0),(121,'Norwegian - Bokml','nb','no_NO',NULL,0),(122,'Norwegian - Nynorsk','nn','no_NO',NULL,0),(123,'Oriya','or','or',NULL,0),(124,'Polish','pl','pl',NULL,0),(125,'Portuguese - Brazil','pt','pt_BR',NULL,0),(126,'Portuguese - Portugal','pt','pt_PT',NULL,0),(127,'Punjabi','pa','pa',NULL,0),(128,'Raeto-Romance','rm','rm',NULL,0),(129,'Romanian - Moldova','ro','ro_MO',NULL,0),(130,'Romanian - Romania','ro','ro',NULL,0),(131,'Russian','ru','ru',NULL,0),(132,'Russian - Moldova','ru','ru_MO',NULL,0),(133,'Sami Lappish','','',NULL,0),(134,'Sanskrit','sa','sa',NULL,0),(135,'Serbian - Cyrillic','sr','sr_SP',NULL,0),(136,'Serbian - Latin','sr','sr_SP',NULL,0),(137,'Sesotho (Sutu)','','',NULL,0),(138,'Setsuana','tn','tn',NULL,0),(139,'Sindhi','sd','sd',NULL,0),(140,'Sinhala Sinhalese','si','si',NULL,0),(141,'Slovak','sk','sk',NULL,0),(142,'Slovenian','sl','sl',NULL,0),(143,'Somali','so','so',NULL,0),(144,'Sorbian','sb','sb',NULL,0),(145,'Spanish - Argentina','es','es_AR',NULL,0),(146,'Spanish - Bolivia','es','es_BO',NULL,0),(147,'Spanish - Chile','es','es_CL',NULL,0),(148,'Spanish - Colombia','es','es_CO',NULL,1),(149,'Spanish - Costa Rica','es','es_CR',NULL,0),(150,'Spanish - Dominican Republic','es','es_DO',NULL,0),(151,'Spanish - Ecuador','es','es_EC',NULL,0),(152,'Spanish - El Salvador','es','es_SV',NULL,0),(153,'Spanish - Guatemala','es','es_GT',NULL,0),(154,'Spanish - Honduras','es','es_HN',NULL,0),(155,'Spanish - Mexico','es','es_MX',NULL,0),(156,'Spanish - Nicaragua','es','es_NI',NULL,0),(157,'Spanish - Panama','es','es_PA',NULL,0),(158,'Spanish - Paraguay','es','es_PY',NULL,0),(159,'Spanish - Peru','es','es_PE',NULL,0),(160,'Spanish - Puerto Rico','es','es_PR',NULL,0),(161,'Spanish - Spain (Traditional)','es','es_ES',NULL,0),(162,'Spanish - Uruguay','es','es_UY',NULL,0),(163,'Spanish - Venezuela','es','es_VE',NULL,0),(164,'Swahili','sw','sw',NULL,0),(165,'Swedish - Finland','sv','sv_FI',NULL,0),(166,'Swedish - Sweden','sv','sv_SE',NULL,0),(167,'Syriac','','',NULL,0),(168,'Tajik','tg','tg',NULL,0),(169,'Tamil','ta','ta',NULL,0),(170,'Tatar','tt','tt',NULL,0),(171,'Telugu','te','te',NULL,0),(172,'Thai','th','th',NULL,0),(173,'Tibetan','bo','bo',NULL,0),(174,'Tsonga','ts','ts',NULL,0),(175,'Turkish','tr','tr',NULL,0),(176,'Turkmen','tk','tk',NULL,0),(177,'Ukrainian','uk','uk',NULL,0),(178,'Unicode','','UTF_8',NULL,0),(179,'Urdu','ur','ur',NULL,0),(180,'Uzbek - Cyrillic','uz','uz_UZ',NULL,0),(181,'Uzbek - Latin','uz','uz_UZ',NULL,0),(182,'Venda','','',NULL,0),(183,'Vietnamese','vi','vi',NULL,0),(184,'Welsh','cy','cy',NULL,0),(185,'Xhosa','xh','xh',NULL,0),(186,'Yiddish','yi','yi',NULL,0),(187,'Zulu','zu','zu',NULL,0);
/*!40000 ALTER TABLE `tbl_language` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:35:55
