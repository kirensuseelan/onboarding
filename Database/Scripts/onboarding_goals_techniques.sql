-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: onboarding
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goals_techniques`
--

DROP TABLE IF EXISTS `goals_techniques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals_techniques` (
  `goals_techniquesID` int(11) NOT NULL AUTO_INCREMENT,
  `GoalsID` int(11) DEFAULT NULL,
  `TechniquesID` int(11) DEFAULT NULL,
  PRIMARY KEY (`goals_techniquesID`),
  KEY `goals_goals_techniques_idx` (`GoalsID`),
  KEY `techniques_goals_techniques_idx` (`TechniquesID`),
  CONSTRAINT `goals_goals_techniques` FOREIGN KEY (`GoalsID`) REFERENCES `goals` (`GoalsID`),
  CONSTRAINT `techniques_goals_techniques` FOREIGN KEY (`TechniquesID`) REFERENCES `techniques` (`TechniquesID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_techniques`
--

LOCK TABLES `goals_techniques` WRITE;
/*!40000 ALTER TABLE `goals_techniques` DISABLE KEYS */;
INSERT INTO `goals_techniques` VALUES (1,1,3),(2,1,15),(3,1,1),(4,1,13),(5,1,5),(6,1,24),(7,1,4),(8,2,13),(9,2,1),(10,2,5),(11,2,3),(12,2,4),(13,2,9),(14,2,21),(15,3,16),(16,3,15),(17,3,18),(18,3,1),(19,3,5),(20,3,3),(21,3,4),(22,4,16),(23,4,15),(24,4,18),(25,4,1),(26,4,5),(27,4,3),(28,4,7),(29,5,16),(30,5,15),(31,5,24),(32,5,22),(33,5,18),(34,5,1),(35,5,3),(36,6,15),(37,6,8),(38,6,18),(39,6,1),(40,6,5),(41,6,3),(42,6,7),(43,7,1),(44,7,5),(45,7,15),(46,7,6),(47,7,11),(48,7,3),(49,7,7),(50,8,16),(51,8,1),(52,8,7),(53,8,10),(54,8,9),(55,8,22),(56,9,16),(57,9,15),(58,9,1),(59,9,5),(60,9,3),(61,9,7),(62,9,6),(63,9,11),(64,10,16),(65,10,22),(66,10,14),(67,10,1),(68,10,5),(69,10,3),(70,10,7),(71,11,8),(72,11,19),(73,11,14),(74,11,1),(75,11,5),(76,11,3),(77,11,7),(78,11,9),(79,11,11),(80,11,22),(81,11,21),(82,10,2),(83,10,21),(84,9,21),(85,9,19),(86,7,2),(87,7,9),(88,7,21),(89,7,12),(90,7,19),(91,6,10),(92,6,9),(93,6,20),(94,5,10),(95,5,9),(96,5,20),(97,4,24),(98,4,9),(99,4,21),(100,3,10),(101,3,22),(102,3,21),(103,2,20),(104,2,18),(105,1,9),(106,1,10),(107,1,11),(108,1,22),(109,1,21),(110,1,20),(111,1,18);
/*!40000 ALTER TABLE `goals_techniques` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-02 21:00:23
