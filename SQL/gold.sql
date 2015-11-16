CREATE DATABASE  IF NOT EXISTS `gold` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gold`;
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
  `MOD_ID` int(10) unsigned NOT NULL,
  `ALI_TAMANHO` int(10) unsigned NOT NULL,
  `OS_ID` int(10) unsigned DEFAULT NULL,
  `ALI_ATIVADO` tinyint(1) DEFAULT '1',
  `ALI_DETALHES` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ALI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



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
  `ALC_SAIDA` decimal(20,0) DEFAULT '0',
  `ALC_OBSSAIDA` varchar(100) DEFAULT NULL,
  `ALC_INICIO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ALC_TERMINO` datetime DEFAULT NULL,
  `ALC_ATIVADO` tinyint(1) DEFAULT '1',
  `FUN_ID` int(11) NOT NULL,
  `MAQ_ID` int(11) DEFAULT '0',
  `CON_ID` int(11) NOT NULL,
  `ALI_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ALC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargo`
--

LOCK TABLES `tbl_cargo` WRITE;
/*!40000 ALTER TABLE `tbl_cargo` DISABLE KEYS */;
INSERT INTO `tbl_cargo` VALUES (1,'Auxiliar de Produção',1),(2,'Ourives',1),(3,'Gerente',1),(4,'Auxiliar Administrativo',1);
/*!40000 ALTER TABLE `tbl_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conta`
--

DROP TABLE IF EXISTS `tbl_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_conta` (
  `CON_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CON_NOME` varchar(45) NOT NULL,
  `CON_ATIVADO` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`CON_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conta`
--

LOCK TABLES `tbl_conta` WRITE;
/*!40000 ALTER TABLE `tbl_conta` DISABLE KEYS */;
INSERT INTO `tbl_conta` VALUES (1,'Fundição',1),(2,'Corte',1),(3,'Usinagem',1),(4,'Polimento',1),(5,'Banca',1),(6,'Preparacao',1);
/*!40000 ALTER TABLE `tbl_conta` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
INSERT INTO `tbl_funcionario` VALUES (1,'Raul Santiago Lopes ','40809988801','408',1,3),(2,'Felipe','31849170602','318',1,3),(3,'Gustavo','29502759406','295',1,3),(4,'Reinaldo','20961808014','209',1,3),(5,'Carlos Alberto','09837563894','098',1,5),(6,'Juliana','57364859304','573',1,6),(7,'Bruna','49582748692','495',1,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_maquina`
--

