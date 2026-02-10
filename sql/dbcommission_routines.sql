CREATE DATABASE  IF NOT EXISTS `dbcommission` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbcommission`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcommission
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
-- Temporary view structure for view `vw_client_list`
--

DROP TABLE IF EXISTS `vw_client_list`;
/*!50001 DROP VIEW IF EXISTS `vw_client_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_client_list` AS SELECT 
 1 AS `tbl_user_reseller_id`,
 1 AS `tbl_parent_reseller_id`,
 1 AS `tbl_user_id`,
 1 AS `tbl_user_first`,
 1 AS `tbl_user_last`,
 1 AS `tbl_userstatus_id`,
 1 AS `tbl_user_dateAdded`,
 1 AS `tbl_commission_id`,
 1 AS `tbl_commission_date`,
 1 AS `tbl_commission_status_id`,
 1 AS `tbl_commission_refNumber`,
 1 AS `tbl_merchant_basic_subs`,
 1 AS `tbl_merchant_standard_subs`,
 1 AS `tbl_merchant_deluxe_subs`,
 1 AS `tbl_merchant_dongles_quantity`,
 1 AS `tbl_merchant_tablet_quantity`,
 1 AS `tbl_merchant_tv_quantity`,
 1 AS `tbl_commission_ammount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_agent_list`
--

DROP TABLE IF EXISTS `vw_agent_list`;
/*!50001 DROP VIEW IF EXISTS `vw_agent_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_agent_list` AS SELECT 
 1 AS `tbl_commission_id`,
 1 AS `tbl_user_id`,
 1 AS `tbl_user_parentId`,
 1 AS `tbl_user_first`,
 1 AS `tbl_user_last`,
 1 AS `tbl_agent_type_id`,
 1 AS `tbl_userstatus_id`,
 1 AS `tbl_user_dateAdded`,
 1 AS `tbl_merchant_qty`,
 1 AS `tbl_merchant_cancelled_qty`,
 1 AS `tbl_merchant_basic_subs`,
 1 AS `tbl_merchant_standard_subs`,
 1 AS `tbl_merchant_deluxe_subs`,
 1 AS `tbl_merchant_dongles_quantity`,
 1 AS `tbl_commission_date`,
 1 AS `tbl_commission_status_id`,
 1 AS `tbl_commission_refNumber`,
 1 AS `tbl_commission_ammount`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_client_list`
--

