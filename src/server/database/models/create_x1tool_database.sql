-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: X1ToolDatabase
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.10.1

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

-- Create Database 
Drop Database IF EXISTS `X1ToolDatabase`;
CREATE DATABASE `X1ToolDatabase` character set utf8;

USE `X1ToolDatabase`;

--
-- Table structure for table `tb_application_category`
--

DROP TABLE IF EXISTS `tb_application_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_application_category` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `resource` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_application_info`
--

DROP TABLE IF EXISTS `tb_application_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_application_info` (
  `id` varchar(255) NOT NULL,
  `resource` varchar(1024) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `tb_application_info_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tb_application_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_application_usage_log`
--

DROP TABLE IF EXISTS `tb_application_usage_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_application_usage_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `inputs` varchar(1024) DEFAULT NULL,
  `outputs` varchar(1024) NOT NULL,
  `stime` datetime NOT NULL,
  `etime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `appid` (`appid`),
  CONSTRAINT `tb_application_usage_log_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `tb_session_log` (`id`),
  CONSTRAINT `tb_application_usage_log_ibfk_2` FOREIGN KEY (`appid`) REFERENCES `tb_application_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_session_log`
--

DROP TABLE IF EXISTS `tb_session_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_session_log` (
  `id` varchar(255) NOT NULL,
  `stime` datetime NOT NULL,
  `atime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_user_visit_log`
--

DROP TABLE IF EXISTS `tb_user_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `sid` varchar(255) NOT NULL,
  `srcip` varchar(255) NOT NULL,
  `location` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-31 15:40:51

-- Create useful index
CREATE INDEX `ix_user_visit_srcip` ON `tb_user_visit_log`(`srcip`);

DROP TABLE IF EXISTS `tb_comments`;
CREATE TABLE `tb_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `comment` varchar(4095) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appid` (`appid`),
  KEY `uid` (`uid`),
  CONSTRAINT tb_comments_ibfk_1 FOREIGN KEY (`appid`) REFERENCES tb_application_info (`id`);
) ENGINE=InnoDB DEFAULT CHARSET=utf8