LOCK TABLES `tbl_maquina` WRITE;
/*!40000 ALTER TABLE `tbl_maquina` DISABLE KEYS */;
INSERT INTO `tbl_maquina` VALUES (1,'Fundidora Continua Mimi',1),(2,'Torno - TA Coelho',1),(3,'Maquina de Corte',1),(4,'Politriz',1),(5,'Diamantadeira FD 85A',1),(6,'Formadeira MF Coelho',1);
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
  `MOD_PESO` decimal(50,2) unsigned NOT NULL,
  `MOD_DESCRICAO` varchar(200) DEFAULT NULL,
  `MOD_LARGURA` decimal(50,2) unsigned NOT NULL,
  `MOD_ALTURA` decimal(50,2) unsigned NOT NULL,
  `MOD_ATIVADO` tinyint(1) DEFAULT '1',
  `MOD_REFERENCIA` decimal(50,2) DEFAULT NULL,
  PRIMARY KEY (`MOD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modelo`
--

LOCK TABLES `tbl_modelo` WRITE;
/*!40000 ALTER TABLE `tbl_modelo` DISABLE KEYS */;
INSERT INTO `tbl_modelo` VALUES (1,'GF23',1.20,'',2.30,0.80,1,1.20),(2,'GF28',1.40,'',2.80,1.00,1,1.40),(3,'GF28AN',2.70,'',2.80,1.30,1,2.70),(4,'GF35',2.30,'',3.40,1.00,1,2.30),(5,'GF35/A',1.60,'',3.40,0.70,1,1.60),(6,'GF35AN',3.00,'',3.50,1.20,1,3.00),(7,'GF40',3.20,'',4.00,1.10,1,3.20),(8,'GF40/A',2.90,'',4.00,0.90,1,3.10),(9,'GF40/C',1.50,'',4.00,0.50,1,1.80),(10,'GF40AN',4.50,'',4.00,1.50,1,4.50),(11,'GF40AN/OB',4.50,'',4.00,1.50,1,5.40),(12,'GF40AN/BR',4.50,'1 BR 3 PTS',4.00,1.50,1,6.20),(13,'GF40AN/3BR',4.50,'3 BR 3 PTS',4.00,1.50,1,9.60),(14,'GF45/7',2.50,'',4.50,0.70,1,2.50),(15,'GF46',5.00,'',4.50,1.30,1,5.00),(16,'GF46/A',3.30,'',4.50,1.00,1,3.30),(17,'GF46/B',1.80,'',4.00,0.80,1,1.80),(18,'GF46AN',6.50,'',4.60,1.70,1,6.50),(19,'GF46AN/OB',6.50,'',4.60,1.70,1,7.80),(20,'GF46AN/BR',6.50,'1 BR 3 PTS',4.60,1.70,1,8.20),(21,'GF46AN/3BR',6.70,'3 BR 3 PTS',4.60,1.70,1,11.60),(22,'GF46AN/7BR',6.50,'7 BR 3 PTS',4.60,1.70,1,18.40),(23,'GF50AN',5.40,'',3.30,2.20,1,5.40),(24,'GF50AN/BR',5.40,'1 BR 4 PTS',3.20,2.20,1,7.90),(25,'GF51',3.50,'',3.20,1.30,1,3.50),(26,'GF51/BR',3.50,'1 BR 2 PTS',3.20,1.30,1,4.70),(27,'GF52 (RETA)',4.20,'',4.00,1.20,1,4.20),(28,'GF52/BR  (RETA)',4.20,'1 BR 3 PTS',4.00,1.20,1,5.90),(29,'GF53',3.30,'',2.90,1.30,1,3.30),(30,'GF53/BR',3.30,'1 BR 2 PTS',2.50,1.30,1,4.50),(31,'GF55',6.20,'',5.00,1.70,1,6.20),(32,'GF55AN',7.60,'',5.00,2.00,1,7.60),(33,'GF57AN/BR',6.40,'1 BR 3 PTS',5.50,1.50,1,8.10),(34,'GF58AN',6.00,'',5.50,1.80,1,6.00),(35,'GF58AN/BR',6.00,'1 BR 2 PTS',5.50,1.80,1,7.20),(36,'GF59',3.40,'',5.00,0.90,1,3.40),(37,'GF75',7.70,'',7.50,1.70,1,7.70),(38,'GF100AN',8.00,'',6.80,1.80,1,8.00),(39,'GF100/BR',6.90,'1 BR 3 PTS',7.00,1.30,1,8.40),(40,'GF100AN/3BR',8.00,'3 BR 3 PTS',6.80,1.70,1,13.10),(41,'GF100AN/7BR',8.00,'7 BR 3 PTS',6.80,1.70,1,19.90),(42,'GF100',6.90,'',7.00,1.30,1,6.90),(43,'GF100/3BR',6.90,'3 BR 3 PTS',7.00,1.30,1,12.00),(44,'GF101',6.50,'',6.00,1.50,1,6.50),(45,'GF101/BR',6.50,'1 BR 3 PTS',6.00,1.50,1,8.20),(46,'GF101/2BR ',6.50,'2 BR 3 PTS',6.00,1.50,1,9.90),(47,'GF101/3BR',6.50,'3 BR 3 PTS',6.00,1.50,1,11.60),(48,'GF102',8.80,'',6.80,2.00,1,8.80),(49,'GF102/A',5.20,'',6.80,1.20,1,5.20),(50,'GF102/BR',8.80,'1 BR 3 PTS',6.80,2.00,1,11.10),(51,'GF102/3BR',8.80,'3 BR 3 PTS',6.80,2.00,1,13.90),(52,'GF102/5BR',8.80,'5 BR 3 PTS',6.80,2.00,1,17.30),(53,'GF 100AN/BR',8.00,'1 BR  3 PTS',6.80,1.80,1,9.40),(54,'GF103',12.00,'',8.00,2.00,1,12.00),(55,'GF103/3BR ',12.00,'3 BR 3 PTS',8.00,2.00,1,17.10),(56,'GF206AN',7.80,'',6.00,1.40,1,7.80),(57,'GF208AN  ',4.90,'',6.00,1.40,1,5.30),(58,'GF208AN/BR',4.90,'1 BR 2PTS',4.00,1.40,1,6.10),(59,'GF209AN',6.40,'',6.00,1.40,1,6.40),(60,'GF209AN/4BR',6.40,'4 BR 1,25PTS',6.00,1.40,1,8.80),(61,'GF210AN/2CV',8.50,'',6.80,1.90,1,9.40),(62,'GF215',8.60,'',8.00,1.30,1,8.60),(63,'GF215AN',11.60,'',8.00,2.20,1,12.40),(64,'GF214/3BR',5.20,'3 BR 3 PTS',5.00,1.30,1,10.30),(65,'GFBP35',2.50,'',3.50,1.10,1,3.00),(66,'GFBP35AN',2.50,'',3.50,1.10,1,4.50),(67,'GFBP40',3.50,'',4.00,1.10,1,4.20),(68,'GFBP45',4.20,'',4.00,1.40,1,5.00),(69,'GFBP45/BR',4.20,'1 BR 3 PTS',4.00,1.40,1,6.80),(70,'GFBP45AN',6.40,'',4.00,1.80,1,7.70),(71,'GFBP45AN/BR',6.40,'1 BR 3 PTS',4.00,1.80,1,9.40),(72,'GFBP46',5.00,'',4.60,1.50,1,6.00),(73,'GFBP46AN/2OU',6.40,'',4.50,2.00,1,7.70),(74,'GFBP50/BR',7.60,'1 BR 3 PTS',5.00,1.80,1,10.80),(75,'GFBP101/FS',7.60,'',6.00,1.50,1,9.10),(76,'GFBP101/2FL',6.70,'',6.00,1.50,1,8.00),(77,'GFBP101FLBR',6.60,'1 BR 3 PTS',6.00,1.50,1,9.60),(78,'GFBP155/BR',8.80,'1 BR 3 PTS',7.90,1.60,1,12.30),(79,'GFBP156',5.50,'',5.00,1.50,1,6.60),(80,'GFBP157',7.10,'',5.90,1.50,1,8.50),(81,'GFBP158',5.50,'',5.00,1.50,1,6.60),(82,'GFBP159/3BR',7.70,'3 BR 3 PTS',7.00,1.80,1,14.30),(83,'GFBP160',6.50,'',5.90,1.40,1,7.80),(84,'GFBP161',7.80,'',6.90,1.40,1,9.40),(85,'GFBP162',4.90,'',4.30,1.10,1,5.90),(86,'GFBP163',8.80,'',6.90,1.80,1,10.50),(87,'GFBP169/25ANOS',6.80,'FILETE OURO VERMELHO   25 ANOS ',5.80,1.50,1,7.90),(88,'GFBP185',2.10,'',2.80,1.10,1,2.50),(89,'GFBP186',2.50,'',2.80,1.30,1,3.00),(90,'GFBP187',2.70,'',3.30,1.10,1,3.20),(91,'GFBP200',5.70,'',5.00,1.20,1,6.80),(92,'GFBP201/3BR',7.50,'3 BR 1,25 PTS',5.60,1.50,1,11.20),(93,'GFBP202AN/BR',6.40,'1 BR 2PTS',6.00,1.20,1,9.10),(94,'GFBP203',6.80,'',6.00,1.30,1,8.10),(95,'GFBP204/FL4BR',8.50,'4 BR 2PTS',6.00,1.70,1,13.00),(96,'GFBP205',4.20,'',3.60,1.20,1,5.00),(97,'GFBO35',2.50,'',3.50,1.10,1,3.00),(98,'GFBO40',3.50,'',4.00,1.10,1,4.20),(99,'GFBO46',5.00,'',4.60,1.50,1,6.00),(100,'GFBO164',5.10,'FILETE OURO VERMELHO TRAB',4.90,1.40,1,5.90),(101,'GFBO165/50ANOS',6.80,'FILETE OURO VERMELHO 50 ANOS',5.80,1.50,1,7.90),(102,'GFBO167',5.30,'FILETE OURO VERMELHO TRAB',5.60,1.40,1,6.00),(103,'GFBO168',7.70,'FILETE OURO VERMELHO TRAB',6.80,1.50,1,8.70),(104,'GFBO101/2FL',7.60,'',6.00,1.50,1,9.10),(105,'GF01T',5.00,'BASE GF46',4.50,1.30,1,5.80),(106,'GF02T',2.30,'BASE GF35',3.40,1.00,1,2.70),(107,'GF03T',2.30,'BASE GF35',3.40,1.00,1,2.70),(108,'GF04T',5.00,'BASE GF46',4.50,1.30,1,5.80),(109,'GF05T',5.00,'BASE GF46',4.50,1.30,1,5.80),(110,'GF06T',2.30,'BASE GF35',3.40,1.00,1,2.70),(111,'GF07T',2.30,'BASE GF35',3.40,1.00,1,2.70),(112,'GF08T',2.30,'BASE GF35',3.40,1.00,1,2.70),(113,'GF09T',2.30,'BASE GF35',3.40,1.00,1,2.70),(114,'GF10T',2.30,'BASE GF35',3.40,1.00,1,2.70),(115,'GF11T',5.00,'BASE GF46',4.50,1.30,1,5.80),(116,'GF12T',5.00,'BASE GF46',4.50,1.30,1,5.80),(117,'GF13T',5.00,'BASE GF46',4.50,1.30,1,5.80),(118,'GF14T',2.30,'BASE GF35',3.40,1.00,1,2.70),(119,'GF15T',1.20,'BASE GF23',2.30,0.80,1,1.40),(120,'GF2318T',1.20,'',2.30,0.80,1,1.40),(121,'GF2319T',1.20,'',2.30,0.80,1,1.40),(122,'GF2325T',1.20,'',2.30,0.80,1,1.40),(123,'GF2830T',1.40,'',2.80,1.00,1,1.60),(124,'GF2831T',1.40,'',2.80,1.00,1,1.60),(125,'GF2832T',1.40,'',2.80,1.00,1,1.60),(126,'GF2833T',1.40,'',2.80,1.00,1,1.60),(127,'GF2834T',1.40,'',2.80,1.00,1,1.60),(128,'GF2838T',1.40,'',2.80,1.00,1,1.60),(129,'GF2839T',1.40,'',2.80,1.00,1,1.60),(130,'GF2840T',1.40,'',2.80,1.00,1,1.60),(131,'GF4040T',3.20,'',4.00,1.10,1,3.60),(132,'GF4041T',3.20,'',4.00,1.10,1,3.60),(133,'GF4043T',3.20,'',4.00,1.10,1,3.60),(134,'GF4044T',3.20,'',4.00,1.10,1,3.60),(135,'GF4045T',3.20,'',4.00,1.10,1,3.60),(136,'GF4047T',3.20,'',4.00,1.10,1,3.60),(137,'GF4048T',3.20,'',4.00,1.10,1,3.60),(138,'GF4049T',3.20,'',4.00,1.10,1,3.60),(139,'GF4051T',3.20,'',4.00,1.10,1,3.60),(140,'GF4052T',3.20,'',4.00,1.10,1,3.60),(141,'GF40AN53T',4.50,'',4.00,1.50,1,5.20),(142,'GF40AN54T',4.50,'',4.00,1.50,1,5.20),(143,'GF40AN35T',6.50,'',4.50,2.00,1,7.50),(144,'GF41FS/LBR',3.90,'1 BR 2 PTS',4.00,1.50,1,6.20),(145,'GF46AN35T',6.50,'',4.60,1.70,1,7.50),(146,'GF52FS/CNBR',3.60,'',5.60,1.60,1,4.10),(147,'GF56/2CNBR',5.80,'',5.60,1.60,1,7.90),(148,'GF101T',6.30,'',6.00,1.30,1,7.30),(149,'GF101CV',5.20,'',6.00,1.20,1,5.20),(150,'GF150T',6.50,'',6.00,1.50,1,9.10),(151,'GF166/CA',5.70,'CARTIE 3 OUROS',2.80,0.90,1,7.50),(152,'GF170',4.30,'',4.50,1.50,1,4.70),(153,'GF171',4.30,'',4.50,1.50,1,4.90),(154,'GF172',3.90,'',4.50,1.50,1,4.30),(155,'GF173',4.60,'',4.50,1.50,1,5.10),(156,'GF174',4.00,'',4.50,1.50,1,4.60),(157,'GF175',5.50,'',4.50,1.60,1,5.50),(158,'GF176',4.50,'',4.50,1.60,1,5.00),(159,'GF207AN/T',6.40,'',5.60,1.40,1,7.70),(160,'GF211T',6.00,'',5.00,1.60,1,6.50),(161,'GF212T',7.00,'',6.00,1.60,1,7.50),(162,'GF213T',6.80,'',6.00,1.20,1,7.30),(163,'GF216T',1.80,'',2.80,0.90,1,2.30),(164,'GF210AN/2CV',8.50,'',6.80,1.90,1,9.40);
/*!40000 ALTER TABLE `tbl_modelo` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping events for database 'gold'
--

--
-- Dumping routines for database 'gold'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 10:49:55
