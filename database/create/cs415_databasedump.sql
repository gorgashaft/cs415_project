-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)\
--\
-- Host: localhost    Database: cs415website\
-- ------------------------------------------------------\
-- Server version       8.0.36-0ubuntu0.22.04.1\
\
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\
/*!50503 SET NAMES utf8mb4 */;\
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;\
/*!40103 SET TIME_ZONE='+00:00' */;\
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;\
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;\
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;\
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;\
\
--\
-- Table structure for table `auth_group`\
--\
\
CREATE DATABASE cs415website;
USE cs415website;
DROP TABLE IF EXISTS `auth_group`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `auth_group` (\
  `id` int NOT NULL AUTO_INCREMENT,\
  `name` varchar(150) NOT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `name` (`name`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `auth_group`\
--\
\
LOCK TABLES `auth_group` WRITE;\
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;\
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `auth_group_permissions`\
--\
\
DROP TABLE IF EXISTS `auth_group_permissions`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `auth_group_permissions` (\
  `id` bigint NOT NULL AUTO_INCREMENT,\
  `group_id` int NOT NULL,\
  `permission_id` int NOT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),\
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),\
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),\
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `auth_group_permissions`\
--\
\
LOCK TABLES `auth_group_permissions` WRITE;\
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;\
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `auth_permission`\
--\
\
DROP TABLE IF EXISTS `auth_permission`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `auth_permission` (\
  `id` int NOT NULL AUTO_INCREMENT,\
  `name` varchar(255) NOT NULL,\
  `content_type_id` int NOT NULL,\
  `codename` varchar(100) NOT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),\
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)\
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `auth_permission`\
--\
\
LOCK TABLES `auth_permission` WRITE;\
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;\
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');\
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `auth_user`\
--\
\
DROP TABLE IF EXISTS `auth_user`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `auth_user` (\
  `id` int NOT NULL AUTO_INCREMENT,\
  `password` varchar(128) NOT NULL,\
  `last_login` datetime(6) DEFAULT NULL,\
  `is_superuser` tinyint(1) NOT NULL,\
  `username` varchar(150) NOT NULL,\
  `first_name` varchar(150) NOT NULL,\
  `last_name` varchar(150) NOT NULL,\
  `email` varchar(254) NOT NULL,\
  `is_staff` tinyint(1) NOT NULL,\
  `is_active` tinyint(1) NOT NULL,\
  `date_joined` datetime(6) NOT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `username` (`username`)\
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `auth_user`\
--\
\
LOCK TABLES `auth_user` WRITE;\
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;\
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$zjkO81ZKJEfJ3DKEEXtm2i$CpfQ9InMF9u/Vvnpe4eaIspcApizVNehdHv1RNIowN8=','2024-01-29 22:21:22.798657',1,'admin','','','admin@email.com',1,1,'2024-01-29 22:20:28.275909');\
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `auth_user_groups`\
--\
\
DROP TABLE IF EXISTS `auth_user_groups`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `auth_user_groups` (\
  `id` bigint NOT NULL AUTO_INCREMENT,\
  `user_id` int NOT NULL,\
  `group_id` int NOT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),\
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),\
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),\
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `auth_user_groups`\
--\
\
LOCK TABLES `auth_user_groups` WRITE;\
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;\
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `auth_user_user_permissions`\
--\
\
DROP TABLE IF EXISTS `auth_user_user_permissions`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `auth_user_user_permissions` (\
  `id` bigint NOT NULL AUTO_INCREMENT,\
  `user_id` int NOT NULL,\
  `permission_id` int NOT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),\
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),\
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),\
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `auth_user_user_permissions`\
--\
\
LOCK TABLES `auth_user_user_permissions` WRITE;\
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;\
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `django_admin_log`\
--\
\
DROP TABLE IF EXISTS `django_admin_log`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `django_admin_log` (\
  `id` int NOT NULL AUTO_INCREMENT,\
  `action_time` datetime(6) NOT NULL,\
  `object_id` longtext,\
  `object_repr` varchar(200) NOT NULL,\
  `action_flag` smallint unsigned NOT NULL,\
  `change_message` longtext NOT NULL,\
  `content_type_id` int DEFAULT NULL,\
  `user_id` int NOT NULL,\
  PRIMARY KEY (`id`),\
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),\
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),\
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),\
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),\
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))\
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `django_admin_log`\
--\
\
LOCK TABLES `django_admin_log` WRITE;\
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;\
INSERT INTO `django_admin_log` VALUES (1,'2024-01-30 07:37:11.748568','261','LuckyChap Productions',1,'[\{\\"added\\": \{\}\}]',9,1),(2,'2024-01-30 07:38:32.808242','1302','Saltburn',1,'[\{\\"added\\": \{\}\}]',8,1);\
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `django_content_type`\
--\
\
DROP TABLE IF EXISTS `django_content_type`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `django_content_type` (\
  `id` int NOT NULL AUTO_INCREMENT,\
  `app_label` varchar(100) NOT NULL,\
  `model` varchar(100) NOT NULL,\
  PRIMARY KEY (`id`),\
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)\
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `django_content_type`\
--\
\
LOCK TABLES `django_content_type` WRITE;\
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;\
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'cs415','genretable'),(8,'cs415','movietable'),(9,'cs415','studiotable'),(10,'cs415','usertable'),(6,'sessions','session');\
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `django_migrations`\
--\
\
DROP TABLE IF EXISTS `django_migrations`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `django_migrations` (\
  `id` bigint NOT NULL AUTO_INCREMENT,\
  `app` varchar(255) NOT NULL,\
  `name` varchar(255) NOT NULL,\
  `applied` datetime(6) NOT NULL,\
  PRIMARY KEY (`id`)\
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `django_migrations`\
--\
\
LOCK TABLES `django_migrations` WRITE;\
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;\
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-29 21:28:04.334877'),(2,'auth','0001_initial','2024-01-29 21:28:06.754613'),(3,'admin','0001_initial','2024-01-29 21:28:07.344027'),(4,'admin','0002_logentry_remove_auto_add','2024-01-29 21:28:07.424508'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-29 21:28:07.501795'),(6,'contenttypes','0002_remove_content_type_name','2024-01-29 21:28:08.006393'),(7,'auth','0002_alter_permission_name_max_length','2024-01-29 21:28:08.211826'),(8,'auth','0003_alter_user_email_max_length','2024-01-29 21:28:08.374647'),(9,'auth','0004_alter_user_username_opts','2024-01-29 21:28:08.455757'),(10,'auth','0005_alter_user_last_login_null','2024-01-29 21:28:08.652326'),(11,'auth','0006_require_contenttypes_0002','2024-01-29 21:28:08.725924'),(12,'auth','0007_alter_validators_add_error_messages','2024-01-29 21:28:08.801206'),(13,'auth','0008_alter_user_username_max_length','2024-01-29 21:28:09.020394'),(14,'auth','0009_alter_user_last_name_max_length','2024-01-29 21:28:09.235686'),(15,'auth','0010_alter_group_name_max_length','2024-01-29 21:28:09.397686'),(16,'auth','0011_update_proxy_permissions','2024-01-29 21:28:09.663916'),(17,'auth','0012_alter_user_first_name_max_length','2024-01-29 21:28:09.884947'),(18,'sessions','0001_initial','2024-01-29 21:28:10.191879');\
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `django_session`\
--\
\
DROP TABLE IF EXISTS `django_session`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `django_session` (\
  `session_key` varchar(40) NOT NULL,\
  `session_data` longtext NOT NULL,\
  `expire_date` datetime(6) NOT NULL,\
  PRIMARY KEY (`session_key`),\
  KEY `django_session_expire_date_a5c62663` (`expire_date`)\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `django_session`\
--\
\
LOCK TABLES `django_session` WRITE;\
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;\
INSERT INTO `django_session` VALUES ('7gy5maamv3rqo4s0nxcgb21kznlyhlrk','.eJxVjEEOwiAQRe_C2pB2aKF16d4zkGFmkKqBpLQr492VpAvdvvf-fymP-5b8XmX1C6uz6tXplwWkh-Qm-I75VjSVvK1L0C3Rh636Wliel6P9O0hYU1vTMGGMI0QU6NhyZ4wVmo3jEFh4cI4CzEDwhWDAGOIxUuh5QgKw6v0BF3M5FQ:1rUa0I:Z08vmExViymRK7e9_8sxxUJFV_Q-QSnANvlzihN8kKQ','2024-02-12 22:21:22.869722');\
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `genre_table`\
--\
\
DROP TABLE IF EXISTS `genre_table`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `genre_table` (\
  `genre_id` int NOT NULL AUTO_INCREMENT,\
  `genre` varchar(255) DEFAULT NULL,\
  PRIMARY KEY (`genre_id`)\
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `genre_table`\
--\
\
LOCK TABLES `genre_table` WRITE;\
/*!40000 ALTER TABLE `genre_table` DISABLE KEYS */;\
INSERT INTO `genre_table` VALUES (10,'Drama'),(11,'Comedy'),(12,'Animation'),(13,'Fantasy'),(14,'Documentary'),(15,'Action'),(16,'Dark Comedy'),(17,'Sci-Fi');\
/*!40000 ALTER TABLE `genre_table` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `movie_table`\
--\
\
DROP TABLE IF EXISTS `movie_table`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `movie_table` (\
  `movie_id` int NOT NULL AUTO_INCREMENT,\
  `title` varchar(255) DEFAULT NULL,\
  `studio_id` int DEFAULT NULL,\
  `genre_id` int DEFAULT NULL,\
  `director` varchar(255) DEFAULT NULL,\
  `release_date` date DEFAULT NULL,\
  PRIMARY KEY (`movie_id`),\
  KEY `genre_id` (`genre_id`),\
  KEY `studio_id` (`studio_id`),\
  CONSTRAINT `movie_table_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre_table` (`genre_id`),\
  CONSTRAINT `movie_table_ibfk_2` FOREIGN KEY (`studio_id`) REFERENCES `studio_table` (`studio_id`)\
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `movie_table`\
--\
\
LOCK TABLES `movie_table` WRITE;\
/*!40000 ALTER TABLE `movie_table` DISABLE KEYS */;\
INSERT INTO `movie_table` VALUES (1001,'Oppenheimer',200,10,'Christopher Nolan','2023-07-23'),(1002,'Eternal Sunshine of the Spotless Mind',202,13,'Michel Gondry','2004-11-02'),(1003,'Stranger Than Fiction',201,11,'Marc Forster','2006-11-10'),(1004,'The Boy and The Heron',203,12,'Hayao Miyazaki','2023-07-14'),(1005,'Saltburn',200,10,'Emerald Fennell','2023-11-17');\
/*!40000 ALTER TABLE `movie_table` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Temporary view structure for view `movie_table_view`\
--\
\
DROP TABLE IF EXISTS `movie_table_view`;\
/*!50001 DROP VIEW IF EXISTS `movie_table_view`*/;\
SET @saved_cs_client     = @@character_set_client;\
/*!50503 SET character_set_client = utf8mb4 */;\
/*!50001 CREATE VIEW `movie_table_view` AS SELECT \
 1 AS `movie_id`,\
 1 AS `title`,\
 1 AS `director`,\
 1 AS `release_date`,\
 1 AS `studio`,\
 1 AS `genre`*/;\
SET character_set_client = @saved_cs_client;\
\
--\
-- Table structure for table `ratings_table`\
--\
\
DROP TABLE IF EXISTS `ratings_table`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `ratings_table` (\
  `rating_id` int NOT NULL AUTO_INCREMENT,\
  `value` int DEFAULT NULL,\
  `movie_id` int DEFAULT NULL,\
  `user_id` int DEFAULT NULL,\
  `comments` varchar(255) DEFAULT NULL,\
  PRIMARY KEY (`rating_id`),\
  KEY `movie_id` (`movie_id`),\
  KEY `user_id` (`user_id`),\
  CONSTRAINT `ratings_table_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie_table` (`movie_id`),\
  CONSTRAINT `ratings_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)\
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `ratings_table`\
--\
\
LOCK TABLES `ratings_table` WRITE;\
/*!40000 ALTER TABLE `ratings_table` DISABLE KEYS */;\
INSERT INTO `ratings_table` VALUES (340,10,1003,1,'Deeply romantic and existential comedy.'),(341,7,1001,1,'Powerful biopic, a bit long in runtime.'),(342,8,1004,1,'Miyazki at his finest.'),(343,9,1002,1,'Profound romantic sci-fi about erasing painful memories.'),(344,4,1001,3,'Super boring, couldnt wait for it to be over.'),(345,10,1004,3,'I love Miyazaki!'),(346,2,1003,2,'I hate Will Ferrell'),(347,8,1003,5,'This is the most romantic comedy ever.'),(348,6,1001,1,'This was awesome!');\
/*!40000 ALTER TABLE `ratings_table` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Temporary view structure for view `ratings_view`\
--\
\
DROP TABLE IF EXISTS `ratings_view`;\
/*!50001 DROP VIEW IF EXISTS `ratings_view`*/;\
SET @saved_cs_client     = @@character_set_client;\
/*!50503 SET character_set_client = utf8mb4 */;\
/*!50001 CREATE VIEW `ratings_view` AS SELECT \
 1 AS `rating_id`,\
 1 AS `first_name`,\
 1 AS `last_name`,\
 1 AS `value`,\
 1 AS `title`,\
 1 AS `comments`*/;\
SET character_set_client = @saved_cs_client;\
\
--\
-- Table structure for table `studio_table`\
--\
\
DROP TABLE IF EXISTS `studio_table`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `studio_table` (\
  `studio_id` int NOT NULL AUTO_INCREMENT,\
  `studio` varchar(255) DEFAULT NULL,\
  PRIMARY KEY (`studio_id`)\
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `studio_table`\
--\
\
LOCK TABLES `studio_table` WRITE;\
/*!40000 ALTER TABLE `studio_table` DISABLE KEYS */;\
INSERT INTO `studio_table` VALUES (200,'Universal'),(201,'Sony Pictures Releasing'),(202,'Focus Features'),(203,'Toho'),(204,'Warner Bros'),(205,'Metro-Goldwyn-Mayer'),(206,'Warner Bros'),(207,'Walt Disney Studios');\
/*!40000 ALTER TABLE `studio_table` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Table structure for table `user_table`\
--\
\
DROP TABLE IF EXISTS `user_table`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
/*!50503 SET character_set_client = utf8mb4 */;\
CREATE TABLE `user_table` (\
  `user_id` int NOT NULL AUTO_INCREMENT,\
  `first_name` varchar(255) DEFAULT NULL,\
  `last_name` varchar(255) DEFAULT NULL,\
  `password` varchar(255) DEFAULT NULL,\
  `username` varchar(255) DEFAULT NULL,\
  `email` varchar(255) DEFAULT NULL,\
  `date_created` date DEFAULT NULL,\
  PRIMARY KEY (`user_id`),\
  UNIQUE KEY `email` (`email`)\
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
\
--\
-- Dumping data for table `user_table`\
--\
\
LOCK TABLES `user_table` WRITE;\
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;\
INSERT INTO `user_table` VALUES (1,'Sergio','Li','p@ssw0rd','gorgashaft','sel430@ensign.edu','2024-01-29'),(2,'Justin','Schow','uk3lele','jschow33','jschow@ensign.edu','2023-12-29'),(3,'Genesis','Zelayandia','fl0w3r!','latinasrule','gzelayan@ensign.edu','2022-04-22'),(4,'James','Newman','letitbeknown@123','putty2','sirkrisnikov@gmail.com','2021-03-12'),(5,'Alex','Snow','alexsnow','shinsboy','alexsnow@gmail.com','2021-05-03'),(8,'Emma','Lowther','12345','elowther','cookies@byu.edu','2024-02-10'),(9,'Kent','Ellsworth','wehDyn-wypjy0-tihpev','kellsworth','kellsworth@gmail.com','2024-03-01'),(11,'cs415Midterm','Assignment','p@ssw0rd','cs415Midterm','cs415@email.com','2024-03-01');\
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;\
UNLOCK TABLES;\
\
--\
-- Final view structure for view `movie_table_view`\
--\
\
/*!50001 DROP VIEW IF EXISTS `movie_table_view`*/;\
/*!50001 SET @saved_cs_client          = @@character_set_client */;\
/*!50001 SET @saved_cs_results         = @@character_set_results */;\
/*!50001 SET @saved_col_connection     = @@collation_connection */;\
/*!50001 SET character_set_client      = utf8mb4 */;\
/*!50001 SET character_set_results     = utf8mb4 */;\
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;\
/*!50001 CREATE ALGORITHM=UNDEFINED */\
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */\
/*!50001 VIEW `movie_table_view` AS select `movie_table`.`movie_id` AS `movie_id`,`movie_table`.`title` AS `title`,`movie_table`.`director` AS `director`,`movie_table`.`release_date` AS `release_date`,`studio_table`.`studio` AS `studio`,`genre_table`.`genre` AS `genre` from ((`movie_table` join `studio_table` on((`movie_table`.`studio_id` = `studio_table`.`studio_id`))) join `genre_table` on((`movie_table`.`genre_id` = `genre_table`.`genre_id`))) */;\
/*!50001 SET character_set_client      = @saved_cs_client */;\
/*!50001 SET character_set_results     = @saved_cs_results */;\
/*!50001 SET collation_connection      = @saved_col_connection */;\
\
--\
-- Final view structure for view `ratings_view`\
--\
\
/*!50001 DROP VIEW IF EXISTS `ratings_view`*/;\
/*!50001 SET @saved_cs_client          = @@character_set_client */;\
/*!50001 SET @saved_cs_results         = @@character_set_results */;\
/*!50001 SET @saved_col_connection     = @@collation_connection */;\
/*!50001 SET character_set_client      = utf8mb4 */;\
/*!50001 SET character_set_results     = utf8mb4 */;\
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;\
/*!50001 CREATE ALGORITHM=UNDEFINED */\
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */\
/*!50001 VIEW `ratings_view` AS select `rt`.`rating_id` AS `rating_id`,`ut`.`first_name` AS `first_name`,`ut`.`last_name` AS `last_name`,`rt`.`value` AS `value`,`mt`.`title` AS `title`,`rt`.`comments` AS `comments` from ((`ratings_table` `rt` join `user_table` `ut` on((`rt`.`user_id` = `ut`.`user_id`))) join `movie_table` `mt` on((`rt`.`movie_id` = `mt`.`movie_id`))) */;\
/*!50001 SET character_set_client      = @saved_cs_client */;\
/*!50001 SET character_set_results     = @saved_cs_results */;\
/*!50001 SET collation_connection      = @saved_col_connection */;\
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;\
\
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;\
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;\
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;\
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;\
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;\
\
-- Dump completed on 2024-03-18 18:17:43}
