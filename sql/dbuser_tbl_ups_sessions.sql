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
-- Table structure for table `tbl_ups_sessions`
--

DROP TABLE IF EXISTS `tbl_ups_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ups_sessions` (
  `tbl_ups_sessions` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_user_id` int(11) DEFAULT NULL,
  `expires_token` varchar(45) DEFAULT NULL,
  `json_info` text,
  PRIMARY KEY (`tbl_ups_sessions`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ups_sessions`
--

LOCK TABLES `tbl_ups_sessions` WRITE;
/*!40000 ALTER TABLE `tbl_ups_sessions` DISABLE KEYS */;
INSERT INTO `tbl_ups_sessions` VALUES (2,197,'5183999','{\"refresh_token_expires_in\":\"5183999\",\"refresh_token_status\":\"approved\",\"token_type\":\"Bearer\",\"issued_at\":\"1764025322666\",\"client_id\":\"Je8Gpsig5HVHLZqPsfsUyrzoMTScResXGUnDGbbHfFNBIZoR\",\"access_token\":\"eyJraWQiOiI5NzllNmVhYy1iZmExLTQzZmQtYTliZi05NTBhYzE0OGVkNjMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJzdWIiOiJhaW9kYy5haW9kbUBnbWFpbC5jb20iLCJjbGllbnRpZCI6IkplOEdwc2lnNUhWSExacVBzZnNVeXJ6b01UU2NSZXNYR1VuREdiYkhmRk5CSVpvUiIsIm1lcl9pZCI6InRlc3RpbmciLCJpc3MiOiJodHRwczovL2FwaXMudXBzLmNvbSIsInV1aWQiOiI1NDM1NTY0NS03NTJGLTExMzQtQUVFMS01NzYyMDRBOEFFQzUiLCJzaWQiOiI5NzllNmVhYy1iZmExLTQzZmQtYTliZi05NTBhYzE0OGVkNjMiLCJhdWQiOiJBcGl0YXAiLCJhdCI6IjRXZU45VUhsSjYzSTBodjlHQzRZUnhEUG1ETlYiLCJuYmYiOjE3NjQwMjUzMjIsInNjb3BlIjoiTG9jYXRvcldpZGdldCIsIkRpc3BsYXlOYW1lIjoiQXBpdGFwIiwiZXhwIjoxNzY0MDM5NzIyLCJpYXQiOjE3NjQwMjUzMjIsImp0aSI6Ijg0ZjQ4NDJkLWMzYjUtNDAzMy04NDEwLTRjZWEyMjc4M2Y4MSJ9.mCSgCx-RludTIkwqDMSXJe15896zfZ48vQ7X7VynuVjt40aqDS62LI4seww2QatJ_CwObsFYOoOHLm_rDWglo0nDkYWFfiBbYHkoSj_mBMpHaHSWBQ1YC3SW2BEQ0GV2kl5kvV_ry2KvJc3ISV6rBh6z9aRIrGyNNOIf9oST5Wzuphdo4bbOVMzbUnJbd7znoI6X6e8o-H-qZJnVMCBmhspTpzJv5jfpEVhLve1cxoA9rj51VVm4dqZ63fHL7FLLuMnAuxENRHbQP8dPSzyiAZ1xFw--xES7t7DADLPZOOQi11SlBX_Cs1lMvoTYlwzt1EriyWqpXEUt_6k5chpP3vFOy2aAyijvmP0De5htCNz-ucuRIiw17GE9onv5Rj0eDgym3FWinUcSHZcsPZWn1mwsPN5iOCwwG-mtJLovos5fmmEtPfGmehTLuTa-dF5R7FSMoMO8q2lp7H9wFP5VqCdkUalJ73QL93WN9xaX_KApnJKMdS-rJE6oVR5H0anwzPzXsuIkTK6jgmsh1huwc7IDmSvJb94ACMN-hIfEr9HxILg7L96Z1T2YwSWrB52cYENxRYEPRyrWLkUMcoj0rBTL2T-TLlOYXSoXXAu3lV9aVcBmPHJyM0vM2-q7bronE0Azhqs1gvJMqhD9faeafZ4Ns0XIuU8YJY1BKjQ-Bh8\",\"refresh_token\":\"VtwY8DbNFfZUaCAFwqk0l7n0PSmGsyQ9\",\"refresh_token_issued_at\":\"1764025322666\",\"expires_in\":\"14399\",\"status\":\"approved\"}'),(3,1360,'5183999','{\"refresh_token_expires_in\":\"5183999\",\"refresh_token_status\":\"approved\",\"token_type\":\"Bearer\",\"issued_at\":\"1764968402419\",\"client_id\":\"Je8Gpsig5HVHLZqPsfsUyrzoMTScResXGUnDGbbHfFNBIZoR\",\"access_token\":\"eyJraWQiOiI5NzllNmVhYy1iZmExLTQzZmQtYTliZi05NTBhYzE0OGVkNjMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJzdWIiOiJhaW9kYy5haW9kbUBnbWFpbC5jb20iLCJjbGllbnRpZCI6IkplOEdwc2lnNUhWSExacVBzZnNVeXJ6b01UU2NSZXNYR1VuREdiYkhmRk5CSVpvUiIsIm1lcl9pZCI6InRlc3RpbmciLCJpc3MiOiJodHRwczovL2FwaXMudXBzLmNvbSIsInV1aWQiOiI1NDM1NTY0NS03NTJGLTExMzQtQUVFMS01NzYyMDRBOEFFQzUiLCJzaWQiOiI5NzllNmVhYy1iZmExLTQzZmQtYTliZi05NTBhYzE0OGVkNjMiLCJhdWQiOiJBcGl0YXAiLCJhdCI6Ijd0aVBHSk1OempwRzNoTmU5WjJrNDBNQktGd3MiLCJuYmYiOjE3NjQ5Njg0MDIsInNjb3BlIjoiTG9jYXRvcldpZGdldCIsIkRpc3BsYXlOYW1lIjoiQXBpdGFwIiwiZXhwIjoxNzY0OTgyODAyLCJpYXQiOjE3NjQ5Njg0MDIsImp0aSI6IjMxYTFhNmFiLWYyY2MtNDAxYy04OGRlLTk2YjZhNDI3NGYzYyJ9.vt5Fuwm-ark6xXC3gRsyyVqwkxK9IIPP2UrYO4v4XdxqYr1izREufxBZXVJnSPNd_DQL_ysg_kbW4YdJyd48zXqUIJ3kF7Kk7lUW5BocYc1ovsAovbOAkg5OLg-AS8k4GxwlBRLfHfX1-hQC_vsY8d7J3-CPCp7UzB-7d3DaZpRDa-zIdZkI-SL--4iWnVYOzHoOsjY20SD9tJMVC5BlMDwGJKo2tO5oyInEEHrPjL2lB23Lxjf23eQWTFVISj9-z3gbvsy5KSWaNpd8leXou8UEWXYlDNjoGFN0v3iE2S3moTezgtkDHpSj0tM208b5K_AUPm6-IijaY2PqALpU-_ucfNhUoagdeAnH56ptVtMp5H1n8T_3gT1XG4x_bmfexeWSgDdtrM2b7URfpD-9XbrK2QyU1E9lov58kFFh7a0WlMzcLyu0B_OAqsh7V1M2FeTXyUBaUfdgrfUu2KxsQrqH__I7ITrA7TPKQPbbG1HvalAZH-rq6L-QDj9KGOEeUbljxpi9eE2KKtZa7Q9AY0oDCAqI2Tym9xEax4M-bL8zAPlppufGXP3tWIw7Fo-7ISZUyhKsSjN0IboatHVqzdur0VBIUMXoxJ7j8xnYtFDdLqPE1tyyAUIDle_IXxP3Q7MM2FLJkiTjBCQZMRHVoTXNp2JxWof_LARiOdxQHNs\",\"refresh_token\":\"Fetib5RyuINrqivZ5oVesE6STkvUc0OU\",\"refresh_token_issued_at\":\"1764968402419\",\"expires_in\":\"14399\",\"status\":\"approved\"}'),(4,5347,'5183999','{\"refresh_token_expires_in\":\"5183999\",\"refresh_token_status\":\"approved\",\"token_type\":\"Bearer\",\"issued_at\":\"1765544664708\",\"client_id\":\"Je8Gpsig5HVHLZqPsfsUyrzoMTScResXGUnDGbbHfFNBIZoR\",\"access_token\":\"eyJraWQiOiI5NzllNmVhYy1iZmExLTQzZmQtYTliZi05NTBhYzE0OGVkNjMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzM4NCJ9.eyJzdWIiOiJhaW9kYy5haW9kbUBnbWFpbC5jb20iLCJjbGllbnRpZCI6IkplOEdwc2lnNUhWSExacVBzZnNVeXJ6b01UU2NSZXNYR1VuREdiYkhmRk5CSVpvUiIsImlzcyI6Imh0dHBzOi8vYXBpcy51cHMuY29tIiwidXVpZCI6IjU0MzU1NjQ1LTc1MkYtMTEzNC1BRUUxLTU3NjIwNEE4QUVDNSIsInNpZCI6Ijk3OWU2ZWFjLWJmYTEtNDNmZC1hOWJmLTk1MGFjMTQ4ZWQ2MyIsImF1ZCI6IkFwaXRhcCIsImF0IjoiMGtHSGozcDBjdjNJd1lFb0J2ajgwQ1BBMlJFUiIsIm5iZiI6MTc2NTU0NDY2NCwic2NvcGUiOiJMb2NhdG9yV2lkZ2V0IiwiRGlzcGxheU5hbWUiOiJBcGl0YXAiLCJleHAiOjE3NjU1NTkwNjQsImlhdCI6MTc2NTU0NDY2NCwianRpIjoiNzY5MDVlMzEtMTBiYi00OTA4LTkyY2ItZjMzMTkyY2YzMWQyIn0.OEEqWastiscRLpkPuurkylC_Q_GSYtI1VcOU4Ski-EjkFLpEdAgqb60kgM00dD7LASzmlgpc5nVzhZ4fGGuWLhC-WympKjUOE3Q1JtvRZ2YqnYtncf2YB0jKmP_v92qcEStS6skWkzwW0TJLoyvz76Pn2KjWTUrEFMgu9OGUk1lcSPlz1rXNq0Zr5ZrbedyE4OrBm4q-KoYb15WFTGCaitKCG6LMWiBPqCuotkL-iYeFaI85BDHg-C-AN6wSmahujdIZYM_lFO9kzFRLMc_bbGiUK9s-nVxJM703jNaM6Q9W3Lh9AufJzqpEVnilpjvEowhpwxet_yx6gZZCT0a9GhuHy49dW_rksP1r_HEkbRvfpbb1EMnFXHujs_Bb90ZXdp_chfpoxNtEjgJ5_i-TcMb3YSh9mQpDWNoGDvUnQ8uSMkna99gGHNfsrqhEvr5Zr96D5Xo_TyNKBIX0UK18stFNYzvwf8bQT0rHM1xBOiOeBeKCTBdh1nB_qvxS5zrDiiwV9p8AMs7O5RzURmqIJW8HMlnQB2yWMFysI3t0EyomRjabWHpLvZ5t8Xj8o6DCBGSqGDqwr8oHPCGfPJQEhNqr8owOPCoPNLYCGBUSKmO12a9RH04le9MLw5yQKaZ7xbo9n2-iRJlMJ-aDgkKAunKBK_xDBjQ_S2u-8GoR1OU\",\"refresh_token\":\"nqwCXOvsQMccSxuyWeKNIHuikY6YGG0r\",\"refresh_token_issued_at\":\"1765544664708\",\"expires_in\":\"14399\",\"status\":\"approved\"}');
/*!40000 ALTER TABLE `tbl_ups_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:35:16
