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
-- Table structure for table `tbl_instancepropertytype`
--

DROP TABLE IF EXISTS `tbl_instancepropertytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_instancepropertytype` (
  `tbl_instancepropertytype_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_instancepropertytype_name` varchar(45) NOT NULL,
  `tbl_instancepropertygroup_id` int(11) NOT NULL,
  `tbl_instancepropertytype_bundle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tbl_instancepropertytype_id`),
  KEY `fk_tbl_instancepropertytype_tbl_instancepropertygroup1_idx` (`tbl_instancepropertygroup_id`),
  CONSTRAINT `fk_tbl_instancepropertytype_tbl_instancepropertygroup1` FOREIGN KEY (`tbl_instancepropertygroup_id`) REFERENCES `tbl_instancepropertygroup` (`idtbl_instancepropertygroup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3408 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_instancepropertytype`
--

LOCK TABLES `tbl_instancepropertytype` WRITE;
/*!40000 ALTER TABLE `tbl_instancepropertytype` DISABLE KEYS */;
INSERT INTO `tbl_instancepropertytype` VALUES (3301,'Platform',3201,NULL),(3302,'textviewnmcmerchantmember',3202,NULL),(3303,'FontFaceNmcMerchantMember',3202,NULL),(3304,'AppName',3202,NULL),(3305,'logoImageName',3202,NULL),(3306,'moduleHome',3203,NULL),(3307,'moduleMessages',3203,NULL),(3308,'moduleShoppingCart',3203,NULL),(3309,'modulePushedItems',3203,NULL),(3310,'moduleScanPurchase',3203,NULL),(3311,'moduleShoppingAssistant',3203,NULL),(3312,'moduleInStoreShopper',3203,NULL),(3313,'moduleFavorites',3203,NULL),(3314,'moduleHistory',3203,NULL),(3315,'moduleSettings',3203,NULL),(3316,'moduleHelp',3203,NULL),(3317,'gradmainbackgrounddark',3204,NULL),(3318,'gradmainbackgroundlight',3204,NULL),(3319,'FontFaceDefaultFont',3205,NULL),(3320,'FontFaceDefaultButtons',3205,NULL),(3321,'FontFacePurchaseFinished',3205,NULL),(3322,'FontFaceTitleBar',3205,NULL),(3323,'gradpincodecanceldarkidle',3206,NULL),(3324,'gradpincodecancellightidle',3206,NULL),(3325,'gradpincodecanceldarkpressed',3206,NULL),(3326,'gradpincodecancellightpressed',3206,NULL),(3327,'gradpincodecleardarkidle',3206,NULL),(3328,'gradpincodeclearlightidle',3206,NULL),(3329,'gradpincodecleardarkpressed',3206,NULL),(3330,'gradpincodeclearlightpressed',3206,NULL),(3331,'gradpincodeenterdarkidle',3206,NULL),(3332,'gradpincodeenterlightidle',3206,NULL),(3333,'gradpincodeenterdarkpressed',3206,NULL),(3334,'gradpincodeenterlightpressed',3206,NULL),(3335,'gradpincodelockdarkidle',3206,NULL),(3336,'gradpincodelocklightidle',3206,NULL),(3337,'gradpincodelockdarkpressed',3206,NULL),(3338,'gradpincodelocklightpressed',3206,NULL),(3339,'FontFacePhoneKeyButtons',3206,NULL),(3340,'textviewbluefontcolor',3207,NULL),(3341,'buttonBlueNormalColorIdle',3207,NULL),(3342,'buttonBlueDegradeColoridle',3207,NULL),(3343,'buttonBlueNormalColorpressed',3207,NULL),(3344,'buttonBlueDegradeColorpressed',3207,NULL),(3345,'textviewgreenfontcolor',3208,NULL),(3346,'buttonGreenNormalColorIdle',3208,NULL),(3347,'buttonGreenDegradeColoridle',3208,NULL),(3348,'buttonGreenNormalColorpressed',3208,NULL),(3349,'buttonGreenDegradeColorpressed',3208,NULL),(3350,'textviewredfontcolor',3209,NULL),(3351,'buttonRedNormalColorIdle',3209,NULL),(3352,'buttonRedDegradeColoridle',3209,NULL),(3353,'buttonRedNormalColorpressed',3209,NULL),(3354,'buttonRedDegradeColorpressed',3209,NULL),(3355,'textviewgrayfontcolor',3210,NULL),(3356,'buttonGrayNormalColorIdle',3210,NULL),(3357,'buttonGrayDegradeColoridle',3210,NULL),(3358,'buttonGrayNormalColorpressed',3210,NULL),(3359,'buttonGrayDegradeColorpressed',3210,NULL),(3360,'textviewgraylightfontcolor',3211,NULL),(3361,'buttonGrayLNormalColorIdle',3211,NULL),(3362,'buttonGrayLDegradeColoridle',3211,NULL),(3363,'buttonGrayLNormalColorpressed',3211,NULL),(3364,'buttonGrayLDegradeColorpressed',3211,NULL),(3365,'ItemDefaultFontSize',3212,NULL),(3366,'ItemLargeFontSize',3212,NULL),(3367,'ItemSmallFontSize',3212,NULL),(3368,'titlebartextcolor',3213,NULL),(3369,'textViewColorNormal',3213,NULL),(3370,'textViewColorDegrade',3213,NULL),(3371,'TitleTextSize',3213,NULL),(3372,'maintoolbar_separator',3214,NULL),(3373,'toolbarColor',3214,NULL),(3374,'toolbarColorDegrade',3214,NULL),(3375,'listViewColor',3215,NULL),(3376,'listViewColorAlternate',3215,NULL),(3377,'menuColor',3216,NULL),(3378,'menuColorDegrade',3216,NULL),(3379,'menuItemColor',3216,NULL),(3380,'menuColorItemDegrade',3216,NULL),(3381,'menuItemFontColor',3216,NULL),(3382,'customviewpagerbordercolor',3218,NULL),(3383,'pagertabstripbackgroundcolor',3218,NULL),(3384,'pagertabstriptextcolor',3218,NULL),(3385,'edittextbackgroundcolor',3212,NULL),(3386,'edittextbordercolor',3212,NULL),(3387,'edittextbordercolorex',3212,NULL),(3388,'gradmenuitemimagefavoritesdark',3216,NULL),(3389,'gradmenuitemimagefavoriteslight',3216,NULL),(3390,'gradmenuitemimagehelpdark',3216,NULL),(3391,'gradmenuitemimagehelplight',3216,NULL),(3392,'gradmenuitemimagehistorydark',3216,NULL),(3393,'gradmenuitemimagehistorylight',3216,NULL),(3394,'gradmenuitemimagehomedark',3216,NULL),(3395,'gradmenuitemimagehomelight',3216,NULL),(3396,'gradmenuitemimageinstoredark',3216,NULL),(3397,'gradmenuitemimageinstorelight',3216,NULL),(3398,'gradmenuitemimagelogoutdark',3216,NULL),(3399,'gradmenuitemimagelogoutlight',3216,NULL),(3400,'gradmenuitemimagepurchasedark',3216,NULL),(3401,'gradmenuitemimagepurchaselight',3216,NULL),(3402,'gradmenuitemimageselldark',3216,NULL),(3403,'gradmenuitemimageselllight',3216,NULL),(3404,'gradmenuitemimagesettingsdark',3216,NULL),(3405,'gradmenuitemimagesettingslight',3216,NULL),(3406,'gradmenuitemimageshoppingassistantdark',3216,NULL),(3407,'gradmenuitemimageshoppingassistantlight',3216,NULL);
/*!40000 ALTER TABLE `tbl_instancepropertytype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-09 14:32:46
