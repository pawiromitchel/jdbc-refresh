CREATE DATABASE  IF NOT EXISTS `jdbc_refresh` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jdbc_refresh`;
-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: jdbc_refresh
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.34-MariaDB

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
-- Table structure for table `afdeling`
--

DROP TABLE IF EXISTS `afdeling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afdeling` (
  `id` int(11) NOT NULL,
  `naam` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afdeling`
--

LOCK TABLES `afdeling` WRITE;
/*!40000 ALTER TABLE `afdeling` DISABLE KEYS */;
INSERT INTO `afdeling` VALUES (1,'HR'),(2,'ICT');
/*!40000 ALTER TABLE `afdeling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functie`
--

DROP TABLE IF EXISTS `functie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functie`
--

LOCK TABLES `functie` WRITE;
/*!40000 ALTER TABLE `functie` DISABLE KEYS */;
INSERT INTO `functie` VALUES (1,'HR'),(2,'ICT');
/*!40000 ALTER TABLE `functie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `naam` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrator'),(2,'Operator');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `werknemer`
--

DROP TABLE IF EXISTS `werknemer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `werknemer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(45) DEFAULT NULL,
  `achternaam` varchar(45) DEFAULT NULL,
  `extensie` varchar(45) DEFAULT NULL,
  `telefoon` varchar(45) DEFAULT NULL,
  `afdeling` int(11) DEFAULT NULL,
  `functie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_werknemer_functie_idx` (`functie`),
  KEY `fk_werknemer_afdeling_idx` (`afdeling`),
  CONSTRAINT `fk_werknemer_afdeling` FOREIGN KEY (`afdeling`) REFERENCES `afdeling` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_werknemer_functie` FOREIGN KEY (`functie`) REFERENCES `functie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `werknemer`
--

LOCK TABLES `werknemer` WRITE;
/*!40000 ALTER TABLE `werknemer` DISABLE KEYS */;
INSERT INTO `werknemer` VALUES (1,'Mitchel','Pawirodinomo','597','8781953',2,2);
/*!40000 ALTER TABLE `werknemer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `werknemer_rol`
--

DROP TABLE IF EXISTS `werknemer_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `werknemer_rol` (
  `werknemer_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`werknemer_id`),
  KEY `fk_werknemer_rol_idx` (`rol_id`),
  CONSTRAINT `fk_werknemer_id` FOREIGN KEY (`werknemer_id`) REFERENCES `werknemer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_werknemer_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `werknemer_rol`
--

LOCK TABLES `werknemer_rol` WRITE;
/*!40000 ALTER TABLE `werknemer_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `werknemer_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-14 19:13:24
