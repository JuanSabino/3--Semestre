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
-- Table structure for table `tbl_alianca_conta`
--

DROP TABLE IF EXISTS `tbl_alianca_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_alianca_conta` (
  `ALC_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ALC_ENTRADA` decimal(20,0) NOT NULL,
  `ALC_OBSENTRADA` varchar(100) NOT NULL,
  `ALC_SAIDA` decimal(20,0) DEFAULT NULL,
  `ALC_OBSSAIDA` varchar(100) DEFAULT NULL,
  `ALC_INICIO` datetime NOT NULL,
  `ALC_TERMINO` datetime DEFAULT NULL,
  `ALC_ATIVADO` tinyint(1) NOT NULL DEFAULT '1',
  `FUN_ID` int(11) NOT NULL,
  `MAQ_ID` int(11) NOT NULL,
  `CON_ID` int(11) NOT NULL,
  `ALI_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ALC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alianca_conta`
--

LOCK TABLES `tbl_alianca_conta` WRITE;
/*!40000 ALTER TABLE `tbl_alianca_conta` DISABLE KEYS */;
INSERT INTO `tbl_alianca_conta` VALUES (1,5,'teste',2,'teste123','0001-01-01 00:00:00','2015-11-03 21:50:44',1,1,1,1,0),(2,2,'dsg,dfghfhfgh',0,NULL,'0001-01-01 00:00:00','0001-01-01 00:00:00',1,1,1,1,1),(3,9,'kjkjkhjkhjkhjkhjkhjkj',0,NULL,'2015-11-03 22:05:45',NULL,1,1,1,1,3),(4,1,'fhgtjgfjygh',0,NULL,'2015-11-03 22:12:00',NULL,1,1,0,2,2),(5,1,'blablabla',0,NULL,'2015-11-03 22:13:17',NULL,1,1,1,2,0);
/*!40000 ALTER TABLE `tbl_alianca_conta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-04  9:38:13