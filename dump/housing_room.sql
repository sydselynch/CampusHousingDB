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
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_number` int(11) NOT NULL DEFAULT '0',
  `hall_code` varchar(4) NOT NULL DEFAULT '',
  `room_key_code` int(11) unsigned DEFAULT NULL,
  `room_gender` varchar(4) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,101,'BOR',1111,'M','D'),(2,102,'BOR',1112,'F','D'),(3,103,'BOR',1113,'M','D'),(4,104,'BOR',1114,'F','D'),(5,105,'BOR',1115,'M','D'),(6,101,'ARK',1116,'F','D'),(7,102,'ARK',1117,'M','D'),(8,103,'ARK',1118,'F','D'),(9,104,'ARK',1119,'M','D'),(10,105,'ARK',1120,'F','D'),(11,101,'EAR',1121,'M','D'),(12,102,'EAR',1122,'F','D'),(13,103,'EAR',1123,'M','D'),(14,104,'EAR',1124,'F','D'),(15,105,'EAR',1125,'M','D'),(16,101,'LYN',1126,'F','D'),(17,102,'LYN',1127,'M','D'),(18,103,'LYN',1128,'F','D'),(19,104,'LYN',1129,'M','D'),(20,105,'LYN',1130,'F','D'),(21,101,'KUT',1131,'M','D'),(22,102,'KUT',1132,'F','D'),(23,103,'KUT',1133,'M','D'),(24,104,'KUT',1134,'F','D'),(25,105,'KUT',1135,'M','D'),(26,101,'HAM',1136,'F','D'),(27,102,'HAM',1137,'M','D'),(28,103,'HAM',1138,'F','D'),(29,104,'HAM',1139,'M','D'),(30,105,'HAM',1140,'F','D'),(31,101,'DUC',1141,'M','D'),(32,102,'DUC',1142,'F','D'),(33,103,'DUC',1143,'M','D'),(34,104,'DUC',1144,'F','D'),(35,105,'DUC',1145,'M','D'),(36,101,'HAR',1146,'F','D'),(37,102,'HAR',1147,'M','D'),(38,103,'HAR',1148,'F','D'),(39,104,'HAR',1149,'M','D'),(40,105,'HAR',1150,'F','D'),(41,101,'GER',1151,'M','D'),(42,102,'GER',1152,'F','D'),(43,103,'GER',1153,'M','D'),(44,104,'GER',1154,'F','D'),(45,105,'GER',1155,'M','D'),(46,101,'MER',1156,'F','D'),(47,102,'MER',1157,'M','D'),(48,103,'MER',1158,'F','D'),(49,104,'MER',1159,'M','D'),(50,105,'MER',1160,'F','D');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06 12:35:09
