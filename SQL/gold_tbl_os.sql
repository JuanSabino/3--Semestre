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
-- Table structure for table `tbl_os`
--

DROP TABLE IF EXISTS `tbl_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_os` (
  `OS_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OS_DATAENTRADA` datetime DEFAULT CURRENT_TIMESTAMP,
  `OS_DATASAIDA` datetime DEFAULT NULL,
  `OS_ATIVADO` tinyint(1) DEFAULT '1',
  `OS_LOJA` varchar(45) DEFAULT NULL,
  `OS_OBS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OS_ID`),
  UNIQUE KEY `OS_ID_UNIQUE` (`OS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_os`
--

LOCK TABLES `tbl_os` WRITE;
/*!40000 ALTER TABLE `tbl_os` DISABLE KEYS */;
INSERT INTO `tbl_os` VALUES (1,'2015-11-01 17:45:28',NULL,0,'mlkmk','nknk'),(2,'2015-11-01 17:50:54',NULL,0,'',''),(3,'2015-11-04 09:31:16',NULL,0,'Loja 1','aliança para a amante'),(4,'2015-11-04 09:33:50',NULL,1,'Loja 2','aliança para a amante');
/*!40000 ALTER TABLE `tbl_os` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-04  9:38:14
