-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: gold
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `tbl_alianca`
--

DROP TABLE IF EXISTS `tbl_alianca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_alianca` (
  `ALI_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ALI_PRODUTO` varchar(45) NOT NULL,
  `MOD_ID` int(10) unsigned NOT NULL,
  `ALI_TAMANHO` int(10) unsigned NOT NULL,
  `OS_ID` int(10) unsigned DEFAULT NULL,
  `ALI_ATIVADO` tinyint(1) DEFAULT '1',
  `ALI_DETALHES` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ALI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alianca`
--

LOCK TABLES `tbl_alianca` WRITE;
/*!40000 ALTER TABLE `tbl_alianca` DISABLE KEYS */;
INSERT INTO `tbl_alianca` VALUES (1,'teste',1,1,0,1,NULL),(2,'teste',1,10,1,1,NULL),(3,'gfdgfgf',1,45,1,1,NULL),(4,'Aliança Teste',1,16,3,1,NULL),(5,'Aliança Teste',1,18,4,1,NULL);
/*!40000 ALTER TABLE `tbl_alianca` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-05 21:19:21
