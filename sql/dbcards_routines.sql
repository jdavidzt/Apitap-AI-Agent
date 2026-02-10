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
-- Dumping routines for database 'dbcards'
--
/*!50003 DROP FUNCTION IF EXISTS `GetCategoryJSONLevel0` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCategoryJSONLevel0`(parentId int, languageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000; 
SET JSON = (
SELECT GROUP_CONCAT(    
			CONCAT('{"122.18":"',C.tbl_category_id,
				  '","120.45":"',D.tbl_categorydescription_name,
                  '","120.44":"',C.tbl_category_level,
                  '","122.183":"',C.tbl_category_active,
					'","300.67":{"47.42":"',C.tbl_category_image,
                     '"},"300.80":{"122.18":"',C.tbl_category_parentid,
					 '"},"300.27":[', if ((select count(*) from  tbl_category 
									where tbl_category_parentid = C.tbl_category_id) > 0, GetCategoryJSONLevel1(C.tbl_category_id,languageId),''),
					']}'))  

FROM tbl_category C,
     tbl_categorydescription D
where C.tbl_category_id = D.tbl_category_id
and C.tbl_category_active = 1
and C.tbl_category_parentid = parentId
and D.tbl_language_id = languageId);

IF JSON is NULL THEN
	SET JSON = "";
END IF;


RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetCategoryJSONLevel1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCategoryJSONLevel1`(parentId int, languageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000; 
SET JSON = (
SELECT GROUP_CONCAT(    
			CONCAT('{"122.18":"',C.tbl_category_id,
				  '","120.45":"',D.tbl_categorydescription_name,
                  '","120.44":"',C.tbl_category_level,
                  '","122.183":"',C.tbl_category_active,
					'","300.67":{"47.42":"',C.tbl_category_image,
                     '"},"300.80":{"122.18":"',C.tbl_category_parentid,
					 '"},"300.27":[', if ((select count(*) from  tbl_category 
									where tbl_category_parentid = C.tbl_category_id) > 0, GetCategoryJSONLevel2(C.tbl_category_id,languageId),''),
					']}'))  

FROM tbl_category C,
     tbl_categorydescription D
where C.tbl_category_id = D.tbl_category_id
and C.tbl_category_active = 1
and C.tbl_category_parentid = parentId
and D.tbl_language_id = languageId);

IF JSON is NULL THEN
	SET JSON = "";
END IF;


RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetCategoryJSONLevel2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCategoryJSONLevel2`(parentId int, languageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = (
SELECT GROUP_CONCAT(     
			CONCAT('{"122.18":"',C.tbl_category_id,
				  '","120.45":"',D.tbl_categorydescription_name,
                  '","120.44":"',C.tbl_category_level,
                  '","122.183":"',C.tbl_category_active,
					'","300.67":{"47.42":"',C.tbl_category_image,
                     '"},"300.80":{"122.18":"',C.tbl_category_parentid,
					'"},"300.27":[', '',if ((select count(*) from  tbl_category 
														where tbl_category_id = C.tbl_category_parentid) > 0,GetCategoryJSONLevel3(C.tbl_category_id,languageId),''),
					']}'))  

FROM tbl_category C,
     tbl_categorydescription D
where C.tbl_category_id = D.tbl_category_id
and C.tbl_category_active = 1
and C.tbl_category_parentid = parentId
and D.tbl_language_id = languageId);

IF JSON is NULL THEN
	SET JSON = "";
END IF;


RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetCategoryJSONLevel3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCategoryJSONLevel3`(parentId int, languageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = (
SELECT GROUP_CONCAT(     
			CONCAT('{"122.18":"',C.tbl_category_id,
				  '","120.45":"',D.tbl_categorydescription_name,
                  '","120.44":"',C.tbl_category_level,
				  '","300.67":{"47.42":"',C.tbl_category_image,
                  '"},"122.183":"',C.tbl_category_active,
                     '","300.80":{"122.18":"',C.tbl_category_parentid,
					'"},"300.27":[', if ((select count(*) from  tbl_category 
														where tbl_category_id = C.tbl_category_parentid) > 0, GetCategoryJSONLevel4(C.tbl_category_id,languageId),''),
					']}'))  

FROM tbl_category C,
     tbl_categorydescription D
where C.tbl_category_id = D.tbl_category_id
and C.tbl_category_active = 1
and C.tbl_category_parentid = parentId
and D.tbl_language_id = languageId);

IF JSON is NULL THEN
	SET JSON = "";
END IF;


RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetCategoryJSONLevel4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCategoryJSONLevel4`(parentId int, languageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 
SELECT GROUP_CONCAT(    
			CONCAT('{"122.18":"',C.tbl_category_id,
				  '","120.45":"',D.tbl_categorydescription_name,
                  '","120.44":"',C.tbl_category_level,
				  '","300.67":{"47.42":"',C.tbl_category_image,
                  '"},"122.183":"',C.tbl_category_active,
                     '","300.80":{"122.18":"',C.tbl_category_parentid,'"}}'))  

FROM tbl_category C,
     tbl_categorydescription D
where C.tbl_category_id = D.tbl_category_id
and C.tbl_category_active = 1
and C.tbl_category_parentid = parentId
and D.tbl_language_id = languageId);

IF JSON is NULL THEN
	SET JSON = "";
END IF;


RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetChoicesFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetChoicesFunction`(OptionId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 



SELECT GROUP_CONCAT(           
					CONCAT('{"121.179":"', PA.tbl_productoption_id,'"'),
					CONCAT(',"122.112":"', PV.tbl_productoptionvalue_id,'"'),
					CONCAT(',"127.16":"',PV.tbl_productoptionvalue_name,'"'),			
					CONCAT(',"120.84":"', PA.tbl_productattribute_optionValuePrice,'"'),
					CONCAT(',"300.24":[',GetInventoryFunction(PA.tbl_productattribute_id),
					']}'))
					
from tbl_productoptionvalue PV, tbl_productattribute PA
where PV.tbl_productoptionvalue_id = PA.tbl_productoptionvalue_id
AND   PA.tbl_productoption_id=OptionId);



IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetComponentByLayout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetComponentByLayout`(LayoutId int) RETURNS mediumtext CHARSET utf8
BEGIN

	DECLARE ENTITYAUX VARCHAR(4);
	DECLARE JSON TEXT;
	SET  group_concat_max_len = 10000000;

	SET JSON = ( 

	SELECT GROUP_CONCAT(
	CONCAT('{"123.18":"',tbl_component_id,'"'),
    CONCAT(',"123.19":"', COALESCE(tbl_component_name,''),'"'),
    CONCAT(',"114.132":"',COALESCE(tbl_component_key,''),'"'),
	CONCAT(',"123.14":"', COALESCE(tbl_component_x,''),'"'),
	CONCAT(',"123.15":"', COALESCE(tbl_component_y,''),'"'),
	CONCAT(',"123.16":"', COALESCE(tbl_component_height,''),'"'),				
	CONCAT(',"123.17":"', COALESCE(tbl_component_width,''),'"'),
    CONCAT(',"114.141":"', COALESCE(tbl_component_interval,''),'"'),
	CONCAT(',"PC":[',dbitems.GetPlaylistProductByComponent(tbl_component_id),']'),
	CONCAT(',"IC":[',dbitems.GetPlaylistImageByComponent(tbl_component_id),']'),
	CONCAT(',"VC":[',dbitems.GetPlaylistVideoByComponent(tbl_component_id),']}')
	)
    from dbitems.tbl_package_layout_component 
	where tbl_layout_id  = LayoutId
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
/*!50003 DROP FUNCTION IF EXISTS `GetInventoryFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetInventoryFunction`(AtributeId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 



SELECT GROUP_CONCAT(           
					CONCAT('{"122.110":"', I.tbl_inventoryId,'"'),			
					CONCAT(',"114.132":"', I.tbl_inventory_quantity,'"}'))			
				
from tbl_inventoryproductattribute PIA, tbl_inventory I
where PIA.tbl_inventoryproductattribute_inventoryId = I.tbl_inventoryId
AND   PIA.tbl_inventoryproductattribute_productAttributeId=AtributeId);



IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetLastActivityByCard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetLastActivityByCard`(carduserId int) RETURNS text CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE USERTYPE_AUX INT(11) DEFAULT 0;
DECLARE CARD_TOCKEN VARCHAR(45) DEFAULT NULL;
DECLARE LAST_ACTIVITY VARCHAR(45) DEFAULT NULL;

SET  group_concat_max_len = 10000000;


set USERTYPE_AUX = (select substring(B.tbl_user_entity,1,1) from dbcards.tbl_carduser as A, dbuser.tbl_user as B where A.tbl_carduser_id = carduserId and A.tbl_user_nmcId = B.tbl_user_id);
set CARD_TOCKEN = (select tbl_card_tocken from tbl_carduser where tbl_carduser_id = carduserId);

	if USERTYPE_AUX = 1 then
			
			set LAST_ACTIVITY = (select tbl_transaction_creationDate from dbtransaction.tbl_transaction where tbl_transaction_cardTocken = CARD_TOCKEN order by tbl_transaction_id desc limit 1);

			SET JSON = (select CONCAT('"',COALESCE(LAST_ACTIVITY,''),'"')

						);
	 else
			
			set LAST_ACTIVITY = (select tbl_billtransaction_date from dbtransaction.tbl_billtransaction where tbl_cardTocken = CARD_TOCKEN order by tbl_billtransaction_id desc limit 1);
			
			SET JSON = (select CONCAT('"',COALESCE(LAST_ACTIVITY,''),'"')

						);
	end if;

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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertiser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertiser`(AdvertiserId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE ENTITY_AUX INTEGER(11) default  0;
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
 
SET ENTITY_AUX = (SELECT tbl_user_entity FROM dbuser.tbl_user WHERE tbl_user_id = AdvertiserId);



IF (select LEFT(ENTITY_AUX,1)) = '8' then


		SET JSON = ( 

		SELECT GROUP_CONCAT(
 
				CONCAT('"53":"',COALESCE(dbuser.GetNMCID((select right(tbl_usernmcid,11))),''),'"'),
				CONCAT(',"114.70":"',COALESCE((SELECT tbl_user_companyName FROM dbuser.tbl_user where tbl_user_id = AdvertiserId LIMIT 1),''),'"'),
				CONCAT(',"114.53":"',COALESCE(tbl_advertiser_contactname,''),'"'),
				CONCAT(',"114.7":"',COALESCE((SELECT tbl_user_email FROM dbuser.tbl_user where tbl_user_id = AdvertiserId LIMIT 1),''),'"'),
				CONCAT(',"121.77":"',COALESCE(tbl_advertiser_logo,''),'"'),
				CONCAT(',"PH":[',COALESCE(dbuser.getNMCPhoneByUser(tbl_usernmcid),''),']') )
			   from  dbuser.tbl_advertiser
					
				where tbl_usernmcid  = AdvertiserId
				);
ELSE
		SET JSON = '';



END IF;


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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingById`(AdvertisingId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		SET JSON = ( 

		SELECT GROUP_CONCAT(
  
				CONCAT('{"121.18":"',W.advertising_id,'"'),
				CONCAT(',"53":"',COALESCE(dbuser.GetNMCId(W.usernmcid),''),'"'),
				CONCAT(',"127.10":"',COALESCE(W.ownerid,''),'"'),
				CONCAT(',"120.83":"',COALESCE(W.title,''),'"') ,
				CONCAT(',"120.157":"',COALESCE(hex(W.description),''),'"') ,
				CONCAT(',"114.143":"',COALESCE(W.status,''),'"') ,
				CONCAT(',"121.170":"',COALESCE(W.image,''),'"') ,
				CONCAT(',"121.15":"',COALESCE(W.file_originalname,''),'"') ,
				CONCAT(',"47.42":"',COALESCE(W.file_thumbnail,''),'"') ,
				CONCAT(',"114.144":"',COALESCE(W.productid,''),'"') ,
				CONCAT(',"114.112":"',COALESCE(W.producttype,''),'"') ,
				CONCAT(',"114.104":"',COALESCE(W.qrcode,''),'"') ,
				CONCAT(',"114.98":"',COALESCE(W.regularprice,0.0),'"') ,
				CONCAT(',"122.158":"',COALESCE(W.saleprice,0.0),'"}'))
			   from

				  (select A.advertising_id, A.usernmcid, A.ownerid, A.title, A.description, A.status, A.image, A.file_originalname, A.file_thumbnail, A.productid, A.producttype, A.qrcode, A.regularprice, A.saleprice
				   from vw_advertising as A
				   where A.advertising_id = AdvertisingId
				   ) as W
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingByPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingByPackage`(PackageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		SET JSON = ( 

		SELECT GROUP_CONCAT(
 
				CONCAT('{"121.18":"',A.tbl_advertising_id,'"'),
				CONCAT(',"53":"',COALESCE(dbuser.GetNMCId(A.tbl_advertising_usernmcid),''),'"'),
				CONCAT(',"127.10":"',COALESCE(A.tbl_advertising_ownerid,''),'"'),
				CONCAT(',"127.102":"',COALESCE(A.tbl_advertising_advertiserid,''),'"'),				
				CONCAT(',"120.83":"',COALESCE(A.tbl_advertising_title,''),'"') ,
				CONCAT(',"120.157":"',COALESCE(hex(A.tbl_advertising_description),''),'"'),
				CONCAT(',"121.170":"',COALESCE(B.tbl_advertisingimage_name ,''),'"') ,
				CONCAT(',"121.15":"',COALESCE(C.tbl_file_originalname,''),'"') ,
				CONCAT(',"47.42":"',COALESCE(C.tbl_file_thumbnail,''),'"') ,
				CONCAT(',"114.143":"',COALESCE(A.tbl_advertising_status,''),'"'),
				CONCAT(',"127.54":"',COALESCE(LPAD(A.tbl_advertising_order,11,0),''),'"}'))
 
			   from tbl_advertising as A 
					left join tbl_advertisingimage as B on A.tbl_advertisingimage_id = B.tbl_advertisingimage_id 
					left join tbl_file as C on A.tbl_file_id = C.tbl_file_id
					left join tbl_packageadvertising as D on A.tbl_advertising_id = D.tbl_advertising_id

					where D.tbl_package_id  = PackageId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingByShuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingByShuffle`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

		SET JSON = ( 

		SELECT GROUP_CONCAT(
  
				CONCAT('{"121.18":"',W.advertising_id,'"'),
				CONCAT(',"127.107":"',COALESCE(ShuffleId,''),'"'),
				CONCAT(',"53":"',COALESCE(dbuser.GetNMCId(W.usernmcid),''),'"'),
				CONCAT(',"127.10":"',COALESCE(W.ownerid,''),'"'),
				CONCAT(',"120.83":"',COALESCE(hex(W.title),''),'"') ,
				CONCAT(',"120.157":"',COALESCE(hex(W.description),''),'"') ,
				CONCAT(',"114.143":"',COALESCE(W.status,''),'"') ,
				CONCAT(',"121.170":"',COALESCE(W.image,''),'"') ,
				CONCAT(',"121.15":"',COALESCE(W.file_originalname,''),'"') ,
				CONCAT(',"47.42":"',COALESCE(W.file_thumbnail,''),'"') ,
				CONCAT(',"114.144":"',COALESCE(W.productid,''),'"') ,
				CONCAT(',"114.112":"',COALESCE(W.producttype,''),'"') ,
				CONCAT(',"114.104":"',COALESCE(W.qrcode,''),'"') ,
				CONCAT(',"114.98":"',COALESCE(W.regularprice,0.0),'"') ,
				CONCAT(',"122.158":"',COALESCE(W.saleprice,0.0),'"') ,
				CONCAT(',"127.106":"',COALESCE(W.tbl_sequence,0),'"') ,
				CONCAT(dbitems.getNMCScheduleshuffle(ShuffleId)),
				CONCAT(',"127.108":"',COALESCE(W.tbl_advertising_banner_type_id,68001),'"') ,
				CONCAT(',"127.109":"',COALESCE(W.tbl_advertising_time,10),'"') ,
				CONCAT(',"127.110":"',COALESCE(hex(W.tbl_banner_text),''),'"') ,
				CONCAT(',"127.111":"',COALESCE(hex(W.tbl_advertising_pitch),''),'"') ,
				CONCAT(',"121.140":"',COALESCE(W.datemodified,W.tbl_advertising_lastModified,''),'"') ,
				CONCAT(',"127.54":"',COALESCE(LPAD(W.tbl_order,11,0),''),'"}'))

			   from

				  (select A.advertising_id, 
						A.usernmcid, 
						A.ownerid, 
						A.title, 
						A.description, 
						A.status, 
						A.image, 
						A.file_originalname, 
						A.file_thumbnail, 
						A.productid, 
						A.producttype, 
						A.qrcode, 
						A.regularprice, 
						A.saleprice, 
                        A.datemodified,
						B.tbl_order,
						B.tbl_sequence,
						B.tbl_advertising_banner_type_id,
						B.tbl_advertising_time,
						B.tbl_banner_text,
						B.tbl_advertising_pitch,
						(select C.tbl_advertising_lastModified from tbl_advertising_republished as C where C.tbl_shuffle_id = ShuffleId limit 1) as tbl_advertising_lastModified
				   from vw_advertising as A
				   left join tbl_shuffle_advertising as B on A.advertising_id = B.tbl_advertising_id
				   where B.tbl_shuffle_id = ShuffleId
				   order by B.tbl_order asc) as W
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingByShufflePortal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingByShufflePortal`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

		SET JSON = ( 

		SELECT GROUP_CONCAT(
  
				CONCAT('{"121.18":"',W.advertising_id,'"'),
				CONCAT(',"53":"',COALESCE(dbuser.GetNMCId(W.usernmcid),''),'"'),
				CONCAT(',"127.10":"',COALESCE(W.ownerid,''),'"'),
				CONCAT(',"120.83":"',COALESCE(hex(W.title),''),'"') ,
				CONCAT(',"120.157":"',COALESCE(hex(W.description),''),'"') ,
				CONCAT(',"114.143":"',COALESCE((SELECT tbl_productstatus_id FROM dbitems.tbl_product where tbl_product.tbl_product_id = W.productid),''),'"') ,
				CONCAT(',"127.113":"',COALESCE(W.status,''),'"') ,
				CONCAT(',"121.170":"',COALESCE(W.image,W.file_thumbnail,''),'"') ,
				CONCAT(',"121.15":"',COALESCE(W.file_originalname,''),'"') ,
				CONCAT(',"47.42":"',COALESCE(W.file_thumbnail,''),'"') ,
				CONCAT(',"114.144":"',COALESCE(W.productid,''),'"') ,
				CONCAT(',"114.112":"',COALESCE(W.producttype,''),'"') ,
				CONCAT(',"114.104":"',COALESCE(W.qrcode,''),'"') ,
                CONCAT(',"122.131":"',COALESCE(W.model,''),'"') ,
                CONCAT(',"121.102":"',COALESCE(W.sku,''),'"') ,
                CONCAT(',"120.31":"',COALESCE(W.dateCreate,''),'"') ,
				CONCAT(',"114.98":"',COALESCE(W.regularprice,0.0),'"') ,
				CONCAT(',"122.158":"',COALESCE(W.saleprice,0.0),'"') ,
                CONCAT(',"114.9":"',COALESCE(ValidateNMCProductSchedule(W.productid),''),'"') ,
				CONCAT(',"IR":[',COALESCE(dbitems.getNMCAdvertisingItemRecommended(W.advertising_id),''),']') ,
                CONCAT(',"CA":{',dbitems.getNMCCategory(W.tbl_category_id),'}'),
                CONCAT(dbitems.getNMCScheduleProduct(W.productid)),
                CONCAT(',"127.106":"',COALESCE(W.tbl_sequence,0),'"') ,
				CONCAT(',"127.108":"',COALESCE(W.tbl_advertising_banner_type_id,68001),'"') ,
				CONCAT(',"127.109":"',COALESCE(W.tbl_advertising_time,10),'"') ,
				CONCAT(',"127.110":"',COALESCE(hex(W.tbl_banner_text),''),'"') ,
				CONCAT(',"127.111":"',COALESCE(hex(W.tbl_advertising_pitch),''),'"') ,
				CONCAT(',"127.54":"',COALESCE(LPAD(W.tbl_order,11,0),''),'"'),
				CONCAT(',"114.121":"',COALESCE(W.tbl_likes,'0'),'"'),
				CONCAT(',"114.132":"',COALESCE(W.tbl_dislikes,'0'),'"}'))
			   
               from

				  (select A.advertising_id, A.usernmcid, A.ownerid, A.title, A.description, A.status, A.image, A.file_originalname, A.file_thumbnail, 
                   A.productid, A.producttype, A.qrcode,  A.model, A.sku, A.dateCreate, A.regularprice, A.saleprice, D.tbl_category_id,
                   B.tbl_order,B.tbl_sequence,B.tbl_advertising_banner_type_id,B.tbl_advertising_time,B.tbl_banner_text,B.tbl_advertising_pitch,
				   C.tbl_likes, C.tbl_dislikes 
				   from vw_advertising_portal as A
				   left join tbl_shuffle_advertising as B on A.advertising_id = B.tbl_advertising_id
				   left join vw_advertising_favorite as C on A.advertising_id = C.tbl_advertising_id
                   left join tbl_productcategory as D on D.tbl_product_id = A.productid 
				   where B.tbl_shuffle_id = ShuffleId
				   order by B.tbl_order asc) as W
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingByShufflePortal2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingByShufflePortal2`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		SET JSON = ( 

		SELECT GROUP_CONCAT(
  
				CONCAT('"121.18":"',W.advertising_id,'"'),
				CONCAT(',"53":"',COALESCE(dbuser.GetNMCId(W.usernmcid),''),'"'),
				CONCAT(',"127.10":"',COALESCE(W.ownerid,''),'"'),
				CONCAT(',"120.83":"',COALESCE(hex(W.title),''),'"') ,
				CONCAT(',"120.157":"',COALESCE(hex(W.description),''),'"') ,
				CONCAT(',"114.143":"',COALESCE((SELECT tbl_productstatus_id FROM dbitems.tbl_product where tbl_product.tbl_product_id = W.productid),''),'"') ,
				CONCAT(',"127.113":"',COALESCE(W.status,''),'"') ,
				CONCAT(',"121.170":"',COALESCE(W.image,W.file_thumbnail,''),'"') ,
				CONCAT(',"121.15":"',COALESCE(W.file_originalname,''),'"') ,
				CONCAT(',"47.42":"',COALESCE(W.file_thumbnail,''),'"') ,
				CONCAT(',"114.144":"',COALESCE(W.productid,''),'"') ,
				CONCAT(',"114.112":"',COALESCE(W.producttype,''),'"') ,
				CONCAT(',"114.104":"',COALESCE(W.qrcode,''),'"') ,
				CONCAT(',"114.98":"',COALESCE(W.regularprice,0.0),'"') ,
				CONCAT(',"122.158":"',COALESCE(W.saleprice,0.0),'"') ,
				CONCAT(',"127.106":"',COALESCE(W.tbl_sequence,0),'"') ,
				CONCAT(',"127.108":"',COALESCE(W.tbl_advertising_banner_type_id,68001),'"') ,
				CONCAT(',"127.109":"',COALESCE(W.tbl_advertising_time,10),'"') ,
				CONCAT(',"127.110":"',COALESCE(hex(W.tbl_banner_text),''),'"') ,
				CONCAT(',"127.111":"',COALESCE(hex(W.tbl_advertising_pitch),''),'"') ,
				CONCAT(',"127.54":"',COALESCE(LPAD(W.tbl_order,11,0),''),'"'),
				CONCAT(',"114.121":"',COALESCE(W.tbl_likes,'0'),'"'),
				CONCAT(',"114.132":"',COALESCE(W.tbl_dislikes,'0'),'"'))
			   from

				  (select A.advertising_id, A.usernmcid, A.ownerid, A.title, A.description, A.status, A.image, A.file_originalname, A.file_thumbnail, A.productid, A.producttype, A.qrcode, A.regularprice, A.saleprice, B.tbl_order,B.tbl_sequence,B.tbl_advertising_banner_type_id,B.tbl_advertising_time,B.tbl_banner_text,B.tbl_advertising_pitch,
				   C.tbl_likes, C.tbl_dislikes
				   from vw_advertising_portal as A
				   left join tbl_shuffle_advertising as B on A.advertising_id = B.tbl_advertising_id
				   left join vw_advertising_favorite as C on A.advertising_id = C.tbl_advertising_id
				   where B.tbl_shuffle_id = ShuffleId
				   order by B.tbl_order asc) as W
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingByShufflePortrait` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingByShufflePortrait`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

		SET JSON = ( 

		SELECT GROUP_CONCAT(
  
				CONCAT('{"121.18":"',W.advertising_id,'"'),
				CONCAT(',"127.107":"',COALESCE(ShuffleId,''),'"'),
				CONCAT(',"53":"',COALESCE(dbuser.GetNMCId(W.usernmcid),''),'"'),
				CONCAT(',"127.10":"',COALESCE(W.ownerid,''),'"'),
				CONCAT(',"120.83":"',COALESCE(hex(W.title),''),'"') ,
				CONCAT(',"120.157":"',COALESCE(hex(W.description),''),'"') ,
				CONCAT(',"114.143":"',COALESCE(W.status,''),'"') ,
				CONCAT(',"121.170":"',COALESCE(W.image,''),'"') ,
				CONCAT(',"121.15":"',COALESCE(W.file_originalname,''),'"') ,
				CONCAT(',"47.42":"',COALESCE(W.file_thumbnail,''),'"') ,
				CONCAT(',"114.144":"',COALESCE(W.productid,''),'"') ,
				CONCAT(',"114.112":"',COALESCE(W.producttype,''),'"') ,
				CONCAT(',"114.104":"',COALESCE(W.qrcode,''),'"') ,
				CONCAT(',"114.98":"',COALESCE(W.regularprice,0.0),'"') ,
				CONCAT(',"122.158":"',COALESCE(W.saleprice,0.0),'"') ,
				CONCAT(',"127.106":"',COALESCE(W.tbl_sequence,0),'"') ,
				CONCAT(dbitems.getNMCScheduleshuffle(ShuffleId)),
				CONCAT(',"127.108":"',COALESCE(W.tbl_advertising_banner_type_id,68001),'"') ,
				CONCAT(',"127.109":"',COALESCE(W.tbl_advertising_time,10),'"') ,
				CONCAT(',"127.110":"',COALESCE(hex(W.tbl_banner_text),''),'"') ,
				CONCAT(',"127.111":"',COALESCE(hex(W.tbl_advertising_pitch),''),'"') ,
				CONCAT(',"121.140":"',COALESCE(W.datemodified,W.tbl_advertising_lastModified,''),'"') ,
				CONCAT(',"127.54":"',COALESCE(LPAD(W.tbl_order,11,0),''),'"}'))

			   from

				  (select A.advertising_id, 
						A.usernmcid, 
						A.ownerid, 
						A.title, 
						A.description, 
						A.status, 
						A.image, 
						A.file_originalname, 
						A.file_thumbnail, 
						A.productid, 
						A.producttype, 
						A.qrcode, 
						A.regularprice, 
						A.saleprice, 
                        A.datemodified,
						B.tbl_order,
						B.tbl_sequence,
						B.tbl_advertising_banner_type_id,
						B.tbl_advertising_time,
						B.tbl_banner_text,
						B.tbl_advertising_pitch,
						(select C.tbl_advertising_lastModified from tbl_advertising_republished as C where C.tbl_shuffle_id = ShuffleId limit 1) as tbl_advertising_lastModified
				   from vw_advertising as A
				   left join tbl_shuffle_advertising as B on A.advertising_id = B.tbl_advertising_id
				   where B.tbl_shuffle_id = ShuffleId
                   and A.productid != 0
				   order by B.tbl_order asc) as W
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingDisikesByUserCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingDisikesByUserCount`(advertiserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;
SET  group_concat_max_len = 10000000;
		SET JSON = ( 
					
				(select count(tbl_advertisingfavorite_id) 
					from dbitems.tbl_advertisingfavorite_user 
						
					where 
						
					tbl_advertising_id = advertiserId
					and  tbl_advertisingfavorite_like = 0
					)
			
				);
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingItemList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingItemList`(mainuserId varchar(20)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
				CONCAT('{"114.144":"',COALESCE(A.tbl_product_id,''),'"'),
				CONCAT(',"114.112":"',COALESCE(A.tbl_producttype_id,''),'"'),
				CONCAT(',"53":"',COALESCE(A.tbl_product_usernmcid,''),'"'),
				CONCAT(',"114.143":"',COALESCE(A.tbl_productstatus_id,''),'"'),
				CONCAT(',"121.170":"',COALESCE(A.tbl_product_image,''),'"'),
				CONCAT(',"114.104":"',COALESCE(A.tbl_product_qrCode,''),'"'),
				CONCAT(',"120.83":"',COALESCE(A.tbl_product_name,''),'"'),
				CONCAT(',"120.157":"',COALESCE(hex(A.tbl_product_description),''),'"'),
				CONCAT(',"114.98":"',COALESCE(A.tbl_product_regularprice,0.0),'"'),
				CONCAT(',"122.158":"',COALESCE(A.tbl_product_saleprice,0.0),'"}')				
	  )
		from vw_product_by_merchant as A,	
		tbl_advertisingmerchantitems as B 
		where B.tbl_advertising_usernmcid = mainuserId
		and A.tbl_productstatus_id = 1001
		and A.tbl_main_user_id = B.tbl_advertising_usernmcid
		and A.tbl_product_id = B.tbl_advertising_product_id  
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingItemRecommended` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingItemRecommended`(advertisingId int(11)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
				CONCAT('{"114.144":"',COALESCE(A.tbl_product_id,''),'"'),
                CONCAT(',"120.83":"',COALESCE(A.tbl_product_name,''),'"'),
				CONCAT(',"120.157":"',COALESCE(hex(A.tbl_product_description),''),'"'),
				CONCAT(',"114.112":"',COALESCE(A.tbl_producttype_id,''),'"'),
				CONCAT(',"IM":[',COALESCE(dbitems.getNMCImage(A.tbl_product_id,99),''),']'),
				CONCAT(',"114.104":"',COALESCE(A.tbl_product_qrCode,''),'"'),
				CONCAT(',"114.98":"',COALESCE(A.tbl_product_regularprice,0.0),'"'),
				CONCAT(',"122.158":"',COALESCE(A.tbl_product_saleprice,0.0),'"}')				
	  )
		from vw_product_by_merchant as A,	
		tbl_advertisingrecommended as B 
		where B.tbl_advertising_id = advertisingId
		and A.tbl_productstatus_id = 1001
		and A.tbl_product_id = B.tbl_product_id  
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCAdvertisingLikesByUserCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCAdvertisingLikesByUserCount`(advertiserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;
SET  group_concat_max_len = 10000000;
		SET JSON = ( 
					
				(select count(tbl_advertisingfavorite_id) 
					from dbitems.tbl_advertisingfavorite_user 
						
					where 
						
					tbl_advertising_id = advertiserId
					and  tbl_advertisingfavorite_like = 1
					)
			
				);
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCatalogCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCatalogCategory`(catalogID int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET JSON = ( 
SELECT GROUP_CONCAT(
	   CONCAT('{"114.93":"',COALESCE(W.tbl_category_id,''),'"'), 
	   CONCAT(',"120.45":"',COALESCE(W.tbl_categorydescription_name,''),'"}'))
		from 
		(select A.tbl_category_id, A.tbl_categorydescription_name from 
		tbl_categorydescription as A, 
		tbl_productcategory as B, 
		tbl_catalogproduct as C 

		where C.tbl_catalog_id = catalogID
		AND C.tbl_product_id=B.tbl_product_id
		and B.tbl_category_id=A.tbl_category_id

		group by  A.tbl_categorydescription_name) as W
	   
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCardByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCardByUser`(UserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 


SELECT GROUP_CONCAT(
		CONCAT('"122.34":"',COALESCE(W.tbl_carduser_id,''),'"'),
        CONCAT(',"48.15":"',COALESCE(W.tbl_card_tocken,''),'"'),
		CONCAT(',"120.7":"',COALESCE(W.tbl_cardstype_id,''),'"'),
        CONCAT(',"2":"',COALESCE(W.tbl_card_number,''),'"'),
        CONCAT(',"48.6":"',COALESCE(hex(W.tbl_card_nickname),''),'"'),
        CONCAT(',"48.2":"',COALESCE(hex(W.tbl_card_chardholderName),''),'"'),
		CONCAT(',"118.5":"',COALESCE(W.tbl_card_dateExpire,''),'"'),
        CONCAT(',"48.4":"',COALESCE(W.tbl_card_swift_iban_code,''),'"'),
		CONCAT(',"47.17":"',COALESCE(W.tbl_zipcode,''),'"')
		)

		
		from 
        (   
			select 
				A.tbl_carduser_id,
                A.tbl_card_tocken,
				B.tbl_cardstype_id,
				B.tbl_card_number,
				B.tbl_card_nickname,
				B.tbl_card_chardholderName,
				B.tbl_card_dateExpire,
                B.tbl_card_swift_iban_code,
                B.tbl_zipcode
			from tbl_carduser as A
            left join tbl_card as B on B.tbl_user_id = A.tbl_user_nmcId
			where A.tbl_user_nmcId = UserId
            and A.tbl_card_tocken = B.tbl_card_tocken
			limit 1) as W
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCardsTypeByAccountId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCardsTypeByAccountId`(AccountId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 



SELECT GROUP_CONCAT(
		CONCAT('{"120.7":"',COALESCE(A.tbl_cardstype_id,''),'"'),
        CONCAT(',"121.72":"',COALESCE(A.tbl_cardstype_name,''),'"}')
		)
		
		from  dbcards.tbl_cardstype as A
        left join dbcards.tbl_cardtypeaccepted_account as B on A.tbl_cardstype_id = B.tbl_cardstype_id
        left join dbcards.tbl_paymentserviceaccount as C on B.tbl_paymentserviceaccount_id = C.tbl_paymentserviceaccount_id

		where C.tbl_paymentserviceaccount_id = AccountId

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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategory`(categoryId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

SELECT GROUP_CONCAT(

       CONCAT('"114.93":"',COALESCE(C.tbl_category_id,''),'",'), 
       CONCAT('"120.45":"',COALESCE(D.tbl_categorydescription_name,''),'",'), 
       CONCAT('"120.44":"',COALESCE(C.tbl_category_level,''),'",'),
	   CONCAT('"122.21":"',COALESCE(C.tbl_category_parentid,''),'",'), 
	   CONCAT('"127.10":"',COALESCE(C.tbl_category_owner,''),'",'), 
       CONCAT('"122.183":"',COALESCE(C.tbl_category_active,''),'",'),
       CONCAT('"47.42":"',COALESCE(C.tbl_category_image,''),'"'))

	   from tbl_category C, tbl_categorydescription D
	   where C.tbl_category_id = D.tbl_category_id 
	 
	  
       and C.tbl_category_id = categoryId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryByModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryByModule`(moduleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET JSON = ( 
SELECT GROUP_CONCAT(
   CONCAT('{"114.93":"',COALESCE(tbl_category_id,''),'"}'))
   from dbitems.tbl_module_category
   where tbl_module_id = moduleId	   
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryByPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryByPackage`(PackageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		SET JSON = ( 

		SELECT GROUP_CONCAT(

			   CONCAT('{"114.93":"',COALESCE(C.tbl_category_id,''),'",'), 
			   CONCAT('"120.45":"',COALESCE(D.tbl_categorydescription_name,''),'",'), 
			   CONCAT('"120.44":"',COALESCE(C.tbl_category_level,''),'",'),
			   CONCAT('"122.21":"',COALESCE(C.tbl_category_parentid,''),'",'), 
			   CONCAT('"127.10":"',COALESCE(C.tbl_category_owner,''),'",'), 
			   CONCAT('"122.183":"',COALESCE(C.tbl_category_active,''),'",'),
			   CONCAT('"47.42":"',COALESCE(C.tbl_category_image,''),'"}'))
 
			   from tbl_category C, tbl_categorydescription D, tbl_packagecategory as A
			   where C.tbl_category_id = D.tbl_category_id 
			   and C.tbl_category_active = 1 
			   and C.tbl_category_deleted = 0 
			   and C.tbl_category_id = A.tbl_category_id
			   and  A.tbl_package_id = PackageId);
	


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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryByshuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryByshuffle`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		SET JSON = ( 

		SELECT GROUP_CONCAT(

			   CONCAT('{"114.93":"',COALESCE(C.tbl_category_id,''),'",'), 
			   CONCAT('"120.45":"',COALESCE(D.tbl_categorydescription_name,''),'",'), 
			   CONCAT('"120.44":"',COALESCE(C.tbl_category_level,''),'",'),
			   CONCAT('"122.21":"',COALESCE(C.tbl_category_parentid,''),'",'), 
			   CONCAT('"127.10":"',COALESCE(C.tbl_category_owner,''),'",'), 
			   CONCAT('"122.183":"',COALESCE(C.tbl_category_active,''),'",'),
			   CONCAT('"47.42":"',COALESCE(C.tbl_category_image,''),'"}'))
 
			   from tbl_category C, tbl_categorydescription D, tbl_shufflecategory as A
			   where C.tbl_category_id = D.tbl_category_id 
			   and C.tbl_category_active = 1 
			   and C.tbl_category_deleted = 0 
			   and C.tbl_category_id = A.tbl_category_id
			   and  A.tbl_shuffle_id = shuffleId);
	


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
/*!50003 DROP FUNCTION IF EXISTS `GetNMCCategoryGroupByCategoryId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCCategoryGroupByCategoryId`(categoryId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE PARENTID INT; 
DECLARE CATEGORYGROUP INT DEFAULT 0;
DECLARE LVL INT; 
SET  group_concat_max_len = 10000000;



SET LVL = (select tbl_category_level from tbl_category where tbl_category_id = categoryId);
SET PARENTID = (select tbl_category_parentid from tbl_category where tbl_category_id = categoryId);

if lvl < 2 then

	set CATEGORYGROUP = NULL;
else

	IF  LVL = 2 THEN
		SET CATEGORYGROUP= (select tbl_category_id from tbl_category where tbl_category_id = categoryId);

	ELSE

		WHILE LVL >2 DO

			 
			SET CATEGORYGROUP= (select tbl_category_id from tbl_category where tbl_category_id = PARENTID);
			SET PARENTID = (select tbl_category_parentid from tbl_category where tbl_category_id = CATEGORYGROUP);
			SET LVL = (select tbl_category_level from tbl_category where tbl_category_id = CATEGORYGROUP);
		END WHILE;
	END IF;

end if;

SET JSON =CATEGORYGROUP;


IF JSON is NULL THEN
	SET JSON = "";
END IF;
 
RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryhasItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryhasItem`(CategoryId int,UserId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		If(select distinct E.tbl_category_id from 
								dbitems.vw_product_by_merchant as B,
								dbitems.tbl_productcategory as C, 
								dbitems.vw_categories_with_categgroup as D,
								dbitems.tbl_category as E

								where B.tbl_main_user_id = dbuser.GetMainUser(UserId)  
								AND B.tbl_product_id = C.tbl_product_id  
								and D.tbl_category_id = C.tbl_category_id
								and C.tbl_category_id=E.tbl_category_id 
								and D.category_group=CategoryId
							
								limit 1) is not null then

			SET JSON = 'true';
		else
			SET JSON = 'false';
			
		end if;
	



RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetNMCCategoryTree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCCategoryTree`(CategoryId int(11)) RETURNS text CHARSET utf8
BEGIN

	DECLARE JSON TEXT;

	set  group_concat_max_len = 10000000;

	set JSON = (

		CONCAT(CategoryId,',',COALESCE((		
			select 
			GROUP_CONCAT(
				CONCAT('',tbl_category_id,',',
				   if((select count(*) from tbl_category as A, tbl_category as B where A.tbl_category_parentid = B.tbl_category_id) > 0,COALESCE(getNMCCategoryTreeX1(tbl_category_id),''),'')
				)
			) 
			from tbl_category 
			where tbl_category_parentid = CategoryId

		),''))
	);


	set JSON = REPLACE(JSON,',,',',');
	SET JSON = (SELECT SUBSTR(JSON,1,LENGTH(JSON)-1));

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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryTreeX1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryTreeX1`(CategoryId int(11)) RETURNS text CHARSET utf8
BEGIN



DECLARE JSON TEXT;


set  group_concat_max_len = 10000000;




	set JSON = (
		select 
		GROUP_CONCAT(
			CONCAT('',tbl_category_id,',',
			   if((select count(*) from tbl_category as A, tbl_category as B where A.tbl_category_parentid = B.tbl_category_id) > 0,COALESCE(getNMCCategoryTreeX2(tbl_category_id),''),'')
			)
		) 
		from tbl_category 
		where tbl_category_parentid = CategoryId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryTreeX2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryTreeX2`(CategoryId int(11)) RETURNS text CHARSET utf8
BEGIN



DECLARE JSON TEXT;

set  group_concat_max_len = 10000000;



	set JSON = (
		select 
		GROUP_CONCAT(tbl_category_id)
		from tbl_category 
		where tbl_category_parentid = CategoryId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryUser`(UserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET ENTITYAUX = (SELECT tbl_user_entity from dbuser.tbl_user where tbl_user_id=UserId  );


 case substring(ENTITYAUX,1,1)

	when 2 then

		SET JSON = ( 

		SELECT GROUP_CONCAT(

			   CONCAT('{"114.93":"',COALESCE(C.tbl_category_id,''),'",'), 
			   CONCAT('"120.45":"',COALESCE(D.tbl_categorydescription_name,''),'",'), 
			   CONCAT('"120.44":"',COALESCE(C.tbl_category_level,''),'",'),
			   CONCAT('"122.21":"',COALESCE(C.tbl_category_parentid,''),'",'), 
			   CONCAT('"127.10":"',COALESCE(C.tbl_category_owner,''),'",'), 
			   CONCAT('"122.183":"',COALESCE(C.tbl_category_active,''),'",'),
			  CONCAT('"127.86":"',dbitems.getNMCCategoryhasItem(C.tbl_category_id,UserId),'",'),
			   CONCAT('"47.42":"',COALESCE(C.tbl_category_image,''),'"}'))
 
			   from tbl_category C, tbl_categorydescription D, dbuser.tbl_merchantbusinesscategory as A
			   where C.tbl_category_id = D.tbl_category_id 
			   and C.tbl_category_active = 1 
			   and C.tbl_category_deleted = 0 
			   and C.tbl_category_id = A.tbl_businesscategory_id
			   and  A.tbl_merchant_nmcId = UserId);
	when 3 then
			SET JSON = ( 

		SELECT GROUP_CONCAT(

			   CONCAT('{"114.93":"',COALESCE(C.tbl_category_id,''),'",'), 
			   CONCAT('"120.45":"',COALESCE(D.tbl_categorydescription_name,''),'",'), 
			   CONCAT('"120.44":"',COALESCE(C.tbl_category_level,''),'",'),
			   CONCAT('"122.21":"',COALESCE(C.tbl_category_parentid,''),'",'), 
			   CONCAT('"127.10":"',COALESCE(C.tbl_category_owner,''),'",'), 
			   CONCAT('"122.183":"',COALESCE(C.tbl_category_active,''),'",'),
			   CONCAT('"47.42":"',COALESCE(C.tbl_category_image,''),'"}'))

			   from tbl_category C, tbl_categorydescription D, dbuser.tbl_resellerbusinesscategory as A
			   where C.tbl_category_id = D.tbl_category_id 
			   and C.tbl_category_active = 1 
			   and C.tbl_category_deleted = 0 
			   and C.tbl_category_id = A.tbl_businesscategory_id
			   and  A.tbl_reseller_nmcId = UserId);
	else 
			SET JSON = '';
	end case;


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
/*!50003 DROP FUNCTION IF EXISTS `getNMCCategoryUserMobile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCCategoryUserMobile`(UserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET ENTITYAUX = (SELECT tbl_user_entity from dbuser.tbl_user where tbl_user_id=UserId  );


 case substring(ENTITYAUX,1,1)

	when 2 then

		SET JSON = ( 

		SELECT GROUP_CONCAT(
 
			   CONCAT('{"114.93":"',COALESCE(C.tbl_category_id,''),'",'), 
			   CONCAT('"120.45":"',COALESCE(D.tbl_categorydescription_name,''),'",'), 
			   CONCAT('"120.44":"',COALESCE(C.tbl_category_level,''),'",'),
			   CONCAT('"122.21":"',COALESCE(C.tbl_category_parentid,''),'",'), 
			   CONCAT('"127.10":"',COALESCE(C.tbl_category_owner,''),'",'), 
			   CONCAT('"122.183":"',COALESCE(C.tbl_category_active,''),'",'),
			   CONCAT('"127.86":"','true','",'),
			   CONCAT('"47.42":"',COALESCE(C.tbl_category_image,''),'"}'))
 
			   from tbl_category C, tbl_categorydescription D, dbuser.tbl_merchantbusinesscategory as A
			   where C.tbl_category_id = D.tbl_category_id 
			   and C.tbl_category_active = 1 
			   and C.tbl_category_deleted = 0 
			   and C.tbl_category_id = A.tbl_businesscategory_id
			   and  A.tbl_merchant_nmcId = UserId);
	when 3 then
			SET JSON = ( 

		SELECT GROUP_CONCAT(

			   CONCAT('{"114.93":"',COALESCE(C.tbl_category_id,''),'",'), 
			   CONCAT('"120.45":"',COALESCE(D.tbl_categorydescription_name,''),'",'), 
			   CONCAT('"120.44":"',COALESCE(C.tbl_category_level,''),'",'),
			   CONCAT('"122.21":"',COALESCE(C.tbl_category_parentid,''),'",'), 
			   CONCAT('"127.10":"',COALESCE(C.tbl_category_owner,''),'",'), 
			   CONCAT('"122.183":"',COALESCE(C.tbl_category_active,''),'",'),
			   CONCAT('"47.42":"',COALESCE(C.tbl_category_image,''),'"}'))

			   from tbl_category C, tbl_categorydescription D, dbuser.tbl_resellerbusinesscategory as A
			   where C.tbl_category_id = D.tbl_category_id 
			   and C.tbl_category_active = 1 
			   and C.tbl_category_deleted = 0 
			   and C.tbl_category_id = A.tbl_businesscategory_id
			   and  A.tbl_reseller_nmcId = UserId);
	else 
			SET JSON = '';
	end case;


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
/*!50003 DROP FUNCTION IF EXISTS `getNMCChoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCChoice`(OptionId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

 

SELECT GROUP_CONCAT(

	   CONCAT('{"121.179":"',COALESCE(B.tbl_productoption_id,''),'"'),
	   CONCAT(',"122.112":"',COALESCE(A.tbl_productoptionvalue_id,''),'"'),
	   CONCAT(',"127.16":"',COALESCE(A.tbl_productoptionvalue_name,''),'"'),	
	   CONCAT(',"120.84":"',COALESCE(B.tbl_productattribute_optionValuePrice,''),'"}'))



	   from tbl_productoptionvalue AS A, tbl_productattribute AS B
	   where A.tbl_productoptionvalue_id = B.tbl_productoptionvalue_id
	   and B.tbl_productoption_id=OptionId



);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCDelivery`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 
SELECT GROUP_CONCAT(

	   CONCAT('{"122.109":"',COALESCE(A.tbl_delivery_id,''),'",'),  
       CONCAT('"122.133":"',COALESCE(A.tbl_delivery_company_option,''),'",') ,
	   CONCAT('"122.39":"',COALESCE(A.tbl_delivery_company_service,''),'",') ,
	   CONCAT('"120.157":"',COALESCE(A.tbl_user_delivery_options_tier,''),'",') ,
	   CONCAT('"123.60":"',COALESCE(A.tbl_delivery_company_tracking_code,''),'",') ,
	   CONCAT('"122.161":"',COALESCE(B.tbl_productdelivery_ajustedPrice,0.00),'"}') 
	   )
	  
		from dbuser.tbl_user_delivery_options AS A, tbl_productdelivery AS B
		where  A.tbl_delivery_id = B.tbl_deliverycompany_id
	    and B.tbl_product_id = productId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCFrecuencyByShuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCFrecuencyByShuffle`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

	SET JSON = ( 

		SELECT GROUP_CONCAT(
 
				CONCAT('{"NMC":"',COALESCE((select tbl_frecuency from tbl_advertising_frecuency where tbl_shuffle_id = ShuffleId and tbl_user_entity = 44 limit 1),'1'),'"'),
				CONCAT(',"OWN":"',COALESCE((select tbl_frecuency from tbl_advertising_frecuency where tbl_shuffle_id = ShuffleId and tbl_user_entity = 60 limit 1),'1'),'"'),
				CONCAT(',"MER":"',COALESCE((select tbl_frecuency from tbl_advertising_frecuency where tbl_shuffle_id = ShuffleId and tbl_user_entity = 20 limit 1),'1'),'"}')

				)
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCImage`(productId int,FIN int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET JSON = ( 
SELECT GROUP_CONCAT(
	   CONCAT('{"120.86":"',COALESCE(W.tbl_productimages_id,''),'",'), 
       CONCAT('"47.42":"',COALESCE(W.tbl_productimage_image,''),'",') , 
	   CONCAT('"120.33":"',COALESCE(W.tbl_imagetype_id,''),'"}'))
	

	   from 
(SELECT tbl_productimages_id,
		tbl_productimage_image,
		tbl_imagetype_id FROM tbl_productimage
		where tbl_product_id = productId LIMIT FIN) AS W
	   
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
/*!50003 DROP FUNCTION IF EXISTS `GetNMCInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCInventory`(ProductId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

 

SELECT GROUP_CONCAT(           
					CONCAT('{"122.110":"',coalesce(I.tbl_productinventory_id,''),'"'),
					CONCAT(',"127.62":"',coalesce(I.tbl_productinventory_choices,''),'"'),
					CONCAT(',"114.132":"',coalesce(I.tbl_productinventory_quantity,''),'"}'))			
				
from dbitems.tbl_productinventory as I
where I.tbl_product_id=ProductId);




IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItem`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE CANNOTBEREDEEM_AUX VARCHAR(10) DEFAULT 0; 				
DECLARE BACKORDER_AUX VARCHAR(10) DEFAULT 0; 
DECLARE STOPSELLINGSOLD_AUX VARCHAR(10) DEFAULT 0; 
DECLARE SPECIAL_CONDIT_AUX VARCHAR(10) DEFAULT 0; 

SET  group_concat_max_len = 10000000;
SET SPECIAL_CONDIT_AUX = (SELECT tbl_condition_code FROM dbitems.tbl_condition where tbl_product_id = productId);
	
	if SUBSTR(SPECIAL_CONDIT_AUX,1,1) = '1' then
		SET CANNOTBEREDEEM_AUX = 'true';
	else 
		SET CANNOTBEREDEEM_AUX = 'false';
	end if;

	if SUBSTR(SPECIAL_CONDIT_AUX,2,1) = '1' then
		SET BACKORDER_AUX = 'true';
	else 
		SET BACKORDER_AUX = 'false';
	end if;

	if SUBSTR(SPECIAL_CONDIT_AUX,3,1) = '1' then
		SET STOPSELLINGSOLD_AUX = 'true';
	else 
		SET STOPSELLINGSOLD_AUX = 'false';
	end if;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
		CONCAT('"114.144":"',COALESCE(tbl_product.tbl_product_id,''),'"'),
				CONCAT(',"114.112":"',COALESCE(tbl_product.tbl_producttype_id,''),'"'),
				CONCAT(',"53":"',COALESCE(tbl_product.tbl_product_usernmcid,''),'"'),
				CONCAT(',"114.143":"',COALESCE(tbl_product.tbl_productstatus_id,''),'"'),
				CONCAT(',"CA":{',dbitems.getNMCCategory(tbl_category.tbl_category_id),'}'),
				CONCAT(',"IM":[',dbitems.getNMCImage(tbl_productimage.tbl_product_id,99),']'),
				CONCAT(',"121.102":"',COALESCE(tbl_product.tbl_product_sku,''),'"'),
				CONCAT(',"114.104":"',COALESCE(tbl_product.tbl_product_qrCode,''),'"'),
				CONCAT(',"122.131":"',COALESCE(tbl_product.tbl_product_model,''),'"'),
				CONCAT(',"120.103":"',COALESCE(tbl_product.tbl_barcodetype_id,''),'"'),
				CONCAT(',"121.108":"',COALESCE(tbl_product.tbl_product_barcode,''),'"'),
				CONCAT(',"120.83":"',COALESCE(tbl_product.tbl_product_name,''),'"'),
				CONCAT(',"114.149":"',COALESCE(tbl_product.tbl_product_brand,''),'"'),
				CONCAT(',"114.98":"',COALESCE(tbl_product.tbl_product_regularprice,0.0),'"'),
				CONCAT(',"122.158":"',COALESCE(tbl_product.tbl_product_saleprice,0.0),'"'),
				CONCAT(',"122.159":"',COALESCE(tbl_product.tbl_product_rewardprice,0.0),'"'),
				CONCAT(',"122.160":"',COALESCE(tbl_product.tbl_product_salediscount,0.0),'"'),
				CONCAT(',"127.15":"',COALESCE(tbl_product.tbl_product_amount_type_id,34001),'"'),
				CONCAT(',"120.157":"',COALESCE(hex(tbl_product.tbl_product_description),''),'"'),
				CONCAT(',"122.147":"',CANNOTBEREDEEM_AUX,'"'),
				CONCAT(',"122.145":"',BACKORDER_AUX,'"'),
				CONCAT(',"122.146":"',STOPSELLINGSOLD_AUX,'"'),
				CONCAT(',"120.31:"',COALESCE(tbl_product.tbl_product_dateadded,''),'"'),
				
				CONCAT(',"122.144":"',if(tbl_product.tbl_product_quantity > 0,'true','false'),'"'), 
				CONCAT(',"122.148":"',COALESCE(tbl_product.tbl_product_quantity,''),'"'), 
				CONCAT(',"120.40":"',COALESCE(tbl_condition.tbl_conditiontype_id,''),'"'), 
				
				CONCAT(',"DE":[',dbitems.getNMCDelivery(tbl_productdelivery.tbl_product_id),']'),
				CONCAT(',"SH":{',dbitems.getNMCSchedule(tbl_productschedule.tbl_schedule_id),'}'),
				CONCAT(',"LO":[',dbuser.getNMCLocation(tbl_productlocation.tbl_location_id),']'),

				CONCAT(',"121.172":"',COALESCE(hex(tbl_condition.tbl_condition_termsandConditions),''),'"')
	  )
		from dbitems.tbl_product 
		left join dbitems.tbl_productcategory on tbl_productcategory.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_category on  tbl_category.tbl_category_id = tbl_productcategory.tbl_category_id
		left join dbitems.tbl_productimage on  tbl_productimage.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_productlocation on tbl_productlocation.tbl_product_id = tbl_product.tbl_product_id
		left join dbuser.tbl_location on tbl_location.tbl_location_id = tbl_productlocation.tbl_location_id
		left join dbitems.tbl_productschedule on tbl_productschedule.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_schedule on tbl_schedule.tbl_schedule_id = tbl_productschedule.tbl_schedule_id
		left join dbitems.tbl_productdelivery on tbl_productdelivery.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_deliverycompany on tbl_deliverycompany.tbl_deliverycompany_id = tbl_productdelivery.tbl_deliverycompany_id
		left join dbitems.tbl_condition on tbl_condition.tbl_product_id = tbl_product.tbl_product_id 
		
		where tbl_product.tbl_product_id = productId
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemByCategory`(CategoryId int, userId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(',"120.31":"',COALESCE(W.tbl_product_dateadded,''),'"'),
            CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
            CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
        A.tbl_product_dateadded
		from tbl_product as A, tbl_productcategory as B
		where B.tbl_category_id = CategoryId
		and A.tbl_product_id = B.tbl_product_id
        and A.tbl_product_offer_f = 0
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetNMCItemByLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCItemByLocation`(LocationId int, userId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(',"120.31":"',COALESCE(W.tbl_product_dateadded,''),'"'),
            CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
            CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
        A.tbl_product_dateadded
		from tbl_product as A, tbl_productlocation as B
		where B.tbl_location_id = LocationId
		and A.tbl_product_id = B.tbl_product_id
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemByMerchant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemByMerchant`(MerchantId int, userId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(dbitems.getNMCScheduleProduct(W.tbl_product_id)),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image
		from vw_product_by_merchant as A
		where A.tbl_main_user_id = dbuser.GetNMCId(MerchantId)
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001	
        and ValidateNMCProductSchedule(A.tbl_product_id) = 'true'
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemByModule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemByModule`(ModuleId int, Price double(15,2)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

DECLARE merchant_f VARCHAR(5);
DECLARE category_f VARCHAR(5);
DECLARE price_f VARCHAR(5);

set merchant_f = (select(if((select tbl_module_id from dbitems.tbl_module_merchant where tbl_module_id = ModuleId limit 1) is not null,'true','false')));
set category_f = (select(if((select tbl_module_id from dbitems.tbl_module_category where tbl_module_id = ModuleId limit 1) is not null,'true','false')));
set price_f = (select(if((select tbl_module_price from dbitems.tbl_module where tbl_module_id = ModuleId limit 1) is not null,'true','false')));

SET  group_concat_max_len = 10000000;

if ((select tbl_module_type_id from dbitems.tbl_module where tbl_module_id = ModuleId limit 1))=1 then

	SET JSON = ( 

		SELECT  GROUP_CONCAT(distinct
				CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
				CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
				CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
				CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
				CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
				CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
                CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
                CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
				CONCAT(',"114.9":"false"}'))

		from 
		
			(select A.tbl_product_id, 
			A.tbl_producttype_id, 
			A.tbl_product_name, 
			A.tbl_product_regularprice, 
			A.tbl_product_saleprice,
			A.tbl_product_image
			from tbl_product as A, tbl_productcategory as B
			where A.tbl_product_id = B.tbl_product_id
			and if(merchant_f='true', A.tbl_product_usernmcId in ((select tbl_user_id from dbitems.tbl_module_merchant where tbl_module_id = ModuleId)), A.tbl_product_id)
			and if(category_f='true', B.tbl_category_id in ((select tbl_category_id from dbitems.tbl_module_category where tbl_module_id = ModuleId)), A.tbl_product_id)
			and if(price_f='true', A.tbl_product_saleprice <= Price, A.tbl_product_id)
			and A.tbl_producttype_id = 21
			and A.tbl_productstatus_id = 1001	
			order by A.tbl_product_id DESC
			limit 10) as W
		);
		
end if;
		
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemCounterByCategory`(CategoryId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(*) 
	from tbl_product as A, tbl_productcategory as B
	where B.tbl_category_id = CategoryId
	and A.tbl_product_id = B.tbl_product_id
    and A.tbl_product_offer_f = 0
    and A.tbl_producttype_id = 21
	and A.tbl_productstatus_id = 1001	
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemCounterByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemCounterByUser`(UserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(*) 
	from vw_product_by_merchant
	where (select right(tbl_main_user_id,11)) = UserId
	and tbl_productstatus_id = 1001	
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemDiscountApply` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemDiscountApply`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 
SELECT GROUP_CONCAT(

	   CONCAT('{"114.144":"',COALESCE(A.tbl_product_id,''),'"'),  
       CONCAT(',"114.112":"',COALESCE(A.tbl_producttype_id,''),'"'), 
       CONCAT(',"114.143":"',COALESCE(A.tbl_productstatus_id,''),'"'),
       CONCAT(',"120.83":"',COALESCE(A.tbl_product_name,''),'"'),
	   CONCAT(',"IM":[',dbitems.getNMCImage(A.tbl_product_id,3),']}')
	   )
	 
		from tbl_product AS A, tbl_discount_item_applied AS B
		where  A.tbl_product_id = B.tbl_product_id
	    and B.tbl_product_discount_id = productId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemDiscountRequired` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemDiscountRequired`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 
SELECT GROUP_CONCAT(

	   CONCAT('{"114.144":"',COALESCE(A.tbl_product_id,''),'"'),  
       CONCAT(',"114.112":"',COALESCE(A.tbl_producttype_id,''),'"'),
	   CONCAT(',"114.143":"',COALESCE(A.tbl_productstatus_id,''),'"'),
       CONCAT(',"120.83":"',COALESCE(A.tbl_product_name,''),'"'),
	   CONCAT(',"IM":[',dbitems.getNMCImage(A.tbl_product_id,3),']}')
	   )
	 
		from tbl_product AS A, tbl_discount_item_required AS B
		where  A.tbl_product_id = B.tbl_product_id
	    and B.tbl_product_discount_id = productId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemList`(mainuserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE CANNOTBEREDEEM_AUX VARCHAR(10) DEFAULT 0; 				
DECLARE BACKORDER_AUX VARCHAR(10) DEFAULT 0; 
DECLARE STOPSELLINGSOLD_AUX VARCHAR(10) DEFAULT 0; 
DECLARE SPECIAL_CONDIT_AUX VARCHAR(10) DEFAULT 0; 

SET  group_concat_max_len = 10000000;
SET SPECIAL_CONDIT_AUX = (SELECT tbl_condition_code FROM dbitems.tbl_condition where tbl_product_id = productId);
	
	if SUBSTR(SPECIAL_CONDIT_AUX,1,1) = '1' then
		SET CANNOTBEREDEEM_AUX = 'true';
	else 
		SET CANNOTBEREDEEM_AUX = 'false';
	end if;

	if SUBSTR(SPECIAL_CONDIT_AUX,2,1) = '1' then
		SET BACKORDER_AUX = 'true';
	else 
		SET BACKORDER_AUX = 'false';
	end if;

	if SUBSTR(SPECIAL_CONDIT_AUX,3,1) = '1' then
		SET STOPSELLINGSOLD_AUX = 'true';
	else 
		SET STOPSELLINGSOLD_AUX = 'false';
	end if;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
		CONCAT('{"114.144":"',COALESCE(tbl_product.tbl_product_id,''),'"'),
				CONCAT(',"114.112":"',COALESCE(tbl_product.tbl_producttype_id,''),'"'),
				CONCAT(',"53":"',COALESCE(tbl_product.tbl_product_usernmcid,''),'"'),
				CONCAT(',"114.143":"',COALESCE(tbl_product.tbl_productstatus_id,''),'"'),
				CONCAT(',"CA":{',dbitems.getNMCCategory(tbl_category.tbl_category_id),'}'),
				CONCAT(',"IM":[',dbitems.getNMCImage(tbl_productimage.tbl_product_id,99),']'),
				CONCAT(',"121.102":"',COALESCE(tbl_product.tbl_product_sku,''),'"'),
				CONCAT(',"114.104":"',COALESCE(tbl_product.tbl_product_qrCode,''),'"'),
				CONCAT(',"122.131":"',COALESCE(tbl_product.tbl_product_model,''),'"'),
				CONCAT(',"120.103":"',COALESCE(tbl_product.tbl_barcodetype_id,''),'"'),
				CONCAT(',"121.108":"',COALESCE(tbl_product.tbl_product_barcode,''),'"'),
				CONCAT(',"120.83":"',COALESCE(tbl_product.tbl_product_name,''),'"'),
				CONCAT(',"114.149":"',COALESCE(tbl_product.tbl_product_brand,''),'"'),
				CONCAT(',"114.98":"',COALESCE(tbl_product.tbl_product_regularprice,0.0),'"'),
				CONCAT(',"122.158":"',COALESCE(tbl_product.tbl_product_saleprice,0.0),'"'),
				CONCAT(',"122.159":"',COALESCE(tbl_product.tbl_product_rewardprice,0.0),'"'),
				CONCAT(',"122.160":"',COALESCE(tbl_product.tbl_product_salediscount,0.0),'"'),
				CONCAT(',"127.15":"',COALESCE(tbl_product.tbl_product_amount_type_id,34001),'"'),
				CONCAT(',"120.157":"',COALESCE(hex(tbl_product.tbl_product_description),''),'"'),
				CONCAT(',"122.147":"',CANNOTBEREDEEM_AUX,'"'),
				CONCAT(',"122.145":"',BACKORDER_AUX,'"'),
				CONCAT(',"122.146":"',STOPSELLINGSOLD_AUX,'"'),
				CONCAT(',"120.31:"',COALESCE(tbl_product.tbl_product_dateadded,''),'"'),
				
				CONCAT(',"122.144":"',if(tbl_product.tbl_product_quantity > 0,'true','false'),'"'), 
				CONCAT(',"122.148":"',COALESCE(tbl_product.tbl_product_quantity,''),'"'), 
				CONCAT(',"120.40":"',COALESCE(tbl_condition.tbl_conditiontype_id,''),'"'), 
				
				CONCAT(',"DE":[',dbitems.getNMCDelivery(tbl_productdelivery.tbl_product_id),']'),
				CONCAT(',"SH":{',dbitems.getNMCSchedule(tbl_productschedule.tbl_schedule_id),'}'),
				CONCAT(',"LO":[',dbuser.getNMCLocation(tbl_productlocation.tbl_location_id),']'),

				CONCAT(',"121.172":"',COALESCE(hex(tbl_condition.tbl_condition_termsandConditions),''),'"}')
	  )
		from dbitems.vw_product_by_merchant as tbl_product
		left join dbitems.tbl_productcategory on tbl_productcategory.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_category on  tbl_category.tbl_category_id = tbl_productcategory.tbl_category_id
		left join dbitems.tbl_productimage on  tbl_productimage.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_productlocation on tbl_productlocation.tbl_product_id = tbl_product.tbl_product_id
		left join dbuser.tbl_location on tbl_location.tbl_location_id = tbl_productlocation.tbl_location_id
		left join dbitems.tbl_productschedule on tbl_productschedule.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_schedule on tbl_schedule.tbl_schedule_id = tbl_productschedule.tbl_schedule_id
		left join dbitems.tbl_productdelivery on tbl_productdelivery.tbl_product_id = tbl_product.tbl_product_id
		left join dbitems.tbl_deliverycompany on tbl_deliverycompany.tbl_deliverycompany_id = tbl_productdelivery.tbl_deliverycompany_id
		left join dbitems.tbl_condition on tbl_condition.tbl_product_id = tbl_product.tbl_product_id 
		
		where tbl_product.tbl_main_user_id = mainuserId
		and tbl_product.tbl_productstatus_id = 1001
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemMembership` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemMembership`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 
SELECT GROUP_CONCAT(

	   CONCAT('{"114.144":"',COALESCE(A.tbl_product_id,''),'",'),  
       CONCAT('"114.112":"',COALESCE(A.tbl_producttype_id,''),'",'), 
	   CONCAT('"IM":[',dbitems.getNMCImage(A.tbl_product_id,3),'],'),
	   CONCAT('"120.83":"',COALESCE(A.tbl_product_name,''),'"}'))
	 
		from tbl_product AS A, tbl_productmembership AS B
		where  A.tbl_product_id = B.tbl_productmembership_membershipId
	    and B.tbl_productmembershipId = productId
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
/*!50003 DROP FUNCTION IF EXISTS `GetNMCItemRatingAverage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCItemRatingAverage`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select avg(tbl_review_rating - 2100) 
    from dbitems.tbl_review 
    where tbl_product_id = productId
    
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
/*!50003 DROP FUNCTION IF EXISTS `GetNMCItemReviewCounter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCItemReviewCounter`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(tbl_review_rating) 
    from dbitems.tbl_review 
    where tbl_product_id = productId
    
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemSpecialByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemSpecialByCategory`(CategoryId int, userId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(',"120.31":"',COALESCE(W.tbl_product_dateadded,''),'"'),
            CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
            CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
        A.tbl_product_dateadded
		from tbl_product as A, tbl_productcategory as B
		where B.tbl_category_id = CategoryId
		and A.tbl_product_id = B.tbl_product_id
        and A.tbl_product_offer_f = 1
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCItemSpecialCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCItemSpecialCounterByCategory`(CategoryId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(*) 
	from tbl_product as A, tbl_productcategory as B
	where B.tbl_category_id = CategoryId
	and A.tbl_product_id = B.tbl_product_id
    and A.tbl_product_offer_f = 1
    and A.tbl_producttype_id = 21
	and A.tbl_productstatus_id = 1001	
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCLocalizationPackageByPackageId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCLocalizationPackageByPackageId`(PackageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

SELECT 
 
GROUP_CONCAT(distinct
	   CONCAT('{"CI":{',dbuser.getNMCCity(A.tbl_city_id),'}') ,
	   CONCAT(',"CO":{',dbuser.getNMCCountry(A.tbl_country_id),'}') ,
	   CONCAT(',"ST":{',dbuser.getNMCStates(A.tbl_state_id),'}')  ,
	   CONCAT(',"ZP":{',dbuser.getNMCZipCode(A.tbl_zipcode_id),'}')  ,
	   CONCAT(',"127.103":"',COALESCE(A.tbl_packagelocalization_id,''),'"}'))


			
		from tbl_packagelocalization AS A
		where A.tbl_package_id = PackageId
		
	
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCLocalizationShuffleByshuffleId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCLocalizationShuffleByshuffleId`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

SELECT 
 
GROUP_CONCAT(distinct
	   CONCAT('{"CI":{',dbuser.getNMCCity(A.tbl_city_id),'}') ,
	   CONCAT(',"CO":{',dbuser.getNMCCountry(A.tbl_country_id),'}') ,
	   CONCAT(',"ST":{',dbuser.getNMCStates(A.tbl_state_id),'}')  ,
	   CONCAT(',"ZP":{',dbuser.getNMCZipCode(A.tbl_zipcode_id),'}')  ,
	   CONCAT(',"127.103":"',COALESCE(A.tbl_shufflelocalization_id,''),'"}'))


			
		from tbl_shufflelocalization AS A
		where A.tbl_shuffle_id = shuffleId
		
	
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCMerchantAdvertisingCounterFormobile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCMerchantAdvertisingCounterFormobile`(MerchantId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		SET JSON = ( 

		SELECT (count(W.advertising_id) 
				)
					from
					(select distinct A.advertising_id
					from vw_advertising as A 
					left join tbl_shuffle_advertising as B on A.advertising_id = B.tbl_advertising_id 
					left join tbl_package_shuffle as C on B.tbl_shuffle_id = C.tbl_shuffle_id
					where C.tbl_shuffle_broadcast_mobile = 1 
					and ValidateNMCShuffleSchedule(C.tbl_shuffle_id) = 'true' 
					and A.status = 60001 and A.productid = 0
					and A.usernmcid=(select right(dbuser.GetMainUser((select right(MerchantId,11))),11))
				   ) as W			);

	


IF JSON is NULL THEN
	SET JSON = 0;
END IF;

 
RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCOfferappliedToItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCOfferappliedToItem`(ProductId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

DECLARE OFFER_ID INT(11) DEFAULT 0;
DECLARE OFFER_ID_PERCETAGE INT(11) DEFAULT 0;
DECLARE DISCOUNT_TYPE INT(11) DEFAULT 0;
DECLARE DISCOUNT_QUANTITY DOUBLE DEFAULT 0;
DECLARE SALEPRICEAUX DOUBLE DEFAULT 0;


SET  group_concat_max_len = 10000000;

SET OFFER_ID = (select tbl_product_discount_id from tbl_discount_item_applied WHERE tbl_product_id = ProductId LIMIT 1);
SET DISCOUNT_TYPE = (SELECT tbl_discount_type_id FROM dbitems.tbl_product_discount WHERE  tbl_product_discount_id =OFFER_ID LIMIT 1);
SET DISCOUNT_QUANTITY = (SELECT tbl_discount_type_number FROM dbitems.tbl_product_discount WHERE  tbl_product_discount_id =OFFER_ID  LIMIT 1);
SET SALEPRICEAUX = (SELECT tbl_product_saleprice FROM dbitems.tbl_product WHERE tbl_product_id = ProductId LIMIT 1 );


	case DISCOUNT_TYPE

		when 38001 then 

			if  DISCOUNT_QUANTITY IS NOT NULL OR DISCOUNT_QUANTITY !='' THEN
				SET OFFER_ID_PERCETAGE = (SELECT (SALEPRICEAUX * DISCOUNT_QUANTITY )/100 );
				SET JSON = (SELECT (SALEPRICEAUX - OFFER_ID_PERCETAGE ));
			else
				SET JSON = SALEPRICEAUX;
			END IF;

		ELSE
			
			if  DISCOUNT_QUANTITY IS NOT NULL OR DISCOUNT_QUANTITY !='' THEN
				SET JSON = (SELECT (SALEPRICEAUX - DISCOUNT_QUANTITY ));
			else
				SET JSON = SALEPRICEAUX;
			END IF;
	end CASE ;


IF JSON IS NULL OR JSON <= 0 THEN
	SET JSON = SALEPRICEAUX;
END IF;


RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCOption`(productId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 
SELECT GROUP_CONCAT(distinct
	   CONCAT('{"121.179":"',COALESCE(B.tbl_productoption_id,''),'"'),
	   CONCAT(',"CH":[',dbitems.getNMCChoice(A.tbl_productoption_id),']'),
	   CONCAT(',"122.134":"',COALESCE(A.tbl_productoption_name,''),'"}'))			
			
		from tbl_productoption AS A,
			 tbl_productattribute AS B
		where B.tbl_productoption_id = A.tbl_productoption_id
		and   B.tbl_product_id = productId 
		
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
/*!50003 DROP FUNCTION IF EXISTS `GetNMCPackageByLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCPackageByLocation`(locationId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
 
	SET JSON = ( 


		SELECT GROUP_CONCAT(distinct
		CONCAT('{"114.101":"',C.tbl_package_id,'"'),
		CONCAT(',"114.156":"',C.tbl_package_name,'"'),
		CONCAT(',"114.143":"',C.tbl_packagestatus_id,'"'),
        CONCAT(',"127.94":"', if(B.tbl_shuffle_published = 1,'true','false'),'"}')

		)

		from dbitems.tbl_shufflelocation as A 
        left join dbitems.tbl_package_shuffle as B on A.tbl_shuffle_id = B.tbl_shuffle_id
        left join dbitems.tbl_package as C on B.tbl_package_id = C.tbl_package_id

		where A.tbl_location_id  = locationId
        and C.tbl_packagestatus_id = 66001
        and B.tbl_shuffle_published = 1
        and dbitems.ValidateNMCShuffleSchedule(A.tbl_shuffle_id) = 'true'
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
/*!50003 DROP FUNCTION IF EXISTS `GetNMCPackageByTerminal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCPackageByTerminal`(terminalId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
 
	SET JSON = ( 

		SELECT GROUP_CONCAT(distinct
		CONCAT('{"114.101":"',C.tbl_package_id,'"'),
		CONCAT(',"114.156":"',C.tbl_package_name,'"'),
		CONCAT(',"114.143":"',C.tbl_packagestatus_id,'"'),
        CONCAT(',"127.94":"', if(B.tbl_shuffle_published = 1,'true','false'),'"}')

		)

		from dbitems.tbl_shuffleterminal as A 
        left join dbitems.tbl_package_shuffle as B on A.tbl_shuffle_id = B.tbl_shuffle_id
        left join dbitems.tbl_package as C on B.tbl_package_id = C.tbl_package_id

		where A.tbl_terminal_id  = terminalId
        and C.tbl_packagestatus_id = 66001
        and B.tbl_shuffle_published = 1
        and dbitems.ValidateNMCShuffleSchedule(A.tbl_shuffle_id) = 'true'
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminDislikesCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminDislikesCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;

SET  group_concat_max_len = 10000000;


		SET JSON = ( 
					
				(select count(A.tbl_advertising_id) 
					from dbitems.tbl_advertisingfavorite as A
					-- , tbl_shuffle_advertising as B
					where A.tbl_advertising_id 
						-- = B.tbl_advertising_id
					and A.tbl_shuffle_id = shuffleId
					and A.tbl_advertisingfavorite_like = 0
					)
			
				);

			
				
	
	
	
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminEndDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminEndDate`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	(select tbl_shuffle_schedule_endDate 
	from dbitems.tbl_shuffle_schedule as A
	where A.tbl_shuffle_id =  shuffleId
	limit 1)
); 
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminImagesCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminImagesCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;


SET JSON = ( 



	(select count(A.tbl_advertising_id) 
		from tbl_advertising as A, tbl_shuffle_advertising as B
		where A.tbl_advertising_id = B.tbl_advertising_id
		and B.tbl_shuffle_id = shuffleId
		and  A.tbl_product_id is null
		and A.tbl_advertisingimage_id is not null
		)
); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminItemsCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminItemsCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;


SET JSON = ( 



	(select count(A.tbl_advertising_id) 
		from tbl_advertising as A, tbl_shuffle_advertising as B
		where A.tbl_advertising_id = B.tbl_advertising_id
		and B.tbl_shuffle_id = shuffleId
		and  A.tbl_product_id is not null
		)
); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminLikesCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminLikesCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;




			
		SET JSON = ( 
					
				(select count(A.tbl_advertising_id) 
					from dbitems.tbl_advertisingfavorite as A
					-- , tbl_shuffle_advertising as B
					where A.tbl_advertising_id 
					-- = B.tbl_advertising_id
					and A.tbl_shuffle_id = shuffleId
					and  A.tbl_advertisingfavorite_like = 1
					)
			
				);
	
	
	
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminLocationsCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminLocationsCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;


SET JSON = ( 



	(select count(A.tbl_shuffle_id) 
		from tbl_shufflelocation as A
		where A.tbl_shuffle_id = shuffleId
		
		)
); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminTerminalCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminTerminalCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;

SET  group_concat_max_len = 10000000;


		SET JSON = ( 

			SELECT count(distinct Q.tbl_terminal_id)
			from (

			SELECT distinct

			tbl_terminal.tbl_terminal_id
			FROM dbuser.tbl_terminal LEFT JOIN dbitems.tbl_shuffleterminal on tbl_terminal.tbl_terminal_id = tbl_shuffleterminal.tbl_terminal_id
			where tbl_shuffleterminal.tbl_shuffle_id  = shuffleId

			union

			SELECT distinct
			tbl_terminal.tbl_terminal_id			
			FROM dbuser.tbl_terminal LEFT JOIN dbitems.tbl_shufflelocation on tbl_terminal.tbl_location_id = tbl_shufflelocation.tbl_location_id
			where tbl_shufflelocation.tbl_shuffle_id  = shuffleId
			and  tbl_shufflelocation_allterminal_f = 1



			) AS Q
				);
	
	
	
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardAdminVideosCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardAdminVideosCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;


SET JSON = ( 



	(select count(A.tbl_advertising_id) 
		from tbl_advertising as A, tbl_shuffle_advertising as B
		where A.tbl_advertising_id = B.tbl_advertising_id
		and B.tbl_shuffle_id = shuffleId
		and  A.tbl_product_id is null
		and A.tbl_file_id is not null
		)
); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantDislikesCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantDislikesCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;


DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;


SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);





		SET JSON = ( 
					
				(select count(A.tbl_advertising_id) 
					from dbitems.tbl_advertisingfavorite as A
					-- , tbl_shuffle_advertising as B
					where A.tbl_advertising_id
						-- = B.tbl_advertising_id
					and A.tbl_shuffle_id = SHUFFLE_ID
					and  A.tbl_advertisingfavorite_like = 0
					)
			
				);

			
				
	
	
	
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantEndDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantEndDate`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	(select tbl_shuffle_schedule_endDate 
	from dbitems.tbl_shuffle_schedule as A, 
	dbitems.tbl_package_shuffle as B 

	where A.tbl_shuffle_id =  B.tbl_shuffle_id
	and B.tbl_package_id = packageId


	limit 1)
); 
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantImagesCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantImagesCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;


SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);

SET JSON = ( 



	(select count(D.tbl_image_id) 
	from dbitems.tbl_package as A 
    left join dbitems.tbl_package_layout as B on A.tbl_package_id = B.tbl_package_id
    left join dbitems.tbl_package_layout_component as C on B.tbl_layout_id = C.tbl_layout_id
    left join dbitems.tbl_package_layout_component_playlist as D on C.tbl_component_id = D.tbl_component_id

	where A.tbl_package_id = packageId
    and D.tbl_broadcast_f = 1
		)
); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantItemsCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantItemsCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;


SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);

SET JSON = ( 



	(select count(D.tbl_product_id) 
	from dbitems.tbl_package as A 
    left join dbitems.tbl_package_layout as B on A.tbl_package_id = B.tbl_package_id
    left join dbitems.tbl_package_layout_component as C on B.tbl_layout_id = C.tbl_layout_id
    left join dbitems.tbl_package_layout_component_playlist as D on C.tbl_component_id = D.tbl_component_id

	where A.tbl_package_id = packageId
    and D.tbl_broadcast_f = 1
		)
); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantLikesCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantLikesCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;


DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;


SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);

			
		SET JSON = ( 
					
				(select count(A.tbl_advertising_id) 
					from dbitems.tbl_advertisingfavorite as A
						-- , tbl_shuffle_advertising as B
					where A.tbl_advertising_id 
						-- = B.tbl_advertising_id
					and A.tbl_shuffle_id = SHUFFLE_ID
					and  tbl_advertisingfavorite_like = 1
					)
			
				);
	
	
	
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantLocationsCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantLocationsCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;


SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);

SET JSON = ( 



	(select count(A.tbl_shuffle_id) 
		from tbl_shufflelocation as A
		where A.tbl_shuffle_id = SHUFFLE_ID
		
		)
); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantRepublishedCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantRepublishedCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;
DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;
SET  group_concat_max_len = 10000000;
SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);

		SET JSON = ( 
					
				(select A.tbl_shuffle_republished_count
					from dbitems.tbl_package_shuffle as A
					where  A.tbl_shuffle_id = SHUFFLE_ID
					
					)
			
				);

IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantStartDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantStartDate`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	(select tbl_shuffle_schedule_startDate 
	from dbitems.tbl_shuffle_schedule as A, 
	dbitems.tbl_package_shuffle as B 

	where A.tbl_shuffle_id =  B.tbl_shuffle_id
	and B.tbl_package_id = packageId


	limit 1)
); 
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantTerminalCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantTerminalCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;


DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;


SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);





		SET JSON = ( 

			SELECT count(distinct Q.tbl_terminal_id)
			from (

			SELECT distinct

			tbl_terminal.tbl_terminal_id
			FROM dbuser.tbl_terminal LEFT JOIN dbitems.tbl_shuffleterminal on tbl_terminal.tbl_terminal_id = tbl_shuffleterminal.tbl_terminal_id
			where tbl_shuffleterminal.tbl_shuffle_id  = SHUFFLE_ID

			union

			SELECT distinct
			tbl_terminal.tbl_terminal_id			
			FROM dbuser.tbl_terminal LEFT JOIN dbitems.tbl_shufflelocation on tbl_terminal.tbl_location_id = tbl_shufflelocation.tbl_location_id
			where tbl_shufflelocation.tbl_shuffle_id  = SHUFFLE_ID
			and  tbl_shufflelocation_allterminal_f = 1



			) AS Q
				);
	
	
	
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPackageDashboardMerchantVideosCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPackageDashboardMerchantVideosCount`(packageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE SHUFFLE_ID INTEGER(11) DEFAULT 0;


SET  group_concat_max_len = 10000000;


SET  SHUFFLE_ID = (SELECT  tbl_shuffle_id FROM tbl_package_shuffle WHERE tbl_package_id = packageId limit 1);

SET JSON = ( 

	(select count(D.tbl_file_id) 
	from dbitems.tbl_package as A 
    left join dbitems.tbl_package_layout as B on A.tbl_package_id = B.tbl_package_id
    left join dbitems.tbl_package_layout_component as C on B.tbl_layout_id = C.tbl_layout_id
    left join dbitems.tbl_package_layout_component_playlist as D on C.tbl_component_id = D.tbl_component_id

	where A.tbl_package_id = packageId
    and D.tbl_broadcast_f = 1
    
		)

); 
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetNMCPackageSize` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCPackageSize`(PackageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

DECLARE IMAGE_SIZE INT(11);
DECLARE FILE_SIZE INT(11);

SET IMAGE_SIZE = COALESCE((SELECT sum(D.tbl_advertisingimage_size) from tbl_package_layout as A, tbl_package_layout_component as B, tbl_package_layout_component_playlist as C, tbl_advertisingimage as D where A.tbl_package_id = PackageId and A.tbl_layout_id = B.tbl_layout_id and B.tbl_component_id = C.tbl_component_id and C.tbl_image_id = D.tbl_advertisingimage_id),0);

SET FILE_SIZE = COALESCE((SELECT sum(D.tbl_file_size) from tbl_package_layout as A, tbl_package_layout_component as B, tbl_package_layout_component_playlist as C, tbl_file as D where A.tbl_package_id = PackageId and A.tbl_layout_id = B.tbl_layout_id and B.tbl_component_id = C.tbl_component_id and C.tbl_file_id = D.tbl_file_id),0);


SET  group_concat_max_len = 10000000;

SET JSON = (IMAGE_SIZE + FILE_SIZE);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCPaymentServiceProvider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPaymentServiceProvider`(paymentServiceProviderId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 


SELECT GROUP_CONCAT(
		CONCAT('"114.73":"',COALESCE(A.tbl_paymentserviceprovider_id,''),'"'),
	    CONCAT(',"121.72":"',COALESCE(A.tbl_paymentserviceprovider_name,''),'"'),
		CONCAT(',"123.64":"',COALESCE(A.tbl_paymentserviceprovidertype_id,''),'"')
		)
		
		from tbl_paymentserviceprovider as A

		where A.tbl_paymentserviceprovider_id = paymentServiceProviderId 
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCPaymentServiceProviderUnsupported` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCPaymentServiceProviderUnsupported`(unsupportedId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON MEDIUMTEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 


SELECT GROUP_CONCAT(
		CONCAT('"122.4":"',COALESCE(A.tbl_paymentserviceprovider_unsupported_id,''),'"'),
	    CONCAT(',"122.121":"',COALESCE(A.tbl_paymentserviceprovider_unsupported_providername,''),'"'),
		CONCAT(',"122.120":"',COALESCE(A.tbl_paymentserviceprovider_unsupported_contactname,''),'"'),
		CONCAT(',"114.156":"',COALESCE(A.tbl_paymentserviceprovider_unsupported_fileName,''),'"'),
		CONCAT(',"121.140":"',COALESCE(A.tbl_paymentserviceprovider_unsupported_dateCreated,''),'"'),
		CONCAT(',"123.64":"',COALESCE(A.tbl_paymentserviceprovidertype_id,''),'"'),
		CONCAT(',"PH":{',dbuser.getNMCPhoneRoot(A.tbl_phone_id),'}')
		)
		
		from tbl_paymentserviceprovider_unsupported as A
		left join dbuser.tbl_phone as B on A.tbl_phone_id = B.tbl_phone_id

		where A.tbl_paymentserviceprovider_unsupported_id = unsupportedId 
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCSavedItemByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSavedItemByCategory`(CategoryId int, userId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(',"120.31":"',COALESCE(W.tbl_product_dateadded,''),'"'),
            CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
            CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
        A.tbl_product_dateadded
		from tbl_productfav as C, tbl_product as A, tbl_productcategory as B
		where C.tbl_productfav_nmcid = userId
		and B.tbl_category_id = CategoryId
		and C.tbl_product_id = A.tbl_product_id
		and A.tbl_product_id = B.tbl_product_id
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCSavedItemCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSavedItemCounterByCategory`(CategoryId int, userId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(*) 
	from tbl_productfav as C, tbl_product as A, tbl_productcategory as B
	where C.tbl_productfav_nmcid = userId
	and B.tbl_category_id = CategoryId
	and C.tbl_product_id = A.tbl_product_id
	and A.tbl_product_id = B.tbl_product_id
    and A.tbl_producttype_id = 21
	and A.tbl_productstatus_id = 1001	
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSchedule`(scheduleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 
SELECT GROUP_CONCAT(

	   CONCAT('"127.63":"',COALESCE(A.tbl_schedule_id,''),'"'), 
	   CONCAT(',"114.138":"',COALESCE(A.tbl_schedule_startdate,''),'"'), 
       CONCAT(',"114.139":"',COALESCE(A.tbl_schedule_enddate,''),'"') , 
	   CONCAT(',"122.127":"',COALESCE(CONCAT(tbl_schedule_monday,tbl_schedule_tuesday,tbl_schedule_wendsday,tbl_schedule_thursday,tbl_schedule_friday,tbl_schedule_saturday,tbl_schedule_sunday),''),'"'),
	   CONCAT(',"127.64":"',COALESCE(A.tbl_schedule_starttime,''),'"'), 
	   CONCAT(',"127.65":"',COALESCE(A.tbl_schedule_endtime,''),'"'))

		from tbl_schedule AS A 
		where A.tbl_schedule_id = scheduleId 
		
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCScheduleCatalog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCScheduleCatalog`(catalogID int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE JSON2 MEDIUMTEXT;
DECLARE JSONFINAL MEDIUMTEXT;


DECLARE DATESTART VARCHAR(20) DEFAULT NULL; 
DECLARE DATEEND VARCHAR(20) DEFAULT NULL; 		

SET  group_concat_max_len = 10000000;

set DATESTART = (select tbl_catalog_schedule_startDate from tbl_catalog_schedule where tbl_catalog_id =  catalogID limit 1);

	
set DATEEND = (select tbl_catalog_schedule_endDate from tbl_catalog_schedule where tbl_catalog_id =  catalogID limit 1);


SET JSON = ( 

SELECT 
 
GROUP_CONCAT(distinct
 
		CONCAT('{"127.89":"',COALESCE(tbl_week_day_id,''),'"') , 
		CONCAT(',"127.90":"',if(SUBSTR(tbl_24_hour,1,1) = 0,'false','true'),'"') , 	   
		CONCAT(',"127.91":"',if(SUBSTR(tbl_closed_flag,1,1) = 1,'true','false'),'"') ,
		CONCAT(',"127.64":"',COALESCE(tbl_hour_open,'00:00:00'),'"') ,
		CONCAT(',"127.65":"',COALESCE(tbl_hour_close,'00:00:00'),'"}'))

		from tbl_week_day left Join tbl_catalog_schedule on tbl_day_of_the_week = tbl_week_day_id
		and tbl_catalog_id = catalogID
	
	
);

IF JSON is NULL THEN
	SET JSON = '';
END IF;

IF DATESTART is NULL THEN
	SET DATESTART = UTC_DATE();
END IF;

IF DATEEND is NULL THEN
	SET DATEEND = '';
END IF;

SET JSONFINAL = (select GROUP_CONCAT(
				CONCAT(',"SP":{"114.138":"',coalesce(DATESTART),'"'),
				CONCAT(',"114.139":"',DATEEND,'"'),
				CONCAT(',"SL":[',JSON,']}'))
);

RETURN JSONFINAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCSchedulePackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSchedulePackage`(PackageID int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE JSON2 MEDIUMTEXT;
DECLARE JSONFINAL MEDIUMTEXT;
 

DECLARE DATESTART VARCHAR(20) DEFAULT NULL; 
DECLARE DATEEND VARCHAR(20) DEFAULT NULL; 		

SET  group_concat_max_len = 10000000;

set DATESTART = (select tbl_package_schedule_startDate from tbl_package_schedule where tbl_package_id =  packageID limit 1);
set DATEEND = (select tbl_package_schedule_endDate from tbl_package_schedule where tbl_package_id =  packageID limit 1);


SET JSON = ( 

SELECT 
 
GROUP_CONCAT(distinct
 
		CONCAT('{"127.89":"',COALESCE(tbl_week_day_id,''),'"') , 
		CONCAT(',"127.90":"',if(SUBSTR(tbl_24_hour,1,1) = 1,'true','false'),'"') , 	   
		CONCAT(',"127.91":"',if(SUBSTR(tbl_closed_flag,1,1) = 1,'true','false'),'"') ,
		CONCAT(',"127.64":"',COALESCE(tbl_hour_open,'00:00:00'),'"') ,
		CONCAT(',"127.65":"',COALESCE(tbl_hour_close,'00:00:00'),'"}'))

		from tbl_week_day left Join tbl_package_schedule on tbl_day_of_the_week = tbl_week_day_id
		and tbl_package_id = PackageID
	
	
);

IF JSON is NULL THEN
	SET JSON = '';
END IF;

IF DATESTART is NULL THEN
	SET DATESTART = '';
END IF;

IF DATEEND is NULL THEN
	SET DATEEND = '';
END IF;

SET JSONFINAL = (select GROUP_CONCAT(
				CONCAT(',"SP":{"114.138":"',DATESTART,'"'),
				CONCAT(',"114.139":"',DATEEND,'"'),
				CONCAT(',"SL":[',JSON,']}'))
);

RETURN JSONFINAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCScheduleProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCScheduleProduct`(productID int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE JSON2 MEDIUMTEXT;
DECLARE JSONFINAL MEDIUMTEXT;


DECLARE DATESTART VARCHAR(20) DEFAULT NULL; 
DECLARE DATEEND VARCHAR(20) DEFAULT NULL; 		

SET  group_concat_max_len = 10000000;

set DATESTART = (select tbl_product_schedule_startDate from tbl_product_schedule where tbl_product_id =  productID limit 1);
set DATEEND = (select tbl_product_schedule_endDate from tbl_product_schedule where tbl_product_id =  productID limit 1);


SET JSON = ( 

SELECT 
 
GROUP_CONCAT(distinct
 
		CONCAT('{"127.89":"',COALESCE(tbl_week_day_id,''),'"') , 
		CONCAT(',"127.90":"',if(SUBSTR(tbl_24_hour,1,1) = 0,'false','true'),'"') , 	   
		CONCAT(',"127.91":"',if(SUBSTR(tbl_closed_flag,1,1) = 1,'true','false'),'"') ,
		CONCAT(',"120.12":"',COALESCE(tbl_timezone,'+0000000000'),'"') ,
        CONCAT(',"127.64":"',COALESCE(tbl_hour_open,'00:00:00'),'"') ,
		CONCAT(',"127.65":"',COALESCE(tbl_hour_close,'00:00:00'),'"}'))

		
		
		from tbl_week_day left Join tbl_product_schedule on tbl_day_of_the_week = tbl_week_day_id	
		and  tbl_product_id = productID
	
	
);

IF JSON is NULL THEN
	SET JSON = '';
END IF;


IF DATESTART is NULL THEN
	SET DATESTART = UTC_DATE();
END IF;

IF DATEEND is NULL THEN
	SET DATEEND = '';
END IF;

SET JSONFINAL = (select GROUP_CONCAT(
				CONCAT(',"SP":{"114.138":"',DATESTART,'"'),
				CONCAT(',"114.139":"',DATEEND,'"'),
				CONCAT(',"SL":[',JSON,']}'))
);

RETURN JSONFINAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCScheduleProductOffer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCScheduleProductOffer`(productID int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE JSON2 MEDIUMTEXT;
DECLARE JSONFINAL MEDIUMTEXT;


DECLARE DATESTART VARCHAR(20) DEFAULT NULL; 
DECLARE DATEEND VARCHAR(20) DEFAULT NULL; 		

SET  group_concat_max_len = 10000000;

set DATESTART = (select tbl_start_date from tbl_productoffer_schedule where tbl_product_id =  productID limit 1);
set DATEEND = (select tbl_end_date from tbl_productoffer_schedule where tbl_product_id =  productID limit 1);


SET JSON = ( 

SELECT 
 
GROUP_CONCAT(distinct
 
		CONCAT('{"127.89":"',COALESCE(tbl_week_day_id,''),'"') , 
		CONCAT(',"127.90":"',if(SUBSTR(tbl_24_hour,1,1) = 0,'false','true'),'"') , 	   
		CONCAT(',"127.91":"',if(SUBSTR(tbl_closed_flag,1,1) = 1,'true','false'),'"') ,
        CONCAT(',"120.12":"',COALESCE(tbl_timezone,'+0000000000'),'"') ,
		CONCAT(',"127.64":"',COALESCE(tbl_hour_open,'00:00:00'),'"') ,
		CONCAT(',"127.65":"',COALESCE(tbl_hour_close,'00:00:00'),'"}'))

		
		
		from tbl_week_day left Join tbl_productoffer_schedule on tbl_day_of_the_week = tbl_week_day_id	
		and  tbl_product_id = productID
	
	
);

IF JSON is NULL THEN
	SET JSON = '';
END IF;


IF DATESTART is NULL THEN
	SET DATESTART = UTC_DATE();
END IF;

IF DATEEND is NULL THEN
	SET DATEEND = '';
END IF;

SET JSONFINAL = (select GROUP_CONCAT(
				CONCAT(',"SO":{"114.138":"',DATESTART,'"'),
				CONCAT(',"114.139":"',DATEEND,'"'),
				CONCAT(',"SL":[',JSON,']}'))
);

RETURN JSONFINAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCScheduleShuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCScheduleShuffle`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE JSON2 MEDIUMTEXT;
DECLARE JSONFINAL MEDIUMTEXT;
 

DECLARE DATESTART VARCHAR(20) DEFAULT NULL; 
DECLARE DATEEND VARCHAR(20) DEFAULT NULL; 		

SET  group_concat_max_len = 10000000;

set DATESTART = (select tbl_shuffle_schedule_startDate from tbl_shuffle_schedule where tbl_shuffle_id =  shuffleID limit 1);
set DATEEND = (select tbl_shuffle_schedule_endDate from tbl_shuffle_schedule where tbl_shuffle_id =  shuffleID limit 1);


SET JSON = ( 

SELECT 
 
GROUP_CONCAT(distinct
 
		CONCAT('{"127.89":"',COALESCE(tbl_week_day_id,''),'"') , 
		CONCAT(',"127.90":"',COALESCE(tbl_24_hour,'false'),'"') , 	   
		CONCAT(',"127.91":"',COALESCE(tbl_closed_flag,'true'),'"') ,
		CONCAT(',"120.12":"',COALESCE(tbl_timezone,'+0000000000'),'"') ,
		CONCAT(',"127.64":"',COALESCE(tbl_hour_open,'09:00:00'),'"') ,
		CONCAT(',"127.65":"',COALESCE(tbl_hour_close,'21:00:00'),'"}'))
        
		from tbl_week_day left Join tbl_shuffle_schedule on tbl_day_of_the_week = tbl_week_day_id
		and tbl_shuffle_id = ShuffleId
	
	
);

IF JSON is NULL THEN
	SET JSON = '';
END IF;

IF DATESTART is NULL THEN
	SET DATESTART = '';
END IF;

IF DATEEND is NULL THEN
	SET DATEEND = '';
END IF;

SET JSONFINAL = (select GROUP_CONCAT(
				CONCAT(',"SP":{"114.138":"',DATESTART,'"'),
				CONCAT(',"114.139":"',DATEEND,'"'),
				CONCAT(',"SL":[',JSON,']}'))
);

RETURN JSONFINAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetNMCShoppingCartTotalAmount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetNMCShoppingCartTotalAmount`(shoppingCartId int) RETURNS mediumtext CHARSET utf8
BEGIN


DECLARE JSON TEXT DEFAULT NULL;

DECLARE de_ITEM TEXT DEFAULT NULL;
DECLARE de_ITEMPRICE TEXT DEFAULT NULL;
DECLARE de_QUANTITY TEXT DEFAULT NULL;
DECLARE de_CHOICES TEXT DEFAULT NULL;

DECLARE ITEM_ID INT(11) DEFAULT NULL;
DECLARE ITEM_PRICE DECIMAL(15,2) DEFAULT 0.00;
DECLARE ITEM_QTY INT(11) DEFAULT NULL;
DECLARE CADENACHOICES TEXT DEFAULT NULL;
DECLARE CHOICE_ID INT(11) DEFAULT NULL;
DECLARE CHOICEPRICE DECIMAL(15,2) DEFAULT 0.00;
DECLARE CHOICEAMOUNT DECIMAL(15,2) DEFAULT 0.00;

DECLARE ITEMAMOUNT DECIMAL(15,2) DEFAULT 0.00;
DECLARE TOTALAMOUNT DECIMAL(15,2) DEFAULT 0.00;


SET  group_concat_max_len = 10000000;

set de_ITEM = (select GROUP_CONCAT(CONCAT('',tbl_product_id,'|'))
				from dbitems.tbl_shoppingcartdetail 
				where tbl_shoppingcart_id = shoppingCartId
				);
                
set de_QUANTITY = (select GROUP_CONCAT(CONCAT('',tbl_shoppingcartdetail_quantity,'|'))
				from dbitems.tbl_shoppingcartdetail 
				where tbl_shoppingcart_id = shoppingCartId
				);
                
set de_CHOICES = (select GROUP_CONCAT(CONCAT('',tbl_shoppingcartdetail_choice,'|'))
				from dbitems.tbl_shoppingcartdetail 
				where tbl_shoppingcart_id = shoppingCartId
				);


set de_ITEMPRICE = (select GROUP_CONCAT(CONCAT('',B.tbl_product_salePrice,'|'))
				from dbitems.tbl_shoppingcartdetail as A 
                left join dbitems.tbl_product as B on A.tbl_product_id = B.tbl_product_id
				where A.tbl_shoppingcart_id = shoppingCartId
				);

set de_ITEM = REPLACE(de_ITEM,'|,','|');
set de_ITEMPRICE = REPLACE(de_ITEMPRICE,'|,','|');
set de_QUANTITY = REPLACE(de_QUANTITY,'|,','|');
set de_CHOICES = REPLACE(de_CHOICES,'|,','|');

/*
SET JSON = (select GROUP_CONCAT(
				CONCAT('---ITEM:',de_ITEM,''),
                CONCAT('---PRICE:',de_ITEMPRICE,''),
                CONCAT('---QUANTITY:',de_QUANTITY,''),
                CONCAT('---CHOICES:',de_CHOICES,'')
			));
*/

