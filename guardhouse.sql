-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: guardhouse
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Current Database: `guardhouse`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `guardhouse` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `guardhouse`;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_type_id` int(11) NOT NULL,
  `car_number` varchar(30) NOT NULL,
  `car_description` varchar(50) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `car_type_id` (`car_type_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_type_id`) REFERENCES `car_type` (`car_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,1,'31육7201','쌍용 렉스턴'),(2,3,'71사3660','현대 포터'),(3,3,'55사6422','그렌져'),(4,3,'46사3455','현대 트레버스'),(5,2,'45마4224','쌍용 렉스턴'),(6,1,'33육7202','쌍용 코란도 스포츠'),(7,1,'722-201','3/4 레토나'),(8,1,'722-211','5/3 통신 차량'),(9,1,'31육7101','현대 카운티'),(10,1,'31육7103','현대 포터'),(11,1,'33육7104','현대 메가 트럭'),(12,2,'23가4980','티볼리'),(13,2,'46바7426','BMW3'),(14,2,'13자4945','아반떼');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_type` (
  `car_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`car_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type`
--

LOCK TABLES `car_type` WRITE;
/*!40000 ALTER TABLE `car_type` DISABLE KEYS */;
INSERT INTO `car_type` VALUES (1,'군대 소유 차량'),(2,'군인 소유 사제 차량'),(3,'민간인 차량');
/*!40000 ALTER TABLE `car_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enter_record`
--

DROP TABLE IF EXISTS `enter_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enter_record` (
  `enter_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `enter_type` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `passer_id` int(11) NOT NULL,
  `enter_purpose` varchar(50) DEFAULT NULL,
  `enter_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`enter_record_id`),
  KEY `car_id` (`car_id`),
  KEY `passer_id` (`passer_id`),
  CONSTRAINT `enter_record_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`),
  CONSTRAINT `enter_record_ibfk_2` FOREIGN KEY (`passer_id`) REFERENCES `passer` (`passer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enter_record`
--

LOCK TABLES `enter_record` WRITE;
/*!40000 ALTER TABLE `enter_record` DISABLE KEYS */;
INSERT INTO `enter_record` VALUES (1,1,12,8,'출근','2019-12-18 23:00:30'),(2,1,13,4,'출근','2019-12-18 23:10:30'),(3,1,14,3,'출근','2019-12-18 23:12:16'),(4,0,3,7,'부식 수령','2019-12-19 00:05:17'),(5,1,3,7,'부식 수령 복귀','2019-12-19 00:35:41'),(6,0,7,9,'훈련지 순찰','2019-12-19 01:00:30'),(7,1,4,6,'PX 납품','2019-12-19 01:13:42'),(8,0,4,6,'PX 납품 완료','2019-12-19 01:30:45'),(9,1,7,9,'훈련지 순찰 복귀','2019-12-19 02:45:31');
/*!40000 ALTER TABLE `enter_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passer`
--

DROP TABLE IF EXISTS `passer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passer` (
  `passer_id` int(11) NOT NULL AUTO_INCREMENT,
  `passer_name` varchar(30) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `passer_duty` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`passer_id`),
  KEY `rank_id` (`rank_id`),
  CONSTRAINT `passer_ibfk_1` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passer`
--

LOCK TABLES `passer` WRITE;
/*!40000 ALTER TABLE `passer` DISABLE KEYS */;
INSERT INTO `passer` VALUES (1,'조래민',2,'2중대 중계조장'),(2,'손현우',4,'2중대 행정보급관'),(3,'유기현',6,'2중대 1소대장'),(4,'채형원',7,'2중대 2소대장'),(5,'김창기',1,'노래방 관리 기사'),(6,'유제광',1,'PX 납품업체 직원'),(7,'임창균',9,'운용장교'),(8,'이태일',10,'722대대장'),(9,'이주헌',8,'2중대 중대장'),(10,'김현민',1,'컴퓨터 수리 기사'),(11,'이민혁',11,'101정보통신단장'),(12,'최시원',1,'LPG가스 판매원');
/*!40000 ALTER TABLE `passer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(30) DEFAULT '민간인',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (1,'민간인'),(2,'하사'),(3,'중사'),(4,'상사'),(5,'준위'),(6,'소위'),(7,'중위'),(8,'대위'),(9,'소령'),(10,'중령'),(11,'대령'),(12,'준장'),(13,'소장'),(14,'중장'),(15,'대장');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-24  6:01:05
