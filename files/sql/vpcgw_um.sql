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

-- 导出 usermaster 的数据库结构
CREATE DATABASE IF NOT EXISTS `usermaster` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `usermaster`;


-- 导出  表 usermaster.account 结构
CREATE TABLE IF NOT EXISTS `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '租户用户状态（初始，启用，锁定）系统词典',
  `type` smallint(6) DEFAULT NULL COMMENT '租户用户类型（试用，实习，转正，离职）系统词典',
  `username` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '租户用户密码',
  `salt_value` varchar(50) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `fail_times` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_account` (`tenant_id`,`username`),
  KEY `fk_user_has_tenant_tenant1_idx` (`tenant_id`),
  KEY `fk_user_has_tenant_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_tenant_tenant1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_tenant_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.account 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `user_id`, `tenant_id`, `status`, `type`, `username`, `surname`, `given_name`, `password`, `salt_value`, `last_login_time`, `create_time`, `update_time`, `fail_times`) VALUES
	(1, NULL, 1, 1, 2, 'dcai701', NULL, NULL, 'dFFqQzWrnbk6/RUzIEMmVfKWpXnlmVTGiPtlf3nnSDU=', 'ecdbbac68ef9b729', NULL, '2015-05-25 15:20:44', '2015-06-05 13:38:45', 0),
	(2, NULL, 1, 1, 2, 'test-excel0518', NULL, NULL, 'eoIuhz4L5wEwWTIa/9wd68nj+UPfzjqtfLzhowYyGvo=', '0f618bdb40336bc3', NULL, '2015-05-25 15:20:44', '2015-06-09 14:58:43', 0),
	(3, NULL, 1, 1, 2, 'dev10', NULL, NULL, 'bvLpZHnh/zrcRseAOPg2OwidwTD2vWZ4ZuimhYwYBKU=', 'a80c922d993df135', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(4, NULL, 1, 1, 2, 'test-excel518', NULL, NULL, '772eJMvkZJ2FSaOaoFMh7OK5Zcl8oyeTf44FEgwDQxI=', '2b1c2eda85a06188', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(5, NULL, 1, 1, 2, 'jump', NULL, NULL, 'SJMaFH4zgPgDiZUKc87zQKGK30qbPwtqRCPn+cjMk7U=', '84399b5e8e9799da', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(6, NULL, 1, 1, 2, 'hehe', NULL, NULL, 'PQ5h6UGWunm7s8NemNEcr2Z8OfGzxTwKgA2MUmMQ+sk=', '029b51981a0217c3', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(7, NULL, 1, 1, 2, 'test_zx', NULL, NULL, 'kYafptjIcTG4c2nLnXUJlaeKglvsIMZYyZIBFV1NVhQ=', 'dc338ce17fd74003', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(8, NULL, 1, 1, 2, 'erqerewerqwrcwqerewq', NULL, NULL, 'xHeBwLfqL7LcfbQzRLZoJAs2mgtT0oNNI2GBGkl3d/4=', 'b5dec160b72d5439', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(9, NULL, 1, 1, 2, 'ewrewrewqrewqrqwer', NULL, NULL, 't+xvhv5TCqusc/dA+iEWDzR3g0pLNTI1bfu+5dy7yGk=', 'f29b1604c10c7f94', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(10, NULL, 1, 1, 2, 'nameveryveryverylong', NULL, NULL, 'km3Vrz2JsQTUc7fQXu/bVwyiDLTbosA8Hy7DFhxo4lE=', '1565ab3c13b5a64f', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(11, NULL, 1, 1, 2, 'qa', NULL, NULL, 'BDYYd8h5WHR3BjkEbtBVLBRqrnVErIl5ztQIrI8aOAA=', '1597d7548ebc9fbb', NULL, '2015-05-25 15:33:21', '2015-06-09 16:08:43', 0),
	(12, NULL, 1, 1, 2, 'dev', NULL, NULL, 'g0gWftEWuMwJlvndDTJsxwkV/hSMLNy9S5hO4U4oSqk=', '0957a61efed67f78', NULL, '2015-05-25 15:33:21', '2015-06-05 13:38:45', 0),
	(13, NULL, 1, 1, 2, 'test11', NULL, NULL, 'oiAEPGDd0JprsRWEFF43cLX1uzXSTcxN4mqWDoz0XCo=', '941a7628249cf348', NULL, '2015-05-26 13:11:39', '2015-06-05 13:38:44', 0),
	(14, NULL, 1, 1, 2, 'dcai-709', NULL, NULL, 'L0+h2k6e+y728q6MLsqp0sOgcqvzbPo++sauEcyTf3Y=', '99ff841d67178b7e', NULL, '2015-05-26 13:11:39', '2015-06-05 13:38:45', 0),
	(15, NULL, 1, 1, 2, 'dcai-708', NULL, NULL, 'LQB28BmnoS7gNwBa+LY57mYqubKshiDCVQcndCDP0j8=', '65aee7a48285946d', NULL, '2015-05-26 13:11:39', '2015-06-05 13:38:45', 0),
	(16, NULL, 1, 1, 2, 'ryanyin2', NULL, NULL, 'Jc2IFDy+OBYfqqn+8YwQFT80G6yjD3To0G/KTD3eJh8=', '8b812d0faf06f2f4', NULL, '2015-05-26 13:11:39', '2015-06-05 13:38:45', 0),
	(17, NULL, 1, 1, 2, 'ryanyin', NULL, NULL, 'vrz9pc1Yp/ILyhNT9UMJ8JF93JMHt39vmlb5XCyYTog=', '67a1a4adef14699f', NULL, '2015-05-26 13:11:40', '2015-06-05 13:38:45', 0),
	(18, NULL, 1, 1, 2, 'testgantan', NULL, NULL, '4nOq0vmrzMvZ1KJp3tUp8Wgbn4bdEjhJMqx9rqEAQH0=', 'dc9589efdc1d4351', NULL, '2015-06-02 15:46:38', '2015-06-05 13:38:44', 0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- 导出  表 usermaster.account_profile 结构
CREATE TABLE IF NOT EXISTS `account_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) NOT NULL COMMENT '属性id',
  `value` varchar(2000) DEFAULT NULL COMMENT '属性值',
  `blob_value` blob COMMENT '属性二进制值',
  `access_level` smallint(6) DEFAULT '0' COMMENT '是否公开',
  `locked` tinyint(4) DEFAULT '0' COMMENT '是否锁定（作为passport）',
  `account_id` bigint(20) NOT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_user_profile` (`account_id`,`field_id`),
  KEY `fk_user_profile_field_idx` (`field_id`),
  CONSTRAINT `fk_user_profile_field` FOREIGN KEY (`field_id`) REFERENCES `profile_field` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_profile_user_tenant` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.account_profile 的数据：~24 rows (大约)
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
INSERT INTO `account_profile` (`id`, `field_id`, `value`, `blob_value`, `access_level`, `locked`, `account_id`, `create_time`, `update_time`) VALUES
	(1, 6, '18601672011', NULL, 0, 0, 1, '2015-05-25 15:20:44', '2015-06-05 13:38:45'),
	(2, 7, 'yunfei.cai1@datayes.com', NULL, 0, 0, 1, '2015-05-25 15:20:44', '2015-06-05 13:38:45'),
	(3, 7, 'wenbin.feng@datayes.com', NULL, 0, 0, 2, '2015-05-25 15:20:44', '2015-06-09 14:58:43'),
	(4, 7, 'xi.wu@sdatayes.com', NULL, 0, 0, 3, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(5, 7, 'wenbin.feng@datayes.com', NULL, 0, 0, 4, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(6, 7, 'jia.guo@datayes.com', NULL, 0, 0, 5, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(7, 7, 'jia.guo@datayes.com', NULL, 0, 0, 6, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(8, 7, 'xue1.zhang@datayes.com', NULL, 0, 0, 7, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(9, 7, 'wenbin.feng@datayes.com', NULL, 0, 0, 8, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(10, 7, 'wenbin.feng@datayes.com', NULL, 0, 0, 9, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(11, 7, 'xue1.zhang@datayes.com', NULL, 0, 0, 10, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(12, 6, '18818233180', NULL, 0, 0, 11, '2015-05-25 15:33:21', '2015-06-09 16:08:43'),
	(13, 7, 'yun@datayes.com', NULL, 0, 0, 11, '2015-05-25 15:33:21', '2015-06-09 16:08:43'),
	(14, 7, 'yun@datayes.com', NULL, 0, 0, 12, '2015-05-25 15:33:21', '2015-06-05 13:38:46'),
	(15, 6, '13818532551', NULL, 0, 0, 12, '2015-05-25 15:33:21', '2015-06-05 13:38:45'),
	(16, 7, 'timeg0@126.com', NULL, 0, 0, 13, '2015-05-26 13:11:39', '2015-06-05 13:38:44'),
	(17, 7, 'yunfei.cai@datayes.com', NULL, 0, 0, 14, '2015-05-26 13:11:39', '2015-06-05 13:38:45'),
	(18, 7, 'yunfei.cai1@datayes.com', NULL, 0, 0, 15, '2015-05-26 13:11:39', '2015-06-05 13:38:45'),
	(19, 7, 'jun.yin@datayes.comm', NULL, 0, 0, 16, '2015-05-26 13:11:39', '2015-06-05 13:38:45'),
	(20, 7, 'jun.yin@datayes.comm', NULL, 0, 0, 17, '2015-05-26 13:11:40', '2015-06-05 13:38:45'),
	(21, 6, '17721058189', NULL, 0, 0, 2, '2015-06-01 15:11:38', '2015-06-09 14:58:43'),
	(22, 7, 'wenbin.feng@dats.com', NULL, 0, 0, 18, '2015-06-02 15:46:38', '2015-06-05 13:38:44'),
	(23, 1, '张', NULL, 0, 0, 11, NULL, NULL),
	(24, 2, '三', NULL, 0, 0, 11, NULL, NULL);
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;


-- 导出  表 usermaster.account_role 结构
CREATE TABLE IF NOT EXISTS `account_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_role_FK_idx` (`role_id`),
  KEY `user_role_user_FK_idx` (`account_id`),
  CONSTRAINT `user_role_role_FK` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_role_user_FK` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.account_role 的数据：~39 rows (大约)
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` (`id`, `account_id`, `role_id`, `status`, `create_time`, `update_time`) VALUES
	(1, 11, 5, 0, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(2, 1, 2, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(3, 12, 2, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(4, 3, 2, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(5, 11, 2, 1, '2015-06-09 16:08:43', '2015-06-09 16:08:43'),
	(6, 17, 2, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(7, 4, 2, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(8, 13, 2, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(9, 1, 1, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(10, 12, 1, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(11, 3, 1, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(12, 11, 1, 1, '2015-06-09 16:08:43', '2015-06-09 16:08:43'),
	(13, 17, 1, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(14, 4, 1, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(15, 13, 1, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(16, 15, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(17, 14, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(18, 8, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(19, 9, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(20, 6, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(21, 5, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(22, 10, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(23, 16, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(24, 2, 4, 0, '2015-06-09 14:58:43', '2015-06-09 14:58:43'),
	(25, 18, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(26, 7, 4, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(31, 15, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(32, 14, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(33, 8, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(34, 9, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(35, 6, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(36, 5, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(37, 10, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(38, 16, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(39, 2, 3, 0, '2015-06-09 14:58:43', '2015-06-09 14:58:43'),
	(40, 18, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(41, 7, 3, 1, '2015-06-05 13:38:46', '2015-06-05 13:38:46'),
	(46, 2, 1, 1, '2015-06-09 14:58:43', '2015-06-09 14:58:43'),
	(47, 2, 2, 1, '2015-06-09 14:58:43', '2015-06-09 14:58:43');
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;


-- 导出  视图 usermaster.account_view 结构
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `account_view` (
	`account_id` BIGINT(20) NOT NULL,
	`username` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`tenant_id` BIGINT(20) NOT NULL,
	`domain` VARCHAR(50) NOT NULL COMMENT '租户域名' COLLATE 'utf8_general_ci',
	`account_role_id` BIGINT(20) NULL,
	`role_id` BIGINT(20) NULL,
	`role_name` VARCHAR(100) NULL COMMENT '角色名' COLLATE 'utf8_general_ci',
	`role_description` TEXT NULL COLLATE 'utf8_general_ci',
	`role_status` SMALLINT(6) NULL,
	`account_status` SMALLINT(6) NULL COMMENT '租户用户状态（初始，启用，锁定）系统词典',
	`account_type` SMALLINT(6) NULL COMMENT '租户用户类型（试用，实习，转正，离职）系统词典'
) ENGINE=MyISAM;


-- 导出  表 usermaster.application 结构
CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '应用名称',
  `code` varchar(100) NOT NULL COMMENT '应用代号（SNS，PMS）',
  `version` int(11) NOT NULL COMMENT '应用版本号',
  `status` varchar(100) NOT NULL COMMENT '应用状态（待审，上架，下架，冻结）',
  `domain` varchar(100) NOT NULL COMMENT '应用域名',
  `class` varchar(100) NOT NULL COMMENT '应用分类（private/public/public_only）',
  `deleted` tinyint(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `type_id` int(11) NOT NULL COMMENT '应用类型',
  `info_id` int(11) NOT NULL COMMENT '应用信息',
  `iaas_id` int(11) DEFAULT NULL COMMENT 'IaaS对应ID',
  PRIMARY KEY (`id`),
  KEY `fk_application_application_type_idx` (`type_id`),
  KEY `fk_application_application_info1_idx` (`info_id`),
  CONSTRAINT `fk_application_application_info1` FOREIGN KEY (`info_id`) REFERENCES `application_info` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_application_type` FOREIGN KEY (`type_id`) REFERENCES `application_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.application 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;


-- 导出  表 usermaster.application_info 结构
CREATE TABLE IF NOT EXISTS `application_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `logo` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.application_info 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `application_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_info` ENABLE KEYS */;


-- 导出  表 usermaster.application_type 结构
CREATE TABLE IF NOT EXISTS `application_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.application_type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `application_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_type` ENABLE KEYS */;


-- 导出  表 usermaster.appmaster_application 结构
CREATE TABLE IF NOT EXISTS `appmaster_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(45) NOT NULL,
  `full_name` varchar(145) NOT NULL,
  `app_version` varchar(45) NOT NULL,
  `app_vendor` varchar(45) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `app_status` tinyint(4) NOT NULL,
  `shelve_time` datetime NOT NULL,
  `release_time` datetime NOT NULL,
  `app_desc` text NOT NULL,
  `app_slogan` varchar(145) NOT NULL,
  `app_logo` varchar(2083) NOT NULL DEFAULT '',
  `app_snapshot_1` varchar(2083) NOT NULL DEFAULT '',
  `app_snapshot_2` varchar(2083) NOT NULL DEFAULT '',
  `app_snapshot_3` varchar(2083) NOT NULL DEFAULT '',
  `ping_uri` varchar(2083) NOT NULL DEFAULT '',
  `show_uri` varchar(2083) NOT NULL DEFAULT '',
  `separated` tinyint(4) NOT NULL DEFAULT '0',
  `order_num` bigint(20) NOT NULL DEFAULT '0',
  `show` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.appmaster_application 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appmaster_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `appmaster_application` ENABLE KEYS */;


-- 导出  表 usermaster.appmaster_application_role 结构
CREATE TABLE IF NOT EXISTS `appmaster_application_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_application_roles_application1_idx` (`application_id`),
  CONSTRAINT `fk_application_roles_application1` FOREIGN KEY (`application_id`) REFERENCES `appmaster_application` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.appmaster_application_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appmaster_application_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `appmaster_application_role` ENABLE KEYS */;


-- 导出  表 usermaster.appmaster_application_role_copy 结构
CREATE TABLE IF NOT EXISTS `appmaster_application_role_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_application_roles_application1_idx` (`application_id`),
  CONSTRAINT `appmaster_application_role_copy_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `appmaster_application` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.appmaster_application_role_copy 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appmaster_application_role_copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `appmaster_application_role_copy` ENABLE KEYS */;


-- 导出  表 usermaster.appmaster_instance 结构
CREATE TABLE IF NOT EXISTS `appmaster_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inst_name` varchar(45) NOT NULL,
  `inst_status` tinyint(4) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `frontend_uri` varchar(2083) NOT NULL DEFAULT '',
  `backend_uri` varchar(2083) NOT NULL DEFAULT '',
  `deploy_time` datetime NOT NULL,
  `inst_desc` text NOT NULL,
  `application_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instance_application1_idx` (`application_id`),
  CONSTRAINT `fk_instance_application1` FOREIGN KEY (`application_id`) REFERENCES `appmaster_application` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.appmaster_instance 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appmaster_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `appmaster_instance` ENABLE KEYS */;


-- 导出  表 usermaster.appmaster_instance_map_tenant 结构
CREATE TABLE IF NOT EXISTS `appmaster_instance_map_tenant` (
  `instance_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `inst_alias` varchar(45) NOT NULL,
  `inst_logo` varchar(200) NOT NULL,
  `map_time` datetime NOT NULL,
  PRIMARY KEY (`instance_id`,`tenant_id`),
  KEY `fk_instance_has_tenant_tenant1_idx` (`tenant_id`),
  KEY `fk_instance_has_tenant_instance1_idx` (`instance_id`),
  CONSTRAINT `fk_instance_has_tenant_instance1` FOREIGN KEY (`instance_id`) REFERENCES `appmaster_instance` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_instance_has_tenant_tenant1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.appmaster_instance_map_tenant 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appmaster_instance_map_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `appmaster_instance_map_tenant` ENABLE KEYS */;


-- 导出  表 usermaster.appmaster_operation_map_role 结构
CREATE TABLE IF NOT EXISTS `appmaster_operation_map_role` (
  `application_operation_id` bigint(20) NOT NULL,
  `application_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`application_operation_id`,`application_role_id`),
  KEY `index_roleid_opId` (`application_operation_id`,`application_role_id`),
  KEY `fk_roleId` (`application_role_id`),
  CONSTRAINT `fk_roleId` FOREIGN KEY (`application_role_id`) REFERENCES `appmaster_application_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.appmaster_operation_map_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `appmaster_operation_map_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `appmaster_operation_map_role` ENABLE KEYS */;


-- 导出  表 usermaster.authorization 结构
CREATE TABLE IF NOT EXISTS `authorization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` bigint(20) NOT NULL,
  `instance_name` varchar(255) NOT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '0 黑名单; 1 白名单',
  `identity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '0 Role; 1 Organization; 2 Account',
  `identity_id` bigint(20) NOT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0 DISABLED; 1 ACTIVE',
  `expire_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perm_identity_perm_idx` (`operation_id`),
  KEY `IND_PERM_IDENTITY` (`operation_id`,`instance_name`,`tenant_id`),
  KEY `fk_perm_tenent_perm_idx` (`tenant_id`),
  CONSTRAINT `fk_perm_identity_perm` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perm_tenent_perm` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.authorization 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `authorization` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorization` ENABLE KEYS */;


-- 导出  表 usermaster.category 结构
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.category 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- 导出  表 usermaster.config 结构
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL,
  `config_name` varchar(100) NOT NULL COMMENT '配置名',
  `config_type` varchar(50) NOT NULL COMMENT '配置类型（String，Int.....）',
  `config_value` varchar(300) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.config 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
/*!40000 ALTER TABLE `config` ENABLE KEYS */;


-- 导出  表 usermaster.dict_category 结构
CREATE TABLE IF NOT EXISTS `dict_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '词典名',
  `type` varchar(50) NOT NULL COMMENT '词典数据类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.dict_category 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dict_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `dict_category` ENABLE KEYS */;


-- 导出  表 usermaster.dict_data 结构
CREATE TABLE IF NOT EXISTS `dict_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` varchar(100) NOT NULL COMMENT '词典数据',
  `dict_category_id` bigint(20) NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_dict_data` (`dict_category_id`,`code`),
  CONSTRAINT `fk_dict_data_dict_category1` FOREIGN KEY (`dict_category_id`) REFERENCES `dict_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.dict_data 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dict_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dict_data` ENABLE KEYS */;


-- 导出  表 usermaster.image 结构
CREATE TABLE IF NOT EXISTS `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL,
  `image` mediumblob,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  usermaster.image 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;


-- 导出  表 usermaster.login_history 结构
CREATE TABLE IF NOT EXISTS `login_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal_name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL COMMENT 'login_time or logout_time',
  `status` int(45) DEFAULT NULL COMMENT '0: fail, 1:success',
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `identity_type` varchar(45) DEFAULT NULL,
  `passport_type` char(10) DEFAULT NULL,
  `refer` varchar(225) DEFAULT NULL,
  `auth_type` int(11) DEFAULT NULL COMMENT 'SUCCESS(0), FAIL(1), INVALID(2), NOTEXIST(3), LOCKED(4), NEED_LOGIN(5), CERTIFICATOR_ERROR(6),CODE_REQUIRED(7), INVALID_CODE(8), ERROR_CODE(9), LOGIN_TOKEN_REQUIRED(10), INVALID_LOGIN_TOKEN(11); -1:exception.',
  `session_token` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `remarks` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2158 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.login_history 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;


-- 导出  表 usermaster.operation 结构
CREATE TABLE IF NOT EXISTS `operation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_key` varchar(255) NOT NULL,
  `description` text,
  `url_pattern` varchar(1024) DEFAULT NULL,
  `method` smallint(6) DEFAULT '0' COMMENT '0 ALL, 1 GET, 2 HEAD, 3 POST, 4 PUT, 5 PATCH, 6 DELETE, 7 OPTION, 8 TRACE',
  `parent_id` bigint(20) DEFAULT NULL,
  `root_id` bigint(20) NOT NULL COMMENT '即instance permission的node',
  `hidden` tinyint(4) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `anonymous` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_PERMISSION` (`operation_key`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.operation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;


-- 导出  表 usermaster.organization 结构
CREATE TABLE IF NOT EXISTS `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_key` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL COMMENT '0 DIMENSION 维度, 1 GROUP_COMPANY 集团, 2 COMPANY 公司, 3 DEPARTMENT 部门, 4 BRANCH 分部, 5 GROUP 小组',
  `description` text,
  `dimension_id` bigint(20) NOT NULL COMMENT '维度节点id，即根节点',
  `parent_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_org_tenant_idx` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.organization 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` (`id`, `organization_key`, `type`, `description`, `dimension_id`, `parent_id`, `tenant_id`, `create_time`, `update_time`) VALUES
	(44, 'staging公司', 2, NULL, 44, -1, 1, '2015-06-03 15:44:59', '2015-06-03 15:44:59');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;


-- 导出  表 usermaster.organization_account 结构
CREATE TABLE IF NOT EXISTS `organization_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '0 DISABLED 1 ACTIVE',
  `position` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ORG_ACCOUNT` (`organization_id`,`account_id`),
  KEY `fk_org_account_account_idx` (`account_id`),
  CONSTRAINT `fk_org_account_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.organization_account 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `organization_account` DISABLE KEYS */;
INSERT INTO `organization_account` (`id`, `organization_id`, `account_id`, `status`, `position`, `create_time`, `update_time`) VALUES
	(16, 44, 11, 1, 'CEO', '2015-06-03 15:48:23', '2015-06-03 15:56:54'),
	(17, 44, 1, 1, 'xiaodi', '2015-06-03 16:03:51', '2015-06-03 16:03:51');
/*!40000 ALTER TABLE `organization_account` ENABLE KEYS */;


-- 导出  表 usermaster.platform_admin 结构
CREATE TABLE IF NOT EXISTS `platform_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(300) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.platform_admin 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `platform_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `platform_admin` ENABLE KEYS */;


-- 导出  表 usermaster.profile_field 结构
CREATE TABLE IF NOT EXISTS `profile_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) NOT NULL COMMENT '字段代码',
  `description` varchar(500) DEFAULT NULL COMMENT '字段描述',
  `display_name` varchar(50) DEFAULT NULL COMMENT '字段显示名称',
  `type` smallint(6) DEFAULT NULL COMMENT '字段类型(Int, Decimal, Date, Boolean, String, Byte)系统词典',
  `public_only` tinyint(4) DEFAULT '0' COMMENT '是否必须公开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.profile_field 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `profile_field` DISABLE KEYS */;
INSERT INTO `profile_field` (`id`, `code`, `description`, `display_name`, `type`, `public_only`) VALUES
	(1, 'sn', NULL, '姓', NULL, 0),
	(2, 'givenName', NULL, '名', NULL, 0),
	(3, 'telephoneNumber', NULL, '电话', NULL, 0),
	(4, 'gender', NULL, '性别', NULL, 0),
	(5, 'nickName', NULL, '昵称', NULL, 0),
	(6, 'mobile', NULL, '手机', NULL, 0),
	(7, 'mail', NULL, '邮箱', NULL, 0),
	(8, 'dateOfBirth', NULL, '生日', NULL, 0),
	(9, 'title', NULL, '职位', NULL, 0),
	(10, 'language', NULL, '语言', NULL, 0),
	(11, 'country', NULL, '国家', NULL, 0),
	(12, 'region', NULL, '地区', NULL, 0),
	(13, 'credit', NULL, '积分', NULL, 0),
	(14, 'avatar', NULL, '头像', NULL, 0),
	(15, 'province', NULL, '省份', NULL, 0),
	(16, 'city', NULL, '城市', NULL, 0),
	(17, 'address', NULL, '地址', NULL, 0);
/*!40000 ALTER TABLE `profile_field` ENABLE KEYS */;


-- 导出  表 usermaster.role 结构
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '角色名',
  `description` text,
  `tenant_id` bigint(20) NOT NULL,
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tenant_role_tenant1_idx` (`tenant_id`),
  CONSTRAINT `fk_tenant_role_tenant1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.role 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `description`, `tenant_id`, `hidden`, `create_time`, `update_time`) VALUES
	(1, 'TRADING1.USER', 'TRADING1.USER', 1, 0, '2015-05-25 15:20:44', '2015-05-25 15:20:44'),
	(2, 'PMS.ADMIN', 'PMS.ADMIN', 1, 0, '2015-05-25 15:20:44', '2015-05-25 15:20:44'),
	(3, 'PMS.USER', 'PMS.USER', 1, 0, '2015-05-25 15:20:44', '2015-05-25 15:20:44'),
	(4, 'TRADING2.USER', 'TRADING2.USER', 1, 0, '2015-05-25 15:20:44', '2015-05-25 15:20:44'),
	(5, 'COMMON.ADMIN', '租户管理员', 1, 0, '2015-06-03 17:25:58', '2015-06-03 17:25:58');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- 导出  表 usermaster.tenant 结构
CREATE TABLE IF NOT EXISTS `tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL COMMENT '租户状态（待审批，启用，停用）系统词典',
  `comment` varchar(300) DEFAULT NULL,
  `domain` varchar(50) NOT NULL COMMENT '租户域名',
  `use_tenant_password` tinyint(4) DEFAULT NULL COMMENT '通行证用户是否需要提供租户密码才能登陆',
  `multifactor_login` tinyint(4) DEFAULT '0',
  `open_for_apply` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_UNIQUE` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.tenant 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` (`id`, `status`, `comment`, `domain`, `use_tenant_password`, `multifactor_login`, `open_for_apply`, `create_time`, `update_time`) VALUES
	(1, 0, NULL, 'stg.com', 0, 0, NULL, '2015-05-25 15:20:43', '2015-05-25 15:20:43');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;


-- 导出  表 usermaster.tenant_profile 结构
CREATE TABLE IF NOT EXISTS `tenant_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '公司名',
  `web` varchar(200) DEFAULT NULL COMMENT '公司站点',
  `mail` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL COMMENT '公司联系人',
  `phone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `tenant_id` bigint(20) NOT NULL,
  `description` text COMMENT '公司说明',
  `icon` varchar(200) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tenant_id_UNIQUE` (`tenant_id`),
  KEY `fk_tenant_profile_tenant1_idx` (`tenant_id`),
  CONSTRAINT `fk_tenant_profile_tenant1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.tenant_profile 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tenant_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_profile` ENABLE KEYS */;


-- 导出  表 usermaster.timestamps 结构
CREATE TABLE IF NOT EXISTS `timestamps` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.timestamps 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `timestamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `timestamps` ENABLE KEYS */;


-- 导出  表 usermaster.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID，也就是通行证ID。',
  `status` smallint(6) NOT NULL COMMENT '用户状态（启用，停用）系统词典',
  `source` smallint(6) NOT NULL DEFAULT '0' COMMENT '用户来源（用户注册，系统注册）',
  `comment` varchar(300) DEFAULT NULL,
  `default_account_id` bigint(20) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 导出  表 usermaster.user_passport 结构
CREATE TABLE IF NOT EXISTS `user_passport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `passport_type` smallint(6) NOT NULL COMMENT '通行证类型（短信，邮件，微信）系统词典',
  `passport_id` varchar(200) DEFAULT NULL COMMENT '通行证ID',
  `remark` varchar(200) DEFAULT NULL,
  `passport_status` smallint(6) NOT NULL COMMENT '通行证状态（未验证，已验证，超时）系统词典',
  `create_time` datetime DEFAULT NULL COMMENT '验证时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_user_passport` (`passport_type`,`passport_id`),
  KEY `fk_user_passport_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_passport_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- 正在导出表  usermaster.user_passport 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `user_passport` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_passport` ENABLE KEYS */;


-- 导出  视图 usermaster.account_view 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `account_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`paas`@`%` SQL SECURITY DEFINER VIEW `account_view` AS select `a`.`id` AS `account_id`,`a`.`username` AS `username`,`t`.`id` AS `tenant_id`,`t`.`domain` AS `domain`,`ar`.`id` AS `account_role_id`,`ar`.`role_id` AS `role_id`,`r`.`name` AS `role_name`,`r`.`description` AS `role_description`,`ar`.`status` AS `role_status`,`a`.`status` AS `account_status`,`a`.`type` AS `account_type` from (((`account` `a` left join `account_role` `ar` on((`a`.`id` = `ar`.`account_id`))) left join `role` `r` on((`ar`.`role_id` = `r`.`id`))) join `tenant` `t` on((`a`.`tenant_id` = `t`.`id`)));
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