WHILE (LENGTH(de_ITEM)>0) DO
		
	SET ITEM_ID = TRIM((SELECT SUBSTR(de_ITEM,1,LOCATE('|',de_ITEM)-1)));
	SET de_ITEM = (SELECT SUBSTR(de_ITEM,LOCATE('|',de_ITEM)+1));

	SET ITEM_PRICE = TRIM((SELECT SUBSTR(de_ITEMPRICE,1,LOCATE('|',de_ITEMPRICE)-1)));
	SET de_ITEMPRICE = (SELECT SUBSTR(de_ITEMPRICE,LOCATE('|',de_ITEMPRICE)+1));

	SET ITEM_QTY = TRIM((SELECT SUBSTR(de_QUANTITY,1,LOCATE('|',de_QUANTITY)-1)));
	SET de_QUANTITY = (SELECT SUBSTR(de_QUANTITY,LOCATE('|',de_QUANTITY)+1));

	SET CADENACHOICES = TRIM((SELECT SUBSTR(de_CHOICES,1,LOCATE('|',de_CHOICES)-1)));
	SET de_CHOICES = (SELECT SUBSTR(de_CHOICES,LOCATE('|',de_CHOICES)+1));

	set CADENACHOICES = REPLACE(CADENACHOICES,',','|');
    set CADENACHOICES = CONCAT(CADENACHOICES,'|');
	SET CHOICEAMOUNT = 0.00;
    
	WHILE (LENGTH(CADENACHOICES)>0) DO
		
        SET CHOICEPRICE = 0.00;
        
		SET CHOICE_ID = COALESCE(TRIM((SELECT SUBSTR(CADENACHOICES,1,LOCATE('|',CADENACHOICES)-1))),0);
		SET CADENACHOICES = (SELECT SUBSTR(CADENACHOICES,LOCATE('|',CADENACHOICES)+1));
		
		if CHOICE_ID = 0 then
			SET CHOICEPRICE = 0.00;
        else
			SET CHOICEPRICE = (select tbl_productattribute_optionValuePrice from dbitems.tbl_productattribute where tbl_productoptionvalue_id = CHOICE_ID);
		end if;
		
		SET CHOICEAMOUNT = CHOICEAMOUNT + CHOICEPRICE;
		
    END WHILE;
    
	SET ITEMAMOUNT = (ITEM_PRICE + CHOICEAMOUNT) * ITEM_QTY;
    SET TOTALAMOUNT = TOTALAMOUNT + ITEMAMOUNT;

