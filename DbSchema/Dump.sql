CREATE DATABASE  IF NOT EXISTS `digimarket_sprint_4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `digimarket_sprint_4`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: digimarket_sprint_4
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `admin_type_id` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us` (
  `contact_us_id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(200) DEFAULT NULL,
  `lastName` varchar(200) DEFAULT NULL,
  `emailAddress` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `topic` varchar(200) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `contact_us_organization_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`contact_us_id`),
  KEY `contact_us_organization_id_idx` (`contact_us_organization_id`),
  KEY `contact_us_created_by_idx` (`created_by`),
  CONSTRAINT `contact_us_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `contact_us_organization_id` FOREIGN KEY (`contact_us_organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_description` varchar(1000) DEFAULT NULL,
  `organization_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_organization_id_idx` (`organization_id`),
  KEY `course_created_by_idx` (`created_by`),
  CONSTRAINT `course_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `course_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_lesson`
--

DROP TABLE IF EXISTS `course_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_lesson` (
  `course_lesson_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `user_content_id` int NOT NULL,
  PRIMARY KEY (`course_lesson_id`),
  KEY `course_lesson_course_id_idx` (`course_id`),
  KEY `course_lesson_user_content_id_idx` (`user_content_id`),
  CONSTRAINT `course_lesson_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `course_lesson_user_content_id` FOREIGN KEY (`user_content_id`) REFERENCES `user_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_location`
--

DROP TABLE IF EXISTS `course_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_location` (
  `course_location_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(100) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `organization_id` int NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`course_location_id`),
  KEY `course_location_organization_id_idx` (`organization_id`),
  KEY `course_location_created_by_idx` (`created_by`),
  CONSTRAINT `course_location_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `course_location_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_schedule`
--

DROP TABLE IF EXISTS `course_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule` (
  `course_schedule_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `organization_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`course_schedule_id`),
  KEY `course_schedule_course_id_idx` (`course_id`),
  KEY `course_schedule_organization_id_idx` (`organization_id`),
  KEY `course_schedule_created_by_idx` (`created_by`),
  CONSTRAINT `course_schedule_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `course_schedule_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `course_schedule_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_schedule_attendance`
--

DROP TABLE IF EXISTS `course_schedule_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule_attendance` (
  `course_schedule_attendance_id` int NOT NULL AUTO_INCREMENT,
  `course_schedule_course_details_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_present` bit(1) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_schedule_attendance_id`),
  KEY `course_schedule_course_details_id_idx` (`course_schedule_course_details_id`),
  KEY `course_schedule_attendance_user_id_idx` (`user_id`),
  KEY `course_schedule_attendance_created_by_idx` (`created_by`),
  CONSTRAINT `course_schedule_attendance_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `course_schedule_attendance_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `course_schedule_course_details_id` FOREIGN KEY (`course_schedule_course_details_id`) REFERENCES `course_schedule_course_details` (`course_schedule_course_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_schedule_course_details`
--

DROP TABLE IF EXISTS `course_schedule_course_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule_course_details` (
  `course_schedule_course_details_id` int NOT NULL AUTO_INCREMENT,
  `course_schedule_id` int NOT NULL,
  `user_content_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `max_participants_count` int DEFAULT NULL,
  `participant_notification_threshold` int DEFAULT NULL,
  PRIMARY KEY (`course_schedule_course_details_id`),
  KEY `course_schedule_course_details_course_schedule_id_idx` (`course_schedule_id`),
  KEY `course_schedule_course_details_user_content_id_idx` (`user_content_id`),
  KEY `course_schedule_course_details_location_id_idx` (`location_id`),
  KEY `course_schedule_course_details_teacher_id_idx` (`teacher_id`),
  CONSTRAINT `course_schedule_course_details_course_schedule_id` FOREIGN KEY (`course_schedule_id`) REFERENCES `course_schedule` (`course_schedule_id`),
  CONSTRAINT `course_schedule_course_details_location_id` FOREIGN KEY (`location_id`) REFERENCES `course_location` (`course_location_id`),
  CONSTRAINT `course_schedule_course_details_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `course_schedule_course_details_user_content_id` FOREIGN KEY (`user_content_id`) REFERENCES `user_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_schedule_members`
--

DROP TABLE IF EXISTS `course_schedule_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedule_members` (
  `course_schedule_members_id` int NOT NULL AUTO_INCREMENT,
  `course_schedule_course_details` int NOT NULL,
  `user_id` int NOT NULL,
  `member_type` int NOT NULL,
  PRIMARY KEY (`course_schedule_members_id`),
  KEY `course_schedule_details_idx` (`course_schedule_course_details`),
  KEY `course_schedule_member_user_id_idx` (`user_id`),
  CONSTRAINT `course_schedule_details` FOREIGN KEY (`course_schedule_course_details`) REFERENCES `course_schedule_course_details` (`course_schedule_course_details_id`),
  CONSTRAINT `course_schedule_member_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `on_going_class_for_user`
--

DROP TABLE IF EXISTS `on_going_class_for_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `on_going_class_for_user` (
  `on_going_class_for_user_id` int NOT NULL AUTO_INCREMENT,
  `course_schedule_course_details_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`on_going_class_for_user_id`),
  KEY `on_going_class_for_user_course_schedule_course_details_id_idx` (`course_schedule_course_details_id`),
  KEY `on_going_class_for_user_user_id_idx` (`user_id`),
  CONSTRAINT `on_going_class_for_user_course_schedule_course_details_id` FOREIGN KEY (`course_schedule_course_details_id`) REFERENCES `course_schedule_course_details` (`course_schedule_course_details_id`),
  CONSTRAINT `on_going_class_for_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `organization_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `end_point` varchar(45) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `about_organziation` varchar(1000) DEFAULT NULL,
  `logo` varchar(1000) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `type_of_organization` int DEFAULT NULL,
  `is_approved` bit(1) DEFAULT NULL,
  `is_rejected` bit(1) DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `reason` varchar(2000) DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `updated_date` varchar(45) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`organization_id`),
  KEY `approved_by_idx` (`approved_by`),
  KEY `rejected_by_idx` (`rejected_by`),
  KEY `organization_creator_idx` (`creator`),
  CONSTRAINT `approved_by` FOREIGN KEY (`approved_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `creator` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rejected_by` FOREIGN KEY (`rejected_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1262 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization_owner`
--

DROP TABLE IF EXISTS `organization_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_owner` (
  `organization_user_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `email_address` varchar(65) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `Profile_info` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`organization_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization_request`
--

DROP TABLE IF EXISTS `organization_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_request` (
  `organization_request_id` int NOT NULL AUTO_INCREMENT,
  `email_address` varchar(45) DEFAULT NULL,
  `organization_name` varchar(45) DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `organization_is_approved` bit(1) DEFAULT NULL,
  `organization_approved_by` int DEFAULT NULL,
  `organization_is_rejected` bit(1) DEFAULT NULL,
  `organization_rejected_by` int DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `about` varchar(200) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_number` varchar(200) DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `is_edit_request` bit(1) DEFAULT NULL,
  `organization_type` int DEFAULT NULL,
  PRIMARY KEY (`organization_request_id`),
  KEY `organization_approved_by_id` (`organization_approved_by`),
  KEY `organization_rejected_by_id` (`organization_rejected_by`),
  CONSTRAINT `organization_approved_by` FOREIGN KEY (`organization_approved_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `organization_rejected_by` FOREIGN KEY (`organization_rejected_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent` (
  `parent_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parent_student`
--

DROP TABLE IF EXISTS `parent_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_student` (
  `Parent_student_id` int NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(45) DEFAULT NULL,
  `student_id` varchar(45) DEFAULT NULL,
  `relation_type` varchar(45) DEFAULT NULL,
  `organization_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Parent_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privillage`
--

DROP TABLE IF EXISTS `privillage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privillage` (
  `privillage_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `details` varchar(45) DEFAULT NULL,
  `is_mandatory` varchar(45) DEFAULT NULL,
  `organization_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`privillage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `privillage_permission`
--

DROP TABLE IF EXISTS `privillage_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privillage_permission` (
  `role_permission_id` int NOT NULL,
  `role_id` varchar(45) DEFAULT NULL,
  `permission_id` varchar(45) DEFAULT NULL,
  `organization_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `is_mandatory` bit(1) DEFAULT NULL,
  `organization_id` int NOT NULL,
  `display_name` varchar(45) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `role_organization_id_idx` (`organization_id`),
  KEY `role_created_by_idx` (`created_by`),
  CONSTRAINT `role_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `role_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_permission_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_permission_id`),
  KEY `role_id_idx` (`role_id`),
  KEY `permission_id_idx` (`permission_id`),
  KEY `role_permission_created_by_idx` (`created_by`),
  CONSTRAINT `permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_permission_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specific_user_prmission`
--

DROP TABLE IF EXISTS `specific_user_prmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specific_user_prmission` (
  `specific_user_prmission_id` int NOT NULL AUTO_INCREMENT,
  `content_id` int DEFAULT NULL,
  `is_requested` bit(1) DEFAULT NULL,
  `request_by` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `token` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`specific_user_prmission_id`),
  KEY `specific_user_prmission_content_id_idx` (`content_id`) /*!80000 INVISIBLE */,
  KEY `specific_user_prmission_request_by_idx` (`request_by`),
  KEY `specific_user_prmission_approved_by_idx` (`approved_by`),
  CONSTRAINT `specific_user_prmission_approved_by` FOREIGN KEY (`approved_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `specific_user_prmission_content_id` FOREIGN KEY (`content_id`) REFERENCES `user_content` (`content_id`),
  CONSTRAINT `specific_user_prmission_request_by` FOREIGN KEY (`request_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `modified_date` varchar(45) DEFAULT NULL,
  `created_ip` varchar(45) DEFAULT NULL,
  `modified_id` varchar(45) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `has_email` bit(1) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `is_Active` bit(1) DEFAULT NULL,
  `is_root` bit(1) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `is_platform_admin` bit(1) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_content`
--

DROP TABLE IF EXISTS `user_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_content` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `is_duplicate` bit(1) NOT NULL,
  `organization_id` int NOT NULL,
  `created_by` int NOT NULL,
  `short_description` longtext,
  `long_description` longtext,
  `duplicated_from` int DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `user_content_guid` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `organization_id_idx` (`organization_id`),
  KEY `created_by_idx` (`created_by`),
  KEY `duplicated_from_idx` (`duplicated_from`),
  CONSTRAINT `created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `duplicated_from` FOREIGN KEY (`duplicated_from`) REFERENCES `user_content` (`content_id`),
  CONSTRAINT `organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_content_access_request`
--

DROP TABLE IF EXISTS `user_content_access_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_content_access_request` (
  `user_content_access_request_id` int NOT NULL AUTO_INCREMENT,
  `content_id` int NOT NULL,
  `request_by` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `requested_date` varchar(100) DEFAULT NULL,
  `approved` bit(1) DEFAULT NULL,
  `approved_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_content_access_request_id`),
  KEY `user_content_access_request_content_id_idx` (`content_id`),
  KEY `user_content_access_request_requested_by_idx` (`request_by`),
  CONSTRAINT `user_content_access_request_content_id` FOREIGN KEY (`content_id`) REFERENCES `user_content` (`content_id`),
  CONSTRAINT `user_content_access_request_requested_by` FOREIGN KEY (`request_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_content_attachments`
--

DROP TABLE IF EXISTS `user_content_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_content_attachments` (
  `attachments_id` int NOT NULL AUTO_INCREMENT,
  `user_content_id` int NOT NULL,
  `attachment_key` varchar(100) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attachments_id`),
  KEY `user_content_id_idx` (`user_content_id`),
  KEY `attachments_created_by_idx` (`created_by`),
  CONSTRAINT `attachments_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `attachments_user_content_id` FOREIGN KEY (`user_content_id`) REFERENCES `user_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_content_meta`
--

DROP TABLE IF EXISTS `user_content_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_content_meta` (
  `user_content_meta_id` int NOT NULL AUTO_INCREMENT,
  `content_id` int NOT NULL,
  `key` varchar(100) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  `meta_type` int DEFAULT NULL,
  PRIMARY KEY (`user_content_meta_id`),
  KEY `user_content_id_idx` (`content_id`),
  CONSTRAINT `user_content_id` FOREIGN KEY (`content_id`) REFERENCES `user_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_content_question`
--

DROP TABLE IF EXISTS `user_content_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_content_question` (
  `user_content_question_id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(2000) DEFAULT NULL,
  `question_description` varchar(2000) DEFAULT NULL,
  `answers` varchar(2000) DEFAULT NULL,
  `is_multiselect` bit(1) DEFAULT NULL,
  `user_content_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_content_question_id`),
  KEY `user_content_question_user_content_id_idx` (`user_content_id`),
  KEY `user_content_question_created_by_idx` (`created_by`),
  CONSTRAINT `user_content_question_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_content_question_user_content_id` FOREIGN KEY (`user_content_id`) REFERENCES `user_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_content_scratch_project`
--

DROP TABLE IF EXISTS `user_content_scratch_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_content_scratch_project` (
  `user_content_scratch_project_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `link` varchar(2000) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `user_content_id` int NOT NULL,
  PRIMARY KEY (`user_content_scratch_project_id`),
  KEY `user_content_scratch_project_created_by_idx` (`created_by`),
  KEY `user_content_scratch_project_content_id_idx` (`user_content_id`),
  CONSTRAINT `user_content_scratch_project_content_id` FOREIGN KEY (`user_content_id`) REFERENCES `user_content` (`content_id`),
  CONSTRAINT `user_content_scratch_project_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_content_sharing_permissions`
--

DROP TABLE IF EXISTS `user_content_sharing_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_content_sharing_permissions` (
  `user_content_sharing_permissions_id` int NOT NULL AUTO_INCREMENT,
  `is_private` bit(1) DEFAULT NULL,
  `share_also_with_students_of_all_ogranizations` bit(1) DEFAULT NULL,
  `share_also_with_students_of_my_ogranizations` bit(1) DEFAULT NULL,
  `share_to_all_ogranizations` bit(1) DEFAULT NULL,
  `share_to_my_ogranizations` bit(1) DEFAULT NULL,
  `shared_with_specific_people` bit(1) DEFAULT NULL,
  `permissions_user_content_id` int DEFAULT NULL,
  `shared_to_all` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_content_sharing_permissions_id`),
  KEY `permissions_user_content_id_idx` (`permissions_user_content_id`),
  CONSTRAINT `permissions_user_content_id` FOREIGN KEY (`permissions_user_content_id`) REFERENCES `user_content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_invite`
--

DROP TABLE IF EXISTS `user_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invite` (
  `user_invite_id` int NOT NULL AUTO_INCREMENT,
  `email_address` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `registered_user_id` int DEFAULT NULL,
  `role_id` int NOT NULL,
  `organization_id` int NOT NULL,
  `accepted` bit(1) DEFAULT NULL,
  `rejected` bit(1) DEFAULT NULL,
  `is_invitation_sent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_invite_id`),
  KEY `user_invite_created_by_idx` (`created_by`),
  KEY `user_invite_registered_user_id_idx` (`registered_user_id`),
  KEY `user_invite_role_id_idx` (`role_id`),
  KEY `user_invite_organization_id_idx` (`organization_id`),
  CONSTRAINT `user_invite_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_invite_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  CONSTRAINT `user_invite_registered_user_id` FOREIGN KEY (`registered_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_invite_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_organization`
--

DROP TABLE IF EXISTS `user_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_organization` (
  `user_organization_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `organization_id` int NOT NULL,
  `is_selected` bit(1) DEFAULT NULL,
  `cretaed_by` int DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  `is_linked` bit(1) DEFAULT NULL,
  `linked_user_organization_id` int DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_organization_id`),
  KEY `user_organization_user_id_idx` (`user_id`),
  KEY `user_organization_organization_id_idx` (`organization_id`),
  KEY `user_organization_created_by_idx` (`cretaed_by`),
  CONSTRAINT `user_organization_created_by` FOREIGN KEY (`cretaed_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_organization_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  CONSTRAINT `user_organization_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=716 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_organization_emails`
--

DROP TABLE IF EXISTS `user_organization_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_organization_emails` (
  `user_organization_email_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `organization_id` int DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `pin` int DEFAULT NULL,
  `pin_generated_at` varchar(45) DEFAULT NULL,
  `is_verified` bit(1) NOT NULL,
  `is_notification_on` bit(1) NOT NULL,
  `is_primary` bit(1) NOT NULL,
  PRIMARY KEY (`user_organization_email_id`),
  KEY `user_organization_email_user_id_idx` (`user_id`),
  KEY `user_organization_email_organization_id_idx` (`organization_id`),
  CONSTRAINT `user_organization_email_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  CONSTRAINT `user_organization_email_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_organization_role`
--

DROP TABLE IF EXISTS `user_organization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_organization_role` (
  `user_organization_role_id` int NOT NULL AUTO_INCREMENT,
  `user_organization_id` int NOT NULL,
  `role_id` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_organization_role_id`),
  KEY `role_id_idx` (`role_id`),
  KEY `user_organization_id_idx` (`user_organization_id`),
  KEY `user_organization_role_created_by_idx` (`created_by`),
  CONSTRAINT `user_oganization_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_organization_id` FOREIGN KEY (`user_organization_id`) REFERENCES `user_organization` (`user_organization_id`),
  CONSTRAINT `user_organization_role_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_privillage`
--

DROP TABLE IF EXISTS `user_privillage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_privillage` (
  `user_privillage_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `privillage_id` varchar(45) DEFAULT NULL,
  `organization_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_privillage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_registration`
--

DROP TABLE IF EXISTS `user_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_registration` (
  `user_registration_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `is_approved` varchar(45) DEFAULT NULL,
  `converted_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_request`
--

DROP TABLE IF EXISTS `user_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_request` (
  `user_request_id` int NOT NULL AUTO_INCREMENT,
  `organization_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `is_approved` bit(1) DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `is_rejected` bit(1) DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_request_id`),
  KEY `user_request_organization_id_idx` (`organization_id`),
  KEY `user_request_rejected_by_idx` (`rejected_by`),
  KEY `user_request_approved_by_idx` (`approved_by`),
  KEY `user_request_role_id_idx` (`role_id`),
  KEY `user_request_user_id_idx` (`user_id`),
  CONSTRAINT `user_request_approved_by` FOREIGN KEY (`approved_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_request_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  CONSTRAINT `user_request_rejected_by` FOREIGN KEY (`rejected_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_request_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_request_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `username_login_student`
--

DROP TABLE IF EXISTS `username_login_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `username_login_student` (
  `username_login_student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `link_parent_id` int NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `status_id` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  `is_share_info` bit(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username_login_student_id`),
  KEY `username_login_student_link_parent_id_idx` (`link_parent_id`),
  KEY `username_login_student_created_by_idx` (`created_by`),
  KEY `username_login_student_user_id_idx` (`user_id`),
  CONSTRAINT `username_login_student_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `username_login_student_link_parent_id` FOREIGN KEY (`link_parent_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `username_login_student_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `username_login_student_organization`
--

DROP TABLE IF EXISTS `username_login_student_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `username_login_student_organization` (
  `username_login_student_organization_id` int NOT NULL AUTO_INCREMENT,
  `username_login_student_id` int NOT NULL,
  `organization_id` int NOT NULL,
  PRIMARY KEY (`username_login_student_organization_id`),
  KEY `username_login_student_id_idx` (`username_login_student_id`),
  KEY `username_login_student_organization_organization_id_idx` (`organization_id`),
  CONSTRAINT `username_login_student_id` FOREIGN KEY (`username_login_student_id`) REFERENCES `username_login_student` (`username_login_student_id`),
  CONSTRAINT `username_login_student_organization_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11 18:38:15
