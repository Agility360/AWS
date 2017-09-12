-- MySQL dump 10.13  Distrib 5.6.36, for Linux (x86_64)
--
-- Host: sql.agility360app.net    Database: cea
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `candidate_certifications`
--

DROP TABLE IF EXISTS `candidate_certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_certifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) DEFAULT NULL,
  `institution_name` varchar(50) NOT NULL,
  `certification_name` varchar(50) NOT NULL,
  `date_received` datetime NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(1024) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `certifications_candidate_id_idx` (`candidate_id`),
  CONSTRAINT `certifications_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidate_education`
--

DROP TABLE IF EXISTS `candidate_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `institution_name` varchar(50) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `graduated` tinyint(1) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `education_candidate_id_idx` (`candidate_id`),
  CONSTRAINT `education_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidate_job_history`
--

DROP TABLE IF EXISTS `candidate_job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_job_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `final_salary` double DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `job_history_candidate_id_idx` (`candidate_id`),
  CONSTRAINT `job_history_candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidate_responses`
--

DROP TABLE IF EXISTS `candidate_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate_responses` (
  `response_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `response` json DEFAULT NULL,
  `response_text` varchar(4096) DEFAULT NULL,
  `response_datetime` datetime DEFAULT NULL,
  `response_double` double DEFAULT NULL,
  PRIMARY KEY (`response_id`),
  UNIQUE KEY `id_UNIQUE` (`response_id`),
  UNIQUE KEY `UC_candidate_responses` (`candidate_id`,`question_id`),
  KEY `candidate_responses-question_id` (`question_id`),
  CONSTRAINT `candidate_responses-question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `candidate_responses_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(30) NOT NULL DEFAULT '',
  `first_name` varchar(30) NOT NULL DEFAULT '',
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `phone_number` varchar(30) DEFAULT NULL,
  `industry_id` int(11) NOT NULL DEFAULT '0',
  `subindustry_id` int(11) NOT NULL DEFAULT '0',
  `profession_id` int(11) NOT NULL DEFAULT '0',
  `subprofession_id` int(11) NOT NULL DEFAULT '0',
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `job_hunting` tinyint(1) NOT NULL DEFAULT '1',
  `city` varchar(30) NOT NULL,
  `state` varchar(2) NOT NULL,
  PRIMARY KEY (`candidate_id`),
  UNIQUE KEY `id_UNIQUE` (`candidate_id`),
  UNIQUE KEY `UC_user_name` (`account_name`),
  UNIQUE KEY `UC_email` (`email`),
  KEY `users-industry_id` (`industry_id`),
  KEY `users-profession_id` (`profession_id`),
  KEY `users-subindustry_id` (`subindustry_id`),
  KEY `users-subprofession_id` (`subprofession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `industries`
--

DROP TABLE IF EXISTS `industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industries` (
  `industry_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `description` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`industry_id`),
  UNIQUE KEY `UC_industries` (`parent_id`,`description`),
  CONSTRAINT `industries-subindustry_id` FOREIGN KEY (`parent_id`) REFERENCES `industries` (`industry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `description` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`profession_id`),
  UNIQUE KEY `UC_professions` (`parent_id`,`description`),
  CONSTRAINT `professions-subprofession_id` FOREIGN KEY (`parent_id`) REFERENCES `professions` (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaire_categories`
--

DROP TABLE IF EXISTS `questionnaire_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaire_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(50) NOT NULL DEFAULT '',
  `industry_id` int(11) DEFAULT NULL,
  `profession_id` int(11) DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id` (`category_id`),
  KEY `categories-industry` (`industry_id`),
  KEY `categories-profession` (`profession_id`),
  KEY `categories-parent_id` (`parent_id`),
  CONSTRAINT `categories-industry` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`industry_id`),
  CONSTRAINT `categories-profession` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `question` varchar(100) DEFAULT NULL,
  `datatype_id` int(11) NOT NULL,
  `choices` json DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `id_UNIQUE` (`question_id`),
  KEY `fk-questions-questionnaire-categories_idx` (`category_id`),
  CONSTRAINT `fk-questions-questionnaire-categories` FOREIGN KEY (`category_id`) REFERENCES `questionnaire_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `vw_candidate_questionnaires`
--

DROP TABLE IF EXISTS `vw_candidate_questionnaires`;
/*!50001 DROP VIEW IF EXISTS `vw_candidate_questionnaires`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_candidate_questionnaires` AS SELECT 
 1 AS `account_name`,
 1 AS `candidate_id`,
 1 AS `category_id`,
 1 AS `questionnaire`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_candidate_questions`
--

DROP TABLE IF EXISTS `vw_candidate_questions`;
/*!50001 DROP VIEW IF EXISTS `vw_candidate_questions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_candidate_questions` AS SELECT 
 1 AS `account_name`,
 1 AS `questionnaire_id`,
 1 AS `seq`,
 1 AS `question`,
 1 AS `datatype_id`,
 1 AS `question_id`,
 1 AS `response`,
 1 AS `response_text`,
 1 AS `response_datetime`,
 1 AS `response_double`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'cea'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_add`(account_name varchar(30),
first_name varchar(30),
middle_name varchar(30),
last_name varchar(30),
email varchar(30),
phone_number varchar(30),
industry_id int(11),
subindustry_id int(11),
profession_id int(11),
subprofession_id int(11),
job_hunting tinyint(1),
city varchar(30),
state varchar(2)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

INSERT cea.candidates (account_name, first_name, middle_name, last_name, email, phone_number, industry_id, subindustry_id, profession_id, subprofession_id, job_hunting, city, state)
	SELECT	account_name,
			first_name,
			middle_name,
			last_name,
			email,
			phone_number,
			industry_id,
			subindustry_id,
			profession_id,
			subprofession_id,
			job_hunting,
            city,
            state;

COMMIT;

CALL cea.sp_candidate_get(account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_certifications_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_certifications_get`(get_account_name varchar(30)
)
BEGIN


SELECT	c.account_name,
		cert.id,
		cert.candidate_id,
		cert.institution_name,
		cert.certification_name,
		cert.date_received,
		cert.expire_date,
        cert.create_date,
        cert.description
FROM 	cea.candidate_certifications cert
		JOIN cea.candidates c ON (c.candidate_id = cert.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(cert.active = 1)
ORDER BY cert.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_certifications_getid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_certifications_getid`(
get_account_name varchar(30),
get_id int(11)
)
BEGIN


SELECT	c.account_name,
		cert.id,
		cert.candidate_id,
		cert.institution_name,
		cert.certification_name,
		cert.date_received,
		cert.expire_date,
        cert.create_date,
        cert.description
FROM 	cea.candidate_certifications cert
		JOIN cea.candidates c ON (c.candidate_id = cert.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(cert.id = get_id) AND
		(cert.active = 1)
ORDER BY cert.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_certifications_inserted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_certifications_inserted`(get_account_name varchar(30)
)
BEGIN


SELECT	c.account_name,
		cert.id,
		cert.candidate_id,
		cert.institution_name,
		cert.certification_name,
		cert.date_received,
		cert.expire_date,
        cert.create_date,
        cert.description
FROM 	cea.candidate_certifications cert
		JOIN cea.candidates c ON (c.candidate_id = cert.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(cert.active = 1) AND
        (cert.id = (SELECT MAX(cert2.id) 
					FROM cea.candidate_certifications cert2 
                    WHERE (cert.candidate_id = cert2.candidate_id) AND
						  (cert2.active = 1)
                 )
		)

ORDER BY cert.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_certification_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_certification_add`(account_name varchar(30),
add_institution_name varchar(255),
add_certification_name varchar(255),
add_date_received varchar(255),
add_expire_date varchar(255),
add_description varchar(1024)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

INSERT cea.candidate_certifications (candidate_id, institution_name, certification_name, date_received, expire_date, description)
	SELECT	c.candidate_id,
			add_institution_name, 
            add_certification_name, 
            add_date_received, 
            add_expire_date,
            add_description
	FROM	cea.candidates c
    WHERE	(c.account_name = account_name);

COMMIT;

CALL cea.sp_candidate_certifications_inserted(account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_certification_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_certification_delete`(delete_account_name varchar(30), delete_id int(11))
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

DELETE 
FROM	candidate_certifications
WHERE	(id = delete_id) AND
		(candidate_id =	(
						SELECT	candidate_id
						FROM	cea.candidates
                        WHERE	(account_name = delete_account_name)
						));

COMMIT;

CALL cea.sp_candidate_certifications_get(delete_account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_certification_edit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_certification_edit`(
edit_id int(11),
edit_account_name varchar(30),
edit_institution_name varchar(255),
edit_certification_name varchar(255),
edit_date_received varchar(255),
edit_expire_date varchar(255),
edit_description varchar(1024)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

# 1. deactivate the current record, identified by the parameter "edit_id"
UPDATE	cea.candidate_certifications
SET		active = 0
WHERE	(id = edit_id) AND
		(edit_id IS NOT NULL);
        

# 2. create a new record with the updated values. the new record self-activate.

CALL cea.sp_candidate_certification_add(edit_account_name, edit_institution_name, edit_certification_name, edit_date_received, edit_expire_date, edit_description);


COMMIT;

#CALL cea.sp_candidate_certifications_get(account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_delete`(delete_account varchar(30))
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

DELETE	
FROM	cea.candidate_certifications
WHERE	candidate_id = 	(
						SELECT	c.candidate_id
						FROM	candidates c
                        WHERE	(c.account_name = delete_account)
						);

DELETE	
FROM	cea.candidate_education
WHERE	candidate_id = 	(
						SELECT	c.candidate_id
						FROM	candidates c
                        WHERE	(c.account_name = delete_account)
						);

DELETE	
FROM	cea.candidate_job_history
WHERE	candidate_id = 	(
						SELECT	c.candidate_id
						FROM	candidates c
                        WHERE	(c.account_name = delete_account)
						);


DELETE
FROM	cea.candidates
WHERE	(account_name = delete_account);

COMMIT;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_edit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_edit`(update_name varchar(30),
update_first_name varchar(30),
update_middle_name varchar(30),
update_last_name varchar(30),
update_email varchar(30),
update_phone_number varchar(30),
update_industry_id int(11),
update_subindustry_id int(11),
update_profession_id int(11),
update_subprofession_id int(11),
update_job_hunting tinyint(1),
update_city varchar(30),
update_state varchar(2)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

UPDATE	cea.candidates
SET		first_name = update_first_name, 
        middle_name = update_middle_name, 
        last_name = update_last_name, 
        email = update_email, 
        phone_number = update_phone_number, 
        industry_id = update_industry_id, 
        subindustry_id = update_subindustry_id, 
        profession_id = update_profession_id, 
        subprofession_id = update_subprofession_id, 
        job_hunting =update_job_hunting, 
        city = update_city, 
        state = update_state
WHERE	(account_name = update_name);

COMMIT;

CALL cea.sp_candidate_get(update_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_education_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_education_add`(account_name varchar(30),
add_institution_name varchar(255),
add_degree varchar(255),
add_start_date varchar(255),
add_end_date varchar(255),
add_graduated tinyint(1),
add_description varchar(1024)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

INSERT cea.candidate_education (candidate_id, institution_name, degree, start_date, end_date, graduated, description)
	SELECT	c.candidate_id,
			add_institution_name, 
			add_degree, 
            add_start_date, 
            add_end_date, 
            add_graduated,
			add_description
	FROM	cea.candidates c
    WHERE	(c.account_name = account_name);

COMMIT;

CALL cea.sp_candidate_education_inserted(account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_education_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_education_delete`(delete_account_name varchar(30), delete_id int(11))
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

DELETE 
FROM	candidate_education
WHERE	(id = delete_id);

COMMIT;

CALL cea.sp_candidate_education_get(delete_account_name);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_education_edit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_education_edit`(
edit_id int(11),
edit_account_name varchar(30),
edit_institution_name varchar(255),
edit_degree varchar(255),
edit_start_date varchar(255),
edit_end_date varchar(255),
edit_graduated tinyint(1),
edit_description varchar(1024)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

# 1. deactivate the current record, identified by the parameter "edit_id"
UPDATE	cea.candidate_education
SET		active = 0
WHERE	(id = edit_id) AND
		(edit_id IS NOT NULL);
        

# 2. create a new record with the updated values. the new record self-activate.

CALL cea.sp_candidate_education_add(edit_account_name, edit_institution_name, edit_degree, edit_start_date, edit_end_date, edit_graduated, edit_description);


COMMIT;

#CALL cea.sp_candidate_education_get(account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_education_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_education_get`(get_account_name varchar(30)
)
BEGIN


SELECT	c.account_name,
		e.id,
		e.candidate_id,
		e.institution_name,
		e.degree,
		e.start_date,
		e.end_date,
        e.graduated,
        e.create_date,
        e.description
FROM 	cea.candidate_education e
		JOIN cea.candidates c ON (c.candidate_id = e.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(e.active = 1)
ORDER BY e.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_education_getid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_education_getid`(
get_account_name varchar(30),
get_id int(11)
)
BEGIN


SELECT	c.account_name,
		e.id,
		e.candidate_id,
		e.institution_name,
		e.degree,
		e.start_date,
		e.end_date,
        e.graduated,
        e.create_date,
        e.description
FROM 	cea.candidate_education e
		JOIN cea.candidates c ON (c.candidate_id = e.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(e.id = get_id) AND
		(e.active = 1)
ORDER BY e.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_education_inserted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_education_inserted`(get_account_name varchar(30)
)
BEGIN


SELECT	c.account_name,
		e.id,
		e.candidate_id,
		e.institution_name,
		e.degree,
		e.start_date,
		e.end_date,
        e.graduated,
        e.create_date,
        e.description
FROM 	cea.candidate_education e
		JOIN cea.candidates c ON (c.candidate_id = e.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(e.active = 1) AND
        (e.id = (SELECT MAX(e2.id) 
					FROM cea.candidate_education e2 
                    WHERE (e.candidate_id = e2.candidate_id) AND
						  (e2.active = 1)
                 )
		)

ORDER BY e.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_get`(account_name varchar(30)
)
BEGIN


SELECT	c.candidate_id,
		c.account_name,
		c.first_name,
		c.middle_name,
		c.last_name,
		c.email,
		c.phone_number,
		c.industry_id,
		c.subindustry_id,
		c.profession_id,
		c.subprofession_id,
		c.create_date,
        c.update_date,
        c.job_hunting,
        c.city,
        c.state
FROM	cea.candidates c
WHERE	c.account_name = account_name;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_job_history_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_add`(
add_account_name varchar(30),
add_company_name varchar(255),
add_job_title varchar(255),
add_start_date varchar(255),
add_end_date varchar(255),
add_final_salary double,
add_department varchar(50),
add_description varchar(1024)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;
UPDATE cea.candidate_job_history
SET		active = 0
WHERE	(candidate_id = 	(
							SELECT 	candidate_id
							FROM	cea.candidates c
                            WHERE	(c.account_name = add_account_name)
							)) AND
		(company_name = add_company_name) AND
		(active = 1)
;

INSERT cea.candidate_job_history (candidate_id, company_name, job_title, start_date, end_date, final_salary, department, description)
	SELECT	c.candidate_id,
			add_company_name, 
            add_job_title, 
            add_start_date, 
            add_end_date, 
            add_final_salary,
            add_department,
			add_description
	FROM	cea.candidates c
    WHERE	(c.account_name = add_account_name);

COMMIT;

CALL cea.sp_candidate_job_history_inserted(add_account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_job_history_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_delete`(delete_account_name varchar(30), delete_id int(11))
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

DELETE	
FROM	cea.candidate_job_history
WHERE	(id = delete_id) AND
		(candidate_id =	(
						SELECT	candidate_id
						FROM	cea.candidates
                        WHERE	(account_name = delete_account_name)
						));

COMMIT;

CALL cea.sp_candidate_job_history_get(delete_account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_job_history_edit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_edit`(
edit_id int(11),
edit_account_name varchar(30),
edit_company_name varchar(255),
edit_job_title varchar(255),
edit_start_date varchar(255),
edit_end_date varchar(255),
edit_final_salary double,
edit_department varchar(50),
edit_description varchar(1024)
)
this_proc:BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;

IF (NOT EXISTS (select * from cea.candidate_job_history where (id = edit_id)) ) THEN
	LEAVE this_proc;
END IF;


START TRANSACTION;

# 1. deactivate the current record, identified by the parameter "edit_id"
UPDATE	cea.candidate_job_history
SET		active = 0
WHERE	(id = edit_id) AND
		(edit_id IS NOT NULL);
        

# 2. create a new record with the updated values. the new record self-activate.

CALL cea.sp_candidate_job_history_add(edit_account_name, edit_company_name, edit_job_title, edit_start_date, edit_end_date, edit_final_salary, edit_department, edit_description);



COMMIT;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_job_history_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_get`(get_account_name varchar(30))
BEGIN

SELECT	c.account_name,
		ch.id,
		ch.candidate_id,
		ch.company_name,
		ch.job_title,
		ch.start_date,
		ch.end_date,
        ch.final_salary,
        ch.create_date,
        ch.department,
        ch.description
FROM 	cea.candidate_job_history ch
		JOIN candidates c ON (c.candidate_id = ch.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(ch.active = 1)
ORDER BY ch.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_job_history_getid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_getid`(
get_account_name varchar(30), 
jobhistory_id int(11)
)
BEGIN


SELECT	c.account_name,
		ch.id,
		ch.candidate_id,
		ch.company_name,
		ch.job_title,
		ch.start_date,
		ch.end_date,
        ch.final_salary,
        ch.create_date,
        ch.department,
        ch.description
FROM 	cea.candidate_job_history ch
		JOIN candidates c ON (c.candidate_id = ch.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(ch.id = jobhistory_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_job_history_inserted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_inserted`(get_account_name varchar(30))
BEGIN


SELECT	c.account_name,
		ch.id,
		ch.candidate_id,
		ch.company_name,
		ch.job_title,
		ch.start_date,
		ch.end_date,
        ch.final_salary,
        ch.create_date,
        ch.department,
        ch.description
FROM 	cea.candidate_job_history ch
		JOIN candidates c ON (c.candidate_id = ch.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(ch.active = 1) AND
        (ch.id = (SELECT MAX(id) 
					FROM cea.candidate_job_history ch2 
                    WHERE (ch.candidate_id = ch2.candidate_id) AND
						  (ch2.active = 1)
                 )
		)
ORDER BY ch.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_questionnaires_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_questionnaires_get`(get_account_name varchar(30))
BEGIN


SELECT	category_id as questionnaire_id,
		questionnaire
FROM 	cea.vw_candidate_questionnaires vw
WHERE	(vw.account_name = get_account_name);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_candidate_responses_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_responses_get`(
get_account_name varchar(30),
get_questionnaire_id int(11)
)
BEGIN


SELECT	question_id,
		seq,
		question,
		datatype_id,
        response,
		response_text,
        response_datetime,
		response_double
FROM	vw_candidate_questions vw
WHERE	(vw.account_name = get_account_name) AND
		(vw.questionnaire_id = get_questionnaire_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_industries_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_industries_get`()
BEGIN


SELECT	industry_id,
		description 
FROM 	industries 
WHERE 	(parent_id IS NULL);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_professions_get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_professions_get`()
BEGIN


SELECT	profession_id,
		description 
FROM 	professions 
WHERE 	(parent_id IS NULL);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_candidate_questionnaires`
--

/*!50001 DROP VIEW IF EXISTS `vw_candidate_questionnaires`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_candidate_questionnaires` AS select distinct `c`.`account_name` AS `account_name`,`cr`.`candidate_id` AS `candidate_id`,`qc`.`category_id` AS `category_id`,`qc`.`description` AS `questionnaire` from (((`candidates` `c` join `candidate_responses` `cr` on((`c`.`candidate_id` = `cr`.`candidate_id`))) join `questions` `q` on((`cr`.`question_id` = `q`.`question_id`))) join `questionnaire_categories` `qc` on((`qc`.`category_id` = `q`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_candidate_questions`
--

/*!50001 DROP VIEW IF EXISTS `vw_candidate_questions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_candidate_questions` AS select `c`.`account_name` AS `account_name`,`q`.`category_id` AS `questionnaire_id`,`q`.`seq` AS `seq`,`q`.`question` AS `question`,`q`.`datatype_id` AS `datatype_id`,`cr`.`question_id` AS `question_id`,`cr`.`response` AS `response`,`cr`.`response_text` AS `response_text`,`cr`.`response_datetime` AS `response_datetime`,`cr`.`response_double` AS `response_double` from ((`candidates` `c` join `candidate_responses` `cr` on((`c`.`candidate_id` = `cr`.`candidate_id`))) join `questions` `q` on((`cr`.`question_id` = `q`.`question_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-12 16:18:56