END WHILE;

SET JSON = TOTALAMOUNT;

IF JSON IS NULL THEN
	SET JSON = '0.00';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCShuffleByPackageID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCShuffleByPackageID`(PackageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;


		SET JSON = ( 

		SELECT GROUP_CONCAT(distinct

			   CONCAT('{"127.107":"',COALESCE(B.tbl_shuffle_id,''),'"'), 
			   CONCAT(',"127.112":"',if ((B.tbl_shuffle_broadcast_mobile= 1),'true','false'),'"'),
			   CONCAT(',"127.94":"',if ((B.tbl_shuffle_published= 1),'true','false'),'"'),
               CONCAT(',"127.117":"',COALESCE(B.tbl_shuffle_republished_count,''),'"'), 
			   CONCAT(dbitems.getNMCScheduleshuffle(B.tbl_shuffle_id )),
			   CONCAT(',"CA":[',dbitems.getNMCCategoryByshuffle(B.tbl_shuffle_id ),']'),
			   CONCAT(',"AR":{',dbitems.getNMCAdvertiser(A.tbl_package_usernmcid),'}'),
			   CONCAT(',"LO":[',dbuser.getNMCLocationByShuffleId(B.tbl_shuffle_id ),']'),
			   CONCAT(',"LZ":[',dbitems.getNMCLocalizationShuffleByshuffleId(B.tbl_shuffle_id ),']'),
			   CONCAT(',"PA":[',dbitems.getNMCAdvertisingByShufflePortal(B.tbl_shuffle_id ),']'),
			   CONCAT(',"TE":[',dbitems.getNMCTerminalByshuffle(B.tbl_shuffle_id),']'),
			   CONCAT(',"48.6":"',COALESCE(B.tbl_shuffle_name,''),'"}'))
 
			   from tbl_package as A, tbl_package_shuffle as B
			   where A.tbl_package_id = B.tbl_package_id
			   and B.tbl_package_id = PackageId
			   
			   
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCShuffleTerminalCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCShuffleTerminalCount`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON INTEGER(11) DEFAULT 0;

