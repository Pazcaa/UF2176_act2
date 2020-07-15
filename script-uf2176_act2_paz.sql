-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: uf2176_act2_paz
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Current Database: `uf2176_act2_paz`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `uf2176_act2_paz` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `uf2176_act2_paz`;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `presupuesto` double DEFAULT NULL,
  `gastos` double DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `departamento_UN` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'formacion',450000,34000),(2,'sistemas',40000,50000),(3,'host',678590,46000),(4,'I+D',0,0),(5,'programación',150000,0);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `codigo` int(10) NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido1` varchar(100) NOT NULL,
  `apellido2` varchar(100) NOT NULL,
  `codigo_departamento` int(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `UN_nif` (`nif`),
  UNIQUE KEY `UN_empleados` (`nombre`,`apellido1`,`apellido2`),
  KEY `FK_empleados` (`codigo_departamento`),
  CONSTRAINT `FK_empleados` FOREIGN KEY (`codigo_departamento`) REFERENCES `departamento` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'11111111H','Periko','Palotes','Fuerte',2),(2,'11111128J','Daniel','Redondo','Cuadrau',4),(3,'15345412G','Patricia','Curniel','Saratova',2),(4,'12433445G','Dolores','West','World',NULL),(8,'11111111G','Enrique','Palotes','World',3),(16,'','paz','','',1),(23,'23456789H','pepe','   redondo','',2),(33,'23456789K','ander','uraga','uraga',1),(34,'23456789J','paz1',' caamaÃ±o','Barrera',3),(40,'11111111K','pepe2','  ','',4),(42,'23456789Y','alberto','redondo','uraga',4),(43,'11111111J','jon','ape1','ape2',1),(44,'11111111D','\'paz\', \'ape1\', \'ape2\', \'12345678K\', 3); DROP TABLE empleados; -- ',' redondo','west',3),(45,'11111111M','periko2',' palotes','fuerte',4),(48,'2456789J','periko2',' redondo','Curniel',4),(49,'11111111T','carlos','mon','sil',4),(50,'11111111S','paz1',' ','',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-14 13:35:32
