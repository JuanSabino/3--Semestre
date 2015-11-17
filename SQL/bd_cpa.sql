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
  PRIMARY KEY (`ALI_ID`),
  KEY `MOD_ID` (`MOD_ID`),
  KEY `OS_ID` (`OS_ID`),
  KEY `fk_ali_fun` (`FUN_ID_ALT`),
  CONSTRAINT `fk_ali_fun` FOREIGN KEY (`FUN_ID_ALT`) REFERENCES `tbl_funcionario` (`FUN_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ali_mod` FOREIGN KEY (`MOD_ID`) REFERENCES `tbl_modelo` (`MOD_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ali_os` FOREIGN KEY (`OS_ID`) REFERENCES `tbl_os` (`OS_ID`) ON UPDATE CASCADE
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
-- Table structure for table `tbl_aliancaconta`
--

DROP TABLE IF EXISTS `tbl_aliancaconta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_aliancaconta` (
  `ACO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACO_ENTRADA` float NOT NULL,
  `ACO_SAIDA` float DEFAULT NULL,
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
  KEY `MAQ_ID` (`MAQ_ID`),
  CONSTRAINT `fk_aco_ali` FOREIGN KEY (`ALI_ID`) REFERENCES `tbl_alianca` (`ALI_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_aco_con` FOREIGN KEY (`CON_ID`) REFERENCES `tbl_conta` (`CON_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_aco_fun` FOREIGN KEY (`FUN_ID`) REFERENCES `tbl_funcionario` (`FUN_ID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_aco_maq` FOREIGN KEY (`MAQ_ID`) REFERENCES `tbl_maquina` (`MAQ_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aliancaconta`
--

LOCK TABLES `tbl_aliancaconta` WRITE;
/*!40000 ALTER TABLE `tbl_aliancaconta` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conta`
--

LOCK TABLES `tbl_conta` WRITE;
/*!40000 ALTER TABLE `tbl_conta` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_maquina`
--

LOCK TABLES `tbl_maquina` WRITE;
/*!40000 ALTER TABLE `tbl_maquina` DISABLE KEYS */;
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
  `MOD_PESO` float NOT NULL,
  `MOD_ATIVADO` tinyint(1) DEFAULT '1',
  `MOD_DESCRICAO` varchar(255) DEFAULT NULL,
  `MOD_LARGURA` float NOT NULL,
  `MOD_ALTURA` float NOT NULL,
  `MOD_DTCAD` datetime DEFAULT NULL,
  `MOD_DTALT` datetime DEFAULT NULL,
  `FUN_ID_ALT` int(11) DEFAULT '0',
  `FUN_ID_CAD` int(11) DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_os`
--

LOCK TABLES `tbl_os` WRITE;
/*!40000 ALTER TABLE `tbl_os` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-17 12:53:04