SET  group_concat_max_len = 10000000;


		SET JSON = ( 

			SELECT count(distinct Q.tbl_terminal_id)
			from (

			SELECT distinct

			tbl_advertisingfavorite.tbl_terminal_id
			FROM dbitems.tbl_advertisingfavorite
			LEFT JOIN dbitems.tbl_shuffleterminal on tbl_advertisingfavorite.tbl_terminal_id = tbl_shuffleterminal.tbl_terminal_id
			where tbl_shuffleterminal.tbl_shuffle_id  = shuffleId

			union

			SELECT distinct
			tbl_advertisingfavorite.tbl_terminal_id			
			FROM dbitems.tbl_advertisingfavorite 
			LEFT JOIN dbitems.tbl_shufflelocation on tbl_advertisingfavorite.tbl_location_id = tbl_shufflelocation.tbl_location_id
			where tbl_shufflelocation.tbl_shuffle_id  = shuffleId
			and  tbl_shufflelocation.tbl_shufflelocation_allterminal_f = 1



			) AS Q
				);
	
	
	
	
IF JSON IS NULL THEN
	SET JSON = '0';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCSubcategoryCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSubcategoryCounterByCategory`(CategoryId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(E.tbl_category_id) 
    from tbl_category as E 
    where E.tbl_category_parentid = CategoryId 
    and E.tbl_category_active = 1
	
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCSubcategoryFavCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSubcategoryFavCounterByCategory`(CategoryId int, UserId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(B.tbl_category_parentId) 
    from tbl_favorite_category as A, tbl_category as B 
    where A.tbl_favorite_category_user_id = UserId  
    and B.tbl_category_parentId = CategoryId
    and B.tbl_category_id = A.tbl_favorite_category_category_id 
    
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNMCSubscription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSubscription`(subscriptionId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

SELECT GROUP_CONCAT(
             CONCAT('"122.116":"',COALESCE(B.tbl_subscription_id,''),'"'),
			 CONCAT(',"122.151":"',COALESCE(B.tbl_subscriptiontype_id,''), '"'),
			 CONCAT(',"114.123":"',COALESCE(B.tbl_subscriptionaccounttype_id,''),'"'), 
             CONCAT(',"121.43":"',COALESCE(B.tbl_subscription_payment_due,''),'"'),
             CONCAT(',"121.73":"',COALESCE(B.tbl_subscriptionrate_id,''),'"'),
             CONCAT(',"120.70":"',COALESCE(B.tbl_subscriptionid_required,''),'"'),
             CONCAT(',"120.83":"',COALESCE(B.tbl_subscription_item_title,''),'"'),
             CONCAT(',"120.157":"',COALESCE(hex(B.tbl_subscription_item_description),''),'"'),
             CONCAT(',"122.163":"',COALESCE(B.tbl_subscription_minimum_price,''),'"'),
             CONCAT(',"122.164":"',COALESCE(B.tbl_subscription_maximum_price,''),'"'),
             CONCAT(',"120.84":"',COALESCE(B.tbl_subscription_recommended_price,''),'"'),
             CONCAT(',"122.154":"',COALESCE(B.tbl_subscription_flat_commission,''),'"'),
             CONCAT(',"122.165":"',COALESCE(B.tbl_subscription_flat_commission_quantity,''),'"'),
             CONCAT(',"122.155":"',COALESCE(B.tbl_subscription_residual_reseller,''),'"'),
             CONCAT(',"122.166":"',COALESCE(B.tbl_subscription_residual_reseller_quantity,''),'"'),
             CONCAT(',"122.156":"',COALESCE(B.tbl_subscription_iso_residual,''),'"'),
			 CONCAT(',"122.167":"',COALESCE(B.tbl_subscription_iso_residual_quantity,''),'"'),
			 CONCAT(',"122.157":"',COALESCE(B.tbl_subscription_pos_residual,''),'"'),
			 CONCAT(',"122.168":"',COALESCE(B.tbl_subscription_pos_residual_quantity,''),'"'),
             CONCAT(',"122.90":"',COALESCE(B.tbl_subscription_transaction_fee,''),'"'), 
             CONCAT(',"122.161":"',COALESCE(B.tbl_subscription_transaction_fee_quantity,''),'"'),
             CONCAT(',"122.139":"',COALESCE(hex(B.tbl_subscription_item_functions),''),'"'),
			 CONCAT(',"114.143":"',COALESCE(B.tbl_subscription_status,''),'"'))

			 from tbl_subscription as B
			 where B.tbl_subscription_id = subscriptionId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCSubscriptionByLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSubscriptionByLocation`(locationId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

SELECT GROUP_CONCAT(
			 CONCAT('"121.141":"',COALESCE(W.tbl_usersubscription_date_expiration,''),'"'),
             CONCAT(',"122.116":"',COALESCE(W.tbl_subscription_id,''),'"'),
			 CONCAT(',"122.151":"',COALESCE(W.tbl_subscriptiontype_id,''), '"'),
			 CONCAT(',"114.123":"',COALESCE(W.tbl_subscriptionaccounttype_id,''),'"'), 
             CONCAT(',"121.43":"',COALESCE(W.tbl_subscription_payment_due,''),'"'),
             CONCAT(',"121.73":"',COALESCE(W.tbl_subscriptionrate_id,''),'"'),
             CONCAT(',"120.70":"',COALESCE(W.tbl_subscriptionid_required,''),'"'),
             CONCAT(',"120.83":"',COALESCE(W.tbl_subscription_item_title,''),'"'),
             CONCAT(',"120.157":"',COALESCE(hex(W.tbl_subscription_item_description),''),'"'),
             CONCAT(',"122.163":"',COALESCE(W.tbl_subscription_minimum_price,''),'"'),
             CONCAT(',"122.164":"',COALESCE(W.tbl_subscription_maximum_price,''),'"'),
             CONCAT(',"120.84":"',COALESCE(W.tbl_subscription_recommended_price,''),'"'),
             CONCAT(',"122.154":"',COALESCE(W.tbl_subscription_flat_commission,''),'"'),
             CONCAT(',"122.165":"',COALESCE(W.tbl_subscription_flat_commission_quantity,''),'"'),
             CONCAT(',"122.155":"',COALESCE(W.tbl_subscription_residual_reseller,''),'"'),
             CONCAT(',"122.166":"',COALESCE(W.tbl_subscription_residual_reseller_quantity,''),'"'),
             CONCAT(',"122.156":"',COALESCE(W.tbl_subscription_iso_residual,''),'"'),
			 CONCAT(',"122.167":"',COALESCE(W.tbl_subscription_iso_residual_quantity,''),'"'),
			 CONCAT(',"122.157":"',COALESCE(W.tbl_subscription_pos_residual,''),'"'),
			 CONCAT(',"122.168":"',COALESCE(W.tbl_subscription_pos_residual_quantity,''),'"'),
             CONCAT(',"122.90":"',COALESCE(W.tbl_subscription_transaction_fee,''),'"'), 
             CONCAT(',"122.161":"',COALESCE(W.tbl_subscription_transaction_fee_quantity,''),'"'),
             CONCAT(',"122.139":"',COALESCE(hex(W.tbl_subscription_item_functions),''),'"'),
			 CONCAT(',"114.143":"',COALESCE(W.tbl_subscription_status,''),'"')
			 )

			 from 
             
				(select A.tbl_usersubscription_date_expiration,
				B.tbl_subscription_id,
				B.tbl_subscriptiontype_id,
				B.tbl_subscriptionaccounttype_id,
				B.tbl_subscription_payment_due,
				B.tbl_subscriptionrate_id,
				B.tbl_subscriptionid_required,
				B.tbl_subscription_item_title,
				B.tbl_subscription_item_description,
				B.tbl_subscription_minimum_price,
				B.tbl_subscription_maximum_price,
				B.tbl_subscription_recommended_price,
				B.tbl_subscription_flat_commission,
				B.tbl_subscription_flat_commission_quantity,
				B.tbl_subscription_residual_reseller,
				B.tbl_subscription_residual_reseller_quantity,
				B.tbl_subscription_iso_residual,
				B.tbl_subscription_iso_residual_quantity,
				B.tbl_subscription_pos_residual,
				B.tbl_subscription_pos_residual_quantity,
				B.tbl_subscription_transaction_fee,
				B.tbl_subscription_transaction_fee_quantity,
				B.tbl_subscription_item_functions,
				B.tbl_subscription_status
				from tbl_usersubscription as A 
				left join tbl_subscription as B on A.tbl_subscription_id = B.tbl_subscription_id
				where A.tbl_location_id = locationId
				order by A.tbl_usersubscription_date_expiration DESC
				limit 1) as W
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCSubscriptionHardware` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCSubscriptionHardware`(subscriptionId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

SELECT GROUP_CONCAT(
             CONCAT('"122.116":""'),
			 CONCAT(',"122.151":""'),
			 CONCAT(',"114.123":""'), 
             CONCAT(',"121.43":""'),
             CONCAT(',"121.73":""'),
             CONCAT(',"120.70":""'),
             CONCAT(',"120.83":"',COALESCE(B.tbl_hardware_type_name,''),'"'),
             CONCAT(',"120.157":""'),
             CONCAT(',"122.163":""'),
             CONCAT(',"122.164":""'),
             CONCAT(',"120.84":"',COALESCE(B.tbl_hardware_type_price,''),'"'),
             CONCAT(',"122.154":""'),
             CONCAT(',"122.165":""'),
             CONCAT(',"122.155":""'),
             CONCAT(',"122.166":""'),
             CONCAT(',"122.156":""'),
			 CONCAT(',"122.167":""'),
			 CONCAT(',"122.157":""'),
			 CONCAT(',"122.168":""'),
             CONCAT(',"122.90":""'), 
             CONCAT(',"122.161":""'),
             CONCAT(',"122.139":""'),
			 CONCAT(',"114.143":""'))

			 from dbuser.tbl_hardware_type as B
			 where B.tbl_hardware_type_id = subscriptionId
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCTerminalByShuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCTerminalByShuffle`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
 
		SET JSON = ( 

			SELECT GROUP_CONCAT(distinct
			CONCAT('{"114.47":"',COALESCE(Q.tbl_location_id ,''),'"'), 
			CONCAT(',"120.69":"',COALESCE(Q.tbl_terminal_id,''),'"') ,
			CONCAT(',"122.170":"',COALESCE(Q.tbl_terminaltype_id,''),'"') ,
			CONCAT(',"122.123":"',COALESCE(Q.tbl_terminal_manofacturer,''),'"') ,
			CONCAT(',"123.67":"',COALESCE(Q.tbl_terminalposition_id,''),'"') ,
			CONCAT(',"121.183":"',COALESCE(Q.tbl_terminal_posTerminalId,''),'"') ,
			CONCAT(',"122.124":"',COALESCE(Q.tbl_terminal_provider,''),'"') ,
			CONCAT(',"122.125":"',COALESCE(Q.tbl_terminal_posInternalId,''),'"') ,
			CONCAT(',"122.126":"',COALESCE(Q.tbl_terminal_reference,''),'"'),
            CONCAT(',"121.141":"',COALESCE(Q.tbl_terminal_lastDateActive,''),'"'),
			CONCAT(',"114.9":"',COALESCE(if(Q.tbl_terminal_update_f=1,'true','false'),''),'"'),
			CONCAT(',"114.104":"',COALESCE(Q.tbl_terminal_qrCode,''),'"}') )


			from (

			SELECT distinct

			tbl_terminal.tbl_location_id,
			tbl_terminal.tbl_terminal_id,
			tbl_terminal.tbl_terminaltype_id,
			tbl_terminal.tbl_terminal_manofacturer,
			tbl_terminal.tbl_terminal_posTerminalId,
			tbl_terminal.tbl_terminal_provider,
			tbl_terminal.tbl_terminal_posInternalId,
			tbl_terminal.tbl_terminal_reference,
            tbl_terminal.tbl_terminal_lastDateActive,
			tbl_terminal.tbl_terminal_update_f,
			tbl_terminal.tbl_terminal_qrCode,
			tbl_terminal.tbl_terminalposition_id

			FROM dbuser.tbl_terminal LEFT JOIN dbitems.tbl_shuffleterminal on tbl_terminal.tbl_terminal_id = tbl_shuffleterminal.tbl_terminal_id

			where tbl_shuffleterminal.tbl_shuffle_id  = shuffleId

			union

			SELECT distinct

			tbl_terminal.tbl_location_id,
			tbl_terminal.tbl_terminal_id,
			tbl_terminal.tbl_terminaltype_id,
			tbl_terminal.tbl_terminal_manofacturer,
			tbl_terminal.tbl_terminal_posTerminalId,
			tbl_terminal.tbl_terminal_provider,
			tbl_terminal.tbl_terminal_posInternalId,
			tbl_terminal.tbl_terminal_reference,
            tbl_terminal.tbl_terminal_lastDateActive,
			tbl_terminal.tbl_terminal_update_f,
			tbl_terminal.tbl_terminal_qrCode,
			tbl_terminal.tbl_terminalposition_id

			FROM dbuser.tbl_terminal LEFT JOIN dbitems.tbl_shufflelocation on tbl_terminal.tbl_location_id = tbl_shufflelocation.tbl_location_id

			where tbl_shufflelocation.tbl_shuffle_id  = shuffleId
			and  tbl_shufflelocation_allterminal_f = 1



			) AS Q
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
/*!50003 DROP FUNCTION IF EXISTS `getNMCTerminalGCMByShuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getNMCTerminalGCMByShuffle`(shuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE ENTITYAUX VARCHAR(4);
DECLARE PACKAGE_ID INTEGER(11);
DECLARE PACKAGE_POS INTEGER(11);
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
  
    set PACKAGE_ID = (select tbl_package_id from dbitems.tbl_package_shuffle where tbl_shuffle_id = shuffleId limit 1);
	set PACKAGE_POS = (select tbl_layout_position from dbitems.tbl_package_layout where tbl_package_id = PACKAGE_ID limit 1);
  
	SET JSON = ( 

		SELECT GROUP_CONCAT(distinct
		CONCAT('{"120.69":"',COALESCE(Q.tbl_terminal_id ,''),'"'), 
		CONCAT(',"122.12":"',COALESCE(Q.tbl_terminal_gcm,''),'"}') )

		from (

			SELECT distinct
			tbl_terminal.tbl_terminal_id,			
			tbl_terminal_gcm
			FROM dbuser.tbl_terminal 
            LEFT JOIN dbitems.tbl_shuffleterminal on tbl_terminal.tbl_terminal_id = tbl_shuffleterminal.tbl_terminal_id
			where tbl_shuffleterminal.tbl_shuffle_id  = shuffleId
            and tbl_terminal_gcm is not null
			and tbl_terminalposition_id = PACKAGE_POS

			union

			SELECT distinct
			tbl_terminal.tbl_terminal_id,
			tbl_terminal_gcm
			FROM dbuser.tbl_terminal 
			LEFT JOIN dbitems.tbl_shufflelocation on tbl_terminal.tbl_location_id = tbl_shufflelocation.tbl_location_id
			where tbl_shufflelocation.tbl_shuffle_id  = shuffleId
			and  tbl_shufflelocation_allterminal_f = 1
			and tbl_terminal_gcm is not null
			and tbl_terminalposition_id = PACKAGE_POS
			
			) AS Q
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
/*!50003 DROP FUNCTION IF EXISTS `GetOptionsFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetOptionsFunction`(ProductId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000; 
SET JSON = (





SELECT  GROUP_CONCAT(  DISTINCT        
					CONCAT('{"121.179":"', PO.tbl_productoption_id,'"'),
					CONCAT(',"122.134":"', PO.tbl_productoption_name,'"'),			
					CONCAT(',"300.25":[',GetChoicesFunction(PO.tbl_productoption_id),
					']}'))
from tbl_productoption PO,
	 tbl_productattribute PA
where PA.tbl_productoption_id = PO.tbl_productoption_id
AND   PA.tbl_product_id=ProductId);


IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPlaylistImageByComponent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPlaylistImageByComponent`(ComponentId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"123.21":"',COALESCE(W.tbl_playlist_id,''),'"'),
			CONCAT(',"120.86":"',COALESCE(W.tbl_advertisingimage_id,''),'"'),
			CONCAT(',"121.170":"',COALESCE(W.tbl_advertisingimage_name,''),'"'),
            CONCAT(',"121.46":"',COALESCE(W.tbl_advertisingimage_size,''),'"'),
            CONCAT(',"121.141":"',COALESCE(W.tbl_advertisingimage_date,''),'"'),
            CONCAT(',"114.9":"',COALESCE(if(W.tbl_broadcast_f=1,'true','false'),''),'"'),
			CONCAT(',"IR":[',COALESCE(dbitems.GetPlaylistRelatedItems(W.tbl_playlist_id),''),']'),
			CONCAT(',"127.54":"',COALESCE(W.tbl_playlist_order,''),'"}')
            )

	from 
    
		(select 
        B.tbl_playlist_id,
        A.tbl_advertisingimage_id, 
        A.tbl_advertisingimage_name,
        A.tbl_advertisingimage_size,
		A.tbl_advertisingimage_date,
		B.tbl_playlist_order,
        B.tbl_broadcast_f
		from tbl_advertisingimage as A, tbl_package_layout_component_playlist as B
		where B.tbl_component_id = ComponentId
		and A.tbl_advertisingimage_id = B.tbl_image_id	
		order by A.tbl_advertisingimage_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPlaylistProductByComponent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPlaylistProductByComponent`(ComponentId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"123.21":"',COALESCE(W.tbl_playlist_id,''),'"'),
			CONCAT(',"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
			CONCAT(',"IR":[',COALESCE(dbitems.GetPlaylistRelatedItems(W.tbl_playlist_id),''),']'),
			CONCAT(',"127.54":"',COALESCE(W.tbl_playlist_order,''),'"}')
            )

	from 
    
		(select 
		B.tbl_playlist_id,
        A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
		B.tbl_playlist_order
		from tbl_product as A, tbl_package_layout_component_playlist as B
		where B.tbl_component_id = ComponentId
		and A.tbl_product_id = B.tbl_product_id
		and A.tbl_productstatus_id = 1001	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPlaylistRelatedItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPlaylistRelatedItems`(PlaylistId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"}')
            )

	from 
    
		(select 
        A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image
		from tbl_product as A, tbl_package_layout_related_items as B
		where B.tbl_playlist_id = PlaylistId
		and A.tbl_product_id = B.tbl_product_id
		and A.tbl_productstatus_id = 1001	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetPlaylistVideoByComponent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPlaylistVideoByComponent`(ComponentId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"123.21":"',COALESCE(W.tbl_playlist_id,''),'"'),
			CONCAT(',"127.50":"',COALESCE(W.tbl_file_id,''),'"'),
			CONCAT(',"121.15":"',COALESCE(W.tbl_file_originalname,''),'"'),
			CONCAT(',"121.170":"',COALESCE(W.tbl_file_thumbnail,''),'"'),
            CONCAT(',"121.47":"',COALESCE(W.tbl_file_size,''),'"'),
            CONCAT(',"121.141":"',COALESCE(W.tbl_file_date,''),'"'),
			CONCAT(',"114.9":"',COALESCE(if(W.tbl_broadcast_f=1,'true','false'),''),'"'),
            CONCAT(',"IR":[',COALESCE(dbitems.GetPlaylistRelatedItems(W.tbl_playlist_id),''),']'),
			CONCAT(',"127.54":"',COALESCE(W.tbl_playlist_order,''),'"}')
            )

	from 
    
		(select 
        B.tbl_playlist_id,
        A.tbl_file_id, 
		A.tbl_file_originalname,
        A.tbl_file_thumbnail,
        A.tbl_file_size,
		A.tbl_file_date,
		B.tbl_playlist_order,
        B.tbl_broadcast_f
		from tbl_file as A, tbl_package_layout_component_playlist as B
		where B.tbl_component_id = ComponentId
		and A.tbl_file_id = B.tbl_file_id	
		order by A.tbl_file_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetRandomAnswersFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetRandomAnswersFunction`(QuestionId int, UserNMCId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000; 
SET JSON = (


SELECT GROUP_CONCAT( DISTINCT        
					CONCAT('', COALESCE(W.tbl_securityquestionsanswer_answer,''))
					)
from 
	(select tbl_securityquestionsanswer_answer 
	from tbl_securityquestionsanswer 
	where tbl_securityquestions_id = QuestionId
	and tbl_cardsconsumer_nmcId != UserNMCId
	order by rand()
	limit 2) as W

);

SET JSON = REPLACE(JSON,',','~');

IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetShoppingCartChoicesFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetShoppingCartChoicesFunction`(Choices varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

DECLARE CADENA_CHOICE VARCHAR(5000) DEFAULT NULL;
DECLARE CHOICE_AUX VARCHAR(11) DEFAULT NULL;

SET  group_concat_max_len = 10000000;

set CADENA_CHOICE = Choices;
set CADENA_CHOICE = (concat(CADENA_CHOICE,','));

SET JSON = "";


WHILE (LENGTH(CADENA_CHOICE)>0) DO

	SET CHOICE_AUX = (SELECT SUBSTR(CADENA_CHOICE,1,LOCATE(',',CADENA_CHOICE)-1));
	SET CADENA_CHOICE = (SELECT SUBSTR(CADENA_CHOICE,LOCATE(',',CADENA_CHOICE)+1));

	SET JSON = concat( JSON, 

		(SELECT GROUP_CONCAT(
				CONCAT('', W.tbl_productoption_id,''),						
				CONCAT(':', W.tbl_productoptionvalue_id,''),			
				CONCAT(':', W.tbl_productattribute_optionValuePrice,''))
							
		from 
			(select tbl_productoption_id, 
					tbl_productoptionvalue_id, 
					tbl_productattribute_optionValuePrice
			from tbl_productattribute as A
			where tbl_productoptionvalue_id = CHOICE_AUX
			group by tbl_productoption_id) as W));

	SET JSON = concat( JSON, ',');

END WHILE;



IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetShoppingCartChoicesFunctionWebsite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetShoppingCartChoicesFunctionWebsite`(Choices varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

DECLARE CADENA_CHOICE VARCHAR(5000) DEFAULT NULL;
DECLARE CHOICE_AUX VARCHAR(11) DEFAULT NULL;

SET  group_concat_max_len = 10000000;

set CADENA_CHOICE = Choices;
set CADENA_CHOICE = (concat(CADENA_CHOICE,','));

SET JSON = "";


WHILE (LENGTH(CADENA_CHOICE)>0) DO

	SET CHOICE_AUX = (SELECT SUBSTR(CADENA_CHOICE,1,LOCATE(',',CADENA_CHOICE)-1));
	SET CADENA_CHOICE = (SELECT SUBSTR(CADENA_CHOICE,LOCATE(',',CADENA_CHOICE)+1));

	SET JSON = concat( JSON, 

		(SELECT GROUP_CONCAT(
				CONCAT('{"121.179":"', W.tbl_productoption_id,'"'),		
				CONCAT(',"122.134":"', W.tbl_productoption_name,'"'),
				CONCAT(',"122.112":"', W.tbl_productoptionvalue_id,'"'),	
                CONCAT(',"127.16":"', W.tbl_productoptionvalue_name,'"'),
				CONCAT(',"120.84":"', W.tbl_productattribute_optionValuePrice,'"}'))
							
		from 
			(select A.tbl_productoption_id, 
					C.tbl_productoption_name,
					A.tbl_productoptionvalue_id, 
                    B.tbl_productoptionvalue_name,
					A.tbl_productattribute_optionValuePrice
			from tbl_productattribute as A 
			left join tbl_productoptionvalue as B on A.tbl_productoptionvalue_id = B.tbl_productoptionvalue_id
			left join tbl_productoption as C on A.tbl_productoption_id = C.tbl_productoption_id
			where A.tbl_productoptionvalue_id = CHOICE_AUX
			group by A.tbl_productoption_id) as W));

	SET JSON = concat( JSON, ',');

END WHILE;


SET JSON = SUBSTR(JSON,1,CHAR_LENGTH(JSON)-1);

IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetShoppingCartDeliveryFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetShoppingCartDeliveryFunction`(ShoppingCartDetail int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;
SET JSON = ( 

SELECT GROUP_CONCAT(     
					CONCAT('', W.tbl_shoppingcartdelivery_id,''),
					CONCAT(':', W.tbl_shoppingcartdelivery_quantity,''),									
					CONCAT(':', W.tbl_address_id,''))
					
from 
	(select tbl_shoppingcartdelivery_id, tbl_shoppingcartdelivery_quantity, tbl_address_id
	from tbl_shoppingcartdelivery 
	where tbl_shoppingcartdetail_id = ShoppingCartDetail) as W);


IF JSON is NULL THEN
	SET JSON = "";
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `searchNMCItemByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `searchNMCItemByCategory`(CategoryId int, userId int, Search varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(',"120.31":"',COALESCE(W.tbl_product_dateadded,''),'"'),
            CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
            CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
        A.tbl_product_dateadded
		from tbl_product as A, tbl_productcategory as B
		where B.tbl_category_id = CategoryId
		and A.tbl_product_id = B.tbl_product_id
        and A.tbl_product_offer_f = 0
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001
        and
		(		UPPER(A.tbl_product_name) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_description) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_regularprice) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_saleprice) like CONCAT("%",UPPER(Search),"%")
		) 	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `searchNMCItemByMerchant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `searchNMCItemByMerchant`(MerchantId int, userId int, Search varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(dbitems.getNMCScheduleProduct(W.tbl_product_id)),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image
		from vw_product_by_merchant as A
		where A.tbl_main_user_id = dbuser.GetNMCId(MerchantId)
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001	
        and ValidateNMCProductSchedule(A.tbl_product_id) = 'true'
        and
		(		UPPER(A.tbl_product_name) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_description) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_regularprice) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_saleprice) like CONCAT("%",UPPER(Search),"%")
		)
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `searchNMCItemCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `searchNMCItemCounterByCategory`(CategoryId int, Search varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(*) 
	from tbl_product as A, tbl_productcategory as B
	where B.tbl_category_id = CategoryId
	and A.tbl_product_id = B.tbl_product_id
    and A.tbl_product_offer_f = 0
    and A.tbl_producttype_id = 21
	and A.tbl_productstatus_id = 1001
	and
	(		UPPER(A.tbl_product_name) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_description) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_regularprice) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_saleprice) like CONCAT("%",UPPER(Search),"%")
	)
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `searchNMCItemSpecialByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `searchNMCItemSpecialByCategory`(CategoryId int, userId int, Search varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(',"120.31":"',COALESCE(W.tbl_product_dateadded,''),'"'),
            CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
            CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
        A.tbl_product_dateadded
		from tbl_product as A, tbl_productcategory as B
		where B.tbl_category_id = CategoryId
		and A.tbl_product_id = B.tbl_product_id
        and A.tbl_product_offer_f = 1
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001	
        and
		(		UPPER(A.tbl_product_name) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_description) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_regularprice) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_saleprice) like CONCAT("%",UPPER(Search),"%")
		)
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `searchNMCItemSpecialCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `searchNMCItemSpecialCounterByCategory`(CategoryId int, Search varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(*) 
	from tbl_product as A, tbl_productcategory as B
	where B.tbl_category_id = CategoryId
	and A.tbl_product_id = B.tbl_product_id
    and A.tbl_product_offer_f = 1
    and A.tbl_producttype_id = 21
	and A.tbl_productstatus_id = 1001	
    and
	(		UPPER(A.tbl_product_name) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_description) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_regularprice) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_saleprice) like CONCAT("%",UPPER(Search),"%")
	)
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `searchNMCSavedItemByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `searchNMCSavedItemByCategory`(CategoryId int, userId int, Search varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT  GROUP_CONCAT(distinct
			CONCAT('{"114.144":"',COALESCE(W.tbl_product_id,''),'"'),
			CONCAT(',"114.112":"',COALESCE(W.tbl_producttype_id,''),'"'),
            CONCAT(',"120.83":"',COALESCE(W.tbl_product_name,''),'"'),
			CONCAT(',"114.98":"',COALESCE(W.tbl_product_regularprice,0.0),'"'),
			CONCAT(',"122.158":"',COALESCE(W.tbl_product_saleprice,0.0),'"'),
            CONCAT(',"121.170":"',COALESCE(W.tbl_product_image,''),'"'),
            CONCAT(',"120.31":"',COALESCE(W.tbl_product_dateadded,''),'"'),
            CONCAT(',"122.19":"',COALESCE(dbitems.GetNMCItemRatingAverage(W.tbl_product_id),''),'"'),
            CONCAT(',"121.80":"',COALESCE(dbitems.GetNMCItemReviewCounter(W.tbl_product_id),''),'"'),
            CONCAT(',"114.9":"',COALESCE(ValidateNMCProductWatched(W.tbl_product_id,userId),''),'"}'))

	from 
    
		(select A.tbl_product_id, 
        A.tbl_producttype_id, 
        A.tbl_product_name, 
        A.tbl_product_regularprice, 
        A.tbl_product_saleprice,
        A.tbl_product_image,
        A.tbl_product_dateadded
		from tbl_productfav as C, tbl_product as A, tbl_productcategory as B
		where C.tbl_productfav_nmcid = userId
        and B.tbl_category_id = CategoryId
        and C.tbl_product_id = A.tbl_product_id
		and A.tbl_product_id = B.tbl_product_id
        and A.tbl_producttype_id = 21
		and A.tbl_productstatus_id = 1001
        and
		(		UPPER(A.tbl_product_name) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_description) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_regularprice) like CONCAT("%",UPPER(Search),"%")
			or  UPPER(A.tbl_product_saleprice) like CONCAT("%",UPPER(Search),"%")
		) 	
		order by A.tbl_product_id DESC) as W
	);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `searchNMCSavedItemCounterByCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `searchNMCSavedItemCounterByCategory`(CategoryId int, userId int, Search varchar(255)) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

SET JSON = ( 

	select count(*) 
	from tbl_productfav as C, tbl_product as A, tbl_productcategory as B
	where C.tbl_productfav_nmcid = userId
	and B.tbl_category_id = CategoryId
	and C.tbl_product_id = A.tbl_product_id
	and A.tbl_product_id = B.tbl_product_id
    and A.tbl_producttype_id = 21
	and A.tbl_productstatus_id = 1001
	and
	(		UPPER(A.tbl_product_name) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_description) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_regularprice) like CONCAT("%",UPPER(Search),"%")
		or  UPPER(A.tbl_product_saleprice) like CONCAT("%",UPPER(Search),"%")
	)
);
	
