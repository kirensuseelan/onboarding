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
-- Table structure for table `techniques`
--

DROP TABLE IF EXISTS `techniques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techniques` (
  `TechniquesID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `DetailedDescription` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`TechniquesID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techniques`
--

LOCK TABLES `techniques` WRITE;
/*!40000 ALTER TABLE `techniques` DISABLE KEYS */;
INSERT INTO `techniques` VALUES (1,'T1','Mentoring','Have an assigned mentor as an experienced person for regular and ad hoc face-to-face meetings and interactions.'),(2,'T2','Online Communities','Searching online communities such as Stack Overflow to find answers to specific technical questions.'),(3,'T3','Peer support ','Ad hoc opportunities to ask peers (in and outside the team) for information or guidance. Usually face-to-face. This included observing others as they worked or met.'),(4,'T4','Team Socializing ','Interacting with other team members in a social setting (not related to work tasks).'),(5,'T5','Training Course','Attend a formal course to achieve specific learning objectives or certification related to work. May involve availability of an “education stipend”. Also includes online courses.'),(6,'T6','Review code ','Analyze and understand relevant existing source code. Attend code reviews. Access to code repository.'),(7,'T7','Internal documentation ','Documentation capturing local knowledge about data structures, algorithms, and control flow of the project. May also include product information.'),(8,'T8','Product overview ','A presentation, video or similar that shows the functionality and features of their product as well as the business value.'),(9,'T9','Pair program','Develop with another developer at one workstation, swapping between driving and navigating regularly.'),(10,'T10','Stand ups','Have regular team standup meetings as described in Scrum or adapted.'),(11,'T11','Simple task','Do task that is low risk and technically unchallenging, but provides experience with tools, process, technology, team norms.'),(12,'T12','Self-learning','Learn about libraries, tools and techniques with free access to books and online courses through sites such Lynda, Pluralsight, Udemy, Code Academy, MSDN'),(13,'T13','Induction','Learn about the company’s history, beliefs, values, long term goals, and company structure as well as safety, security and health and job responsibilities, accountability and progression.'),(14,'T14','Knowledge database','Access and contribution to a local knowledge database such as a wiki may store complex structured and unstructured information. This may relate to product information, design decisions, testing architecture, coding standards.'),(15,'T15','Team Leader support','Ad hoc assistance from the Team Leader (may be Scrum Master, or Project Manager) answering questions or explaining decisions.'),(16,'T16','Course on Agile','Learn about the Agile way of working by attending a course (usually third party but may be run by internal coaches).'),(17,'T17','Team retrospective','Review challenges and learning with the team and learn from their challenges and learning. Some teams do this as part of their sprint retrospective meetings.'),(18,'T18','Review plan','Review the longer term plan for the project to understand what has been done and is coming up.'),(19,'T19','Attend Conference','Learn from others by attending a relevant technical national, regional or international conference.'),(20,'T20','Set expectations','Expectations about onboarding activities and goals are explicitly discussed and set before onboarding and reviewed during onboarding.'),(21,'T21','Electronic communication','Get assistance from others in the organization through electronic communications such as email, chat, social media.'),(22,'T22','Meet with other teams ','Face-to-face meetings with other teams in the organization. May be at different branches geographically separated.'),(23,'T23','Location map','A diagram showing the distribution of every staff member in the floor. The information of staff such as authority, expertise and department is also attached in the Floor map.'),(24,'T24','Checklists','Given checklists to assist with remembering aspects of work. For example, a checklist of points to look for when reviewing others’ code.');
/*!40000 ALTER TABLE `techniques` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-02 21:00:28
