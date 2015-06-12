-- --------------------------------------------------------
-- 主机:                           10.22.116.72
-- 服务器版本:                        5.6.14 - MySQL Community Server (GPL)
-- 服务器操作系统:                      debian6.0
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 message 的数据库结构
CREATE DATABASE IF NOT EXISTS `message` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `message`;


-- 导出  表 message.application_info 结构
CREATE TABLE IF NOT EXISTS `application_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `token` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  message.application_info 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `application_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_info` ENABLE KEYS */;


-- 导出  表 message.content 结构
CREATE TABLE IF NOT EXISTS `content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `md5` char(32) DEFAULT NULL,
  `status` int(11) DEFAULT '2' COMMENT '0 æœª',
  `content_type` int(11) DEFAULT NULL COMMENT '1 text',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5359 DEFAULT CHARSET=utf8;

-- 正在导出表  message.content 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;


-- 导出  表 message.mailbox 结构
CREATE TABLE IF NOT EXISTS `mailbox` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `args` text,
  `source_id` bigint(20) DEFAULT NULL,
  `receive_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7351 DEFAULT CHARSET=utf8;

-- 正在导出表  message.mailbox 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;


-- 导出  表 message.notification_web 结构
CREATE TABLE IF NOT EXISTS `notification_web` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receiver_type` int(11) NOT NULL COMMENT '1:个人，2：租户，3，通行证',
  `receiver_list` text NOT NULL,
  `args` text NOT NULL,
  `template_id` bigint(20) NOT NULL,
  `send_time` datetime NOT NULL,
  `task_id` bigint(20) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_template_id` (`template_id`),
  KEY `fk_task_id` (`task_id`),
  CONSTRAINT `fk_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_id` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 正在导出表  message.notification_web 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `notification_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_web` ENABLE KEYS */;


-- 导出  表 message.subtask 结构
CREATE TABLE IF NOT EXISTS `subtask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(11) DEFAULT NULL COMMENT '1 é‚',
  `status` int(11) DEFAULT '0' COMMENT '0 æœª',
  `error_msg` text,
  `receiver` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `principal_name` varchar(255) DEFAULT NULL COMMENT '被发送者principalName',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251303 DEFAULT CHARSET=utf8;

-- 正在导出表  message.subtask 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `subtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `subtask` ENABLE KEYS */;


-- 导出  表 message.task 结构
CREATE TABLE IF NOT EXISTS `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_type` smallint(11) DEFAULT NULL COMMENT '1',
  `subject_id` bigint(20) DEFAULT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `args` text,
  `app_id` bigint(20) DEFAULT NULL,
  `receiver` text,
  `status` int(11) DEFAULT NULL COMMENT '1 æ­£å',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `receiver_type` smallint(6) DEFAULT NULL COMMENT '1ï¼š',
  `params` text,
  `custom_params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62740 DEFAULT CHARSET=utf8;

-- 正在导出表  message.task 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;


-- 导出  表 message.template 结构
CREATE TABLE IF NOT EXISTS `template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '2',
  `create_time` datetime NOT NULL,
  `last_update_time` datetime NOT NULL,
  `app_id` bigint(20) NOT NULL,
  `status` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `app_id` FOREIGN KEY (`app_id`) REFERENCES `application_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- 正在导出表  message.template 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