IF JSON IS NULL THEN
	SET JSON = '';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateCampaignLayout` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateCampaignLayout`(PackageId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;



if (
	select tbl_package_id 
	from tbl_package_layout
	where tbl_package_id = PackageId
	limit 1
	) is not null then

	if dbitems.GetNMCPackageSize(PackageId) > 0 then
		SET JSON = 'true';
	else
		SET JSON = 'false';
    end if;

else

	SET JSON = 'false';

end if;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCAdvertisingStatusByShuffle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCAdvertisingStatusByShuffle`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;



if (
	select A.advertising_id 
	from vw_advertising as A
	left join tbl_shuffle_advertising as B on A.advertising_id = B.tbl_advertising_id
	where B.tbl_shuffle_id = ShuffleId 
    and A.status = 60002
	limit 1) is null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCcatalogHasItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCcatalogHasItem`(catalogId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

 

if (
	select tbl_catalog_id 
	from tbl_catalogproduct limit 1

	) is not null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;
 
RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCcatalogSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCcatalogSchedule`(catalogId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;



if (
	select tbl_catalog_id 
	from tbl_catalog_schedule 
	where tbl_catalog_id = catalogId
	and tbl_day_of_the_week = (select weekday(NOW()))
	and tbl_closed_flag = 0
	and (select curdate() between tbl_catalog_schedule_startDate and tbl_catalog_schedule_endDate) = 1
	and (select curtime() between tbl_hour_open  and tbl_hour_close ) = 1
	) is not null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;
 
RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCProductOfferApplied` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCProductOfferApplied`(ProductId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
DECLARE OFFER_ID INT(11) DEFAULT 0;
SET  group_concat_max_len = 10000000;


set OFFER_ID = (select tbl_product_discount_id from tbl_discount_item_applied where tbl_product_id = ProductId limit 1);

if (
	select tbl_product_id 
	from tbl_product_schedule 
	where tbl_product_id = OFFER_ID
	and tbl_day_of_the_week = (select weekday(NOW()))
	and tbl_closed_flag = 0
	and (select curdate() between tbl_product_schedule_startDate and tbl_product_schedule_endDate) = 1
	and (select curtime() between tbl_hour_open  and tbl_hour_close ) = 1
	) is not null then

	SET JSON = 'true';

else 

	SET JSON = 'false';

end if;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCProductOfferSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCProductOfferSchedule`(ProductId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;

if (
	select tbl_product_id 
	from tbl_productoffer_schedule 
	where tbl_product_id = ProductId
	and tbl_day_of_the_week = (select weekday(NOW()))
	and tbl_closed_flag = 0
	and (select curdate() between tbl_start_date and tbl_end_date) = 1
	) is not null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCProductSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCProductSchedule`(ProductId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;


if (
	select tbl_product_id 
	from tbl_product_schedule 
	where tbl_product_id = ProductId
	and tbl_day_of_the_week = (select weekday(NOW()))
	and tbl_closed_flag = 0
	and (select curdate() between tbl_product_schedule_startDate and tbl_product_schedule_endDate) = 1
	) is not null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCProductWatched` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCProductWatched`(productId int, userId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

 

if (
	select tbl_product_id 
    from tbl_product_watched 
    where tbl_product_id = productId 
    and tbl_user_id = userId
    limit 1
	) is not null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;
 
RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCShuffleSchedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCShuffleSchedule`(ShuffleId int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;



if (
	select tbl_shuffle_id 
	from tbl_shuffle_schedule 
	where tbl_shuffle_id = ShuffleId
	and tbl_day_of_the_week = (select weekday(NOW()))
	and tbl_closed_flag = 0
	and (select curdate() between tbl_shuffle_schedule_startDate and tbl_shuffle_schedule_endDate) = 1
	) is not null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateNMCShuffleScheduleDongle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateNMCShuffleScheduleDongle`(ShuffleId int, Day_week int) RETURNS mediumtext CHARSET utf8
BEGIN
DECLARE JSON TEXT;

SET  group_concat_max_len = 10000000;



if (
	select tbl_shuffle_id 
	from tbl_shuffle_schedule 
	where tbl_shuffle_id = ShuffleId
	and tbl_day_of_the_week = Day_week
	and tbl_closed_flag = 0
	and (select curdate() between tbl_shuffle_schedule_startDate and tbl_shuffle_schedule_endDate) = 1
	) is not null then

	SET JSON = 'true';

else

	SET JSON = 'false';

end if;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidateSubscriptionActiveByLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidateSubscriptionActiveByLocation`(locationId int) RETURNS mediumtext CHARSET utf8
BEGIN

DECLARE JSON TEXT;
SET  group_concat_max_len = 10000000;

SET JSON = ( 

	SELECT B.tbl_subscription_id
	from tbl_usersubscription as A, tbl_subscription as B
	where A.tbl_location_id = locationId
	and A.tbl_subscription_id = B.tbl_subscription_id
    and A.tbl_usersubscription_date_expiration > NOW()
    limit 1
);

IF JSON is NULL THEN
	SET JSON = 'false';
else
	SET JSON = 'true';
END IF;

RETURN JSON;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEditCreditCard030400694` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Administrador`@`%` PROCEDURE `AddEditCreditCard030400694`(IN MSG_IN VARCHAR(20000))
BEGIN

-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: AddNewAccount030400044
-- Version: 1.0
-- Last modified: 2014-02-24
-- --------------------------------------------------------

-- -------------------------
-- Declare Data Elements --
-- -------------------------




    DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_053  VARCHAR(20) DEFAULT 0;                      -- 53 User id
    DECLARE de_120_007 INT(11) DEFAULT 0;                 -- 120.7 Type credit card
    DECLARE de_002 VARCHAR(45) DEFAULT NULL;             -- 2 Account number
    DECLARE de_048_015 VARCHAR(45) DEFAULT NULL;        -- 48.15 Card Token
	DECLARE de_048_002 VARCHAR(255) DEFAULT NULL;         -- 48.2 Cardholder name
    DECLARE de_048_006 VARCHAR(255) DEFAULT NULL;        -- 48.6 Card nick name
    DECLARE de_048_004 VARCHAR(5) DEFAULT NULL;         -- 48.4 Card verification number
    DECLARE de_118_005 VARCHAR(5) DEFAULT NULL;         -- 118.4 Card expiration date accessible
  
	DECLARE de_048_007 VARCHAR(255) DEFAULT NULL;         -- Issuing bank
    DECLARE de_122_189 VARCHAR(11) DEFAULT NULL;        -- Swift/IBAN code
	DECLARE de_122_190 INT(11) DEFAULT 0;                 -- Bank Account type
	DECLARE de_122_087 INT(11) DEFAULT 0;                 -- Country Id
    
	DECLARE de_122_034 INT(11) DEFAULT 0;                 -- Card user id
  
	DECLARE de_121_048 INT(11) DEFAULT 0;               
    DECLARE de_121_072 VARCHAR(45) DEFAULT 0;             -- 121.72 Type credit card NAME
    
-- -------------------------
-- Declare auxiliary --
-- -------------------------

    DECLARE CARDTOKEN_AUX VARCHAR(100) DEFAULT NULL;
    DECLARE ACCOUNTID_AUX INT(11) DEFAULT 0;
    DECLARE ADDRESSID_AUX INT(11) DEFAULT 0;
	DECLARE FLAG_AUX VARCHAR(5) DEFAULT NULL;
    DECLARE FLAG_2 VARCHAR(5) DEFAULT NULL;
	DECLARE BILLNUMBER_AUX INT(11) DEFAULT 0;

    DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
    DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations  --
-- ---------------

    DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;

    --            TABLE  TEMPORARY OF IN    --
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);

    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------
-- Set variables  --
-- -----------------

	SET    de_053     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	SET    de_053     = (select right(de_053,11));
	
	SET    de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
	SET    de_002     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '2');
    SET    de_048_015 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.15');
    SET    de_048_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.2');
	SET    de_048_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.6');
	SET    de_048_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.4');
	SET    de_118_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.5');

	SET    de_122_034 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.34');

	SET de_122_189 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.189');
	SET de_122_190 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.190');
    SET de_048_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.7');
	SET de_122_087 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.87');
    
    SET de_121_048 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.48');
    SET de_121_072 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.72');
    
    
     if length(de_121_048)>0 then
		set de_053 = (select tbl_bill_merchant_nmcId from dbtransaction.tbl_bill where tbl_bill_number = de_121_048 limit 1);
     end if;
    
    
    if length(de_048_002)>0 then
		SET de_048_002 = convert(unhex(de_048_002) using utf8);
	end if;
    
	if length(de_048_006)>0 then
		SET de_048_006 = convert(unhex(de_048_006) using utf8);
	end if;
	
    if length(de_048_007)>0 then
		SET de_048_007 = convert(unhex(de_048_007) using utf8);
    end if;
    
    
	SET BILLNUMBER_AUX = (select A.tbl_bill_number 
												from dbtransaction.tbl_bill as A left join dbuser.tbl_user as B on A. tbl_bill_merchant_nmcId = B.tbl_user_id
                                                where tbl_bill_merchant_nmcId = de_053 and B.tbl_userstatus_id = 35 limit 1);

-- ---------------
-- Query of DB  --
-- ---------------

            SET CARDTOKEN_AUX = de_048_015;

			if length(de_122_034)>0 then

				SET ACCOUNTID_AUX = de_122_034;
                SET FLAG_AUX = 'false';
                
				update tbl_card set
                tbl_card_type_name = COALESCE(de_121_072,tbl_card_type_name),
                tbl_card_nickname = COALESCE(de_048_006, tbl_card_nickname),
				tbl_card_chardholderName = COALESCE(de_048_002, tbl_card_chardholderName),
                
				tbl_cardstype_id = COALESCE(de_120_007, tbl_cardstype_id),
				tbl_card_number = COALESCE(de_002, tbl_card_number),
                tbl_card_dateExpire = COALESCE(de_118_005, tbl_card_dateExpire),
				tbl_card_datemodified = NOW(),
                tbl_card_issuingBank = COALESCE(de_048_007, tbl_card_issuingBank),
                tbl_card_swift_iban_code = COALESCE(de_122_189, tbl_card_swift_iban_code),
                tbl_accounttype_id = COALESCE(de_122_190, tbl_accounttype_id),
                tbl_country_id = COALESCE(de_122_087, tbl_country_id)
                where tbl_user_id = de_053
				and tbl_card_tocken = CARDTOKEN_AUX
                ;
             
				-- -----------------------
				-- Result of operation  --
				-- -----------------------
				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');

			else
				if (select A.tbl_carduser_id 
					from tbl_carduser as A, tbl_card as B
					where A.tbl_user_nmcId = de_053 
					and A.tbl_card_tocken = CARDTOKEN_AUX 
					and A.tbl_card_tocken = B.tbl_card_tocken 
					and A.tbl_user_nmcId = B.tbl_user_id
                    and B.tbl_cardstatus_id = 52
					limit 1) is not null then
                
					update tbl_card set
                    tbl_card_type_name = COALESCE(de_121_072,tbl_card_type_name),
					tbl_cardstype_id = COALESCE(de_120_007,tbl_cardstype_id),
                    tbl_cardstatus_id = 51,
					tbl_card_number = COALESCE(de_002, tbl_card_number),
					tbl_card_dateExpire = COALESCE(de_118_005, tbl_card_dateExpire),
					tbl_card_nickname = COALESCE(de_048_006, tbl_card_nickname),
					tbl_card_chardholderName = COALESCE(de_048_002, tbl_card_chardholderName),
					tbl_card_datemodified = NOW(),
					tbl_card_issuingBank = COALESCE(de_048_007, tbl_card_issuingBank),
					tbl_card_swift_iban_code = COALESCE(de_122_189, tbl_card_swift_iban_code),
					tbl_accounttype_id = COALESCE(de_122_190, tbl_accounttype_id),
					tbl_country_id = COALESCE(de_122_087, tbl_country_id)
					where tbl_user_id = de_053
					and tbl_card_tocken = CARDTOKEN_AUX;
					
                    SET FLAG_AUX = 'true';
                    SET ACCOUNTID_AUX = (select tbl_carduser_id from tbl_carduser where tbl_user_nmcId = de_053 and tbl_card_tocken = CARDTOKEN_AUX limit 1);
					-- -----------------------
						-- Result of operation  --
						-- -----------------------
						insert into TBL_MESSAGE (CODE,DATA)
						values('39','0000'),('44','Transaction Approved');
                    
                
                else   
					if (select A.tbl_carduser_id 
						from tbl_carduser as A, tbl_card as B
						where A.tbl_user_nmcId = de_053 
						and A.tbl_card_tocken = CARDTOKEN_AUX 
						and A.tbl_card_tocken = B.tbl_card_tocken 
						and A.tbl_user_nmcId = B.tbl_user_id
						limit 1) is null then
						
					 
						SET FLAG_AUX = 'true';

						if (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) is not null then
							SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) +1;
						else
							SET ACCOUNTID_AUX = 1;
						end if;

						insert into tbl_carduser set
						tbl_carduser_id = ACCOUNTID_AUX,
						tbl_user_nmcId = de_053,
						tbl_card_tocken = CARDTOKEN_AUX,
						tbl_paymentnaturetype_id = 35001,
						tbl_carduser_primaryAccount_f = 1;

						insert into tbl_card set
						tbl_user_id = de_053,
						tbl_card_tocken = CARDTOKEN_AUX,
                        tbl_card_type_name = de_121_072,
                        tbl_card_nickname = COALESCE(de_048_006,''),
						tbl_card_chardholderName = COALESCE(de_048_002,''),
						tbl_cardstype_id = COALESCE(de_120_007,61),
						tbl_card_dateExpire = COALESCE(de_118_005,''),
						tbl_card_dateAdded = NOW(),
						tbl_card_datemodified = NOW(),
						 tbl_card_number = de_002,
						tbl_card_issuingBank = COALESCE(de_048_007,''),
						tbl_card_swift_iban_code = COALESCE(de_122_189,''),
						tbl_accounttype_id = COALESCE(de_122_190, null),
						tbl_country_id = COALESCE(de_122_087,null),
						tbl_cardstatus_id = 51;
					 
						-- -----------------------
						-- Result of operation  --
						-- -----------------------
						insert into TBL_MESSAGE (CODE,DATA)
						values('39','0000'),('44','Transaction Approved');
				 
					else
					
						SET FLAG_AUX = 'false';
						SET ACCOUNTID_AUX = (select tbl_carduser_id from tbl_carduser where tbl_user_nmcId = de_053 and tbl_card_tocken = CARDTOKEN_AUX limit 1);
					
						insert into TBL_MESSAGE (CODE,DATA)
						values('39','0000'),('44','Transaction Approved');
					
					end if;
				
                end if;
			end if;


	if (select tbl_user_id from dbcards.tbl_card where tbl_user_id = de_053 and tbl_card_tocken = CARDTOKEN_AUX and (length(tbl_card_dateExpire) > 0 and length(tbl_card_nickname) > 0 and length(tbl_card_chardholderName) > 0) limit 1) is not null then
    
		set FLAG_2 = 'true';
    
    else
    
		set FLAG_2 = 'false';
    
    end if;
  
    SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
    SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

   --  IF length(BILLNUMBER_AUX)>0 THEN
    --    SELECT
	-- 	GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"121.48":"',BILLNUMBER_AUX,'"'),CONCAT(',"122.34":"',ACCOUNTID_AUX,'"}')) AS JSON;
    -- ELSE
        SELECT
		GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"114.9":"',FLAG_2,'"'),CONCAT(',"127.94":"',FLAG_AUX,'"'),CONCAT(',"122.34":"',ACCOUNTID_AUX,'"}')) AS JSON;
   --  END IF;
    DROP TABLE TBL_MESSAGE;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEditPaymentServiceProviderAccountByUserId030400687` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Administrador`@`%` PROCEDURE `AddEditPaymentServiceProviderAccountByUserId030400687`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
		
	DECLARE de_053 VARCHAR(20) DEFAULT NULL;    	
	DECLARE de_114_047 INT(11) DEFAULT NULL;
	DECLARE de_120_017 INT(11) DEFAULT NULL; 	
    DECLARE de_114_073 INT(11) DEFAULT NULL; 
    DECLARE de_122_121 VARCHAR(45) DEFAULT NULL; 		
			
	DECLARE de_CT VARCHAR(5000) DEFAULT NULL;  
	DECLARE CADENA_CARD VARCHAR(5000) DEFAULT NULL;
    DECLARE de_120_007 INT(11) DEFAULT NULL; 
            
	DECLARE de_GP VARCHAR(5000) DEFAULT NULL;  
    DECLARE CADENA_PARAM VARCHAR(5000) DEFAULT NULL;
    DECLARE CADENA_PARAM_VAL VARCHAR(5000) DEFAULT NULL;
    DECLARE de_123_075 INT(11) DEFAULT NULL; 
    DECLARE de_123_078 VARCHAR(99) DEFAULT NULL; 	
	
    
    
    
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;


	SET de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_053 = (select right(de_053,11));
	
    SET de_114_047 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.47');
	SET de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
	SET de_120_017 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.17');
	SET de_114_073 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '123.72');
    SET de_122_121 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.121');
	
    SET de_CT = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'CT');
	set de_CT = convert(unhex(de_CT) USING utf8);
	SET de_CT = REPLACE(de_CT,'{"1','{"_1');
	set CADENA_CARD = (select common_schema.extract_json_value_nmc(concat('{"_CT":', de_CT ,'}'),'//_120.7'));	
    
	SET de_GP = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'GP');
	set de_GP = convert(unhex(de_GP) USING utf8);
	SET de_GP = REPLACE(de_GP,'{"1','{"_1');
    SET de_GP = REPLACE(de_GP,',"1',',"_1');
	set CADENA_PARAM = (select common_schema.extract_json_value_nmc(concat('{"_GP":', de_GP ,'}'),'//_123.75'));
	set CADENA_PARAM_VAL = (select common_schema.extract_json_value_nmc(concat('{"_GP":', de_GP ,'}'),'//_123.78'));


		if length(de_120_017) > 0 and de_120_017 != 0 then

			update tbl_paymentserviceaccount set 
			tbl_paymentserviceprovider_id = COALESCE(de_114_073,tbl_paymentserviceprovider_id),
			tbl_paymentserviceaccount_name = COALESCE(convert(unhex(de_122_121) USING utf8),tbl_paymentserviceaccount_name),
            tbl_paymentserviceaccount_enabled = 1,
			tbl_paymentserviceaccount_dateCreated = NOW()
			where tbl_paymentserviceaccount_id = de_120_017
			and tbl_paymentserviceaccount_nmcid_user = de_053;

			delete from dbtransaction.tbl_gateway_user
            where tbl_paymentserviceaccount_id = de_120_017;
            
            /*
            delete from dbtransaction.tbl_gateway_user
			where tbl_gateway_params_id in (select tbl_gateway_params_id
																	from dbtransaction.tbl_gateway_params
																	where tbl_gateway_id = (select tbl_gateway_id 
																											from tbl_cardtypeaccepted_account 
																											where tbl_paymentserviceaccount_id = de_120_017 
																											and tbl_location_id = de_114_047 limit 1));
			*/

			delete from tbl_cardtypeaccepted_account 
			where tbl_paymentserviceaccount_id = de_120_017
			and tbl_location_id = de_114_047;

			
			while (LENGTH(CADENA_PARAM)>0) DO
			
				SET de_123_075 = TRIM((SELECT SUBSTR(CADENA_PARAM,1,LOCATE('|',CADENA_PARAM)-1)));
				SET CADENA_PARAM = (SELECT SUBSTR(CADENA_PARAM,LOCATE('|',CADENA_PARAM)+1));
			
				SET de_123_078 = TRIM((SELECT SUBSTR(CADENA_PARAM_VAL,1,LOCATE('|',CADENA_PARAM_VAL)-1)));
				SET CADENA_PARAM_VAL = (SELECT SUBSTR(CADENA_PARAM_VAL,LOCATE('|',CADENA_PARAM_VAL)+1));
			
			
					insert into dbtransaction.tbl_gateway_user set 
					tbl_user_id = de_053,
                    tbl_paymentserviceaccount_id = de_120_017,
					tbl_gateway_params_id = de_123_075,
					tbl_gateway_user_value = de_123_078,
					tbl_gateway_user_dateCreated  = NOW();	

			end while;
            
            
            while (LENGTH(CADENA_CARD)>0) DO
			
				SET de_120_007 = TRIM((SELECT SUBSTR(CADENA_CARD,1,LOCATE('|',CADENA_CARD)-1)));
				SET CADENA_CARD = (SELECT SUBSTR(CADENA_CARD,LOCATE('|',CADENA_CARD)+1));
			
				if (select tbl_cardstype_id from tbl_cardtypeaccepted where tbl_cardstype_id = de_120_007 and tbl_user_nmcId = de_053) is null then 
		
					insert into tbl_cardtypeaccepted set 
					tbl_user_nmcId = de_053,
					tbl_cardstype_id = de_120_007,
					tbl_cardtypeaccepted_dateCreated = NOW();

				end if;
            
				if (select tbl_paymentserviceaccount_id from tbl_cardtypeaccepted_account where tbl_paymentserviceaccount_id = de_120_017 and tbl_user_nmcId = de_053 and tbl_cardstype_id = de_120_007 and tbl_location_id = de_114_047 limit 1) is null then

					insert into tbl_cardtypeaccepted_account set
					tbl_paymentserviceaccount_id = de_120_017,
					tbl_carduser_id = null,
					tbl_user_nmcId = de_053,
					tbl_gateway_id = de_114_073,
					tbl_cardstype_id = de_120_007,
					tbl_location_id = de_114_047,
					tbl_cardtypeaccepted_account_dateCreated = NOW();

				end if;
					
			end while;

			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');



		else



			if (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) is not null then
			   SET de_120_017 = (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) +1;
			else
			   SET de_120_017 = 1;			  
			end if;

			insert into tbl_paymentserviceaccount set 
			tbl_paymentserviceaccount_id = de_120_017,
			tbl_paymentserviceaccount_nmcid_user = de_053,
            tbl_paymentserviceprovider_id = de_114_073,
			tbl_paymentserviceaccount_name = convert(unhex(de_122_121) USING utf8),
			tbl_paymentserviceaccount_enabled = 1,
			tbl_paymentserviceaccount_dateCreated = NOW();


            while (LENGTH(CADENA_PARAM)>0) DO
			
				SET de_123_075 = TRIM((SELECT SUBSTR(CADENA_PARAM,1,LOCATE('|',CADENA_PARAM)-1)));
				SET CADENA_PARAM = (SELECT SUBSTR(CADENA_PARAM,LOCATE('|',CADENA_PARAM)+1));
			
				SET de_123_078 = TRIM((SELECT SUBSTR(CADENA_PARAM_VAL,1,LOCATE('|',CADENA_PARAM_VAL)-1)));
				SET CADENA_PARAM_VAL = (SELECT SUBSTR(CADENA_PARAM_VAL,LOCATE('|',CADENA_PARAM_VAL)+1));
			
			
					insert into dbtransaction.tbl_gateway_user set 
					tbl_user_id = de_053,
                    tbl_paymentserviceaccount_id = de_120_017,
					tbl_gateway_params_id = de_123_075,
					tbl_gateway_user_value = de_123_078,
					tbl_gateway_user_dateCreated  = NOW();	

			end while;
            
            
            while (LENGTH(CADENA_CARD)>0) DO
			
				SET de_120_007 = TRIM((SELECT SUBSTR(CADENA_CARD,1,LOCATE('|',CADENA_CARD)-1)));
				SET CADENA_CARD = (SELECT SUBSTR(CADENA_CARD,LOCATE('|',CADENA_CARD)+1));
			
				if (select tbl_cardstype_id from tbl_cardtypeaccepted where tbl_cardstype_id = de_120_007 and tbl_user_nmcId = de_053) is null then 
		
					insert into tbl_cardtypeaccepted set 
					tbl_user_nmcId = de_053,
					tbl_cardstype_id = de_120_007,
					tbl_cardtypeaccepted_dateCreated = NOW();

				end if;
            
				if (select tbl_paymentserviceaccount_id from tbl_cardtypeaccepted_account where tbl_paymentserviceaccount_id = de_120_017 and tbl_user_nmcId = de_053 and tbl_cardstype_id = de_120_007 and tbl_location_id = de_114_047 limit 1) is null then

					insert into tbl_cardtypeaccepted_account set
					tbl_paymentserviceaccount_id = de_120_017,
					tbl_carduser_id = null,
					tbl_user_nmcId = de_053,
					tbl_gateway_id = de_114_073,
					tbl_cardstype_id = de_120_007,
					tbl_location_id = de_114_047,
					tbl_cardtypeaccepted_account_dateCreated = NOW();

				end if;
					
			end while;


			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');

		end if;

	

	
	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"120.17":"',de_120_017,'"}')) AS JSON;


	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddEditPaymentServiceProviderAccountByUserId030400810` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Administrador`@`%` PROCEDURE `AddEditPaymentServiceProviderAccountByUserId030400810`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
		
	DECLARE de_053 VARCHAR(20) DEFAULT NULL;    	
	DECLARE de_114_047 INT(11) DEFAULT NULL;
	DECLARE de_120_017 INT(11) DEFAULT NULL; 	
    DECLARE de_114_073 INT(11) DEFAULT NULL; 
    DECLARE de_122_121 VARCHAR(45) DEFAULT NULL; 		
			
	DECLARE de_CT VARCHAR(5000) DEFAULT NULL;  
	DECLARE CADENA_CARD VARCHAR(5000) DEFAULT NULL;
    DECLARE de_120_007 INT(11) DEFAULT NULL; 
            
	DECLARE de_GP VARCHAR(5000) DEFAULT NULL;  
    DECLARE CADENA_PARAM VARCHAR(5000) DEFAULT NULL;
    DECLARE CADENA_PARAM_VAL VARCHAR(5000) DEFAULT NULL;
    DECLARE de_123_075 INT(11) DEFAULT NULL; 
    DECLARE de_123_078 VARCHAR(99) DEFAULT NULL; 	
	
    
    
    
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;


	SET de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_053 = (select right(de_053,11));
	
    SET de_114_047 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.47');
	-- SET de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
	SET de_120_017 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.17');
	SET de_114_073 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '123.72');
    SET de_122_121 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.121');
	
    SET de_CT = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'CT');
	set de_CT = convert(unhex(de_CT) USING utf8);
	SET de_CT = REPLACE(de_CT,'{"1','{"_1');
	set CADENA_CARD = (select common_schema.extract_json_value_nmc(concat('{"_CT":', de_CT ,'}'),'//_120.7'));	
    
	SET de_GP = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'GP');
	set de_GP = convert(unhex(de_GP) USING utf8);
	SET de_GP = REPLACE(de_GP,'{"1','{"_1');
    SET de_GP = REPLACE(de_GP,',"1',',"_1');
	set CADENA_PARAM = (select common_schema.extract_json_value_nmc(concat('{"_GP":', de_GP ,'}'),'//_123.75'));
	set CADENA_PARAM_VAL = (select common_schema.extract_json_value_nmc(concat('{"_GP":', de_GP ,'}'),'//_123.78'));

		if length(de_120_017) > 0 and de_120_017 != 0 then

			update tbl_paymentserviceaccount set 
			tbl_paymentserviceprovider_id = COALESCE(de_114_073,tbl_paymentserviceprovider_id),
			tbl_paymentserviceaccount_name = COALESCE(convert(unhex(de_122_121) USING utf8),tbl_paymentserviceaccount_name),
            tbl_paymentserviceaccount_enabled = 1,
			tbl_paymentserviceaccount_dateCreated = NOW()
			where tbl_paymentserviceaccount_id = de_120_017
			and tbl_paymentserviceaccount_nmcid_user = de_053;

			delete from dbtransaction.tbl_gateway_user
            where tbl_paymentserviceaccount_id = de_120_017;
            
            /*
            delete from dbtransaction.tbl_gateway_user
			where tbl_gateway_params_id in (select tbl_gateway_params_id
																	from dbtransaction.tbl_gateway_params
																	where tbl_gateway_id = (select tbl_gateway_id 
																											from tbl_cardtypeaccepted_account 
																											where tbl_paymentserviceaccount_id = de_120_017 
																											and tbl_location_id = de_114_047 limit 1));
			*/

			delete from tbl_cardtypeaccepted_account 
			where tbl_paymentserviceaccount_id = de_120_017
			and tbl_location_id = de_114_047;

			
			while (LENGTH(CADENA_PARAM)>0) DO
			
				SET de_123_075 = TRIM((SELECT SUBSTR(CADENA_PARAM,1,LOCATE('|',CADENA_PARAM)-1)));
				SET CADENA_PARAM = (SELECT SUBSTR(CADENA_PARAM,LOCATE('|',CADENA_PARAM)+1));
			
				SET de_123_078 = TRIM((SELECT SUBSTR(CADENA_PARAM_VAL,1,LOCATE('|',CADENA_PARAM_VAL)-1)));
				SET CADENA_PARAM_VAL = (SELECT SUBSTR(CADENA_PARAM_VAL,LOCATE('|',CADENA_PARAM_VAL)+1));
			
			
					insert into dbtransaction.tbl_gateway_user set 
					tbl_user_id = de_053,
                    tbl_paymentserviceaccount_id = de_120_017,
					tbl_gateway_params_id = de_123_075,
					tbl_gateway_user_value = de_123_078,
					tbl_gateway_user_dateCreated  = NOW();	

			end while;
            
            
            while (LENGTH(CADENA_CARD)>0) DO
			
				SET de_120_007 = TRIM((SELECT SUBSTR(CADENA_CARD,1,LOCATE('|',CADENA_CARD)-1)));
				SET CADENA_CARD = (SELECT SUBSTR(CADENA_CARD,LOCATE('|',CADENA_CARD)+1));
			
				if (select tbl_cardstype_id from tbl_cardtypeaccepted where tbl_cardstype_id = de_120_007 and tbl_user_nmcId = de_053) is null then 
		
					insert into tbl_cardtypeaccepted set 
					tbl_user_nmcId = de_053,
					tbl_cardstype_id = de_120_007,
					tbl_cardtypeaccepted_dateCreated = NOW();

				end if;
						
				if (select tbl_paymentserviceaccount_id from tbl_cardtypeaccepted_account where tbl_paymentserviceaccount_id = de_120_017 and tbl_user_nmcId = de_053 and tbl_cardstype_id = de_120_007 and tbl_location_id = de_114_047 limit 1) is null then

					insert into tbl_cardtypeaccepted_account set
					tbl_paymentserviceaccount_id = de_120_017,
					tbl_carduser_id = null,
					tbl_user_nmcId = de_053,
					tbl_gateway_id = de_114_073,
					tbl_cardstype_id = de_120_007,
					tbl_location_id = de_114_047,
					tbl_cardtypeaccepted_account_dateCreated = NOW();

				end if;
					
			end while;

			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');



		else



			if (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) is not null then
			   SET de_120_017 = (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) +1;
			else
			   SET de_120_017 = 1;			  
			end if;

			insert into tbl_paymentserviceaccount set 
			tbl_paymentserviceaccount_id = de_120_017,
			tbl_paymentserviceaccount_nmcid_user = de_053,
            tbl_paymentserviceprovider_id = de_114_073,
			tbl_paymentserviceaccount_name = convert(unhex(de_122_121) USING utf8),
			tbl_paymentserviceaccount_enabled = 1,
			tbl_paymentserviceaccount_dateCreated = NOW();


            while (LENGTH(CADENA_PARAM)>0) DO
			
				SET de_123_075 = TRIM((SELECT SUBSTR(CADENA_PARAM,1,LOCATE('|',CADENA_PARAM)-1)));
				SET CADENA_PARAM = (SELECT SUBSTR(CADENA_PARAM,LOCATE('|',CADENA_PARAM)+1));
			
				SET de_123_078 = TRIM((SELECT SUBSTR(CADENA_PARAM_VAL,1,LOCATE('|',CADENA_PARAM_VAL)-1)));
				SET CADENA_PARAM_VAL = (SELECT SUBSTR(CADENA_PARAM_VAL,LOCATE('|',CADENA_PARAM_VAL)+1));
			
			
					insert into dbtransaction.tbl_gateway_user set 
					tbl_user_id = de_053,
                    tbl_paymentserviceaccount_id = de_120_017,
					tbl_gateway_params_id = de_123_075,
					tbl_gateway_user_value = de_123_078,
					tbl_gateway_user_dateCreated  = NOW();	

			end while;
            
            
            while (LENGTH(CADENA_CARD)>0) DO
			
				SET de_120_007 = TRIM((SELECT SUBSTR(CADENA_CARD,1,LOCATE('|',CADENA_CARD)-1)));
				SET CADENA_CARD = (SELECT SUBSTR(CADENA_CARD,LOCATE('|',CADENA_CARD)+1));
			
				if (select tbl_cardstype_id from tbl_cardtypeaccepted where tbl_cardstype_id = de_120_007 and tbl_user_nmcId = de_053) is null then 
		
					insert into tbl_cardtypeaccepted set 
					tbl_user_nmcId = de_053,
					tbl_cardstype_id = de_120_007,
					tbl_cardtypeaccepted_dateCreated = NOW();

				end if;
            
            
				if (select tbl_paymentserviceaccount_id from tbl_cardtypeaccepted_account where tbl_paymentserviceaccount_id = de_120_017 and tbl_user_nmcId = de_053 and tbl_cardstype_id = de_120_007 and tbl_location_id = de_114_047 limit 1) is null then

					insert into tbl_cardtypeaccepted_account set
					tbl_paymentserviceaccount_id = de_120_017,
					tbl_carduser_id = null,
					tbl_user_nmcId = de_053,
					tbl_gateway_id = de_114_073,
					tbl_cardstype_id = de_120_007,
					tbl_location_id = de_114_047,
					tbl_cardtypeaccepted_account_dateCreated = NOW();

				end if;
					
			end while;


			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');

		end if;

	

	
	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"120.17":"',de_120_017,'"}')) AS JSON;


	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewAccount030400044` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmc`@`localhost` PROCEDURE `AddNewAccount030400044`(IN MSG_IN VARCHAR(20000))
