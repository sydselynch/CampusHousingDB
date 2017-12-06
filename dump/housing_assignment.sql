CREATE DATABASE  IF NOT EXISTS `housing` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `housing`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: ix.cs.uoregon.edu    Database: housing
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assignment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(11) unsigned NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `resident_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`assignment_id`),
  KEY `room_id` (`room_id`),
  KEY `res_id_idx` (`resident_id`),
  CONSTRAINT `res_id` FOREIGN KEY (`resident_id`) REFERENCES `resident` (`resident_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2017-12-05 14:43:52',NULL,1),(2,5,'2017-12-05 14:43:52',NULL,2),(3,8,'2017-12-05 14:43:52',NULL,3),(4,11,'2017-12-05 14:43:52',NULL,4),(5,15,'2017-12-05 14:43:52',NULL,5),(6,27,'2017-12-05 14:43:52',NULL,6),(7,35,'2017-12-05 14:43:52',NULL,7),(8,38,'2017-12-05 14:43:52',NULL,8),(9,41,'2017-12-05 14:43:52',NULL,9),(10,48,'2017-12-05 14:43:52',NULL,10),(11,23,'2017-12-05 14:43:53',NULL,11),(12,12,'2017-12-05 14:43:53',NULL,12),(13,50,'2017-12-05 14:43:53',NULL,13),(14,7,'2017-12-05 14:43:53',NULL,14),(15,29,'2017-12-05 14:43:53',NULL,15),(18,16,'2017-12-06 00:37:10',NULL,54),(19,16,'2017-12-06 01:15:45',NULL,54);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06 12:35:10