/*!50001 DROP VIEW IF EXISTS `vw_client_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_client_list` AS select `c`.`tbl_user_reseller_id` AS `tbl_user_reseller_id`,(select `f`.`tbl_user_parentId` from `dbuser`.`tbl_user` `f` where (`f`.`tbl_user_id` = `c`.`tbl_user_reseller_id`)) AS `tbl_parent_reseller_id`,`a`.`tbl_user_id` AS `tbl_user_id`,`a`.`tbl_user_first` AS `tbl_user_first`,`a`.`tbl_user_last` AS `tbl_user_last`,`a`.`tbl_userstatus_id` AS `tbl_userstatus_id`,`a`.`tbl_user_dateAdded` AS `tbl_user_dateAdded`,`b`.`tbl_commission_id` AS `tbl_commission_id`,`b`.`tbl_commission_date` AS `tbl_commission_date`,`b`.`tbl_commission_status_id` AS `tbl_commission_status_id`,`b`.`tbl_commission_refNumber` AS `tbl_commission_refNumber`,`c`.`tbl_merchant_basic_subs` AS `tbl_merchant_basic_subs`,`c`.`tbl_merchant_standard_subs` AS `tbl_merchant_standard_subs`,`c`.`tbl_merchant_deluxe_subs` AS `tbl_merchant_deluxe_subs`,`c`.`tbl_merchant_dongles_quantity` AS `tbl_merchant_dongles_quantity`,`c`.`tbl_merchant_tablet_quantity` AS `tbl_merchant_tablet_quantity`,`c`.`tbl_merchant_tv_quantity` AS `tbl_merchant_tv_quantity`,coalesce((select (((((`c`.`tbl_merchant_basic_subs` * 75) + (`c`.`tbl_merchant_standard_subs` * 150)) + (`c`.`tbl_merchant_deluxe_subs` * 200)) * (`d`.`tbl_commission_rates_subs` / 100)) + ((((`c`.`tbl_merchant_dongles_quantity` + `c`.`tbl_merchant_tablet_quantity`) + `c`.`tbl_merchant_tv_quantity`) * 40) * (`d`.`tbl_commission_rates_devices` / 100))) from ((`dbuser`.`tbl_merchant` `c` join `dbcommission`.`tbl_commission_rates` `d`) join `dbuser`.`tbl_user` `e`) where ((`c`.`tbl_user_reseller_id` = `d`.`tbl_user_id`) and (`c`.`tbl_user_id` = `a`.`tbl_user_id`) and (`c`.`tbl_user_id` = `e`.`tbl_user_id`) and (month(`e`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)))),'0.00') AS `tbl_commission_ammount` from ((`dbuser`.`tbl_user` `a` left join `dbuser`.`tbl_merchant` `c` on((`a`.`tbl_user_id` = `c`.`tbl_user_id`))) left join `dbcommission`.`tbl_commission` `b` on((`c`.`tbl_user_reseller_id` = `b`.`tbl_commission_agent_nmcId`))) where (`c`.`tbl_user_reseller_id` and (`a`.`tbl_user_entity` = 20) and (`a`.`tbl_user_class` = '2C0') and (month(`a`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`))) order by `a`.`tbl_user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_agent_list`
--

/*!50001 DROP VIEW IF EXISTS `vw_agent_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Administrador`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_agent_list` AS select distinct `b`.`tbl_commission_id` AS `tbl_commission_id`,`a`.`tbl_user_id` AS `tbl_user_id`,`a`.`tbl_user_parentId` AS `tbl_user_parentId`,`a`.`tbl_user_first` AS `tbl_user_first`,`a`.`tbl_user_last` AS `tbl_user_last`,`a`.`tbl_agent_type_id` AS `tbl_agent_type_id`,`a`.`tbl_userstatus_id` AS `tbl_userstatus_id`,`a`.`tbl_user_dateAdded` AS `tbl_user_dateAdded`,(select count(`c`.`tbl_user_reseller_id`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`)))) AS `tbl_merchant_qty`,(select count(`c`.`tbl_user_reseller_id`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`)) and (`d`.`tbl_userstatus_id` = 34))) AS `tbl_merchant_cancelled_qty`,coalesce((select sum(`c`.`tbl_merchant_basic_subs`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`)))),0) AS `tbl_merchant_basic_subs`,coalesce(if(isnull((select sum(`c`.`tbl_merchant_standard_subs`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`))))),(select sum(`c`.`tbl_billsubscription_quantity`) from ((`dbtransaction`.`tbl_billsubscription` `c` left join `dbtransaction`.`tbl_bill` `d` on((`c`.`tbl_bill_id` = `d`.`tbl_bill_id`))) left join `dbuser`.`tbl_merchant` `e` on((`d`.`tbl_bill_merchant_nmcId` = `e`.`tbl_user_id`))) where ((`c`.`tbl_subscription_id` = 15) and (`e`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_bill_date`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_bill_date`) = year(`b`.`tbl_commission_date`)))),(select sum(`c`.`tbl_merchant_standard_subs`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`))))),0) AS `tbl_merchant_standard_subs`,coalesce(if(isnull((select sum(`c`.`tbl_merchant_deluxe_subs`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`))))),(select sum(`c`.`tbl_billsubscription_quantity`) from ((`dbtransaction`.`tbl_billsubscription` `c` left join `dbtransaction`.`tbl_bill` `d` on((`c`.`tbl_bill_id` = `d`.`tbl_bill_id`))) left join `dbuser`.`tbl_merchant` `e` on((`d`.`tbl_bill_merchant_nmcId` = `e`.`tbl_user_id`))) where ((`c`.`tbl_subscription_id` = 16) and (`e`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_bill_date`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_bill_date`) = year(`b`.`tbl_commission_date`)))),(select sum(`c`.`tbl_merchant_deluxe_subs`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`))))),0) AS `tbl_merchant_deluxe_subs`,coalesce((select sum(`c`.`tbl_merchant_dongles_quantity`) from (`dbuser`.`tbl_merchant` `c` left join `dbuser`.`tbl_user` `d` on((`c`.`tbl_user_id` = `d`.`tbl_user_id`))) where ((`c`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_user_dateAdded`) = year(`b`.`tbl_commission_date`)))),0) AS `tbl_merchant_dongles_quantity`,`b`.`tbl_commission_date` AS `tbl_commission_date`,`b`.`tbl_commission_status_id` AS `tbl_commission_status_id`,`b`.`tbl_commission_refNumber` AS `tbl_commission_refNumber`,coalesce(if(isnull((select ((((((sum(`c`.`tbl_merchant_basic_subs`) * 375) + (sum(`c`.`tbl_merchant_standard_subs`) * 2010)) + (sum(`c`.`tbl_merchant_deluxe_subs`) * 3600)) * (`d`.`tbl_commission_rates_subs` / 100)) + (`d`.`tbl_commission_rates_signing` * count(`c`.`tbl_user_reseller_id`))) + ((((sum(`c`.`tbl_merchant_dongles_quantity`) + sum(`c`.`tbl_merchant_tablet_quantity`)) + sum(`c`.`tbl_merchant_tv_quantity`)) * 40) * (`d`.`tbl_commission_rates_devices` / 100))) from ((`dbuser`.`tbl_merchant` `c` join `dbcommission`.`tbl_commission_rates` `d`) join `dbuser`.`tbl_user` `e`) where ((`c`.`tbl_user_reseller_id` = `d`.`tbl_user_id`) and (`d`.`tbl_user_id` = `a`.`tbl_user_id`) and (`c`.`tbl_user_id` = `e`.`tbl_user_id`) and (month(`e`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`))))),(select ((((select sum(`c`.`tbl_billsubscription_quantity`) from ((`dbtransaction`.`tbl_billsubscription` `c` left join `dbtransaction`.`tbl_bill` `d` on((`c`.`tbl_bill_id` = `d`.`tbl_bill_id`))) left join `dbuser`.`tbl_merchant` `e` on((`d`.`tbl_bill_merchant_nmcId` = `e`.`tbl_user_id`))) where ((`c`.`tbl_subscription_id` = 15) and (`e`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_bill_date`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_bill_date`) = year(`b`.`tbl_commission_date`)))) * 150) + ((select sum(`c`.`tbl_billsubscription_quantity`) from ((`dbtransaction`.`tbl_billsubscription` `c` left join `dbtransaction`.`tbl_bill` `d` on((`c`.`tbl_bill_id` = `d`.`tbl_bill_id`))) left join `dbuser`.`tbl_merchant` `e` on((`d`.`tbl_bill_merchant_nmcId` = `e`.`tbl_user_id`))) where ((`c`.`tbl_subscription_id` = 16) and (`e`.`tbl_user_reseller_id` = `a`.`tbl_user_id`) and (month(`d`.`tbl_bill_date`) = month(`b`.`tbl_commission_date`)) and (year(`d`.`tbl_bill_date`) = year(`b`.`tbl_commission_date`)))) * 200)) * (`d`.`tbl_commission_rates_subs` / 100)) from `dbcommission`.`tbl_commission_rates` `d` where (`d`.`tbl_user_id` = `a`.`tbl_user_id`)),(select ((((((sum(`c`.`tbl_merchant_basic_subs`) * 375) + (sum(`c`.`tbl_merchant_standard_subs`) * 335)) + (sum(`c`.`tbl_merchant_deluxe_subs`) * 300)) * (`d`.`tbl_commission_rates_subs` / 100)) + (`d`.`tbl_commission_rates_signing` * count(`c`.`tbl_user_reseller_id`))) + ((((sum(`c`.`tbl_merchant_dongles_quantity`) + sum(`c`.`tbl_merchant_tablet_quantity`)) + sum(`c`.`tbl_merchant_tv_quantity`)) * 40) * (`d`.`tbl_commission_rates_devices` / 100))) from ((`dbuser`.`tbl_merchant` `c` join `dbcommission`.`tbl_commission_rates` `d`) join `dbuser`.`tbl_user` `e`) where ((`c`.`tbl_user_reseller_id` = `d`.`tbl_user_id`) and (`d`.`tbl_user_id` = `a`.`tbl_user_id`) and (`c`.`tbl_user_id` = `e`.`tbl_user_id`) and (month(`e`.`tbl_user_dateAdded`) = month(`b`.`tbl_commission_date`))))),'0.00') AS `tbl_commission_ammount` from (`dbuser`.`tbl_user` `a` left join `dbcommission`.`tbl_commission` `b` on((`a`.`tbl_user_id` = `b`.`tbl_commission_agent_nmcId`))) where ((`a`.`tbl_user_entity` in (30,60)) and (`b`.`tbl_commission_date` is not null)) order by `a`.`tbl_user_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'dbcommission'
--
/*!50003 DROP FUNCTION IF EXISTS `GetUserByCommission` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmc`@`localhost` FUNCTION `GetUserByCommission`(commissionId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET JSON = ( 
SELECT GROUP_CONCAT(
   CONCAT('{"53":"',COALESCE(dbuser.GetNMCId(C.tbl_user_id),''),'"'),
   CONCAT(',"114.70":"',COALESCE(hex(C.tbl_user_companyName),''),'"'),
   CONCAT(',"114.138":"',COALESCE(C.tbl_user_dateAdded,''),'"}') 
   )
   from dbcommission.tbl_commission as A
   left join dbuser.tbl_merchant as B on A.tbl_commission_agent_nmcId = B.tbl_user_reseller_id
   left join dbuser.tbl_user as C on B.tbl_user_id = C.tbl_user_id
   where A.tbl_commission_id = commissionId	
   and YEAR(A.tbl_commission_date) = YEAR(C.tbl_user_dateAdded) 
   and MONTH(A.tbl_commission_date) = MONTH(C.tbl_user_dateAdded) 
);

IF JSON is NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddCommissionAgentPaymentPDF030401065` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Administrador`@`%` PROCEDURE `AddCommissionAgentPaymentPDF030401065`(IN MSG_IN LONGTEXT)
BEGIN
	  
-- -------------------------	
-- Declare Data Elements --
-- -------------------------

	DECLARE UNHEXPARAM LONGTEXT DEFAULT NULL;
    DECLARE de_115_092 VARCHAR(255) DEFAULT NULL;
    DECLARE de_115_094  VARCHAR(100) DEFAULT NULL;
	DECLARE de_127_026 INT(11) DEFAULT NULL;
	DECLARE COMMISSION_IDAUX INT(11) DEFAULT NULL;
	DECLARE de_127_060 TEXT DEFAULT NULL; 
    DECLARE de_120_157 TEXT DEFAULT NULL; 
	DECLARE BILL_ID INT(11) DEFAULT NULL;
	
-- --------------------
-- Declare auxiliary --
-- --------------------

	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;
	
-- ---------------
-- Validations --
-- ---------------
	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
	
	-- TABLE  TEMPORARY OF IN    --
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA LONGTEXT NULL);
	
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
	
    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	
	
-- -----------------	
-- Set variables --
-- -----------------
	
    SET de_115_092 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '115.92');
    SET de_127_060 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '127.60');
    SET de_115_094 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '115.94');
	SET de_127_026 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '127.26');
    SET de_120_157 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.157');
    SET de_120_157 = (SELECT CONVERT(unhex(de_120_157) USING UTF8));
	-- SET de_127_060 = CONCAT(de_127_060,',');
	SET de_127_060 = REPLACE(de_127_060,',','|');
    
-- ---------------		
-- Query of DB  --
-- ---------------

	insert into dbcommission.tbl_commission_agent_file set 
	tbl_agent_id = de_127_026,
	tbl_commission_agent_file_date = now(),
    tbl_commission_agent_file_name = de_115_092,
    tbl_commission_agent_file_additional_ifo = de_120_157,
    tbl_commission_agent_payperiod = de_115_094;
	
	SET COMMISSION_IDAUX = (select last_insert_id());
	
	
		while (LENGTH(de_127_060)>0) DO
		
			SET BILL_ID = TRIM((SELECT SUBSTR(de_127_060,1,LOCATE('|',de_127_060)-1)));
			SET de_127_060 = (SELECT SUBSTR(de_127_060,LOCATE('|',de_127_060)+1));
			
			insert into tbl_commission_agent_file_bill set
			tbl_commission_agent_file_id = COMMISSION_IDAUX,
			tbl_bill_id  = BILL_ID;
			

		end while;
	

	insert into TBL_MESSAGE (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');

	set RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	set RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	select GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;

	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditCommissionRatesByAdmin020400439` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `EditCommissionRatesByAdmin020400439`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE de_114_138 DATE DEFAULT NULL; -- 114.138
    DECLARE de_114_139 DATE DEFAULT NULL; -- 114.139
    DECLARE de_118_002 DATE DEFAULT NULL; -- 118.2 
    DECLARE de_118_003 DATE DEFAULT NULL; -- 118.3 

	DECLARE de_118_011 INT(11) DEFAULT NULL; -- 118.11 Accounts Goal
	DECLARE de_118_012 INT(11) DEFAULT NULL; -- 118.12 Bonus Goal
	DECLARE de_117_003 DECIMAL(15,2) DEFAULT NULL; -- 117.3 Subscriptions Rate
	DECLARE de_117_004 DECIMAL(15,2) DEFAULT NULL; -- 117.4 Devices Rate
	DECLARE de_117_005 DECIMAL(15,2) DEFAULT NULL; -- 117.5 Signing Rate    
	DECLARE de_117_006 DECIMAL(15,2) DEFAULT NULL; -- 117.6 over Goal Bonus
	DECLARE de_117_007 DECIMAL(15,2) DEFAULT NULL; -- 117.7 Goal Met
    DECLARE de_117_008 DECIMAL(15,2) DEFAULT NULL; -- 117.8 Tier 1
    DECLARE de_117_009 DECIMAL(15,2) DEFAULT NULL; -- 117.9 Tier 2
	DECLARE de_118_010 DECIMAL(15,2) DEFAULT NULL; -- 118.10 Tier 3
	

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

	SET de_114_138 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.138');
    SET de_114_139 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.139');
    SET de_118_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.2');
    SET de_118_003 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.3');

	SET de_118_011 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.11');
	SET de_118_012 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.12');	
    SET de_117_003 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.3');
	SET de_117_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.4');
	SET de_117_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.5');	
    SET de_117_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.6');
	SET de_117_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.7');
	SET de_117_008 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.8');
	SET de_117_009 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.9');
    SET de_118_010 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.10');
	
    
	update dbcommission.tbl_commission_rates  set     
	tbl_commission_rates_payPeriod_start = de_114_138,
    tbl_commission_rates_payPeriod_end = de_114_139,
    tbl_commission_rates_bonuses_start = de_118_002,
    tbl_commission_rates_bonuses_end = de_118_003,
	tbl_commission_rates_payPeriod_accountsGoal = de_118_011,
	tbl_commission_rates_payPeriod_bonusGoal = de_118_012,	
    tbl_commission_rates_subs = de_117_003,
	tbl_commission_rates_devices = de_117_004,
	tbl_commission_rates_signing = de_117_005,	
    tbl_commission_rates_overGoalBonus = de_117_006,
	tbl_commission_rates_goalMet = de_117_007,
	tbl_commission_rates_tier1 = de_117_008,
	tbl_commission_rates_tier2 = de_117_009,
	tbl_commission_rates_tier3 = de_118_010	
    where tbl_commission_rates_id = 1;

	
    
	insert into TBL_MESSAGE (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');
	
	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);
		
	SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;

	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditCommissionRatesByAgentType020400438` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `EditCommissionRatesByAgentType020400438`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE de_117_026 INT(11) DEFAULT NULL; -- 117.26 Agent Type

	DECLARE de_114_138 DATE DEFAULT NULL; -- 114.138
    DECLARE de_114_139 DATE DEFAULT NULL; -- 114.139
    DECLARE de_118_002 DATE DEFAULT NULL; -- 118.2 
    DECLARE de_118_003 DATE DEFAULT NULL; -- 118.3 

	DECLARE de_118_011 INT(11) DEFAULT NULL; -- 118.11 Accounts Goal
	DECLARE de_118_012 INT(11) DEFAULT NULL; -- 118.12 Bonus Goal
	DECLARE de_117_003 DECIMAL(15,2) DEFAULT NULL; -- 117.3 Subscriptions Rate
	DECLARE de_117_004 DECIMAL(15,2) DEFAULT NULL; -- 117.4 Devices Rate
	DECLARE de_117_005 DECIMAL(15,2) DEFAULT NULL; -- 117.5 Signing Rate    
	DECLARE de_117_006 DECIMAL(15,2) DEFAULT NULL; -- 117.6 over Goal Bonus
	DECLARE de_117_007 DECIMAL(15,2) DEFAULT NULL; -- 117.7 Goal Met
    DECLARE de_117_008 DECIMAL(15,2) DEFAULT NULL; -- 117.8 Tier 1
    DECLARE de_117_009 DECIMAL(15,2) DEFAULT NULL; -- 117.9 Tier 2
	DECLARE de_118_010 DECIMAL(15,2) DEFAULT NULL; -- 118.10 Tier 3
	
    
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

	SET de_117_026 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.26');
	
    SET de_114_138 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.138');
    SET de_114_139 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.139');
    SET de_118_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.2');
    SET de_118_003 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.3');
    
	SET de_118_011 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.11');
	SET de_118_012 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.12');	
    SET de_117_003 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.3');
	SET de_117_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.4');
	SET de_117_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.5');	
    SET de_117_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.6');
	SET de_117_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.7');
	SET de_117_008 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.8');
	SET de_117_009 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.9');
    SET de_118_010 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.10');
	
    
	update dbcommission.tbl_commission_rates  set 
    tbl_commission_rates_payPeriod_start = de_114_138,
    tbl_commission_rates_payPeriod_end = de_114_139,
    tbl_commission_rates_bonuses_start = de_118_002,
    tbl_commission_rates_bonuses_end = de_118_003,
	tbl_commission_rates_payPeriod_accountsGoal = de_118_011,
	tbl_commission_rates_payPeriod_bonusGoal = de_118_012,	
    tbl_commission_rates_subs = de_117_003,
	tbl_commission_rates_devices = de_117_004,
	tbl_commission_rates_signing = de_117_005,	
    tbl_commission_rates_overGoalBonus = de_117_006,
	tbl_commission_rates_goalMet = de_117_007,
	tbl_commission_rates_tier1 = de_117_008,
	tbl_commission_rates_tier2 = de_117_009,
	tbl_commission_rates_tier3 = de_118_010	
    where tbl_agent_type_id = de_117_026;

	
    
	insert into TBL_MESSAGE (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');
	
	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);
		
	SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;

	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditCommissionRatesByUserId020400434` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditCommissionRatesByUserId020400434`(IN MSG_IN VARCHAR(20000))
BEGIN
  
    DECLARE de_053 VARCHAR(20) DEFAULT NULL; -- 53 User Id
		
	DECLARE de_114_138 DATE DEFAULT NULL; -- 114.138 PayPeriod Start
    DECLARE de_114_139 DATE DEFAULT NULL; -- 114.139 PayPeriod End
    DECLARE de_118_002 DATE DEFAULT NULL; -- 118.2 Bonuses Start
    DECLARE de_118_003 DATE DEFAULT NULL; -- 118.3 Bonuses End
	DECLARE de_118_011 INT(11) DEFAULT NULL; -- 118.11 Accounts Goal
	DECLARE de_118_012 INT(11) DEFAULT NULL; -- 118.12 Bonus Goal
	DECLARE de_117_003 DECIMAL(15,2) DEFAULT NULL; -- 117.3 Subscriptions Rate
	DECLARE de_117_004 DECIMAL(15,2) DEFAULT NULL; -- 117.4 Devices Rate
	DECLARE de_117_005 DECIMAL(15,2) DEFAULT NULL; -- 117.5 Signing Rate    
	DECLARE de_117_006 DECIMAL(15,2) DEFAULT NULL; -- 117.6 over Goal Bonus
	DECLARE de_117_007 DECIMAL(15,2) DEFAULT NULL; -- 117.7 Goal Met
    DECLARE de_117_008 DECIMAL(15,2) DEFAULT NULL; -- 117.8 Tier 1
    DECLARE de_117_009 DECIMAL(15,2) DEFAULT NULL; -- 117.9 Tier 2
	DECLARE de_118_010 DECIMAL(15,2) DEFAULT NULL; -- 118.10 Tier 3
	
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
	SET de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');	
    set de_053 = (select right(de_053,11));
    
	SET de_114_138 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.138');
    SET de_114_139 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.139');
    SET de_118_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.2');
    SET de_118_003 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.3');  
	SET de_118_011 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.11');
	SET de_118_012 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.12');	
    SET de_117_003 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.3');
	SET de_117_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.4');
	SET de_117_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.5');	
	SET de_117_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.6');
	SET de_117_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.7');
	SET de_117_008 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.8');
	SET de_117_009 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '117.9');
    SET de_118_010 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.10');
	
    if (select tbl_commission_rates_id from tbl_commission_rates where tbl_user_id = de_053 limit 1) is null then
    
		insert into dbcommission.tbl_commission_rates  set  
		tbl_user_id = de_053,
		tbl_commission_rates_payPeriod_start = de_114_138,
		tbl_commission_rates_payPeriod_end = de_114_139,
		tbl_commission_rates_bonuses_start = de_118_002,
		tbl_commission_rates_bonuses_end = de_118_003,
		tbl_commission_rates_payPeriod_accountsGoal = de_118_011,
		tbl_commission_rates_payPeriod_bonusGoal = de_118_012,	
		tbl_commission_rates_subs = de_117_003,
		tbl_commission_rates_devices = de_117_004,
		tbl_commission_rates_signing = de_117_005,	
		tbl_commission_rates_overGoalBonus = de_117_006,
		tbl_commission_rates_goalMet = de_117_007,
		tbl_commission_rates_tier1 = de_117_008,
		tbl_commission_rates_tier2 = de_117_009,
		tbl_commission_rates_tier3 = de_118_010;

	else 
    
		update dbcommission.tbl_commission_rates  set  
		tbl_commission_rates_payPeriod_start = de_114_138,
		tbl_commission_rates_payPeriod_end = de_114_139,
		tbl_commission_rates_bonuses_start = de_118_002,
		tbl_commission_rates_bonuses_end = de_118_003,
		tbl_commission_rates_payPeriod_accountsGoal = de_118_011,
		tbl_commission_rates_payPeriod_bonusGoal = de_118_012,	
		tbl_commission_rates_subs = de_117_003,
		tbl_commission_rates_devices = de_117_004,
		tbl_commission_rates_signing = de_117_005,	
		tbl_commission_rates_overGoalBonus = de_117_006,
		tbl_commission_rates_goalMet = de_117_007,
		tbl_commission_rates_tier1 = de_117_008,
		tbl_commission_rates_tier2 = de_117_009,
		tbl_commission_rates_tier3 = de_118_010
        where tbl_user_id = de_053;
    
    end if;
    
	insert into TBL_MESSAGE (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');
	
	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);
		
	SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;

	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCommissionRatesByUserId010400433` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Administrador`@`%` PROCEDURE `GetCommissionRatesByUserId010400433`(PARAM VARCHAR(4000))
BEGIN 

-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: GetCommissionRatesByUserId010400433
-- Method: 010400433
-- Version: 1.0
-- Last modified: 2019-10-21
-- --------------------------------------------------------

-- -------------------------	
-- Declare Data Elements  --
-- -------------------------

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_053	    VARCHAR(20) DEFAULT 0; 		   -- Agent id 
	DECLARE de_114_138	VARCHAR(10) DEFAULT 0; 		   -- Date
    DECLARE de_114_139	VARCHAR(10) DEFAULT 0; 		   -- Date

	DECLARE JSON TEXT;
    
-- --------------------
-- Declare auxiliary --
-- -------------------- 

	SET  group_concat_max_len = 1000000;

	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE1;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE1 (CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
    
    SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM PARAM));	
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE1 (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------	
-- Set variables  --
-- -----------------

	SET de_053 = (select DATA from TBL_MESSAGE1 where CODE = '53');
	set de_053 = (select right(de_053,11));
    
	SET de_114_138 = (select DATA from TBL_MESSAGE1 where CODE = '114.138');
	SET de_114_139 = (select DATA from TBL_MESSAGE1 where CODE = '114.139');

-- ---------------		
-- Query of DB  --
-- ---------------

if (select tbl_commission_rates_id 
		from dbcommission.tbl_commission_rates 
		where tbl_user_id = de_053 limit 1) is not null then

	if (select tbl_commission_rates_id 
		from dbcommission.tbl_commission_rates 
		where tbl_user_id = de_053 
		and tbl_commission_rates_payPeriod_start >= de_114_138 
		and tbl_commission_rates_payPeriod_end <= de_114_139 limit 1) is not null then

		SET JSON=(

			select GROUP_CONCAT(
				CONCAT('{"114.138":"', COALESCE(tbl_commission_rates_payPeriod_start,''),'"'),
				CONCAT(',"114.139":"', COALESCE(tbl_commission_rates_payPeriod_end,''),'"'), 
				CONCAT(',"118.2":"', COALESCE(tbl_commission_rates_bonuses_start,''),'"'), 
				CONCAT(',"118.3":"', COALESCE(tbl_commission_rates_bonuses_end,''),'"'), 
				CONCAT(',"118.11":"', COALESCE(tbl_commission_rates_payPeriod_accountsGoal,'10'),'"'), 
				CONCAT(',"118.12":"', COALESCE(tbl_commission_rates_payPeriod_bonusGoal,'8'),'"'), 
				CONCAT(',"117.3":"', COALESCE(tbl_commission_rates_subs,'15.00'),'"'), 
				CONCAT(',"117.4":"', COALESCE(tbl_commission_rates_devices,'15.00'),'"'), 
				CONCAT(',"117.5":"', COALESCE(tbl_commission_rates_signing,'40.00'),'"'), 
				CONCAT(',"117.6":"', COALESCE(tbl_commission_rates_overGoalBonus,'20.00'),'"'), 
				CONCAT(',"117.7":"', COALESCE(tbl_commission_rates_goalMet,'100.00'),'"'), 
				CONCAT(',"118.10":"', COALESCE(tbl_commission_rates_tier3,'75.00'),'"'), 
				CONCAT(',"117.9":"', COALESCE(tbl_commission_rates_tier2,'50.00'),'"'), 
				CONCAT(',"117.8":"', COALESCE(tbl_commission_rates_tier1,'25.00'),'"'),
				CONCAT(',"114.141":"', COALESCE((select count(C.tbl_user_reseller_id) from dbuser.tbl_merchant as C where C.tbl_user_reseller_id = de_053),0),'"'), 
				CONCAT(',"121.12":"', COALESCE((select sum(A.tbl_merchant_qty) from vw_agent_list as A where A.tbl_user_id = de_053),0),'"'), 
				CONCAT(',"121.16":"', COALESCE((select sum(A.tbl_merchant_cancelled_qty) from vw_agent_list as A where A.tbl_user_id = de_053),0),'"'), 
				CONCAT(',"117.18":"', COALESCE((select sum(A.tbl_merchant_dongles_quantity)  from vw_agent_list as A where A.tbl_user_id = de_053),0),'"}')
				
			) as JSON
			
			from dbcommission.tbl_commission_rates
			where tbl_user_id = de_053
			and tbl_commission_rates_payPeriod_start >= de_114_138 
			and tbl_commission_rates_payPeriod_end <= de_114_139
			
		);
	
    else
    
		SET JSON=(

			select GROUP_CONCAT(
				CONCAT('{"114.138":"', COALESCE(tbl_commission_rates_payPeriod_start,''),'"'),
				CONCAT(',"114.139":"', COALESCE(tbl_commission_rates_payPeriod_end,''),'"'), 
				CONCAT(',"118.2":"', COALESCE(tbl_commission_rates_bonuses_start,''),'"'), 
				CONCAT(',"118.3":"', COALESCE(tbl_commission_rates_bonuses_end,''),'"'), 
				CONCAT(',"118.11":"', COALESCE(tbl_commission_rates_payPeriod_accountsGoal,''),'"'), 
				CONCAT(',"118.12":"', COALESCE(tbl_commission_rates_payPeriod_bonusGoal,''),'"'), 
				CONCAT(',"117.3":"', COALESCE(tbl_commission_rates_subs,''),'"'), 
				CONCAT(',"117.4":"', COALESCE(tbl_commission_rates_devices,''),'"'), 
				CONCAT(',"117.5":"', COALESCE(tbl_commission_rates_signing,''),'"'), 
				CONCAT(',"117.6":"', COALESCE(tbl_commission_rates_overGoalBonus,''),'"'), 
				CONCAT(',"117.7":"', COALESCE(tbl_commission_rates_goalMet,''),'"'), 
				CONCAT(',"118.10":"', COALESCE(tbl_commission_rates_tier3,''),'"'), 
				CONCAT(',"117.9":"', COALESCE(tbl_commission_rates_tier2,''),'"'), 
				CONCAT(',"117.8":"', COALESCE(tbl_commission_rates_tier1,''),'"'), 
				CONCAT(',"114.141":"', COALESCE((select count(C.tbl_user_reseller_id) from dbuser.tbl_merchant as C where C.tbl_user_reseller_id = de_053),0),'"'), 
				CONCAT(',"121.12":"', COALESCE((select sum(A.tbl_merchant_qty) from vw_agent_list as A where A.tbl_user_id = de_053),0),'"'), 
				CONCAT(',"121.16":"', COALESCE((select sum(A.tbl_merchant_cancelled_qty) from vw_agent_list as A where A.tbl_user_id = de_053),0),'"'), 
				CONCAT(',"117.18":"', COALESCE((select sum(A.tbl_merchant_dongles_quantity)  from vw_agent_list as A where A.tbl_user_id = de_053),0),'"}')
				
			) as JSON
			
			from dbcommission.tbl_commission_rates
			where tbl_user_id = de_053
		);
    
	end if;
    
    
else

	SET JSON=(

		select GROUP_CONCAT(
			CONCAT('{"114.138":"', COALESCE(tbl_commission_rates_payPeriod_start,''),'"'),
			CONCAT(',"114.139":"', COALESCE(tbl_commission_rates_payPeriod_end,''),'"'), 
			CONCAT(',"118.2":"', COALESCE(tbl_commission_rates_bonuses_start,''),'"'), 
			CONCAT(',"118.3":"', COALESCE(tbl_commission_rates_bonuses_end,''),'"'), 
			CONCAT(',"118.11":"', COALESCE(tbl_commission_rates_payPeriod_accountsGoal,'10'),'"'), 
			CONCAT(',"118.12":"', COALESCE(tbl_commission_rates_payPeriod_bonusGoal,'8'),'"'), 
			CONCAT(',"117.3":"', COALESCE(tbl_commission_rates_subs,'15.00'),'"'), 
			CONCAT(',"117.4":"', COALESCE(tbl_commission_rates_devices,'15.00'),'"'), 
			CONCAT(',"117.5":"', COALESCE(tbl_commission_rates_signing,'40.00'),'"'), 
			CONCAT(',"117.6":"', COALESCE(tbl_commission_rates_overGoalBonus,'20.00'),'"'), 
			CONCAT(',"117.7":"', COALESCE(tbl_commission_rates_goalMet,'100.00'),'"'), 
			CONCAT(',"118.10":"', COALESCE(tbl_commission_rates_tier3,'75.00'),'"'), 
			CONCAT(',"117.9":"', COALESCE(tbl_commission_rates_tier2,'50.00'),'"'), 
			CONCAT(',"117.8":"', COALESCE(tbl_commission_rates_tier1,'25.00'),'"'), 
			CONCAT(',"114.141":"', COALESCE((select count(C.tbl_user_reseller_id) from dbuser.tbl_merchant as C where C.tbl_user_reseller_id = de_053),0),'"'), 
			CONCAT(',"121.12":"', COALESCE((select sum(A.tbl_merchant_qty) from vw_agent_list as A where A.tbl_user_id = de_053),0),'"'), 
			CONCAT(',"121.16":"', COALESCE((select sum(A.tbl_merchant_cancelled_qty) from vw_agent_list as A where A.tbl_user_id = de_053),0),'"'), 
			CONCAT(',"117.18":"', COALESCE((select sum(A.tbl_merchant_dongles_quantity)  from vw_agent_list as A where A.tbl_user_id = de_053),0),'"}')
			
		) as JSON
		
		from dbcommission.tbl_commission_rates
		where tbl_commission_rates_id = 5
	);

end if;



	
 
IF JSON is NULL THEN
	SET JSON = '{}';
END IF;

SELECT JSON;

	DROP TABLE TBL_MESSAGE1;

  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PayAgent030300443` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `PayAgent030300443`(IN MSG_IN VARCHAR(20000))
BEGIN
	
-- --------------------------------------------------------
-- Autor: Juan David Zapata 
-- Procedure: PayAgent030300443
-- Method: 030300443
-- Version: 1.0
-- Last modified: 2015-07-09
-- --------------------------------------------------------


-- -------------------------	
-- Declare Data Elements --
-- -------------------------


	DECLARE de_053 VARCHAR(20) DEFAULT NULL; 		-- 53 UserId	
	

-- --------------------
-- Declare auxiliary --
-- --------------------
	
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;	
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(70) DEFAULT NULL;	
	
	DECLARE EMAIL TEXT DEFAULT NULL;
	
-- ---------------
-- Validations --
-- ---------------
	
	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE1;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE1(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
	
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE1 (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	
-- -----------------	
-- Set variables  --
-- -----------------
	
	SET de_053 = (SELECT DATA FROM TBL_MESSAGE1 WHERE CODE = '53');
	SET de_053 =(select right(de_053,11));
	
-- ---------------		
-- Query of DB  --
-- ---------------
	
    SET EMAIL = (select tbl_user_email from dbuser.tbl_user where tbl_user_id = de_053);
    
    -- -----------------------
	-- Result of operation  --
	-- -----------------------	
	insert into TBL_MESSAGE1 (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');


	set RESULT_39 = (select DATA from TBL_MESSAGE1 where CODE = 39);
	set RESULT_44 = (select DATA from TBL_MESSAGE1 where CODE = 44);
	

	if RESULT_39 = '0000' then
    
		select GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"114.7":"',EMAIL,'"}')) as JSON;
		
	end if;


	DROP TABLE TBL_MESSAGE1;
 
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchAgent010400442` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `SearchAgent010400442`(PARAM VARCHAR(4000))
BEGIN 


-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: SearchAgent010400442
-- Method: 010400442
-- Version: 1.0
-- Last modified: 2015-04-08
-- --------------------------------------------------------
 
-- -------------------------	
-- Declare Data Elements  --
-- -------------------------

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE INI       BIGINT       DEFAULT 1;   -- START LIMIT
	DECLARE FIN       BIGINT	   DEFAULT 0;   -- END LIMIT

	DECLARE de_053 VARCHAR(20) DEFAULT NULL;        -- 53 User Id
	DECLARE de_114_127  VARCHAR(255) DEFAULT 0;		-- 114.127 Search
	
	DECLARE de_114_138 DATE DEFAULT 0;		-- 114.138 From date
	DECLARE de_114_139 DATE DEFAULT 0;		-- 114.138 To date
	
	DECLARE de_ORDER VARCHAR(45) DEFAULT NULL;		-- ORDER	
	DECLARE de_ORDER_VAL VARCHAR(45) DEFAULT NULL;		-- ORDER
	DECLARE de_ORDER_ASC VARCHAR(45) DEFAULT NULL;		-- ORDER
	
	DECLARE COUNTER_AUX INT(11) DEFAULT 0;		
	
	DECLARE SEARCH_RESULT TEXT DEFAULT NULL;
	DECLARE JSON TEXT;
-- --------------------
-- Declare auxiliary --
-- -------------------- 

	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE1;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE1 (CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
    
    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM PARAM));	
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE1 (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------	
-- Set variables  --
-- -----------------

	SET  group_concat_max_len = 1000000;

	SET INI = (select DATA from TBL_MESSAGE1 where CODE = '120.2' limit 1);
	SET FIN = (select DATA from TBL_MESSAGE1 where CODE = '120.3' limit 1);

	SET de_053 = (SELECT DATA FROM TBL_MESSAGE1 WHERE CODE = '53');
	SET de_053 = (select right(de_053,11));
	
	SET de_114_127 = (select DATA from TBL_MESSAGE1 where CODE = '114.127');
	
	SET de_114_138 = (select DATA from TBL_MESSAGE1 where CODE = '114.138');
	SET de_114_139 = (select DATA from TBL_MESSAGE1 where CODE = '114.139');
	
	SET de_ORDER = (select DATA from TBL_MESSAGE1 where CODE = 'order');
	
-- -------------		
-- Limits     --
-- -------------

	IF (length(INI) > 0) then 
		SET INI = (select DATA from TBL_MESSAGE1 where CODE = '120.2' limit 1);
	ELSE
		set INI = 0;
	END IF;
		
	IF (length(FIN) > 0) then 
		SET FIN = (select DATA from TBL_MESSAGE1 where CODE = '120.3' limit 1) - INI;
	ELSE
		set FIN = 999999999;
	END IF;

	
	SET de_ORDER_VAL = (SELECT SUBSTR(de_ORDER,1,LOCATE('-',de_ORDER)-1));
	SET de_ORDER_ASC = (SELECT SUBSTR(de_ORDER,LOCATE('-',de_ORDER)+1));



-- ---------------		
-- Query of DB  --
-- ---------------

	set COUNTER_AUX = ( select count(*) 
					from dbcommission.vw_agent_list 
					where tbl_user_id
                    and tbl_commission_date is not null
					and if (length(de_114_138)>0 , tbl_commission_date >= de_114_138, tbl_user_id)
					and if (length(de_114_139)>0 , tbl_commission_date <= de_114_139, tbl_user_id)
					and 
					(		UPPER(tbl_user_first) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_user_last) like CONCAT("%",UPPER(de_114_127),"%")                    
						or  UPPER(tbl_agent_type_id) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_userstatus_id) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_user_dateAdded) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_qty) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_cancelled_qty) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_basic_subs) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_standard_subs) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_deluxe_subs) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_dongles_quantity) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_tablet_quantity) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_merchant_tv_quantity) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_commission_date) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_commission_status_id) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_commission_refNumber) like CONCAT("%",UPPER(de_114_127),"%")
						or  UPPER(tbl_commission_ammount) like CONCAT("%",UPPER(de_114_127),"%")
					) 
				);

	if de_ORDER_ASC='ASC' then
    
    
		SET SEARCH_RESULT = (			
			select 
			GROUP_CONCAT(
				CONCAT('{"53":"', dbuser.GetNMCID(W.tbl_user_id),'"') , 
				CONCAT(',"114.3":"',coalesce(W.tbl_user_first,''),'"') , 
				CONCAT(',"114.5":"',coalesce(W.tbl_user_last,''),'"') , 
				CONCAT(',"117.26":"',coalesce(W.tbl_agent_type_id,''),'"') , 
				CONCAT(',"114.143":"',coalesce(W.tbl_userstatus_id,''),'"') , 
				CONCAT(',"114.138":"',coalesce(W.tbl_user_dateAdded,''),'"') , 
				CONCAT(',"121.12":"',coalesce(W.tbl_merchant_qty,''),'"') , 
				CONCAT(',"121.16":"',coalesce(W.tbl_merchant_cancelled_qty,''),'"') , 
				CONCAT(',"117.20":"',coalesce(W.tbl_merchant_basic_subs,''),'"') , 
				CONCAT(',"117.21":"',coalesce(W.tbl_merchant_standard_subs,''),'"') , 
				CONCAT(',"117.22":"',coalesce(W.tbl_merchant_deluxe_subs,''),'"') , 
				CONCAT(',"117.18":"',coalesce(W.tbl_merchant_dongles_quantity,''),'"') , 
				CONCAT(',"117.12":"',coalesce(W.tbl_merchant_tablet_quantity,''),'"') , 
				CONCAT(',"117.19":"',coalesce(W.tbl_merchant_tv_quantity,''),'"') , 
				CONCAT(',"114.139":"',coalesce(W.tbl_commission_date,''),'"') , 
				CONCAT(',"120.28":"',coalesce(W.tbl_commission_status_id,''),'"') , 
				CONCAT(',"122.126":"',coalesce(W.tbl_commission_refNumber,''),'"') , 
				CONCAT(',"120.22":"',coalesce(W.tbl_commission_ammount,'0.00'),'"}')
			)  as JSON
		
			from 
			
				(select tbl_user_id,
				tbl_user_first,
				tbl_user_last,
				tbl_agent_type_id,
				tbl_userstatus_id,
				tbl_user_dateAdded,
				tbl_merchant_qty,
				tbl_merchant_cancelled_qty,
				tbl_merchant_basic_subs,
				tbl_merchant_standard_subs,
				tbl_merchant_deluxe_subs,
				tbl_merchant_dongles_quantity,
				tbl_merchant_tablet_quantity,
				tbl_merchant_tv_quantity,
				tbl_commission_date,
				tbl_commission_status_id,
				tbl_commission_refNumber,
				tbl_commission_ammount
				from dbcommission.vw_agent_list 
				where tbl_user_id
                and tbl_commission_date is not null
				and if (length(de_114_138)>0 , tbl_commission_date >= de_114_138, tbl_user_id)
				and if (length(de_114_139)>0 , tbl_commission_date <= de_114_139, tbl_user_id)
				and 
				(		UPPER(tbl_user_first) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_user_last) like CONCAT("%",UPPER(de_114_127),"%")                    
                    or  UPPER(tbl_agent_type_id) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_userstatus_id) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_user_dateAdded) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_qty) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_cancelled_qty) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_basic_subs) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_standard_subs) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_deluxe_subs) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_dongles_quantity) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_tablet_quantity) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_tv_quantity) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_commission_date) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_commission_status_id) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_commission_refNumber) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_commission_ammount) like CONCAT("%",UPPER(de_114_127),"%")
				) 
				order by if (de_ORDER_VAL='114.3',tbl_user_first,
						 if (de_ORDER_VAL='114.5',tbl_user_last,
						 if (de_ORDER_VAL='121.12',tbl_merchant_qty,
						 if (de_ORDER_VAL='121.16',tbl_merchant_cancelled_qty,
						 if (de_ORDER_VAL='117.20',tbl_merchant_basic_subs,
						 if (de_ORDER_VAL='117.21',tbl_merchant_standard_subs,
						 if (de_ORDER_VAL='117.22',tbl_merchant_deluxe_subs,
						 if (de_ORDER_VAL='117.18',tbl_merchant_dongles_quantity,
						 if (de_ORDER_VAL='117.12',tbl_merchant_tablet_quantity,
						 if (de_ORDER_VAL='117.19',tbl_merchant_tv_quantity,
						 if (de_ORDER_VAL='122.126',tbl_commission_refNumber,
						 if (de_ORDER_VAL='120.22',tbl_commission_ammount,tbl_user_id
						 )))))))))))) ASC
				limit INI,FIN ) as W
				
			);

	else
    
		SET SEARCH_RESULT = (			
			select 
			GROUP_CONCAT(
				CONCAT('{"53":"', dbuser.GetNMCID(W.tbl_user_id),'"') , 
				CONCAT(',"114.3":"',coalesce(W.tbl_user_first,''),'"') , 
				CONCAT(',"114.5":"',coalesce(W.tbl_user_last,''),'"') , 
				CONCAT(',"117.26":"',coalesce(W.tbl_agent_type_id,''),'"') , 
				CONCAT(',"114.143":"',coalesce(W.tbl_userstatus_id,''),'"') , 
				CONCAT(',"114.138":"',coalesce(W.tbl_user_dateAdded,''),'"') , 
				CONCAT(',"121.12":"',coalesce(W.tbl_merchant_qty,''),'"') , 
				CONCAT(',"121.16":"',coalesce(W.tbl_merchant_cancelled_qty,''),'"') , 
				CONCAT(',"117.20":"',coalesce(W.tbl_merchant_basic_subs,''),'"') , 
				CONCAT(',"117.21":"',coalesce(W.tbl_merchant_standard_subs,''),'"') , 
				CONCAT(',"117.22":"',coalesce(W.tbl_merchant_deluxe_subs,''),'"') , 
				CONCAT(',"117.18":"',coalesce(W.tbl_merchant_dongles_quantity,''),'"') , 
				CONCAT(',"117.12":"',coalesce(W.tbl_merchant_tablet_quantity,''),'"') , 
				CONCAT(',"117.19":"',coalesce(W.tbl_merchant_tv_quantity,''),'"') , 
				CONCAT(',"114.139":"',coalesce(W.tbl_commission_date,''),'"') , 
				CONCAT(',"120.28":"',coalesce(W.tbl_commission_status_id,''),'"') , 
				CONCAT(',"122.126":"',coalesce(W.tbl_commission_refNumber,''),'"') , 
				CONCAT(',"120.22":"',coalesce(W.tbl_commission_ammount,'0.00'),'"}')
			)  as JSON
		
			from 
			
				(select tbl_user_id,
				tbl_user_first,
				tbl_user_last,
				tbl_agent_type_id,
				tbl_userstatus_id,
				tbl_user_dateAdded,
				tbl_merchant_qty,
				tbl_merchant_cancelled_qty,
				tbl_merchant_basic_subs,
				tbl_merchant_standard_subs,
				tbl_merchant_deluxe_subs,
				tbl_merchant_dongles_quantity,
				tbl_merchant_tablet_quantity,
				tbl_merchant_tv_quantity,
				tbl_commission_date,
				tbl_commission_status_id,
				tbl_commission_refNumber,
				tbl_commission_ammount
				from dbcommission.vw_agent_list 
				where tbl_user_id
                and tbl_commission_date is not null
				and if (length(de_114_138)>0 , tbl_commission_date >= de_114_138, tbl_user_id)
				and if (length(de_114_139)>0 , tbl_commission_date <= de_114_139, tbl_user_id)
				and 
				(		UPPER(tbl_user_first) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_user_last) like CONCAT("%",UPPER(de_114_127),"%")                    
                    or  UPPER(tbl_agent_type_id) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_userstatus_id) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_user_dateAdded) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_qty) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_cancelled_qty) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_basic_subs) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_standard_subs) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_deluxe_subs) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_dongles_quantity) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_tablet_quantity) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_merchant_tv_quantity) like CONCAT("%",UPPER(de_114_127),"%")                    
					or  UPPER(tbl_commission_date) like CONCAT("%",UPPER(de_114_127),"%")
                    or  UPPER(tbl_commission_status_id) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_commission_refNumber) like CONCAT("%",UPPER(de_114_127),"%")
					or  UPPER(tbl_commission_ammount) like CONCAT("%",UPPER(de_114_127),"%")
				) 
				order by if (de_ORDER_VAL='114.3',tbl_user_first,
						 if (de_ORDER_VAL='114.5',tbl_user_last,
						 if (de_ORDER_VAL='121.12',tbl_merchant_qty,
						 if (de_ORDER_VAL='121.16',tbl_merchant_cancelled_qty,
						 if (de_ORDER_VAL='117.20',tbl_merchant_basic_subs,
						 if (de_ORDER_VAL='117.21',tbl_merchant_standard_subs,
						 if (de_ORDER_VAL='117.22',tbl_merchant_deluxe_subs,
						 if (de_ORDER_VAL='117.18',tbl_merchant_dongles_quantity,
						 if (de_ORDER_VAL='117.12',tbl_merchant_tablet_quantity,
						 if (de_ORDER_VAL='117.19',tbl_merchant_tv_quantity,
						 if (de_ORDER_VAL='122.126',tbl_commission_refNumber,
						 if (de_ORDER_VAL='120.22',tbl_commission_ammount,tbl_user_id
						 )))))))))))) DESC
				limit INI,FIN ) as W
				
			);
    
    end if;

	SET JSON = (select GROUP_CONCAT(
					CONCAT('{"127.41":"',COUNTER_AUX,'"}'),
					CONCAT(',',SEARCH_RESULT,''))
	);	

	SELECT JSON;
	
	DROP TABLE TBL_MESSAGE1;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:34:29