BEGIN

-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: AddNewAccount030400044
-- Version: 1.0
-- Last modified: 2014-02-24
-- --------------------------------------------------------

-- -------------------------
-- Declare Data Elements --
-- -------------------------

    DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

    DECLARE de_120_007 INT(11) DEFAULT 0;                 -- Type credit card
    DECLARE de_121_070 INT(11) DEFAULT 0;                -- Payment Nature Type
    DECLARE de_053  VARCHAR(20) DEFAULT 0;                      -- User id
    DECLARE de_122_188 VARCHAR(20) DEFAULT NULL;        -- Routing number
    DECLARE de_122_189 VARCHAR(11) DEFAULT NULL;        -- Swift/IBAN code
    DECLARE de_002 VARCHAR(45) DEFAULT NULL;             -- Account number
    DECLARE de_122_190 INT(11) DEFAULT 0;                 -- Bank Account type

    DECLARE de_048_006 VARCHAR(99) DEFAULT NULL;        -- Account nick name
    DECLARE de_118_005 VARCHAR(5) DEFAULT NULL;         -- Card expiration date accessible
    DECLARE de_048_003 INT(3) DEFAULT 0;                 -- Account type
    DECLARE de_048_004 VARCHAR(5) DEFAULT NULL;         -- Card verification number
    DECLARE de_048_002 VARCHAR(99) DEFAULT NULL;         -- Cardholder name
    DECLARE de_048_007 VARCHAR(99) DEFAULT NULL;         -- Issuing bank

    DECLARE de_048_027 VARCHAR(300) DEFAULT NULL;        -- Email
    DECLARE de_048_028 VARCHAR(20) DEFAULT NULL;        -- Phone number
    DECLARE de_123_059 VARCHAR(20) DEFAULT NULL;        -- Password paypal

	DECLARE de_AD VARCHAR(5000) DEFAULT NULL;  			-- Address
    DECLARE de_114_115 VARCHAR(20) DEFAULT 0;                 -- Address id
	DECLARE de_122_087 INT(11) DEFAULT 0;                 -- Country Id

	DECLARE de_114_056 VARCHAR(45) DEFAULT NULL;         -- Wallet Number

	DECLARE de_122_126 VARCHAR(45) DEFAULT NULL;
    DECLARE de_121_005 VARCHAR(45) DEFAULT NULL;  
	
    DECLARE de_114_009 VARCHAR(5) DEFAULT 0;                 -- 114.9 primary account flag
    
-- -------------------------
-- Declare auxiliary --
-- -------------------------

    DECLARE CARDTOKEN_AUX VARCHAR(100) DEFAULT NULL;
    DECLARE ACCOUNTID_AUX INT(11) DEFAULT 0;
    DECLARE ADDRESSID_AUX INT(11) DEFAULT 0;

    DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
    DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations  --
-- ---------------

    DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;

    --            TABLE  TEMPORARY OF IN    --
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);

    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------
-- Set variables  --
-- -----------------

        SET    de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
        SET    de_121_070 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.70');
        SET    de_053     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
		set    de_053      = (select right(de_053,11));
        SET    de_122_188 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.188');
        SET    de_122_189 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.189');
        SET    de_002     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '2');
        SET    de_122_190 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.190');
        SET    de_048_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.6');
        SET    de_118_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.5');
        SET    de_048_003 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.3');
        SET    de_048_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.4');
        SET    de_048_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.2');
        SET    de_048_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.7');

        SET    de_048_027 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.27');
        SET    de_048_028 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.28');
        SET    de_123_059 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '123.59');
		SET    de_122_087 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.87');

		SET    de_114_056 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.56');

		SET    de_122_126 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.126');
		SET    de_121_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.5');
		SET    de_114_009 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.9');



		SET de_AD = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'AD');
		SET de_AD = convert(unhex(de_AD) USING utf8);
		SET de_114_115 = common_schema.get_option( de_AD, "114.115" );
		-- SET de_AD = REPLACE(de_AD,'{"1','{"_1');
		-- set de_AD = (select common_schema.extract_json_value_nmc(concat('{"_AD":', de_AD ,'}'), '//_114.115'));
		-- SET de_114_115 = (SELECT SUBSTR(de_AD,1,LENGTH(de_AD)-1));



		 if length(de_048_002)>0 then
			SET de_048_002 = convert(unhex(de_048_002) using utf8);
		end if;
		
		if length(de_048_006)>0 then
			SET de_048_006 = convert(unhex(de_048_006) using utf8);
		end if;
		
		if length(de_048_007)>0 then
			SET de_048_007 = convert(unhex(de_048_007) using utf8);
		end if;
    

-- ---------------
-- Query of DB  --
-- ---------------

    if de_120_007 = 64 then

        if (select tbl_cardpaypal_email from tbl_cardpaypal where tbl_cardpaypal_email = de_048_027 limit 1) is null then

            SET CARDTOKEN_AUX = de_048_027;

            if (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) is not null then
                SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) +1;
            else
                SET ACCOUNTID_AUX = 1;
            end if;

			insert into tbl_carduser set
            tbl_carduser_id = ACCOUNTID_AUX,
            tbl_user_nmcId = de_053,
            tbl_card_tocken = CARDTOKEN_AUX,
            tbl_paymentnaturetype_id = COALESCE(de_121_070,35001);

            insert into tbl_cardpaypal set
			tbl_cardpaypal_nickname = COALESCE(de_048_006,''),
            tbl_cardpaypal_email = de_048_027,
            tbl_cardpaypal_password = md5(de_123_059),
            tbl_cardpaypal_phoneNumber = de_048_028,
            tbl_card_tocken = CARDTOKEN_AUX,
            tbl_cardstatus_id = 51;

            insert into TBL_MESSAGE (CODE,DATA)
            values('39','0000'),('44','Transaction Approved');

        else

			if (select A.tbl_cardpaypal_email from tbl_cardpaypal as A, tbl_carduser as B where A.tbl_cardpaypal_email = de_048_027 and B.tbl_user_nmcId = de_053 and A.tbl_cardstatus_id = 52 and A.tbl_card_tocken = B.tbl_card_tocken) is not null then

				update tbl_cardpaypal set
				tbl_cardpaypal_nickname = COALESCE(de_048_006,''),
				tbl_cardpaypal_password = md5(de_123_059),
				tbl_cardpaypal_phoneNumber = de_048_028,
				tbl_cardstatus_id = 51
				where tbl_cardpaypal_email = de_048_027;

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');

			else

				SET ACCOUNTID_AUX = 0;

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','1804'),('44','Invalid card number');

			end if;

        end if;

    else
    
		if de_120_007 = 72 then 
			set de_002 = de_114_056;
		end if;
        

        if (select tbl_card_tocken from tbl_card where tbl_card_tocken = de_002 limit 1) is null then

            SET CARDTOKEN_AUX = de_002;

			if (select tbl_carduser_id from tbl_carduser where tbl_user_nmcId = de_053 and tbl_card_tocken = CARDTOKEN_AUX limit 1) is null then

				if (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) is not null then
					SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) +1;
				else
					SET ACCOUNTID_AUX = 1;
				end if;

				if de_114_009 = 'true' then
                
					update tbl_carduser set
                    tbl_carduser_primaryAccount_f = 0
                    where tbl_user_nmcId = de_053
                    and tbl_carduser_primaryAccount_f = 1;

                end if;

				insert into tbl_carduser set
				tbl_carduser_id = ACCOUNTID_AUX,
				tbl_user_nmcId = de_053,
				tbl_card_tocken = CARDTOKEN_AUX,
				tbl_paymentnaturetype_id = COALESCE(de_121_070,35001),
				tbl_carduser_referenceNumber = de_122_126,
                tbl_carduser_primaryAccount_f = COALESCE(if(de_114_009='true',1,0),0),
				tbl_carduser_date = de_121_005;

			end if;

            insert into tbl_card set
            tbl_user_id = de_053,
            tbl_card_tocken = CARDTOKEN_AUX,
            tbl_card_number = SUBSTRING(de_002, -4),
            tbl_card_verification_number = COALESCE(de_048_004,''),
            tbl_card_dateAdded = NOW(),
            tbl_card_datemodified = NOW(),
            tbl_cardstype_id = de_120_007,
            tbl_cardstatus_id = 51,
            tbl_card_nickname = COALESCE(de_048_006,''),
            tbl_card_chardholderName = COALESCE(de_048_002,''),
            tbl_card_routingNumber = COALESCE(de_122_188,''),
            tbl_card_issuingBank = COALESCE(de_048_007,''),
            tbl_accounttype_id = COALESCE(de_048_003,null),
            tbl_bankaccounttype_id = COALESCE(de_122_190,null),
            tbl_card_dateExpire = COALESCE(de_118_005,''),
            tbl_card_swift_iban_code = COALESCE(de_122_189,''),
			tbl_country_id = COALESCE(de_122_087,null),
            tbl_debitaccounttype_id = null,
            tbl_address_id = de_114_115;

            -- -----------------------
            -- Result of operation  --
            -- -----------------------
            insert into TBL_MESSAGE (CODE,DATA)
            values('39','0000'),('44','Transaction Approved');

        else

			if (select A.tbl_card_tocken from tbl_card as A, tbl_carduser as B where A.tbl_card_tocken = de_002 and B.tbl_user_nmcId = de_053 and A.tbl_card_tocken = B.tbl_card_tocken limit 1) is not null then
				
                if de_114_009 = 'true' then
                
					update tbl_carduser set
                    tbl_carduser_primaryAccount_f = 0
                    where tbl_user_nmcId = de_053
                    and tbl_carduser_primaryAccount_f = 1;

                end if;
                
				update tbl_card set
				tbl_card_datemodified = NOW(),
				tbl_cardstype_id = de_120_007,
				tbl_cardstatus_id = 51,
				tbl_card_nickname = COALESCE(de_048_006,''),
				tbl_card_chardholderName = COALESCE(de_048_002,''),
                tbl_card_verification_number = COALESCE(de_048_004,''),
				tbl_card_routingNumber = COALESCE(de_122_188,''),
				tbl_card_issuingBank = COALESCE(de_048_007,''),
				tbl_accounttype_id = COALESCE(de_048_003,null),
				tbl_bankaccounttype_id = COALESCE(de_122_190,null),
				tbl_card_dateExpire = COALESCE(de_118_005,''),
				tbl_card_swift_iban_code = COALESCE(de_122_189,''),
				tbl_debitaccounttype_id = null,
				tbl_address_id = de_114_115
                where tbl_card_tocken = de_002
                and tbl_user_id = de_053;

				SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser where tbl_user_nmcId = de_053 and tbl_card_tocken = de_002);

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');

			else 
            
                SET CARDTOKEN_AUX =  de_002;
			
				if (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) is not null then
					SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) +1;
				else
					SET ACCOUNTID_AUX = 1;
				end if;

				if de_114_009='true' then
                
					update tbl_carduser set
                    tbl_carduser_primaryAccount_f = 0
                    where tbl_user_nmcId = de_053
                    and tbl_carduser_primaryAccount_f = 1;

                end if;

				insert into tbl_carduser set
				tbl_carduser_id = ACCOUNTID_AUX,
				tbl_user_nmcId = de_053,
				tbl_card_tocken = CARDTOKEN_AUX,
				tbl_paymentnaturetype_id = COALESCE(de_121_070,35001),
				tbl_carduser_referenceNumber = de_122_126,
                tbl_carduser_primaryAccount_f = COALESCE(if(de_114_009='true',1,0),0),
				tbl_carduser_date = de_121_005;

				insert into tbl_card set
                tbl_user_id = de_053,
				tbl_card_tocken = CARDTOKEN_AUX,
				tbl_card_number = SUBSTRING(de_002, -4),
                tbl_card_verification_number = COALESCE(de_048_004,''),
				tbl_card_dateAdded = NOW(),
				tbl_card_datemodified = NOW(),
				tbl_cardstype_id = de_120_007,
				tbl_cardstatus_id = 51,
				tbl_card_nickname = COALESCE(de_048_006,''),
				tbl_card_chardholderName = COALESCE(de_048_002,''),
				tbl_card_routingNumber = COALESCE(de_122_188,''),
				tbl_card_issuingBank = COALESCE(de_048_007,''),
				tbl_accounttype_id = COALESCE(de_048_003,null),
				tbl_bankaccounttype_id = COALESCE(de_122_190,null),
				tbl_card_dateExpire = COALESCE(de_118_005,''),
				tbl_card_swift_iban_code = COALESCE(de_122_189,''),
				tbl_country_id = COALESCE(de_122_087,null),
				tbl_debitaccounttype_id = null,
				tbl_address_id = de_114_115;

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');

			end if;

		end if;

    end if;




    SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
    SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

    IF (RESULT_39 = '0000') THEN
        SELECT
		GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"122.34":"',ACCOUNTID_AUX,'"}')) AS JSON;
    ELSE
        SELECT
		GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;
    END IF;
    DROP TABLE TBL_MESSAGE;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewAccountByReseller030400409` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewAccountByReseller030400409`(IN MSG_IN VARCHAR(20000))
