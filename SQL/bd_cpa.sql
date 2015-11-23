CREATE DATABASE  IF NOT EXISTS `db_cpa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_cpa`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_cpa
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
-- Temporary view structure for view `horas_trabalhadas`
--

DROP TABLE IF EXISTS `horas_trabalhadas`;
/*!50001 DROP VIEW IF EXISTS `horas_trabalhadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `horas_trabalhadas` AS SELECT 
 1 AS `Conta`,
 1 AS `HorasTrabalhadas`,
 1 AS `Funcionario`,
 1 AS `OS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tbl_alianca`
--

DROP TABLE IF EXISTS `tbl_alianca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_alianca` (
  `ALI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MOD_ID` int(11) NOT NULL,
  `OS_ID` int(11) NOT NULL,
  `ALI_DTCAD` datetime DEFAULT NULL,
  `ALI_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  `ALI_TAMANHO` int(11) NOT NULL,
  `ALI_DETALHES` varchar(100) DEFAULT NULL,
  `ALI_ATIVADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ALI_ID`),
  KEY `MOD_ID` (`MOD_ID`),
  KEY `OS_ID` (`OS_ID`),
  KEY `fk_ali_fun` (`FUN_ID_ALT`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alianca`
--

LOCK TABLES `tbl_alianca` WRITE;
/*!40000 ALTER TABLE `tbl_alianca` DISABLE KEYS */;
INSERT INTO `tbl_alianca` VALUES (2,1,1,NULL,NULL,0,0,20,NULL,1),(3,2,1,NULL,NULL,0,0,18,NULL,1),(4,7,2,NULL,NULL,0,0,12,NULL,1),(5,7,2,NULL,NULL,0,0,1,NULL,1),(6,17,4,NULL,NULL,0,0,17,NULL,1),(7,5,4,NULL,NULL,0,0,24,NULL,1),(8,10,5,NULL,NULL,0,0,18,NULL,1),(9,17,5,NULL,NULL,0,0,11,NULL,1),(10,5,6,NULL,NULL,0,0,16,NULL,1),(11,18,6,NULL,NULL,0,0,20,NULL,1),(12,4,7,NULL,NULL,0,0,18,NULL,1),(13,3,7,NULL,NULL,0,0,19,NULL,1),(14,1,8,NULL,NULL,0,0,18,NULL,1),(15,1,8,NULL,NULL,0,0,19,NULL,1),(16,14,9,NULL,NULL,0,0,27,NULL,1),(17,89,9,NULL,NULL,0,0,15,NULL,1),(18,50,10,NULL,NULL,0,0,17,NULL,1),(19,75,10,NULL,NULL,0,0,17,NULL,1),(20,156,11,NULL,NULL,0,0,24,NULL,1),(21,60,11,NULL,NULL,0,0,14,NULL,1),(22,5,12,NULL,NULL,0,0,16,NULL,1),(23,141,12,NULL,NULL,0,0,16,NULL,1),(24,102,13,NULL,NULL,0,0,26,NULL,1),(25,112,13,NULL,NULL,0,0,18,NULL,1),(26,93,14,NULL,NULL,0,0,28,NULL,1),(27,99,14,NULL,NULL,0,0,18,NULL,1),(28,34,15,NULL,NULL,0,0,16,NULL,1),(29,33,15,NULL,NULL,0,0,22,NULL,1),(30,49,16,NULL,NULL,0,0,17,NULL,1),(31,14,16,NULL,NULL,0,0,15,NULL,1),(32,19,17,NULL,NULL,0,0,13,NULL,1),(33,87,17,NULL,NULL,0,0,15,NULL,1),(34,10,18,NULL,NULL,0,0,19,NULL,1),(35,116,19,NULL,NULL,0,0,18,NULL,1),(36,156,19,NULL,NULL,0,0,18,NULL,1),(37,4,20,NULL,NULL,0,0,18,NULL,1),(38,63,20,NULL,NULL,0,0,13,NULL,1),(39,7,21,NULL,NULL,0,0,14,NULL,1),(40,16,22,NULL,NULL,0,0,18,NULL,1),(41,12,22,NULL,NULL,0,0,18,NULL,1),(42,1,23,NULL,NULL,0,0,14,NULL,1);
/*!40000 ALTER TABLE `tbl_alianca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aliancaconta`
--

DROP TABLE IF EXISTS `tbl_aliancaconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_aliancaconta` (
  `ACO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACO_ENTRADA` double(255,2) NOT NULL,
  `ACO_SAIDA` double(255,2) DEFAULT '0.00',
  `ACO_INICIO` datetime DEFAULT CURRENT_TIMESTAMP,
  `ACO_TERMINO` datetime DEFAULT NULL,
  `ACO_OBSENTRADA` varchar(255) DEFAULT NULL,
  `ACO_OBSSAIDA` varchar(255) DEFAULT NULL,
  `CON_ID` int(11) NOT NULL,
  `MAQ_ID` int(11) NOT NULL,
  `ALI_ID` int(11) DEFAULT '0',
  `FUN_ID` int(11) NOT NULL DEFAULT '0',
  `ACO_DTCAD` datetime DEFAULT NULL,
  `ACO_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  `ACO_ATIVADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ACO_ID`),
  KEY `ALI_ID` (`ALI_ID`),
  KEY `CON_ID` (`CON_ID`),
  KEY `FUN_ID` (`FUN_ID`),
  KEY `MAQ_ID` (`MAQ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aliancaconta`
--

LOCK TABLES `tbl_aliancaconta` WRITE;
/*!40000 ALTER TABLE `tbl_aliancaconta` DISABLE KEYS */;
INSERT INTO `tbl_aliancaconta` VALUES (1,2000.00,1999.00,'2015-11-17 18:32:12','2015-11-17 18:38:19','materia prima','barra',1,1,0,1,NULL,NULL,0,0,1),(2,20.00,1.30,'2015-11-17 18:39:05','2015-11-17 21:46:11','','',3,2,2,1,NULL,NULL,0,0,1),(3,10.00,9.00,'2015-11-17 19:36:20','2015-11-17 19:41:53','ouro','rebarba',6,6,3,3,NULL,NULL,0,0,1),(4,49.00,48.90,'2015-11-17 21:48:34','2015-11-17 21:55:37','','',6,6,2,3,NULL,NULL,0,0,1),(5,489.00,489.00,'2015-11-17 21:58:26','2015-11-17 22:00:47','','',3,2,2,1,NULL,NULL,0,0,1),(6,451.00,451.00,'2015-11-17 21:59:45','2015-11-17 22:01:15','','',6,3,3,3,NULL,NULL,0,0,1),(7,701.00,701.00,'2015-11-17 22:00:33','2015-11-17 22:01:27','','',6,4,4,3,NULL,NULL,0,0,1),(8,8000.00,7996.00,'2015-11-17 22:01:51','2015-11-17 22:02:19','','',1,1,0,2,NULL,NULL,0,0,1),(9,13.00,12.80,'2015-11-17 22:03:05','2015-11-17 22:03:25','','',4,4,2,3,NULL,NULL,0,0,1);
/*!40000 ALTER TABLE `tbl_aliancaconta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargo`
--

DROP TABLE IF EXISTS `tbl_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cargo` (
  `CAR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAR_NOME` varchar(50) NOT NULL,
  `CAR_ATIVADO` tinyint(1) DEFAULT '1',
  `CAR_DTCAD` datetime DEFAULT NULL,
  `CAR_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`CAR_ID`),
  KEY `fk_car_fun` (`FUN_ID_ALT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargo`
--

LOCK TABLES `tbl_cargo` WRITE;
/*!40000 ALTER TABLE `tbl_cargo` DISABLE KEYS */;
INSERT INTO `tbl_cargo` VALUES (1,'Auxiliar de Produção',1,NULL,NULL,0,0),(2,'Ourives',1,NULL,NULL,0,0),(3,'Gerente',1,NULL,NULL,0,0),(4,'Auxiliar Administrativo',1,NULL,NULL,0,0);
/*!40000 ALTER TABLE `tbl_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cep`
--

DROP TABLE IF EXISTS `tbl_cep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cep` (
  `CEP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CEP_CEP` varchar(10) NOT NULL,
  `CEP_RUA` varchar(50) DEFAULT NULL,
  `CID_ID` int(11) NOT NULL DEFAULT '0',
  `CEP_DTCAD` datetime DEFAULT NULL,
  `CEP_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`CEP_ID`),
  KEY `CID_ID` (`CID_ID`),
  KEY `fk_cep_fun` (`FUN_ID_ALT`),
  CONSTRAINT `fk_cep_cid` FOREIGN KEY (`CID_ID`) REFERENCES `tbl_cidade` (`CID_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cep`
--

LOCK TABLES `tbl_cep` WRITE;
/*!40000 ALTER TABLE `tbl_cep` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cidade`
--

DROP TABLE IF EXISTS `tbl_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cidade` (
  `CID_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CID_NOME` varchar(50) NOT NULL,
  `EST_ID` int(11) NOT NULL DEFAULT '0',
  `CID_DTCAD` datetime DEFAULT NULL,
  `CID_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`CID_ID`),
  KEY `EST_ID` (`EST_ID`),
  KEY `fk_cid_fun` (`FUN_ID_ALT`),
  CONSTRAINT `fk_cid_est` FOREIGN KEY (`EST_ID`) REFERENCES `tbl_estado` (`EST_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cidade`
--

LOCK TABLES `tbl_cidade` WRITE;
/*!40000 ALTER TABLE `tbl_cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conta`
--

DROP TABLE IF EXISTS `tbl_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_conta` (
  `CON_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CON_NOME` varchar(50) DEFAULT NULL,
  `CON_DTCAD` datetime DEFAULT NULL,
  `CON_DTALT` datetime DEFAULT NULL,
  `FUN_CODIGO_ALT` int(11) DEFAULT '0',
  `FUN_CODIGO` int(11) DEFAULT '0',
  `CON_ATIVADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`CON_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conta`
--

LOCK TABLES `tbl_conta` WRITE;
/*!40000 ALTER TABLE `tbl_conta` DISABLE KEYS */;
INSERT INTO `tbl_conta` VALUES (1,'Fundição',NULL,NULL,0,0,1),(2,'Corte',NULL,NULL,0,0,1),(3,'Usinagem',NULL,NULL,0,0,1),(4,'Polimento',NULL,NULL,0,0,1),(5,'Banca',NULL,NULL,0,0,1),(6,'Preparacao',NULL,NULL,0,0,1);
/*!40000 ALTER TABLE `tbl_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estado` (
  `EST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EST_NOME` varchar(50) NOT NULL,
  `EST_DTCAD` datetime DEFAULT NULL,
  `EST_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`EST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_funcionario` (
  `FUN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FUN_NOME` varchar(50) NOT NULL,
  `FUN_CPF` varchar(11) NOT NULL,
  `FUN_SENHA` varchar(25) NOT NULL,
  `FUN_ATIVADO` tinyint(1) DEFAULT '1',
  `CEP_ID` int(11) DEFAULT '0',
  `CAR_ID` int(11) DEFAULT '0',
  `FUN_DTCAD` datetime DEFAULT NULL,
  `FUN_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`FUN_ID`),
  KEY `CAR_ID` (`CAR_ID`),
  KEY `CEP_ID` (`CEP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
INSERT INTO `tbl_funcionario` VALUES (1,'Raul Santiago','40809988801','408',1,0,1,NULL,NULL,0,0),(2,'Felipe','31849170602','318',1,0,3,NULL,NULL,0,0),(3,'Gustavo','29502759406','295',1,0,3,NULL,NULL,0,0),(4,'Reinaldo','20961808014','209',1,0,3,NULL,NULL,0,0),(5,'Carlos Alberto','09837563894','098',1,0,5,NULL,NULL,0,0),(6,'Juliana','57364859304','573',1,0,6,NULL,NULL,0,0),(7,'Bruna','49582748692','495',1,0,6,NULL,NULL,0,0);
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_maquina`
--

DROP TABLE IF EXISTS `tbl_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_maquina` (
  `MAQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAQ_NOME` varchar(50) NOT NULL,
  `MAQ_ATIVADO` tinyint(1) DEFAULT '1',
  `MAQ_DTCAD` datetime DEFAULT NULL,
  `MAQ_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`MAQ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_maquina`
--

LOCK TABLES `tbl_maquina` WRITE;
/*!40000 ALTER TABLE `tbl_maquina` DISABLE KEYS */;
INSERT INTO `tbl_maquina` VALUES (1,'Fundidora Continua Mimi',1,NULL,NULL,0,0),(2,'Torno - TA Coelho',1,NULL,NULL,0,0),(3,'Maquina de Corte',1,NULL,NULL,0,0),(4,'Politriz',1,NULL,NULL,0,0),(5,'Diamantadeira FD 85A',1,NULL,NULL,0,0),(6,'Formadeira MF Coelho',1,NULL,NULL,0,0);
/*!40000 ALTER TABLE `tbl_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modelo`
--

DROP TABLE IF EXISTS `tbl_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_modelo` (
  `MOD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MOD_NOME` varchar(50) NOT NULL,
  `MOD_PESO` double NOT NULL,
  `MOD_ATIVADO` tinyint(1) DEFAULT '1',
  `MOD_DESCRICAO` varchar(255) DEFAULT NULL,
  `MOD_LARGURA` double NOT NULL,
  `MOD_ALTURA` double NOT NULL,
  `MOD_DTCAD` datetime DEFAULT NULL,
  `MOD_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`MOD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modelo`
--

LOCK TABLES `tbl_modelo` WRITE;
/*!40000 ALTER TABLE `tbl_modelo` DISABLE KEYS */;
INSERT INTO `tbl_modelo` VALUES (1,'GF23',1.2,1,'',2.3,0.8,NULL,NULL,0,0),(2,'GF28',1.4,1,'',2.8,1,NULL,NULL,0,0),(3,'GF28AN',2.7,1,'',2.8,1.3,NULL,NULL,0,0),(4,'GF35',2.3,1,'',3.4,1,NULL,NULL,0,0),(5,'GF35/A',1.6,1,'',3.4,0.7,NULL,NULL,0,0),(6,'GF35AN',3,1,'',3.5,1.2,NULL,NULL,0,0),(7,'GF40',3.2,1,'',4,1.1,NULL,NULL,0,0),(8,'GF40/A',2.9,1,'',4,0.9,NULL,NULL,0,0),(9,'GF40/C',1.5,1,'',4,0.5,NULL,NULL,0,0),(10,'GF40AN',4.5,1,'',4,1.5,NULL,NULL,0,0),(11,'GF40AN/OB',4.5,1,'',4,1.5,NULL,NULL,0,0),(12,'GF40AN/BR',4.5,1,'1 BR 3 PTS',4,1.5,NULL,NULL,0,0),(13,'GF40AN/3BR',4.5,1,'3 BR 3 PTS',4,1.5,NULL,NULL,0,0),(14,'GF45/7',2.5,1,'',4.5,0.7,NULL,NULL,0,0),(15,'GF46',5,1,'',4.5,1.3,NULL,NULL,0,0),(16,'GF46/A',3.3,1,'',4.5,1,NULL,NULL,0,0),(17,'GF46/B',1.8,1,'',4,0.8,NULL,NULL,0,0),(18,'GF46AN',6.5,1,'',4.6,1.7,NULL,NULL,0,0),(19,'GF46AN/OB',6.5,1,'',4.6,1.7,NULL,NULL,0,0),(20,'GF46AN/BR',6.5,1,'1 BR 3 PTS',4.6,1.7,NULL,NULL,0,0),(21,'GF46AN/3BR',6.7,1,'3 BR 3 PTS',4.6,1.7,NULL,NULL,0,0),(22,'GF46AN/7BR',6.5,1,'7 BR 3 PTS',4.6,1.7,NULL,NULL,0,0),(23,'GF50AN',5.4,1,'',3.3,2.2,NULL,NULL,0,0),(24,'GF50AN/BR',5.4,1,'1 BR 4 PTS',3.2,2.2,NULL,NULL,0,0),(25,'GF51',3.5,1,'',3.2,1.3,NULL,NULL,0,0),(26,'GF51/BR',3.5,1,'1 BR 2 PTS',3.2,1.3,NULL,NULL,0,0),(27,'GF52 (RETA)',4.2,1,'',4,1.2,NULL,NULL,0,0),(28,'GF52/BR  (RETA)',4.2,1,'1 BR 3 PTS',4,1.2,NULL,NULL,0,0),(29,'GF53',3.3,1,'',2.9,1.3,NULL,NULL,0,0),(30,'GF53/BR',3.3,1,'1 BR 2 PTS',2.5,1.3,NULL,NULL,0,0),(31,'GF55',6.2,1,'',5,1.7,NULL,NULL,0,0),(32,'GF55AN',7.6,1,'',5,2,NULL,NULL,0,0),(33,'GF57AN/BR',6.4,1,'1 BR 3 PTS',5.5,1.5,NULL,NULL,0,0),(34,'GF58AN',6,1,'',5.5,1.8,NULL,NULL,0,0),(35,'GF58AN/BR',6,1,'1 BR 2 PTS',5.5,1.8,NULL,NULL,0,0),(36,'GF59',3.4,1,'',5,0.9,NULL,NULL,0,0),(37,'GF75',7.7,1,'',7.5,1.7,NULL,NULL,0,0),(38,'GF100AN',8,1,'',6.8,1.8,NULL,NULL,0,0),(39,'GF100/BR',6.9,1,'1 BR 3 PTS',7,1.3,NULL,NULL,0,0),(40,'GF100AN/3BR',8,1,'3 BR 3 PTS',6.8,1.7,NULL,NULL,0,0),(41,'GF100AN/7BR',8,1,'7 BR 3 PTS',6.8,1.7,NULL,NULL,0,0),(42,'GF100',6.9,1,'',7,1.3,NULL,NULL,0,0),(43,'GF100/3BR',6.9,1,'3 BR 3 PTS',7,1.3,NULL,NULL,0,0),(44,'GF101',6.5,1,'',6,1.5,NULL,NULL,0,0),(45,'GF101/BR',6.5,1,'1 BR 3 PTS',6,1.5,NULL,NULL,0,0),(46,'GF101/2BR ',6.5,1,'2 BR 3 PTS',6,1.5,NULL,NULL,0,0),(47,'GF101/3BR',6.5,1,'3 BR 3 PTS',6,1.5,NULL,NULL,0,0),(48,'GF102',8.8,1,'',6.8,2,NULL,NULL,0,0),(49,'GF102/A',5.2,1,'',6.8,1.2,NULL,NULL,0,0),(50,'GF102/BR',8.8,1,'1 BR 3 PTS',6.8,2,NULL,NULL,0,0),(51,'GF102/3BR',8.8,1,'3 BR 3 PTS',6.8,2,NULL,NULL,0,0),(52,'GF102/5BR',8.8,1,'5 BR 3 PTS',6.8,2,NULL,NULL,0,0),(53,'GF 100AN/BR',8,1,'1 BR  3 PTS',6.8,1.8,NULL,NULL,0,0),(54,'GF103',12,1,'',8,2,NULL,NULL,0,0),(55,'GF103/3BR ',12,1,'3 BR 3 PTS',8,2,NULL,NULL,0,0),(56,'GF206AN',7.8,1,'',6,1.4,NULL,NULL,0,0),(57,'GF208AN  ',4.9,1,'',6,1.4,NULL,NULL,0,0),(58,'GF208AN/BR',4.9,1,'1 BR 2PTS',4,1.4,NULL,NULL,0,0),(59,'GF209AN',6.4,1,'',6,1.4,NULL,NULL,0,0),(60,'GF209AN/4BR',6.4,1,'4 BR 1,25PTS',6,1.4,NULL,NULL,0,0),(61,'GF210AN/2CV',8.5,1,'',6.8,1.9,NULL,NULL,0,0),(62,'GF215',8.6,1,'',8,1.3,NULL,NULL,0,0),(63,'GF215AN',11.6,1,'',8,2.2,NULL,NULL,0,0),(64,'GF214/3BR',5.2,1,'3 BR 3 PTS',5,1.3,NULL,NULL,0,0),(65,'GFBP35',2.5,1,'',3.5,1.1,NULL,NULL,0,0),(66,'GFBP35AN',2.5,1,'',3.5,1.1,NULL,NULL,0,0),(67,'GFBP40',3.5,1,'',4,1.1,NULL,NULL,0,0),(68,'GFBP45',4.2,1,'',4,1.4,NULL,NULL,0,0),(69,'GFBP45/BR',4.2,1,'1 BR 3 PTS',4,1.4,NULL,NULL,0,0),(70,'GFBP45AN',6.4,1,'',4,1.8,NULL,NULL,0,0),(71,'GFBP45AN/BR',6.4,1,'1 BR 3 PTS',4,1.8,NULL,NULL,0,0),(72,'GFBP46',5,1,'',4.6,1.5,NULL,NULL,0,0),(73,'GFBP46AN/2OU',6.4,1,'',4.5,2,NULL,NULL,0,0),(74,'GFBP50/BR',7.6,1,'1 BR 3 PTS',5,1.8,NULL,NULL,0,0),(75,'GFBP101/FS',7.6,1,'',6,1.5,NULL,NULL,0,0),(76,'GFBP101/2FL',6.7,1,'',6,1.5,NULL,NULL,0,0),(77,'GFBP101FLBR',6.6,1,'1 BR 3 PTS',6,1.5,NULL,NULL,0,0),(78,'GFBP155/BR',8.8,1,'1 BR 3 PTS',7.9,1.6,NULL,NULL,0,0),(79,'GFBP156',5.5,1,'',5,1.5,NULL,NULL,0,0),(80,'GFBP157',7.1,1,'',5.9,1.5,NULL,NULL,0,0),(81,'GFBP158',5.5,1,'',5,1.5,NULL,NULL,0,0),(82,'GFBP159/3BR',7.7,1,'3 BR 3 PTS',7,1.8,NULL,NULL,0,0),(83,'GFBP160',6.5,1,'',5.9,1.4,NULL,NULL,0,0),(84,'GFBP161',7.8,1,'',6.9,1.4,NULL,NULL,0,0),(85,'GFBP162',4.9,1,'',4.3,1.1,NULL,NULL,0,0),(86,'GFBP163',8.8,1,'',6.9,1.8,NULL,NULL,0,0),(87,'GFBP169/25ANOS',6.8,1,'FILETE OURO VERMELHO   25 ANOS ',5.8,1.5,NULL,NULL,0,0),(88,'GFBP185',2.1,1,'',2.8,1.1,NULL,NULL,0,0),(89,'GFBP186',2.5,1,'',2.8,1.3,NULL,NULL,0,0),(90,'GFBP187',2.7,1,'',3.3,1.1,NULL,NULL,0,0),(91,'GFBP200',5.7,1,'',5,1.2,NULL,NULL,0,0),(92,'GFBP201/3BR',7.5,1,'3 BR 1,25 PTS',5.6,1.5,NULL,NULL,0,0),(93,'GFBP202AN/BR',6.4,1,'1 BR 2PTS',6,1.2,NULL,NULL,0,0),(94,'GFBP203',6.8,1,'',6,1.3,NULL,NULL,0,0),(95,'GFBP204/FL4BR',8.5,1,'4 BR 2PTS',6,1.7,NULL,NULL,0,0),(96,'GFBP205',4.2,1,'',3.6,1.2,NULL,NULL,0,0),(97,'GFBO35',2.5,1,'',3.5,1.1,NULL,NULL,0,0),(98,'GFBO40',3.5,1,'',4,1.1,NULL,NULL,0,0),(99,'GFBO46',5,1,'',4.6,1.5,NULL,NULL,0,0),(100,'GFBO164',5.1,1,'FILETE OURO VERMELHO TRAB',4.9,1.4,NULL,NULL,0,0),(101,'GFBO165/50ANOS',6.8,1,'FILETE OURO VERMELHO 50 ANOS',5.8,1.5,NULL,NULL,0,0),(102,'GFBO167',5.3,1,'FILETE OURO VERMELHO TRAB',5.6,1.4,NULL,NULL,0,0),(103,'GFBO168',7.7,1,'FILETE OURO VERMELHO TRAB',6.8,1.5,NULL,NULL,0,0),(104,'GFBO101/2FL',7.6,1,'',6,1.5,NULL,NULL,0,0),(105,'GF01T',5,1,'BASE GF46',4.5,1.3,NULL,NULL,0,0),(106,'GF02T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(107,'GF03T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(108,'GF04T',5,1,'BASE GF46',4.5,1.3,NULL,NULL,0,0),(109,'GF05T',5,1,'BASE GF46',4.5,1.3,NULL,NULL,0,0),(110,'GF06T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(111,'GF07T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(112,'GF08T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(113,'GF09T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(114,'GF10T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(115,'GF11T',5,1,'BASE GF46',4.5,1.3,NULL,NULL,0,0),(116,'GF12T',5,1,'BASE GF46',4.5,1.3,NULL,NULL,0,0),(117,'GF13T',5,1,'BASE GF46',4.5,1.3,NULL,NULL,0,0),(118,'GF14T',2.3,1,'BASE GF35',3.4,1,NULL,NULL,0,0),(119,'GF15T',1.2,1,'BASE GF23',2.3,0.8,NULL,NULL,0,0),(120,'GF2318T',1.2,1,'',2.3,0.8,NULL,NULL,0,0),(121,'GF2319T',1.2,1,'',2.3,0.8,NULL,NULL,0,0),(122,'GF2325T',1.2,1,'',2.3,0.8,NULL,NULL,0,0),(123,'GF2830T',1.4,1,'',2.8,1,NULL,NULL,0,0),(124,'GF2831T',1.4,1,'',2.8,1,NULL,NULL,0,0),(125,'GF2832T',1.4,1,'',2.8,1,NULL,NULL,0,0),(126,'GF2833T',1.4,1,'',2.8,1,NULL,NULL,0,0),(127,'GF2834T',1.4,1,'',2.8,1,NULL,NULL,0,0),(128,'GF2838T',1.4,1,'',2.8,1,NULL,NULL,0,0),(129,'GF2839T',1.4,1,'',2.8,1,NULL,NULL,0,0),(130,'GF2840T',1.4,1,'',2.8,1,NULL,NULL,0,0),(131,'GF4040T',3.2,1,'',4,1.1,NULL,NULL,0,0),(132,'GF4041T',3.2,1,'',4,1.1,NULL,NULL,0,0),(133,'GF4043T',3.2,1,'',4,1.1,NULL,NULL,0,0),(134,'GF4044T',3.2,1,'',4,1.1,NULL,NULL,0,0),(135,'GF4045T',3.2,1,'',4,1.1,NULL,NULL,0,0),(136,'GF4047T',3.2,1,'',4,1.1,NULL,NULL,0,0),(137,'GF4048T',3.2,1,'',4,1.1,NULL,NULL,0,0),(138,'GF4049T',3.2,1,'',4,1.1,NULL,NULL,0,0),(139,'GF4051T',3.2,1,'',4,1.1,NULL,NULL,0,0),(140,'GF4052T',3.2,1,'',4,1.1,NULL,NULL,0,0),(141,'GF40AN53T',4.5,1,'',4,1.5,NULL,NULL,0,0),(142,'GF40AN54T',4.5,1,'',4,1.5,NULL,NULL,0,0),(143,'GF40AN35T',6.5,1,'',4.5,2,NULL,NULL,0,0),(144,'GF41FS/LBR',3.9,1,'1 BR 2 PTS',4,1.5,NULL,NULL,0,0),(145,'GF46AN35T',6.5,1,'',4.6,1.7,NULL,NULL,0,0),(146,'GF52FS/CNBR',3.6,1,'',5.6,1.6,NULL,NULL,0,0),(147,'GF56/2CNBR',5.8,1,'',5.6,1.6,NULL,NULL,0,0),(148,'GF101T',6.3,1,'',6,1.3,NULL,NULL,0,0),(149,'GF101CV',5.2,1,'',6,1.2,NULL,NULL,0,0),(150,'GF150T',6.5,1,'',6,1.5,NULL,NULL,0,0),(151,'GF166/CA',5.7,1,'CARTIE 3 OUROS',2.8,0.9,NULL,NULL,0,0),(152,'GF170',4.3,1,'',4.5,1.5,NULL,NULL,0,0),(153,'GF171',4.3,1,'',4.5,1.5,NULL,NULL,0,0),(154,'GF172',3.9,1,'',4.5,1.5,NULL,NULL,0,0),(155,'GF173',4.6,1,'',4.5,1.5,NULL,NULL,0,0),(156,'GF174',4,1,'',4.5,1.5,NULL,NULL,0,0),(157,'GF175',5.5,1,'',4.5,1.6,NULL,NULL,0,0),(158,'GF176',4.5,1,'',4.5,1.6,NULL,NULL,0,0),(159,'GF207AN/T',6.4,1,'',5.6,1.4,NULL,NULL,0,0),(160,'GF211T',6,1,'',5,1.6,NULL,NULL,0,0),(161,'GF212T',7,1,'',6,1.6,NULL,NULL,0,0),(162,'GF213T',6.8,1,'',6,1.2,NULL,NULL,0,0),(163,'GF216T',1.8,1,'',2.8,0.9,NULL,NULL,0,0),(164,'GF210AN/2CV',8.5,1,'',6.8,1.9,NULL,NULL,0,0);
/*!40000 ALTER TABLE `tbl_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_os`
--

DROP TABLE IF EXISTS `tbl_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_os` (
  `OS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OS_DATAENTRADA` datetime DEFAULT CURRENT_TIMESTAMP,
  `OS_DATASAIDA` datetime DEFAULT NULL,
  `OS_DTCAD` datetime DEFAULT NULL,
  `OS_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  `OS_LOJA` varchar(45) DEFAULT NULL,
  `OS_OBS` varchar(45) DEFAULT NULL,
  `OS_ATIVADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`OS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_os`
--

LOCK TABLES `tbl_os` WRITE;
/*!40000 ALTER TABLE `tbl_os` DISABLE KEYS */;
INSERT INTO `tbl_os` VALUES (1,'2015-11-17 18:45:20',NULL,NULL,NULL,0,0,'Loja 1','',1),(3,'2015-11-17 19:31:36','2015-11-17 19:32:51',NULL,NULL,0,0,'10','grava maria',1),(4,'2015-11-17 21:26:46',NULL,NULL,NULL,0,0,'1','',1),(5,'2015-11-17 21:27:14',NULL,NULL,NULL,0,0,'2','',1),(6,'2015-11-17 21:27:45',NULL,NULL,NULL,0,0,'3','',1),(7,'2015-11-17 21:28:08',NULL,NULL,NULL,0,0,'4','',1),(8,'2015-11-17 21:28:39',NULL,NULL,NULL,0,0,'5','',1),(9,'2015-11-17 21:29:40',NULL,NULL,NULL,0,0,'6','',1),(10,'2015-11-17 21:30:23',NULL,NULL,NULL,0,0,'10','',1),(11,'2015-11-17 21:31:05',NULL,NULL,NULL,0,0,'11','',1),(12,'2015-11-17 21:31:32',NULL,NULL,NULL,0,0,'12','',1),(13,'2015-11-17 21:32:33',NULL,NULL,NULL,0,0,'13','',1),(14,'2015-11-17 21:33:14',NULL,NULL,NULL,0,0,'13','',1),(15,'2015-11-17 21:33:49',NULL,NULL,NULL,0,0,'14','',1),(16,'2015-11-17 21:35:23',NULL,NULL,NULL,0,0,'15','',1),(17,'2015-11-17 21:35:51',NULL,NULL,NULL,0,0,'16','',1),(18,'2015-11-17 21:36:06',NULL,NULL,NULL,0,0,'17','',1),(19,'2015-11-17 21:36:48',NULL,NULL,NULL,0,0,'18','',1),(20,'2015-11-17 21:37:35',NULL,NULL,NULL,0,0,'19','',1),(21,'2015-11-17 21:37:52',NULL,NULL,NULL,0,0,'20','',1),(22,'2015-11-17 21:38:16',NULL,NULL,NULL,0,0,'21','',1),(23,'2015-11-17 21:49:22',NULL,NULL,NULL,0,0,'12','',1);
/*!40000 ALTER TABLE `tbl_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permissao`
--

DROP TABLE IF EXISTS `tbl_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_permissao` (
  `PER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PER_ADMINISTRATIVO` varchar(25) DEFAULT NULL,
  `PER_OPERACIONAL` varchar(25) DEFAULT NULL,
  `FUN_ID` int(11) DEFAULT '0',
  `PER_DTCAD` datetime DEFAULT NULL,
  `PER_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
  PRIMARY KEY (`PER_ID`),
  KEY `FUN_ID` (`FUN_ID`),
  CONSTRAINT `fk_per_fun` FOREIGN KEY (`FUN_ID`) REFERENCES `tbl_funcionario` (`FUN_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permissao`
--

LOCK TABLES `tbl_permissao` WRITE;
/*!40000 ALTER TABLE `tbl_permissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_cpa'
--

--
-- Dumping routines for database 'db_cpa'
--

--
-- Final view structure for view `horas_trabalhadas`
--

/*!50001 DROP VIEW IF EXISTS `horas_trabalhadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `horas_trabalhadas` AS select `conta`.`CON_NOME` AS `Conta`,timestampdiff(MINUTE,`aliancaconta`.`ACO_INICIO`,ifnull(`aliancaconta`.`ACO_TERMINO`,now())) AS `HorasTrabalhadas`,`funcionario`.`FUN_NOME` AS `Funcionario`,`os`.`OS_ID` AS `OS` from ((((`tbl_aliancaconta` `aliancaconta` join `tbl_conta` `conta` on((`aliancaconta`.`CON_ID` = `conta`.`CON_ID`))) join `tbl_funcionario` `funcionario` on((`aliancaconta`.`FUN_ID` = `funcionario`.`FUN_ID`))) join `tbl_alianca` `alianca` on((`aliancaconta`.`ALI_ID` = `alianca`.`ALI_ID`))) join `tbl_os` `os` on((`alianca`.`OS_ID` = `os`.`OS_ID`))) where ((`aliancaconta`.`ACO_ATIVADO` = 1) and (`conta`.`CON_ATIVADO` = 1) and (`os`.`OS_ATIVADO` = 1)) order by `conta`.`CON_NOME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-23 13:55:02
