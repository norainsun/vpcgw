-- --------------------------------------------------------
-- 主机:                           10.22.225.57
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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

-- 数据导出被取消选择。


-- 导出  表 usermaster.application_info 结构
CREATE TABLE IF NOT EXISTS `application_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `logo` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 usermaster.application_type 结构
CREATE TABLE IF NOT EXISTS `application_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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

-- 数据导出被取消选择。


-- 导出  表 usermaster.appmaster_operation_map_role 结构
CREATE TABLE IF NOT EXISTS `appmaster_operation_map_role` (
  `application_operation_id` bigint(20) NOT NULL,
  `application_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`application_operation_id`,`application_role_id`),
  KEY `index_roleid_opId` (`application_operation_id`,`application_role_id`),
  KEY `fk_roleId` (`application_role_id`),
  CONSTRAINT `fk_roleId` FOREIGN KEY (`application_role_id`) REFERENCES `appmaster_application_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 usermaster.category 结构
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 usermaster.config 结构
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL,
  `config_name` varchar(100) NOT NULL COMMENT '配置名',
  `config_type` varchar(50) NOT NULL COMMENT '配置类型（String，Int.....）',
  `config_value` varchar(300) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 usermaster.dict_category 结构
CREATE TABLE IF NOT EXISTS `dict_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '词典名',
  `type` varchar(50) NOT NULL COMMENT '词典数据类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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

-- 数据导出被取消选择。


-- 导出  表 usermaster.image 结构
CREATE TABLE IF NOT EXISTS `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL,
  `image` mediumblob,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- 正在导出表  usermaster.tenant 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` (`id`, `status`, `comment`, `domain`, `use_tenant_password`, `multifactor_login`, `open_for_apply`, `create_time`, `update_time`) VALUES
        (1, 0, NULL, 'leitoncapital.com', 0, 0, NULL, '2015-05-25 15:20:43', '2015-06-25 13:52:47');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;



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


-- 正在导出表  usermaster.tenant_profile 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tenant_profile` DISABLE KEYS */;
INSERT INTO `tenant_profile` (`id`, `name`, `web`, `mail`, `contact`, `phone`, `tenant_id`, `description`, `icon`, `creator_id`, `create_time`, `update_time`) VALUES
	(1, 'vpc', NULL, 'yun@datayes.com', NULL, NULL, 1, 'vpc', NULL, 0, '2015-06-25 13:52:47', '2015-06-25 13:52:47');
/*!40000 ALTER TABLE `tenant_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;



-- 导出  表 usermaster.timestamps 结构
CREATE TABLE IF NOT EXISTS `timestamps` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  视图 usermaster.account_view 结构
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `account_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`paas`@`%` SQL SECURITY DEFINER VIEW `account_view` AS select `a`.`id` AS `account_id`,`a`.`username` AS `username`,`t`.`id` AS `tenant_id`,`t`.`domain` AS `domain`,`ar`.`id` AS `account_role_id`,`ar`.`role_id` AS `role_id`,`r`.`name` AS `role_name`,`r`.`description` AS `role_description`,`ar`.`status` AS `role_status`,`a`.`status` AS `account_status`,`a`.`type` AS `account_type` from (((`account` `a` left join `account_role` `ar` on((`a`.`id` = `ar`.`account_id`))) left join `role` `r` on((`ar`.`role_id` = `r`.`id`))) join `tenant` `t` on((`a`.`tenant_id` = `t`.`id`)));
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