BEGIN

-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: AddNewAccountByReseller030400409
-- Version: 1.0
-- Last modified: 2014-04-15
-- --------------------------------------------------------

-- -------------------------
-- Declare Data Elements --
-- -------------------------

    DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_053  VARCHAR(20) DEFAULT 0;               -- User id
	DECLARE de_002 VARCHAR(45) DEFAULT NULL;             -- Account number	
	DECLARE de_048_002 VARCHAR(99) DEFAULT NULL;         -- Cardholder name	
	DECLARE de_118_005 VARCHAR(5) DEFAULT NULL;         -- Card expiration date accessible
	DECLARE de_048_004 VARCHAR(5) DEFAULT NULL;         -- Card verification number
		
    DECLARE de_120_007 INT(11) DEFAULT 0;                 -- Type credit card

    

-- -------------------------
-- Declare auxiliary --
-- -------------------------

    DECLARE CARDTOKEN_AUX VARCHAR(100) DEFAULT NULL;
    DECLARE ACCOUNTID_AUX INT(11) DEFAULT 0;
    DECLARE ADDRESSID_AUX INT(11) DEFAULT 0;

    DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
    DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations  --
-- ---------------

    DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;

    --            TABLE  TEMPORARY OF IN    --
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);

    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------
-- Set variables  --
-- -----------------

	SET    de_053     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	SET    de_053     = (select right(de_053,11));
	SET    de_002     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '2');
	SET    de_048_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.2');
	SET    de_118_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.5');
	SET    de_048_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.4');
	
	SET    de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');

-- ---------------
-- Query of DB  --
-- ---------------

		SET CARDTOKEN_AUX = de_002;
        
		if (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) is not null then
			SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) +1;
		else
			SET ACCOUNTID_AUX = 1;
		end if;

		insert into tbl_carduser set
		tbl_carduser_id = ACCOUNTID_AUX,
		tbl_user_nmcId = de_053,
		tbl_card_tocken = CARDTOKEN_AUX,
		tbl_paymentnaturetype_id = 35003;

		insert into tbl_card set
		tbl_card_tocken = CARDTOKEN_AUX,
		tbl_card_number = SUBSTRING(de_002, -4),
		tbl_card_dateAdded = NOW(),
		tbl_card_datemodified = NOW(),
		tbl_cardstype_id = de_120_007,
		tbl_cardstatus_id = 51,
		tbl_accounttype_id = 402,
		tbl_card_nickname = COALESCE(de_048_002,''),
		tbl_card_chardholderName = COALESCE(de_048_002,''),
		tbl_card_dateExpire = COALESCE(de_118_005,''),	
		tbl_card_routingNumber = '',
		tbl_card_issuingBank = '',		
		tbl_bankaccounttype_id = null,
		tbl_card_swift_iban_code = '',
		tbl_country_id = null,
		tbl_debitaccounttype_id = null,
		tbl_address_id = null;

		-- -----------------------
		-- Result of operation  --
		-- -----------------------
		insert into TBL_MESSAGE (CODE,DATA)
		values('39','0000'),('44','Transaction Approved');

	

    SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
    SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

    IF (RESULT_39 = '0000') THEN
        SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"122.34":"',ACCOUNTID_AUX,'"}')) AS JSON;
    ELSE
        SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;
    END IF;
    DROP TABLE TBL_MESSAGE;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewCard030300445` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `AddNewCard030300445`(IN MSG_IN VARCHAR(20000))
BEGIN

-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: AddNewAccount030400044
-- Version: 1.0
-- Last modified: 2014-02-24
-- --------------------------------------------------------

-- -------------------------
-- Declare Data Elements --
-- -------------------------

    DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_053  VARCHAR(20) DEFAULT 0;			-- User id
	DECLARE de_048_015 VARCHAR(20) DEFAULT NULL;    -- Card token
	DECLARE de_118_005 VARCHAR(5) DEFAULT NULL;     -- Card expiration date 
	DECLARE de_120_007 INT(11) DEFAULT 0;           -- Type credit card
    DECLARE de_121_017 INT(4) DEFAULT NULL;         -- Account number
    DECLARE de_048_006 VARCHAR(45) DEFAULT NULL;    -- Nick name
    DECLARE de_048_002 VARCHAR(99) DEFAULT NULL;    -- Cardholder name
	
	DECLARE ACCOUNTID_AUX INT(11) DEFAULT 0;
    DECLARE ADDRESSID_AUX INT(11) DEFAULT 0;
	
-- -------------------------
-- Declare auxiliary --
-- -------------------------

    DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
    DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations  --
-- ---------------

    DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;

    --            TABLE  TEMPORARY OF IN    --
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);

    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------
-- Set variables  --
-- -----------------

	SET de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_053 = (select right(de_053,11));

	SET de_048_015 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.15');
	SET de_118_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.5');
	SET de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
	SET de_121_017 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.17');
    SET de_048_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.6');
	SET de_048_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.2');
        
	SET ADDRESSID_AUX = (select tbl_address_id from dbuser.tbl_address where tbl_user_id = de_053 limit 1);
    
-- ---------------
-- Query of DB  --
-- ---------------

	if de_120_007 != 64 and de_120_007 != 72 then

		if (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) is not null then
			SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) +1;
		else
			SET ACCOUNTID_AUX = 1;
		end if;
		
		insert into tbl_carduser set
		tbl_carduser_id = ACCOUNTID_AUX,
		tbl_user_nmcId = de_053,
		tbl_card_tocken = de_048_015,
		tbl_paymentnaturetype_id = 35001;
		
		insert into tbl_card set
		tbl_card_tocken = de_048_015,
		tbl_card_number = de_121_017,
		tbl_card_dateAdded = NOW(),
		tbl_card_datemodified = NOW(),
		tbl_cardstype_id = de_120_007,
		tbl_cardstatus_id = 51,
		tbl_card_nickname = COALESCE(de_048_006,''),
        tbl_card_chardholderName = COALESCE(de_048_002,''),		
		tbl_card_routingNumber = '',
		tbl_card_issuingBank = '',
		tbl_accounttype_id = null,
		tbl_bankaccounttype_id = null,	
		tbl_card_dateExpire = COALESCE(de_118_005,''),
		tbl_card_swift_iban_code = '',
		tbl_country_id = null,
		tbl_debitaccounttype_id = null,
		tbl_address_id = ADDRESSID_AUX;

	end if;

	insert into TBL_MESSAGE (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');


    SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
    SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);


	SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"114.9":"true"}')) AS JSON;

    DROP TABLE TBL_MESSAGE;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewCreditCard030400899` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Administrador`@`%` PROCEDURE `AddNewCreditCard030400899`(IN MSG_IN VARCHAR(20000))
BEGIN

-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: AddNewCreditCard030400899
-- Version: 1.0
-- Last modified: 2020-11-04
-- --------------------------------------------------------

-- -------------------------
-- Declare Data Elements --
-- -------------------------




    DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_053  VARCHAR(20) DEFAULT 0;                      -- 53 User id
    DECLARE de_120_007 INT(11) DEFAULT 0;                 -- 120.7 Type credit card
    DECLARE de_002 VARCHAR(45) DEFAULT NULL;             -- 2 Account number
    DECLARE de_048_015 VARCHAR(45) DEFAULT NULL;        -- 48.15 Card Token
	DECLARE de_048_002 VARCHAR(255) DEFAULT NULL;         -- 48.2 Cardholder name
    DECLARE de_048_006 VARCHAR(255) DEFAULT NULL;        -- 48.6 Card nick name
    DECLARE de_048_004 VARCHAR(5) DEFAULT NULL;         -- 48.4 Card verification number
    DECLARE de_118_005 VARCHAR(5) DEFAULT NULL;         -- 118.4 Card expiration date accessible
  
	DECLARE de_048_007 VARCHAR(255) DEFAULT NULL;         -- Issuing bank
    DECLARE de_122_189 VARCHAR(11) DEFAULT NULL;        -- Swift/IBAN code
	DECLARE de_122_190 INT(11) DEFAULT 0;                 -- Bank Account type
	DECLARE de_122_087 INT(11) DEFAULT 0;                 -- Country Id
    
	DECLARE de_122_034 INT(11) DEFAULT 0;                 -- Card user id
  
	DECLARE de_121_048 INT(11) DEFAULT 0;               
    DECLARE de_121_072 VARCHAR(45) DEFAULT 0;             -- 121.72 Type credit card NAME
    
-- -------------------------
-- Declare auxiliary --
-- -------------------------

    DECLARE CARDTOKEN_AUX VARCHAR(100) DEFAULT NULL;
    DECLARE ACCOUNTID_AUX INT(11) DEFAULT 0;
    DECLARE ADDRESSID_AUX INT(11) DEFAULT 0;
	DECLARE FLAG_AUX VARCHAR(5) DEFAULT NULL;
    DECLARE FLAG_2 VARCHAR(5) DEFAULT NULL;
	DECLARE BILLNUMBER_AUX INT(11) DEFAULT 0;

    DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
    DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations  --
-- ---------------

    DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;

    --            TABLE  TEMPORARY OF IN    --
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);

    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------
-- Set variables  --
-- -----------------

	SET    de_053     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	SET    de_053     = (select right(de_053,11));
	
	SET    de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
	SET    de_002     = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '2');
    SET    de_048_015 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.15');
    SET    de_048_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.2');
	SET    de_048_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.6');
	SET    de_048_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.4');
	SET    de_118_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.5');

	SET    de_122_034 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.34');

	SET de_122_189 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.189');
	SET de_122_190 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.190');
    SET de_048_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.7');
	SET de_122_087 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.87');
    
    SET de_121_048 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.48');
    SET de_121_072 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.72');
    
    
     if length(de_121_048)>0 then
		set de_053 = (select tbl_bill_merchant_nmcId from dbtransaction.tbl_bill where tbl_bill_number = de_121_048 limit 1);
     end if;
    
    
    if length(de_048_002)>0 then
		SET de_048_002 = convert(unhex(de_048_002) using utf8);
	end if;
    
	if length(de_048_006)>0 then
		SET de_048_006 = convert(unhex(de_048_006) using utf8);
	end if;
	
    if length(de_048_007)>0 then
		SET de_048_007 = convert(unhex(de_048_007) using utf8);
    end if;
    
    
	SET BILLNUMBER_AUX = (select A.tbl_bill_number 
												from dbtransaction.tbl_bill as A left join dbuser.tbl_user as B on A. tbl_bill_merchant_nmcId = B.tbl_user_id
                                                where tbl_bill_merchant_nmcId = de_053 and B.tbl_userstatus_id = 35 limit 1);

-- ---------------
-- Query of DB  --
-- ---------------

            SET CARDTOKEN_AUX = de_048_015;

					if (select A.tbl_carduser_id 
						from tbl_carduser as A, tbl_card as B
						where A.tbl_user_nmcId = de_053 
						and A.tbl_card_tocken = CARDTOKEN_AUX 
						and A.tbl_card_tocken = B.tbl_card_tocken 
						and A.tbl_user_nmcId = B.tbl_user_id
						limit 1) is null then
						
					 
						SET FLAG_AUX = 'true';

						if (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) is not null then
							SET ACCOUNTID_AUX = (SELECT tbl_carduser_id FROM tbl_carduser ORDER BY tbl_carduser_id DESC LIMIT 1) +1;
						else
							SET ACCOUNTID_AUX = 1;
						end if;

						insert into tbl_carduser set
						tbl_carduser_id = ACCOUNTID_AUX,
						tbl_user_nmcId = de_053,
						tbl_card_tocken = CARDTOKEN_AUX,
						tbl_paymentnaturetype_id = 35001,
						tbl_carduser_primaryAccount_f = 1;

						insert into tbl_card set
						tbl_user_id = de_053,
						tbl_card_tocken = CARDTOKEN_AUX,
                        tbl_card_type_name = de_121_072,
                        tbl_card_nickname = COALESCE(de_048_006,''),
						tbl_card_chardholderName = COALESCE(de_048_002,''),
						tbl_card_dateAdded = NOW(),
						tbl_card_datemodified = NOW(),
						tbl_cardstatus_id = 51;
					
						-- -----------------------
						-- Result of operation  --
						-- -----------------------
						insert into TBL_MESSAGE (CODE,DATA)
						values('39','0000'),('44','Transaction Approved');
				 
					else
					
						SET FLAG_AUX = 'false';
						SET ACCOUNTID_AUX = (select tbl_carduser_id from tbl_carduser where tbl_user_nmcId = de_053 and tbl_card_tocken = CARDTOKEN_AUX limit 1);
					
						insert into TBL_MESSAGE (CODE,DATA)
						values('39','0000'),('44','Transaction Approved');
					
					end if;
				
            

	if (select tbl_user_id from dbcards.tbl_card where tbl_user_id = de_053 and tbl_card_tocken = CARDTOKEN_AUX and (length(tbl_card_dateExpire) > 0 and length(tbl_card_nickname) > 0 and length(tbl_card_chardholderName) > 0) limit 1) is not null then
    
		set FLAG_2 = 'true';
    
    else
    
		set FLAG_2 = 'false';
    
    end if;
  
    SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
    SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

   --  IF length(BILLNUMBER_AUX)>0 THEN
    --    SELECT
	-- 	GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"121.48":"',BILLNUMBER_AUX,'"'),CONCAT(',"122.34":"',ACCOUNTID_AUX,'"}')) AS JSON;
    -- ELSE
        SELECT
		GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"114.9":"',FLAG_2,'"'),CONCAT(',"127.94":"',FLAG_AUX,'"'),CONCAT(',"122.34":"',ACCOUNTID_AUX,'"}')) AS JSON;
   --  END IF;
    DROP TABLE TBL_MESSAGE;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewPaymentServiceProviderAccountByUserId030400036` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewPaymentServiceProviderAccountByUserId030400036`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
		
	DECLARE de_053 VARCHAR(20) DEFAULT NULL;    		
	
	DECLARE de_122_122 VARCHAR(45) DEFAULT NULL; 			
	DECLARE de_114_073 INT(11) DEFAULT NULL; 				
		DECLARE de_122_121 VARCHAR(45) DEFAULT NULL; 		
		DECLARE de_122_120 VARCHAR(45) DEFAULT NULL; 		
		DECLARE de_114_156 VARCHAR(255) DEFAULT NULL; 		
			DECLARE de_048_028 VARCHAR(20) DEFAULT NULL; 	
			DECLARE de_121_167 VARCHAR(11) DEFAULT NULL; 		
			DECLARE de_122_087 INT(11) DEFAULT NULL; 		

	DECLARE PROVIDERID_AUX INT(11) DEFAULT NULL;
	DECLARE PHONEID_AUX INT(11) DEFAULT NULL;
	DECLARE PAYSERVUN_AUX INT(11) DEFAULT NULL;
	DECLARE PAYSERACCID_AUX INT(11) DEFAULT NULL;

	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;


	SET de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_053 = (select right(de_053,11));
        
	SET de_122_122 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.122');
	SET de_114_073 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.73');
	SET de_122_121 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.121');
	SET de_122_120 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.120');
	SET de_114_156 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.156');
	SET de_048_028 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.28');
	SET de_121_167 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '121.167');
	SET de_122_087 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.87');



		if length(de_114_073) > 0 then

			if (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) is not null then
			   SET PAYSERACCID_AUX = (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) +1;
			else
			   SET PAYSERACCID_AUX = 1;			  
			end if;

			insert into tbl_paymentserviceaccount set 
			tbl_paymentserviceaccount_id = PAYSERACCID_AUX,
			tbl_paymentserviceaccount_nmcid_user = de_053,
            tbl_paymentserviceprovider_id = de_114_073,
             tbl_paymentserviceaccount_name = de_122_121,
			tbl_paymentserviceaccount_enabled = 1,
			tbl_paymentserviceaccount_number = de_122_122,
			tbl_paymentserviceaccount_dateCreated = NOW();
			
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');

		else

			if (SELECT tbl_phone_id FROM dbuser.tbl_phone ORDER BY tbl_phone_id DESC LIMIT 1) is not null then
			   SET PHONEID_AUX = (SELECT tbl_phone_id FROM dbuser.tbl_phone ORDER BY tbl_phone_id DESC LIMIT 1) +1;
			else
			   SET PHONEID_AUX = 1;
			end if;

			if (SELECT tbl_paymentserviceprovider_unsupported_id FROM tbl_paymentserviceprovider_unsupported ORDER BY tbl_paymentserviceprovider_unsupported_id DESC LIMIT 1) is not null then
			   SET PAYSERVUN_AUX = (SELECT tbl_paymentserviceprovider_unsupported_id FROM tbl_paymentserviceprovider_unsupported ORDER BY tbl_paymentserviceprovider_unsupported_id DESC LIMIT 1) +1;
			else
			   SET PAYSERVUN_AUX = 1;
			end if;

			if (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) is not null then
			   SET PAYSERACCID_AUX = (SELECT tbl_paymentserviceaccount_id FROM tbl_paymentserviceaccount ORDER BY tbl_paymentserviceaccount_id DESC LIMIT 1) +1;
			else
			   SET PAYSERACCID_AUX = 1;			  
			end if;

			insert into dbuser.tbl_phone set
			tbl_phone_id = PHONEID_AUX,
			tbl_phone_nmcId = de_053,
			tbl_phone_phoneNumber = de_048_028,
			tbl_phone_extension = de_121_167,
			tbl_phone_country_id = de_122_087,
			tbl_phonetype_id = 4006;

			insert into tbl_paymentserviceprovider_unsupported set
			tbl_paymentserviceprovider_unsupported_id = PAYSERVUN_AUX,
			tbl_paymentserviceprovider_unsupported_providername = de_122_121,
			tbl_paymentserviceprovider_unsupported_contactname = de_122_120,
			tbl_paymentserviceprovider_unsupported_fileName = COALESCE(de_114_156,''),
			tbl_paymentserviceprovider_unsupported_dateCreated = NOW(),
			tbl_paymentserviceprovidertype_id = 37001,
			tbl_user_nmcId = de_053,
			tbl_phone_id = PHONEID_AUX;

			insert into tbl_paymentserviceaccount set
			tbl_paymentserviceaccount_id = PAYSERACCID_AUX,
			tbl_paymentserviceaccount_nmcid_user = de_053,
			tbl_paymentserviceprovider_id = null,
            tbl_paymentserviceaccount_name = de_122_121,
			tbl_paymentserviceprovider_unsupported_id = PAYSERVUN_AUX,
			tbl_paymentserviceaccount_enabled = 1,
			tbl_paymentserviceaccount_number = de_122_122,
			tbl_paymentserviceaccount_dateCreated = NOW();

			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');

		end if;

	

	
	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	SELECT GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"'),CONCAT(',"120.17":"',PAYSERACCID_AUX,'"}')) AS JSON;


	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPaymentMethodAcceptedByUserId030400035` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `AddPaymentMethodAcceptedByUserId030400035`(IN MSG_IN VARCHAR(20000))
BEGIN
-- -------------------------	
-- Declare Data Elements --
-- -------------------------
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE de_39 VARCHAR(4) DEFAULT NULL;
	DECLARE de_44 VARCHAR(25) DEFAULT NULL;
	DECLARE de_18 VARCHAR(140) DEFAULT NULL;
	
	
	DECLARE de_53 VARCHAR(20) DEFAULT NULL;    
	DECLARE de_120_007 INT(11) DEFAULT NULL; 	
	
-- --------------------
-- Declare auxiliary --
-- --------------------	
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations --
-- ---------------	
	

	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	
-- -----------------	
-- Set variables --
-- -----------------

        SET de_53 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
		set de_53 = (select right(de_53,11));
		SET de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
		
