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
-- Table structure for table `equipment_borrow`
--

DROP TABLE IF EXISTS `equipment_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_borrow` (
  `equipment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(30) DEFAULT '',
  `student_id` int(11) unsigned NOT NULL DEFAULT '0',
  `in_date` datetime DEFAULT NULL,
  `out_date` datetime DEFAULT NULL,
  PRIMARY KEY (`equipment_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_borrow`
--

LOCK TABLES `equipment_borrow` WRITE;
/*!40000 ALTER TABLE `equipment_borrow` DISABLE KEYS */;
INSERT INTO `equipment_borrow` VALUES (1,'basketball',951000000,'2017-12-05 22:28:25','2017-12-05 22:09:01'),(9,'Basketball',951000000,'2017-12-06 12:14:27','2017-12-06 01:16:29'),(10,'Ping Pong Paddle',951000001,'2017-12-06 01:17:08','2017-12-06 01:16:42'),(11,'DVD Player 951000001',0,NULL,'2017-12-06 12:08:15'),(12,'Basketball',951000000,'2017-12-06 12:14:27','2017-12-06 12:08:39'),(13,'DVD Player',951000001,NULL,'2017-12-06 12:09:05'),(14,'Ping Pong Set',951000010,NULL,'2017-12-06 12:10:50'),(15,'Vacuum',951000015,NULL,'2017-12-06 12:11:10'),(16,'Vacuum',951000014,NULL,'2017-12-06 12:11:30');
/*!40000 ALTER TABLE `equipment_borrow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06 12:35:11
