-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: agility360-db
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `batch_categories`
--

DROP TABLE IF EXISTS `batch_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_categories` (
  `batch_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`batch_category_id`),
  UNIQUE KEY `UC_batch_categorie` (`batch_id`,`category_id`),
  KEY `batch_categories_category_id` (`category_id`),
  CONSTRAINT `batch_categories_batch_id` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`),
  CONSTRAINT `batch_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batches` (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL DEFAULT '',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
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
  CONSTRAINT `categories-parent_id` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `categories-profession` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaires`
--

DROP TABLE IF EXISTS `questionnaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaires` (
  `response_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `response` json DEFAULT NULL,
  `response_text` varchar(4096) DEFAULT NULL,
  `response_datetime` datetime DEFAULT NULL,
  `response_double` double DEFAULT NULL,
  PRIMARY KEY (`response_id`),
  UNIQUE KEY `id_UNIQUE` (`response_id`),
  UNIQUE KEY `UC_questionnaires` (`user_id`,`question_id`),
  KEY `responses-question_id` (`question_id`),
  CONSTRAINT `questionnaires_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `responses-question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `seq` int(11) NOT NULL,
  `question` varchar(100) DEFAULT NULL,
  `datatype_id` int(11) NOT NULL,
  `choices` json DEFAULT NULL,
  `is_descriptor` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `id_UNIQUE` (`question_id`),
  UNIQUE KEY `UC_questions` (`category_id`,`question`),
  CONSTRAINT `questions-category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id_UNIQUE` (`user_id`),
  UNIQUE KEY `UC_user_name` (`user_name`),
  UNIQUE KEY `UC_email` (`email`),
  KEY `users-industry_id` (`industry_id`),
  KEY `users-profession_id` (`profession_id`),
  KEY `users-subindustry_id` (`subindustry_id`),
  KEY `users-subprofession_id` (`subprofession_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`industry_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`profession_id`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`subindustry_id`) REFERENCES `industries` (`industry_id`),
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`subprofession_id`) REFERENCES `professions` (`profession_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-29 21:10:20
