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

--
-- Table structure for table `complex`
--

DROP TABLE IF EXISTS `complex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complex` (
  `complex_id` int(11) NOT NULL AUTO_INCREMENT,
  `complex_code` varchar(4) NOT NULL DEFAULT '',
  `complex_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`complex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complex`
--

LOCK TABLES `complex` WRITE;
/*!40000 ALTER TABLE `complex` DISABLE KEYS */;
INSERT INTO `complex` VALUES (1,'JON','Johnson'),(2,'DEA','Deady'),(3,'FEN','Fenton'),(4,'DES','Deschutes'),(5,'KLA','Klamath');
/*!40000 ALTER TABLE `complex` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_code` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(50) DEFAULT '',
  PRIMARY KEY (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('DIR','Director'),('FYG','First Year Group'),('RA','Resident Assistant'),('RES','Resident'),('ST','Staff');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hall` (
  `hall_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `complex_id` int(11) NOT NULL DEFAULT '0',
  `hall_code` varchar(4) NOT NULL DEFAULT '',
  `hall_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hall_id`),
  KEY `complex_id` (`complex_id`),
  KEY `hall_code` (`hall_code`),
  CONSTRAINT `complex_id` FOREIGN KEY (`complex_id`) REFERENCES `complex` (`complex_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,1,'BOR','Boris'),(2,1,'ARK','Arkady'),(3,2,'EAR','Earl'),(4,2,'LYN','Lynch'),(5,3,'KUT','Kutler'),(6,3,'HAM','Hampton'),(7,4,'DUC','Duck'),(8,4,'HAR','Harold'),(9,5,'GER','Gerald'),(10,5,'MER','Meryl');
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_borrow`
--

DROP TABLE IF EXISTS `key_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_borrow` (
  `key_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `room_key_code` int(11) unsigned DEFAULT NULL,
  `out_date` datetime DEFAULT NULL,
  `in_date` datetime DEFAULT NULL,
  `student_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`),
  KEY `room_key_code` (`room_key_code`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_borrow`
--

LOCK TABLES `key_borrow` WRITE;
/*!40000 ALTER TABLE `key_borrow` DISABLE KEYS */;
INSERT INTO `key_borrow` VALUES (1,1111,'2017-12-05 22:53:41','2017-12-05 23:55:36',951000000),(2,1111,'2017-12-05 22:53:42','2017-12-05 23:55:36',951000000),(3,1111,'2017-12-05 22:59:51','2017-12-05 23:55:36',951000000),(4,1111,'2017-12-05 23:01:44','2017-12-05 23:55:36',951000000),(5,1111,'2017-12-05 23:02:55','2017-12-05 23:55:36',951000000),(6,1158,'2017-12-06 01:17:34',NULL,951000009),(8,1117,'2017-12-06 01:18:18',NULL,951000013),(9,1118,'2017-12-06 12:15:14',NULL,951000002),(10,1122,'2017-12-06 12:15:27',NULL,951000011);
/*!40000 ALTER TABLE `key_borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailbox`
--

DROP TABLE IF EXISTS `mailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailbox` (
  `mailbox_num` int(11) unsigned NOT NULL DEFAULT '0',
  `mailbox_key` int(11) unsigned DEFAULT NULL,
  `complex_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailbox_num`),
  KEY `complex_id` (`complex_id`),
  CONSTRAINT `mb_complex_id` FOREIGN KEY (`complex_id`) REFERENCES `complex` (`complex_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox`
--

LOCK TABLES `mailbox` WRITE;
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
INSERT INTO `mailbox` VALUES (1000,1234,1),(1001,5345,1),(1002,6564,1),(1003,7636,2),(1004,9756,2),(1005,9649,2),(1006,6480,3),(1007,9784,3),(1008,1648,3),(1009,9835,4),(1010,1569,4),(1011,4545,4),(1012,2222,5),(1013,1973,5),(1014,8469,5),(1015,7777,5),(1016,1235,1),(1017,5346,1),(1018,6568,1),(1019,7646,2),(1020,9753,2),(1021,9671,2),(1022,6490,3),(1023,9774,3),(1024,1748,3),(1025,9861,4),(1026,1568,4),(1027,4646,4),(1028,2894,5),(1029,1976,5),(1030,8491,5),(1031,7888,5),(1032,9495,1),(1033,4689,1),(1034,1864,1),(1035,1780,2),(1036,1886,2),(1037,3598,2),(1038,2287,3),(1039,2929,3),(1040,4681,3),(1041,6481,4),(1042,3295,4),(1043,1874,4),(1044,2891,5),(1045,6913,5),(1046,9718,5),(1047,2841,5),(1048,5854,1),(1049,6101,1),(1050,6351,1);
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `package_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `package_recipient` varchar(64) NOT NULL DEFAULT '0',
  `student_id` int(11) unsigned NOT NULL DEFAULT '0',
  `in_date` datetime DEFAULT NULL,
  `out_date` datetime DEFAULT NULL,
  `tracking_number` varchar(64) DEFAULT '',
  PRIMARY KEY (`package_id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (2,'Jerry Larry',951000000,'2017-12-06 00:14:40','2017-12-06 00:23:02','1Z5391ABC'),(3,'Jerry Larry',951000001,'2017-12-06 01:20:16',NULL,'1Z5928BAC'),(4,'Danny Lu',951000010,'2017-12-06 12:17:22','2017-12-06 12:20:32','1ZKJF392'),(5,'Uncle Buzz',951000013,'2017-12-06 12:17:39',NULL,'1ZKDJSKLJ3'),(6,'Michelle Obama',951000007,'2017-12-06 12:17:55',NULL,'1ZOSJDLKFJ'),(7,'Bob Dylan',951000006,'2017-12-06 12:18:09',NULL,'1ZOSJDKLJF'),(8,'Gus Dapperton',951000004,'2017-12-06 12:18:38',NULL,'1ZAJSLFKSAKLJ'),(9,'Gus Dapperton',951000004,'2017-12-06 12:18:55',NULL,'1ZLKJ229D');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resident`
--

DROP TABLE IF EXISTS `resident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resident` (
  `resident_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) unsigned NOT NULL DEFAULT '0',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `group_code` varchar(10) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `mailbox_num` int(11) DEFAULT '0',
  PRIMARY KEY (`resident_id`),
  KEY `student_id` (`student_id`),
  KEY `group_code` (`group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resident`
--

LOCK TABLES `resident` WRITE;
/*!40000 ALTER TABLE `resident` DISABLE KEYS */;
INSERT INTO `resident` VALUES (1,951000000,'Jerry','Larry','RES FYG','M',1002),(2,951000001,'Jim','Bo','RES','M',1016),(3,951000002,'Walter','White','RES','M',1001),(4,951000003,'Sandy','Cheeks','RES DIR','F',1003),(5,951000004,'Gus','Dapperton','RES','M',1005),(6,951000005,'Frank','Ocean','RES RA','M',1006),(7,951000006,'Bob','Dylan','RES','M',1009),(8,951000007,'Michelle','Obama','RES ST','F',1043),(9,951000008,'Jenny','Lewis','RES ST','F',1012),(10,951000009,'Sufjan','Stevens','RES','M',1047),(11,951000010,'Danny','Lu','RES RA','M',1008),(12,951000011,'Angela','Poole','RES','F',1004),(13,951000012,'Graham','Cracker','RES','M',1046),(14,951000013,'Uncle','Buzz','RES','M',1000),(15,951000014,'Marilyn','Lynch','RES RA','F',1007),(54,951123456,'Puddles','Duck','RES','M',1020),(55,951123456,'Puddles','Duck','RES','M',1020);
/*!40000 ALTER TABLE `resident` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2017-12-06 12:39:49
