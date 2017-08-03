-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: cea.cjbv7rlz4hsg.us-east-1.rds.amazonaws.com    Database: cea
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
-- Dumping events for database 'cea'
--

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

#CALL cea.sp_candidate_get(account_name);

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


SELECT	cert.id,
		cert.candidate_id,
		cert.institution_name,
		cert.certification_name,
		cert.date_received,
		cert.expire_date,
        cert.create_date
FROM 	cea.candidate_certifications cert
		JOIN cea.candidates c ON (c.candidate_id = cert.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(c.active = 1)
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
institution_name varchar(255),
certification_name varchar(255),
date_received varchar(255),
expire_date varchar(255)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

INSERT cea.candidate_certifications (candidate_id, institution_name, certification_name, date_received, expire_date)
	SELECT	c.candidate_id,
			institution_name, 
            certification_name, 
            date_received, 
            expire_date
	FROM	cea.candidates c
    WHERE	(c.account_name = account_name);

COMMIT;

#CALL cea.sp_candidate_certifications_get(account_name);

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
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_certification_delete`(delete_id int(11))
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

DELETE 
FROM	candidate_certifications
WHERE	(id = delete_id);

COMMIT;

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
edit_expire_date varchar(255)
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

CALL cea.sp_candidate_certification_add(edit_account_name, edit_institution_name, edit_certification_name, edit_date_received, edit_expire_date);


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

#CALL cea.sp_candidate_get(account_name);

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
institution_name varchar(255),
degree varchar(255),
start_date varchar(255),
end_date varchar(255),
graduated tinyint(1)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

INSERT cea.candidate_education (candidate_id, institution_name, degree, start_date, end_date, graduated)
	SELECT	c.candidate_id,
			institution_name, 
			degree, 
            start_date, 
            end_date, 
            graduated
	FROM	cea.candidates c
    WHERE	(c.account_name = account_name);

COMMIT;

#CALL cea.sp_candidate_education_get(account_name);

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
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_education_delete`(delete_id int(11))
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
edit_graduated tinyint(1)
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

CALL cea.sp_candidate_education_add(edit_account_name, edit_institution_name, edit_degree, edit_start_date, edit_end_date, edit_graduated);


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


SELECT	e.id,
		e.candidate_id,
		e.institution_name,
		e.degree,
		e.start_date,
		e.end_date,
        e.graduated,
        e.create_date
FROM 	cea.candidate_education e
		JOIN cea.candidates c ON (c.candidate_id = e.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(c.active = 1)
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
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_add`(account_name varchar(30),
company_name varchar(255),
job_title varchar(255),
start_date varchar(255),
end_date varchar(255),
final_salary double,
department varchar(50)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

INSERT cea.candidate_job_history (candidate_id, company_name, job_title, start_date, end_date, final_salary, department)
	SELECT	c.candidate_id,
			company_name, 
            job_title, 
            start_date, 
            end_date, 
            final_salary,
            department
	FROM	cea.candidates c
    WHERE	(c.account_name = account_name);

COMMIT;

#CALL cea.sp_candidate_job_history_get(account_name);

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
CREATE DEFINER=`root`@`%` PROCEDURE `sp_candidate_job_history_delete`(delete_account varchar(30)
)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

DELETE	
FROM	cea.candidate_job_history
WHERE	candidate_id = 	(
						SELECT	c.candidate_id
						FROM	candidates c
                        WHERE	(c.account_name = delete_account)
						);

COMMIT;

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
edit_department varchar(50)
)
BEGIN


DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	ROLLBACK;  -- rollback any changes made in the transaction
	RESIGNAL;  -- raise again the sql exception to the caller
END;


START TRANSACTION;

# 1. deactivate the current record, identified by the parameter "edit_id"
UPDATE	cea.candidate_job_history
SET		active = 0
WHERE	(id = edit_id) AND
		(edit_id IS NOT NULL);
        

# 2. create a new record with the updated values. the new record self-activate.

CALL cea.sp_candidate_job_history_add(edit_account_name, edit_company_name, edit_job_title, edit_start_date, edit_end_date, edit_final_salary, edit_department);



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


SELECT	ch.id,
		ch.candidate_id,
		ch.company_name,
		ch.job_title,
		ch.start_date,
		ch.end_date,
        ch.final_salary,
        ch.create_date,
        ch.department
FROM 	cea.candidate_job_history ch
		JOIN candidates c ON (c.candidate_id = ch.candidate_id)
WHERE	(c.account_name = get_account_name) AND
		(c.active = 1)
ORDER BY ch.id;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-03 10:14:45
