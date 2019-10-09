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
-- Dumping routines for database 'onboarding'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_characteristicsGroup_Characteristics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_characteristicsGroup_Characteristics`(In scenarioID int)
BEGIN
Select * from characteristicsgroup;

Select c.characteristicsID, c.characteristic, c.shortForm, cg.GroupID from characteristicsgroup cg 
			inner join characteristicsgroup_characteristics cgc on cg.GroupID=cgc.groupsID
			inner join characteristics c on c.characteristicsID=cgc.characteristicsID;

Select c.characteristicsID,ca.answerID,ca.answerText from characteristicsanswers ca 
			inner join characteristics_characteristicsanswers cca on ca.answerID=cca.answersID
            inner join characteristics c on c.characteristicsID=cca.characteristicsID;

SELECT cca.characteristicsID,ca.answerID,ca.answerText FROM onboardingscenario_characteristics_characteristicsanswers occa 
			inner join characteristics_characteristicsanswers cca on occa.characteristics_caharacteristicAnswerID=cca.ID
            inner join characteristicsanswers ca on ca.answerID=cca.answersID
		where occa.ScenarioId=scenarioID;
        
SELECT GROUP_CONCAT(ccg.goalid) selectedgoalID FROM onboardingscenario_characteristics_characteristicsanswers occa 
			inner join characteristics_characteristicsanswers cca on occa.characteristics_caharacteristicAnswerID=cca.ID
            inner join characteristics_characteristicsanswers_goals ccg on ccg.CharacteristicsCharacterAnswerID = occa.characteristics_caharacteristicAnswerID
        where occa.ScenarioId=scenarioID;    

Select * from onboardingscenario c where c.scenarioID=scenarioID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_goals_techniques` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_goals_techniques`(IN goals nvarchar(255))
BEGIN
drop table if exists t;
create table t( txt text );
insert into t values(goals);

drop temporary table if exists temp;
create temporary table temp( val char(255) );
set @sql = concat("insert into temp (val) values ('", replace(( select group_concat(distinct txt) as data from t), ",", "'),('"),"');");
prepare stmt1 from @sql;
execute stmt1;

Select tech.TechniquesID,tech.Name, tech.Description, tech.DetailedDescription, count(my_rank) as cnt from (
select t.TechniquesID, RANK() OVER (
		partition by gt.TechniquesID
		order by gt.GoalsID
    ) my_rank from techniques t left join goals_techniques gt on t.TechniquesID=gt.TechniquesID 
    where gt.goalsID in (select distinct(val) from temp)
) as goal_techniques right join techniques tech on goal_techniques.TechniquesID=tech.TechniquesID group by TechniquesID order by cnt desc ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_techniquesByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_techniquesByID`(IN techID integer)
BEGIN
Select tech.TechniquesID,tech.Name, tech.Description, tech.DetailedDescription from techniques tech where tech.TechniquesID=techID;

Select G.Name, G.Description from Goals G inner join goals_techniques gt on g.GoalsID=gt.GoalsID where gt.TechniquesID=techID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-02 21:00:33