-- ---------------		
-- Query of DB --
-- ---------------

	
		if (select tbl_cardstype_id from tbl_cardstype where tbl_cardstype_id = de_120_007) is not null then 
				
			if (select tbl_cardstype_id from tbl_cardtypeaccepted where tbl_cardstype_id = de_120_007 and tbl_user_nmcId = de_53) is null then 
		
				insert into tbl_cardtypeaccepted set 
				tbl_user_nmcId = de_53,
				tbl_cardstype_id = de_120_007,
				tbl_cardtypeaccepted_dateCreated = NOW();


				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');
						
			else

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','1804'),('44','Duplicate Payment Method');	

			end if;

		else
		
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','2040'),('44','Invalid Payment Method');

		end if;

		
			
	
	
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
/*!50003 DROP PROCEDURE IF EXISTS `AddQuestionsAndAnswersByUser030400084` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Administrador`@`%` PROCEDURE `AddQuestionsAndAnswersByUser030400084`(IN MSG_IN VARCHAR(20000))
BEGIN
-- -------------------------	
-- Declare Data Elements --
-- -------------------------
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_39 VARCHAR(4) DEFAULT NULL;
	DECLARE de_44 VARCHAR(25) DEFAULT NULL;
	DECLARE de_18 VARCHAR(140) DEFAULT NULL;
		
	DECLARE de_053 VARCHAR(20) DEFAULT NULL; 
	
	DECLARE de_122_008 INT(11) DEFAULT NULL; 
	DECLARE de_122_009 INT(11) DEFAULT NULL; 
	DECLARE de_122_010 INT(11) DEFAULT NULL; 
	DECLARE de_122_011 INT(11) DEFAULT NULL; 
	DECLARE de_119_004 VARCHAR(100) DEFAULT NULL; 
	DECLARE de_119_006 VARCHAR(100) DEFAULT NULL; 
	DECLARE de_119_008 VARCHAR(100) DEFAULT NULL; 
	DECLARE de_119_010 VARCHAR(100) DEFAULT NULL; 
-- --------------------
-- Declare auxiliary --
-- --------------------	
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;
	
-- ---------------
-- Validations --
-- ---------------
	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
	
	
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);

	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
	
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
-- -----------------	
-- Set variables --
-- -----------------
		SET de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
		set de_053 = (select right(de_053,11));
		SET de_122_008 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.8');
		SET de_122_009 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.9');
		SET de_122_010 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.10');
		SET de_122_011 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.11');
		SET de_119_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '119.4');
		SET de_119_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '119.6');
		SET de_119_008 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '119.8');
		SET de_119_010 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '119.10');
-- ---------------		
-- Query of DB --
-- ---------------	
		
         
        
        if (select tbl_securityquestionsanswer_id from tbl_securityquestionsanswer where tbl_cardsconsumer_nmcId = de_053 limit 1) is not null then
		 delete from tbl_securityquestionsanswer
         where tbl_cardsconsumer_nmcId = de_053;
         
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_008,
			tbl_securityquestionsanswer_answer = de_119_004,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_009,
			tbl_securityquestionsanswer_answer = de_119_006,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_010,
			tbl_securityquestionsanswer_answer = de_119_008,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_011,
			tbl_securityquestionsanswer_answer = de_119_010,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');
        
        else
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_008,
			tbl_securityquestionsanswer_answer = de_119_004,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_009,
			tbl_securityquestionsanswer_answer = de_119_006,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_010,
			tbl_securityquestionsanswer_answer = de_119_008,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into tbl_securityquestionsanswer set 
			tbl_securityquestions_id = de_122_011,
			tbl_securityquestionsanswer_answer = de_119_010,
			tbl_cardsconsumer_nmcId = de_053;
			
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');
					
	

		end if;

	set RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	set RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);


	select GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) as JSON;

	
	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AttachAccountToCardByUserId030400040` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AttachAccountToCardByUserId030400040`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE de_53 VARCHAR(20) DEFAULT NULL;    
	DECLARE de_120_007 INT(11) DEFAULT NULL; 	
	DECLARE de_122_034 INT(11) DEFAULT NULL; 	
	DECLARE de_120_017 INT(11) DEFAULT NULL; 	
	DECLARE de_114_047 INT(11) DEFAULT NULL; 	
	DECLARE de_123_072 INT(11) DEFAULT NULL; 	



	DECLARE PROVIDERID_AUX INT(11) DEFAULT NULL;
	DECLARE PHONEID_AUX INT(11) DEFAULT NULL;
	DECLARE PAYSERVUN_AUX INT(11) DEFAULT NULL;

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;




	
	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;





        SET de_53 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
		set de_53 = (select right(de_53,11));
		SET de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
		SET de_122_034 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.34');
		SET de_120_017 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.17');
		SET de_114_047 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.47');
		SET de_123_072 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '123.72');





		if (select tbl_user_nmcId from tbl_cardtypeaccepted where tbl_user_nmcId = de_53 and tbl_cardstype_id = de_120_007 limit 1) is not null then

			if (select tbl_cardstype_reqperlocation from tbl_cardstype where tbl_cardstype_id = de_120_007 limit 1) = 1 then

					insert into tbl_cardtypeaccepted_account set 
					tbl_paymentserviceaccount_id = COALESCE(de_120_017,null),
					tbl_carduser_id = COALESCE(de_122_034,null),
					tbl_user_nmcId = de_53,
					tbl_cardstype_id = de_120_007,
					tbl_location_id = de_114_047,
                    tbl_gateway_id =  de_123_072,
					tbl_cardtypeaccepted_account_dateCreated = NOW();

					insert into TBL_MESSAGE (CODE,DATA)
					values('39','0000'),('44','Transaction Approved');

			else

				insert into tbl_cardtypeaccepted_account set 
				tbl_paymentserviceaccount_id = COALESCE(de_120_017,null),
				tbl_carduser_id = COALESCE(de_122_034,null),
				tbl_user_nmcId = de_53,
				tbl_cardstype_id = de_120_007,
                tbl_gateway_id =  de_123_072,
				tbl_cardtypeaccepted_account_dateCreated = NOW();
				
				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');

			end if;

		else
		
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','2040'),('44','Invalid Payment Method Accepted');
		
		end if;
	
	
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
/*!50003 DROP PROCEDURE IF EXISTS `EditAccount020400070` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditAccount020400070`(IN MSG_IN VARCHAR(20000))
BEGIN



	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	
	DECLARE de_122_034 INT(11) DEFAULT NULL;			
	DECLARE de_53 VARCHAR(20) DEFAULT 0;					
	DECLARE de_120_007 INT(11) DEFAULT 0; 				

	DECLARE de_118_005 VARCHAR(5) DEFAULT NULL; 			
	DECLARE de_048_002 VARCHAR(99) DEFAULT NULL; 		
	DECLARE de_048_006 VARCHAR(45) DEFAULT NULL;	

	DECLARE de_AD VARCHAR(5000) DEFAULT NULL;  			
	DECLARE de_114_115  INT(11) DEFAULT 0 ; 	
		
	DECLARE de_114_009 VARCHAR(5) DEFAULT 0;                 -- 114.9 primary account flag
    


	DECLARE CARDTOKEN_AUX VARCHAR(100) DEFAULT NULL;
	DECLARE CARDID_AUX INT(11) DEFAULT NULL;

	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;





	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
	
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;





		SET	de_53 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
		set de_53 = (select right(de_53,11));
		SET	de_122_034 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.34');
		SET	de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');

		SET	de_118_005 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '118.5');
		SET	de_048_002 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.2');
		SET	de_048_006 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '48.6');

		SET de_AD = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'AD');
		SET de_AD = convert(unhex(de_AD) USING utf8);
		SET de_114_115 = common_schema.get_option( de_AD, "114.115" );

		SET de_114_009 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.9');



 
	if de_120_007 != 64 then

		if (select B.tbl_carduser_id 
			from tbl_card as A, tbl_carduser as B 
			where B.tbl_carduser_id = de_122_034 
			and B.tbl_user_nmcId = de_53 
			and A.tbl_card_tocken = B.tbl_card_tocken limit 1) is not null then
			
			set CARDID_AUX = (select A.tbl_card_id from tbl_card as A, tbl_carduser as B where B.tbl_carduser_id = de_122_034 and B.tbl_user_nmcId = de_53 and A.tbl_card_tocken = B.tbl_card_tocken and A.tbl_user_id = B.tbl_user_nmcId limit 1);
			
			if length(de_118_005)>0 then 
				update tbl_card set
				tbl_card_dateExpire = de_118_005
				where tbl_card_id = CARDID_AUX;
			end if;

			if length(de_048_002)>0  then
				update tbl_card set
				tbl_card_chardholderName =  de_048_002
				where tbl_card_id = CARDID_AUX;
			end if;

			if length(de_048_006)>0 and de_120_007 != 64 then
				update tbl_card set
				tbl_card_nickname = de_048_006
				where tbl_card_id = CARDID_AUX;
			end if;

			if(length(de_114_115)>0)then 
				update tbl_card set
				tbl_address_id = de_114_115
				where tbl_card_id = CARDID_AUX;
			end if;
		
			if(length(de_114_009)>0)then 
			
				if de_114_009 = 'true' then
				
					update tbl_carduser set
					tbl_carduser_primaryAccount_f = 0
					where tbl_user_nmcId = de_53;
				
				end if;
			
				update tbl_carduser set
				tbl_carduser_primaryAccount_f = if(de_114_009='true',1,0)
				where tbl_carduser_id = de_122_034;
			end if;
        
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');

		else 

			insert into TBL_MESSAGE (CODE,DATA)
			values('39','1015'),('44','Invalid Request');

		end if;

	else 

		set CARDID_AUX = (select A.tbl_cardpaypal_id from tbl_cardpaypal as A, tbl_carduser as B where B.tbl_carduser_id = de_122_034 and B.tbl_user_nmcId = de_53 and A.tbl_card_tocken = B.tbl_card_tocken);
			
		if length(de_048_006)>0 and de_120_007 = 64 then
			update tbl_cardpaypal set
			tbl_cardpaypal_nickname = de_048_006
			where tbl_cardpaypal_id = CARDID_AUX;
		end if;

		insert into TBL_MESSAGE (CODE,DATA)
		values('39','0000'),('44','Transaction Approved');

	end if;

	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	 SELECT  GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;

	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditPaymentServiceProviderAccountByUserId030400268` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditPaymentServiceProviderAccountByUserId030400268`(IN MSG_IN VARCHAR(20000))
BEGIN
-- -------------------------	
-- Declare Data Elements --
-- -------------------------


	DECLARE de_53 VARCHAR(20) DEFAULT NULL; 
			
	
	DECLARE de_120_017 INT(11) DEFAULT NULL; 	
	DECLARE de_114_047 INT(11) DEFAULT NULL;
    DECLARE de_122_121 VARCHAR(45) DEFAULT NULL; 
	DECLARE de_122_122 VARCHAR(45) DEFAULT NULL; 	
	DECLARE de_114_073 INT(11) DEFAULT NULL; 
	DECLARE de_122_004 INT(11) DEFAULT NULL; 

-- --------------------
-- Declare auxiliary --
-- --------------------
	DECLARE de_CT VARCHAR(5000) DEFAULT NULL;  
	DECLARE CADENA_CARD VARCHAR(5000) DEFAULT NULL;
    DECLARE de_120_007 INT(11) DEFAULT NULL; 
    
    DECLARE de_GW VARCHAR(5000) DEFAULT NULL;  
	DECLARE CADENA_GATEWAY VARCHAR(5000) DEFAULT NULL;
	DECLARE de_123_072 INT(11) DEFAULT NULL; 
    
    DECLARE de_GP VARCHAR(5000) DEFAULT NULL;  
    DECLARE CADENA_PARAM VARCHAR(5000) DEFAULT NULL;
    DECLARE CADENA_PARAM_VAL VARCHAR(5000) DEFAULT NULL;
    DECLARE de_123_075 INT(11) DEFAULT NULL; 
    DECLARE de_123_078 VARCHAR(99) DEFAULT NULL; 	
    
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations  --
-- ---------------	
	
	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

-- -----------------	
-- Set variables --
-- -----------------

	SET de_53 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_53 = (select right(de_53,11));

	SET de_CT = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'CT');
	set de_CT = convert(unhex(de_CT) USING utf8);
	SET de_CT = REPLACE(de_CT,'{"1','{"_1');
	set CADENA_CARD = (select common_schema.extract_json_value_nmc(concat('{"_CT":', de_CT ,'}'),'//_120.7'));	

	SET de_GW = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'GW');
	set de_GW = convert(unhex(de_GW) USING utf8);
	SET de_GW = REPLACE(de_GW,'{"1','{"_1');
	set CADENA_GATEWAY = (select common_schema.extract_json_value_nmc(concat('{"_GW":', de_GW ,'}'),'//_123.72'));

	SET de_GP = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'GP');
	set de_GP = convert(unhex(de_GP) USING utf8);
	SET de_GP = REPLACE(de_GP,'{"1','{"_1');
    SET de_GP = REPLACE(de_GP,',"1',',"_1');
	set CADENA_PARAM = (select common_schema.extract_json_value_nmc(concat('{"_GP":', de_GP ,'}'),'//_123.75'));
	set CADENA_PARAM_VAL = (select common_schema.extract_json_value_nmc(concat('{"_GP":', de_GP ,'}'),'//_123.78'));
    
	SET de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');
	SET de_120_017 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.17');
	SET de_114_047 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.47');
    SET de_122_121 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.121');
	SET de_122_122 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.122');
	SET de_114_073 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.73');
	SET de_122_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.4');

-- ---------------		
-- Query of DB --
-- ---------------

	update tbl_paymentserviceaccount set 
	tbl_paymentserviceprovider_id = COALESCE(de_114_073,tbl_paymentserviceprovider_id),
	tbl_paymentserviceprovider_unsupported_id = COALESCE(de_122_004,tbl_paymentserviceprovider_unsupported_id),
	tbl_paymentserviceaccount_enabled = 1,
    tbl_paymentserviceaccount_name= COALESCE(de_122_121,tbl_paymentserviceaccount_name),
	tbl_paymentserviceaccount_number = COALESCE(de_122_122,tbl_paymentserviceaccount_number),
	tbl_paymentserviceaccount_dateCreated = NOW()
	where tbl_paymentserviceaccount_id = de_120_017
	and tbl_paymentserviceaccount_nmcid_user = de_53;

	delete from dbtransaction.tbl_gateway_user
    where tbl_gateway_params_id in (select tbl_gateway_params_id
															from dbtransaction.tbl_gateway_params
                                                            where tbl_gateway_id = (select tbl_gateway_id 
																									from tbl_cardtypeaccepted_account 
																									where tbl_paymentserviceaccount_id = de_120_017 
																									and tbl_location_id = de_114_047 limit 1));

	delete from tbl_cardtypeaccepted_account 
	where tbl_paymentserviceaccount_id = de_120_017
	and tbl_location_id = de_114_047;
	
    
    
    
    while (LENGTH(CADENA_GATEWAY)>0) DO
			
		SET de_123_072 = TRIM((SELECT SUBSTR(CADENA_GATEWAY,1,LOCATE('|',CADENA_GATEWAY)-1)));
		SET CADENA_GATEWAY = (SELECT SUBSTR(CADENA_GATEWAY,LOCATE('|',CADENA_GATEWAY)+1));
	
	end while;
    
    
    
    
    while (LENGTH(CADENA_PARAM)>0) DO
			
		SET de_123_075 = TRIM((SELECT SUBSTR(CADENA_PARAM,1,LOCATE('|',CADENA_PARAM)-1)));
		SET CADENA_PARAM = (SELECT SUBSTR(CADENA_PARAM,LOCATE('|',CADENA_PARAM)+1));
	
		SET de_123_078 = TRIM((SELECT SUBSTR(CADENA_PARAM_VAL,1,LOCATE('|',CADENA_PARAM_VAL)-1)));
		SET CADENA_PARAM_VAL = (SELECT SUBSTR(CADENA_PARAM_VAL,LOCATE('|',CADENA_PARAM_VAL)+1));
	
    
			insert into dbtransaction.tbl_gateway_user set 
			tbl_user_id = de_53,
			tbl_gateway_params_id = de_123_075,
			tbl_gateway_user_value = de_123_078,
			tbl_gateway_user_dateCreated  = NOW();	

	end while;
    
    
    
    
	while (LENGTH(CADENA_CARD)>0) DO
			
		SET de_120_007 = TRIM((SELECT SUBSTR(CADENA_CARD,1,LOCATE('|',CADENA_CARD)-1)));
		SET CADENA_CARD = (SELECT SUBSTR(CADENA_CARD,LOCATE('|',CADENA_CARD)+1));
	
		if (select tbl_paymentserviceaccount_id from tbl_cardtypeaccepted_account where tbl_paymentserviceaccount_id = de_120_017 and tbl_user_nmcId = de_53 and tbl_cardstype_id = de_120_007 and tbl_location_id = de_114_047 limit 1) is null then

			insert into tbl_cardtypeaccepted_account set
			tbl_paymentserviceaccount_id = de_120_017,
			tbl_carduser_id = null,
			tbl_user_nmcId = de_53,
            tbl_gateway_id = de_123_072,
			tbl_cardstype_id = de_120_007,
			tbl_location_id = de_114_047,
			tbl_cardtypeaccepted_account_dateCreated = NOW();

		end if;
			
	end while;





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
/*!50003 DROP PROCEDURE IF EXISTS `EditPaymentServiceProviderUnsupportedById020400384` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `EditPaymentServiceProviderUnsupportedById020400384`(IN MSG_IN VARCHAR(20000))
BEGIN
	

	DECLARE de_122_004 INT(11) DEFAULT NULL; 

	DECLARE de_053 VARCHAR(20) DEFAULT NULL;    			
 				
	DECLARE de_122_121 VARCHAR(45) DEFAULT NULL; 		
	DECLARE de_122_120 VARCHAR(45) DEFAULT NULL; 		
	DECLARE de_114_156 VARCHAR(255) DEFAULT NULL; 		

	DECLARE de_PH VARCHAR(5000) DEFAULT NULL;  
	DECLARE de_122_088 INT(11) DEFAULT NULL; 
	DECLARE de_048_028 VARCHAR(20) DEFAULT NULL; 	
	DECLARE de_121_167 VARCHAR(11) DEFAULT NULL; 		
	DECLARE de_122_087 INT(11) DEFAULT NULL; 		

	DECLARE PHONEID_AUX INT(11) DEFAULT NULL;
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;




	DROP TEMPORARY TABLE if exists TBL_MESSAGE;	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;



	SET de_122_004 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.4');

	SET de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_053 = (select right(de_053,11));

	SET de_122_121 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.121');
	SET de_122_120 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.120');
	SET de_114_156 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.156');
	
	SET de_PH = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = 'PH');
	set de_PH = convert(unhex(de_PH) USING utf8);

	SET de_122_088 = common_schema.get_option(de_PH, "122.88");
	SET de_048_028 = common_schema.get_option(de_PH, "48.28");
	SET de_121_167 = common_schema.get_option(de_PH, "121.167");
	SET de_122_087 = common_schema.get_option(de_PH, "122.87");



	if trim(de_122_088) = 0 then
	
		if (SELECT tbl_phone_id FROM dbuser.tbl_phone ORDER BY tbl_phone_id DESC LIMIT 1) is not null then
		   SET PHONEID_AUX = (SELECT tbl_phone_id FROM dbuser.tbl_phone ORDER BY tbl_phone_id DESC LIMIT 1) +1;
		else
		   SET PHONEID_AUX = 1;
		end if;

		insert into dbuser.tbl_phone set
		tbl_phone_id = PHONEID_AUX,
		tbl_phone_nmcId = de_053,
		tbl_phone_phoneNumber = trim(de_048_028),
		tbl_phone_extension = trim(de_121_167),
		tbl_phone_country_id = trim(de_122_087),
		tbl_phonetype_id = 4006;

		update tbl_paymentserviceprovider_unsupported set
		tbl_paymentserviceprovider_unsupported_providername = COALESCE(de_122_121,tbl_paymentserviceprovider_unsupported_providername),
		tbl_paymentserviceprovider_unsupported_contactname = COALESCE(de_122_120,tbl_paymentserviceprovider_unsupported_contactname),
		tbl_paymentserviceprovider_unsupported_fileName = COALESCE(de_114_156,tbl_paymentserviceprovider_unsupported_fileName),
		tbl_phone_id = PHONEID_AUX
		where tbl_paymentserviceprovider_unsupported_id = de_122_004;

	else

		update dbuser.tbl_phone set
		tbl_phone_phoneNumber = COALESCE(trim(de_048_028),tbl_phone_phoneNumber),
		tbl_phone_extension = COALESCE(trim(de_121_167),tbl_phone_extension),
		tbl_phone_country_id = COALESCE(trim(de_122_087),tbl_phone_country_id)
		where tbl_phone_id = trim(de_122_088);

		update tbl_paymentserviceprovider_unsupported set
		tbl_paymentserviceprovider_unsupported_providername = COALESCE(de_122_121,tbl_paymentserviceprovider_unsupported_providername),
		tbl_paymentserviceprovider_unsupported_contactname = COALESCE(de_122_120,tbl_paymentserviceprovider_unsupported_contactname),
		tbl_paymentserviceprovider_unsupported_fileName = COALESCE(de_114_156,tbl_paymentserviceprovider_unsupported_fileName)
		where tbl_paymentserviceprovider_unsupported_id = de_122_004;

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
/*!50003 DROP PROCEDURE IF EXISTS `EditPrimaryAccountByUser020400671` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditPrimaryAccountByUser020400671`(IN MSG_IN VARCHAR(20000))
BEGIN



	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	
	DECLARE de_122_034 INT(11) DEFAULT NULL;			
	DECLARE de_53 VARCHAR(20) DEFAULT 0;					
	DECLARE de_114_009 VARCHAR(5) DEFAULT 0;                 -- 114.9 primary account flag
    
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE if exists TBL_MESSAGE;
		
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;


	SET	de_53 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_53 = (select right(de_53,11));
    
	SET	de_122_034 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.34');
	SET de_114_009 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '114.9');


	if de_114_009 = 'true' then
				
		update tbl_carduser set
		tbl_carduser_primaryAccount_f = 0
		where tbl_user_nmcId = de_53;
				
	end if;
			
	update tbl_carduser set
	tbl_carduser_primaryAccount_f = if(de_114_009='true',1,0)
	where tbl_carduser_id = de_122_034;
	
        
	insert into TBL_MESSAGE (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');

	
	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	 SELECT  GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;

	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLastActivityByCardUserId010400080` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `GetLastActivityByCardUserId010400080`(PARAM VARCHAR(20000))
BEGIN 
-- -------------------------	
-- Declare Data Elements --
-- -------------------------
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_122_034 INT(11) DEFAULT 0;  
-- --------------------
-- Declare auxiliary --
-- --------------------	
	
	DECLARE USERTYPE_AUX INT(11) DEFAULT 0;
	DECLARE CARD_TOCKEN VARCHAR(45) DEFAULT NULL;
	DECLARE LAST_ACTIVITY VARCHAR(45) DEFAULT NULL;

-- ---------------
-- Validations --
-- ---------------
    DROP TEMPORARY TABLE if exists TBL_MESSAGE1;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE1 (CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM PARAM));

    
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE1 (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
-- -----------------	
-- Set variables --
-- -----------------


	SET group_concat_max_len = 1000000;
	
	SET de_122_034 = (select DATA from TBL_MESSAGE1 where CODE = '122.34');

-- ---------------		
-- Query of DB --
-- ---------------	

	set USERTYPE_AUX = (select substring(B.tbl_user_entity,1,1) from tbl_carduser as A, dbuser.tbl_user as B where A.tbl_carduser_id = de_122_034 and A.tbl_user_nmcId = B.tbl_user_id);

	if USERTYPE_AUX = 1 then

		set CARD_TOCKEN = (select tbl_card_tocken from tbl_carduser where tbl_carduser_id = de_122_034);
		set LAST_ACTIVITY = (select tbl_transaction_creationDate from dbtransaction.tbl_transaction where tbl_transaction_cardTocken = CARD_TOCKEN order by tbl_transaction_id desc limit 1);

		select CONCAT('{"118.6":"',COALESCE(LAST_ACTIVITY,''),'"}');

	else 

		set CARD_TOCKEN = (select tbl_card_tocken from tbl_carduser where tbl_carduser_id = de_122_034);
		set LAST_ACTIVITY = (select tbl_billtransaction_date from dbtransaction.tbl_billtransaction where tbl_cardTocken = CARD_TOCKEN order by tbl_billtransaction_id desc limit 1);

		select CONCAT('{"118.6":"',COALESCE(LAST_ACTIVITY,''),'"}');

	end if;

    
    DROP TABLE TBL_MESSAGE1;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRandomSecurityQuestionByUserId010300189` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `GetRandomSecurityQuestionByUserId010300189`(PARAM VARCHAR(20000))
BEGIN 

-- --------------------------------------------------------
-- Autor: Juan David Zapata
-- Procedure: GetRandomSecurityQuestionByUserId010300189
-- Method: 010300189
-- Version: 1.0
-- Last modified: 2014-04-08
-- --------------------------------------------------------

-- -------------------------	
-- Declare Data Elements  --
-- -------------------------

	DECLARE de_127_061 varchar(32) DEFAULT 0;  -- 127.61 NMC Id
	DECLARE USER_AUX INT(18) DEFAULT 0;  -- 53 User NMC Id

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE JSON MEDIUMTEXT;
	DECLARE QUESTION MEDIUMTEXT;

	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE1;
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE1 (CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM PARAM));
    --  METHOD FOR STORING MESSAGE DATA IN TEMPORARY TABLE
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE1 (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	
-- -----------------	
-- Set variables  --
-- -----------------

	SET group_concat_max_len = 150000;
	
	SET de_127_061 = (select DATA from TBL_MESSAGE1 where CODE = '127.61');

	SET USER_AUX = COALESCE((select tbl_user_id from dbuser.tbl_user where tbl_user_pay_nmcId = md5((CONVERT(unhex(de_127_061) using utf8))) limit 1),'0');

-- ---------------		
-- Query of DB  --
-- ---------------

	if USER_AUX != 0 then

		if (select tbl_carduser_id from tbl_carduser where tbl_user_nmcId = USER_AUX limit 1) is not null then 

			if (select tbl_securityquestionsanswer_id  from tbl_securityquestionsanswer where tbl_cardsconsumer_nmcId = USER_AUX limit 1) is not null then

				SET QUESTION = (

					select GROUP_CONCAT(
					CONCAT('{"53":"',(select dbuser.getNMCID(USER_AUX)),'"'),
					CONCAT(',"122.70":"', COALESCE(W.tbl_securityquestions_id,''),'"'),
					CONCAT(',"122.71":"', COALESCE(W.tbl_securityquestions_name,''),'"'),
					CONCAT(',"119.4":"', COALESCE(W.tbl_securityquestionsanswer_answer,''),'"'),
					CONCAT(',"119.6":"', COALESCE(W.RandomAnswer,''),'"}'))
					from 
						(select A.tbl_securityquestions_id, 
								A.tbl_securityquestions_name, 
								B.tbl_securityquestionsanswer_answer,
								GetRandomAnswersFunction(A.tbl_securityquestions_id,USER_AUX) as RandomAnswer
						from tbl_securityquestions as A, tbl_securityquestionsanswer as B
						where B.tbl_cardsconsumer_nmcId = USER_AUX 
						and A.tbl_securityquestions_id = B.tbl_securityquestions_id 
						order by rand() limit 2) as W 
				);

				set JSON = CONCAT('{"39":"0000","44":"Transaction Approved","300":[', QUESTION,']}');

			else
			
				set JSON = CONCAT('{"39":"1015","44":"Invalid Request","300":[]}');

			end if;

		else

			set JSON = CONCAT('{"39":"1014","44":"Account Not Found","300":[]}');

		end if;

	else 

		set JSON = CONCAT('{"39":"1015","44":"Invalid Request","300":[]}');

	end if;

	select JSON;

    -- ELIMINATION OF TEMPORARY TABLE
    DROP TABLE TBL_MESSAGE1;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveAccountByUser030400046` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmc`@`localhost` PROCEDURE `RemoveAccountByUser030400046`(IN MSG_IN VARCHAR(20000))
BEGIN
-- -------------------------	
-- Declare Data Elements --
-- ------------------------- 
	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
 	
	DECLARE de_122_034 INT(11) DEFAULT 0;  	
    
-- --------------------
-- Declare auxiliary --
-- --------------------	

	DECLARE CARDTOCKEN_AUX VARCHAR(255) DEFAULT NULL;
    DECLARE CARDUSER_AUX VARCHAR(255) DEFAULT NULL;

	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;
-- ---------------
-- Validations --
-- ---------------	

	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
-- -----------------	
-- Set variables --
-- -----------------	
		SET	de_122_034 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '122.34');

-- ---------------		
-- Query of DB --
-- ---------------
		set CARDTOCKEN_AUX = (SELECT tbl_card_tocken from tbl_carduser where tbl_carduser_id = de_122_034 );
        set CARDUSER_AUX = (SELECT tbl_user_nmcId from tbl_carduser where tbl_carduser_id = de_122_034 );


		if (select tbl_card_tocken from tbl_card where tbl_card_tocken = CARDTOCKEN_AUX limit 1) is not null then 

			update tbl_card set
			tbl_cardstatus_id = 52
			where tbl_card_tocken = CARDTOCKEN_AUX
            AND tbl_user_id = CARDUSER_AUX;

			insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');

		else 

			if (select tbl_card_tocken from tbl_cardpaypal where tbl_card_tocken = CARDTOCKEN_AUX limit 1) is not null then 

				update tbl_cardpaypal set
				tbl_cardstatus_id = 52
				where tbl_card_tocken = CARDTOCKEN_AUX
                 -- AND tbl_user_id = CARDUSER_AUX
                 ;

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');
		
			else 

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','1015'),('44','Invalid Request');

			end if;

		end if;

	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	SELECT 
	GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;
	

    
	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveCreditCardByUser020400693` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveCreditCardByUser020400693`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_053 VARCHAR(20) DEFAULT 0;  	

	DECLARE CARDTOCKEN_AUX VARCHAR(255) DEFAULT NULL;

	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;




	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;



	SET	de_053 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	SET de_053 = (select right(de_053,11));

	delete FROM dbcards.tbl_card where tbl_user_id = de_053;
	delete FROM dbcards.tbl_carduser where tbl_user_nmcid = de_053;
    
	insert into TBL_MESSAGE (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');

	SET RESULT_39 = (select DATA from TBL_MESSAGE where CODE = 39);
	SET RESULT_44 = (select DATA from TBL_MESSAGE where CODE = 44);

	SELECT 
	GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) AS JSON;
	

    
	DROP TABLE TBL_MESSAGE;
 
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemovePaymentMethodAcceptedByUserId030400048` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmc`@`localhost` PROCEDURE `RemovePaymentMethodAcceptedByUserId030400048`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	
	DECLARE de_53 VARCHAR(20) DEFAULT NULL;    
	DECLARE de_120_007 INT(11) DEFAULT NULL; 	

	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;


	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;


    SET de_53 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
	set de_53 = (select right(de_53,11));
	SET de_120_007 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.7');


	if (select tbl_cardstype_id from tbl_cardtypeaccepted where tbl_cardstype_id = de_120_007 and tbl_user_nmcId = de_53 limit 1) is not null then 		
			
		if (select tbl_cardtypeaccepted_account_id from tbl_cardtypeaccepted_account where tbl_cardstype_id = de_120_007 and tbl_user_nmcId = de_53 limit 1) is not null then 

			delete from tbl_cardtypeaccepted_account
			where tbl_cardstype_id = de_120_007 
			and tbl_user_nmcId = de_53;	

		end if;

		delete from tbl_cardtypeaccepted 
		where tbl_user_nmcId = de_53
		and tbl_cardstype_id = de_120_007;

		insert into TBL_MESSAGE (CODE,DATA)
		values('39','0000'),('44','Transaction Approved');

	else
		
        if de_120_007 = 66 then
        
			delete from dbcards.tbl_carduser where tbl_user_nmcId = de_53;
			
            insert into TBL_MESSAGE (CODE,DATA)
			values('39','0000'),('44','Transaction Approved');
        
		else
        
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','1015'),('44','Invalid Request');

		end if;

	end if;

	
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
/*!50003 DROP PROCEDURE IF EXISTS `RemovePaymentServiceProviderAccountByUserId030400050` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemovePaymentServiceProviderAccountByUserId030400050`(IN MSG_IN VARCHAR(20000))
BEGIN

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;

	DECLARE de_53 VARCHAR(20) DEFAULT NULL;  
	DECLARE de_120_017 INT(11) DEFAULT NULL;  



	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;





	DROP TEMPORARY TABLE IF EXISTS TBL_MESSAGE;
	
	
    CREATE TEMPORARY TABLE IF NOT EXISTS TBL_MESSAGE(CODE VARCHAR(7)NOT NULL, DATA VARCHAR(4000)NULL);
		
    
	SET UNHEXPARAM = (SELECT TRIM(BOTH '"' FROM MSG_IN));
    SET @QRY = CONCAT('INSERT INTO TBL_MESSAGE (CODE, DATA) VALUES ',CONVERT(unhex(UNHEXPARAM) USING UTF8));
    PREPARE stmt FROM @QRY;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;



        SET de_53 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '53');
		set de_53 = (select right(de_53,11));
		SET de_120_017 = (SELECT DATA FROM TBL_MESSAGE WHERE CODE = '120.17');


		if (select tbl_cardtypeaccepted_account_id 
			from tbl_cardtypeaccepted_account
			where tbl_paymentserviceaccount_id = de_120_017
			and tbl_user_nmcId = de_53 limit 1) is not null then

			if (select tbl_paymentserviceaccount_id 
				from tbl_paymentserviceaccount 
				where tbl_paymentserviceaccount_id = de_120_017 
				and tbl_paymentserviceaccount_nmcid_user = de_53 limit 1) is not null then

				delete from tbl_cardtypeaccepted_account
				where tbl_paymentserviceaccount_id = de_120_017
				and tbl_user_nmcId = de_53;

				delete from  tbl_paymentserviceaccount 
				where tbl_paymentserviceaccount_id = de_120_017 
				and tbl_paymentserviceaccount_nmcid_user = de_53;

				delete from dbtransaction.tbl_gateway_user
                where tbl_paymentserviceaccount_id = de_120_017;
                
                /*
                delete from dbtransaction.tbl_gateway_user
                where tbl_user_id = de_53
                and tbl_gateway_params_id in (select tbl_gateway_params_id 
																   from dbtransaction.tbl_gateway_params 
                                                                   where tbl_gateway_id in (select tbl_gateway_id 
																											from dbcards.tbl_cardtypeaccepted_account 
                                                                                                            where tbl_paymentserviceaccount_id = de_120_017 
                                                                                                            and tbl_user_nmcId = de_53));
				*/
                
				insert into TBL_MESSAGE (CODE,DATA)
				values('39','0000'),('44','Transaction Approved');

			else

				insert into TBL_MESSAGE (CODE,DATA)
				values('39','1015'),('44','Invalid Request');

			end if;

		else

		
			insert into TBL_MESSAGE (CODE,DATA)
			values('39','1015'),('44','Invalid Request');

		end if;
	
	
	
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
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCards` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nmcserver`@`localhost` PROCEDURE `UpdateCards`(IN MSG_IN VARCHAR(20000))
BEGIN
	
-- -------------------------------------------------------
-- Autor: Juan David Zapata 
-- Procedure: CheckOutSubscriptions030400112
-- Method: 030400112
-- Version: 1.0
-- Last modified: 2014-03-25 
-- -------------------------------------------------------

-- -------------------------	
-- Declare Data Elements  --
-- -------------------------

	DECLARE de_053 VARCHAR(20) DEFAULT NULL; 	-- 53 UserId

-- --------------------
-- Declare auxiliary --
-- --------------------

	DECLARE USERID INT(11) DEFAULT 0;
	DECLARE CARD_TOCKEN VARCHAR(45) DEFAULT NULL;
    DECLARE CARDUSER VARCHAR(45) DEFAULT NULL;
	
	DECLARE de_CT TEXT DEFAULT NULL;
	DECLARE CADENA_CARDTOCKEN TEXT DEFAULT NULL;

	DECLARE UNHEXPARAM VARCHAR(20000) DEFAULT NULL;
	DECLARE RESULT_39 VARCHAR(45) DEFAULT NULL;
	DECLARE RESULT_44 VARCHAR(45) DEFAULT NULL;	

-- ---------------
-- Validations  --
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

	set de_CT = (select GROUP_CONCAT(CONCAT('',tbl_carduser_id,'|'))
				from dbcards.tbl_carduser 
				);
		
	set CADENA_CARDTOCKEN = REPLACE(de_CT,'|,','|');	
		
	WHILE (LENGTH(CADENA_CARDTOCKEN)>0) DO
					
		SET CARDUSER = TRIM((SELECT SUBSTR(CADENA_CARDTOCKEN,1,LOCATE('|',CADENA_CARDTOCKEN)-1)));
		SET CADENA_CARDTOCKEN = (SELECT SUBSTR(CADENA_CARDTOCKEN,LOCATE('|',CADENA_CARDTOCKEN)+1));

		SET CARD_TOCKEN = (select tbl_card_tocken from dbcards.tbl_carduser where tbl_carduser_id = CARDUSER);
		SET USERID = (select tbl_user_nmcId from dbcards.tbl_carduser as B where tbl_card_tocken = CARD_TOCKEN limit 1);

		update dbcards.tbl_card set 
		tbl_user_id = USERID
		where tbl_card_tocken = CARD_TOCKEN;
	
	END WHILE;


	insert into TBL_MESSAGE1 (CODE,DATA)
	values('39','0000'),('44','Transaction Approved');

	set RESULT_39 = (select DATA from TBL_MESSAGE1 where CODE = 39);
	set RESULT_44 = (select DATA from TBL_MESSAGE1 where CODE = 44);

	select GROUP_CONCAT(CONCAT('{"39":"',RESULT_39,'"'),CONCAT(',"44":"',RESULT_44,'"}')) as JSON;	

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

-- Dump completed on 2026-01-09 14:32:15
