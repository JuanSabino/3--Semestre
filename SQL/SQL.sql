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
  `TAM_ID` int(10) unsigned NOT NULL,
  `OS_ID` int(10) unsigned DEFAULT NULL,
  `ALI_ATIVADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ALI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alianca`
--

LOCK TABLES `tbl_alianca` WRITE;
/*!40000 ALTER TABLE `tbl_alianca` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_alianca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargo`
--

DROP TABLE IF EXISTS `tbl_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cargo` (
  `CAR_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CAR_NOME` varchar(45) NOT NULL,
  `CAR_ATIVADO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CAR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargo`
--

LOCK TABLES `tbl_cargo` WRITE;
/*!40000 ALTER TABLE `tbl_cargo` DISABLE KEYS */;
INSERT INTO `tbl_cargo` VALUES (1,'teste',1),(2,'teste2',1);
/*!40000 ALTER TABLE `tbl_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_funcionario` (
  `FUN_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FUN_NOME` varchar(100) DEFAULT NULL,
  `FUN_CPF` varchar(11) NOT NULL,
  `FUN_SENHA` varchar(100) DEFAULT NULL,
  `FUN_ATIVADO` tinyint(1) DEFAULT '1',
  `CAR_ID` int(100) NOT NULL,
  PRIMARY KEY (`FUN_ID`),
  UNIQUE KEY `FUN_ID_UNIQUE` (`FUN_ID`),
  UNIQUE KEY `FUN_CPF_UNIQUE` (`FUN_CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
INSERT INTO `tbl_funcionario` VALUES (1,'Raul Santiago','11111111111','123',1,1);
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_maquina`
--

DROP TABLE IF EXISTS `tbl_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_maquina` (
  `MAQ_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MAQ_NOME` varchar(45) NOT NULL,
  `MAQ_ATIVADO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MAQ_ID`),
  UNIQUE KEY `MAQ_ID_UNIQUE` (`MAQ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_maquina`
--

LOCK TABLES `tbl_maquina` WRITE;
/*!40000 ALTER TABLE `tbl_maquina` DISABLE KEYS */;
INSERT INTO `tbl_maquina` VALUES (1,'Teste',0);
/*!40000 ALTER TABLE `tbl_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modelo`
--

DROP TABLE IF EXISTS `tbl_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_modelo` (
  `MOD_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MOD_NOME` varchar(45) NOT NULL,
  `MOD_PESO` decimal(50,0) unsigned NOT NULL,
  `MOD_FERRAMENTA` varchar(100) DEFAULT NULL,
  `MOD_DESCRICAO` varchar(200) DEFAULT NULL,
  `MOD_LARGURA` decimal(50,0) unsigned NOT NULL,
  `MOD_ALTURA` decimal(50,0) unsigned NOT NULL,
  `MOD_ATIVADO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modelo`
--

LOCK TABLES `tbl_modelo` WRITE;
/*!40000 ALTER TABLE `tbl_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_modelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-31 21:21:00
