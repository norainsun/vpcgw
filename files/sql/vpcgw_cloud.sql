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

-- 导出 cloud 的数据库结构
CREATE DATABASE IF NOT EXISTS `cloud` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cloud`;


-- 导出  表 cloud.cloud_account 结构
CREATE TABLE IF NOT EXISTS `cloud_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_account 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_account` ENABLE KEYS */;


-- 导出  表 cloud.cloud_account_user 结构
CREATE TABLE IF NOT EXISTS `cloud_account_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `favoured` tinyint(1) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qibuyg0sdt652k7s3i6np56ko` (`account_id`),
  CONSTRAINT `FK_qibuyg0sdt652k7s3i6np56ko` FOREIGN KEY (`account_id`) REFERENCES `cloud_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_account_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_account_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_account_user` ENABLE KEYS */;


-- 导出  表 cloud.cloud_card 结构
CREATE TABLE IF NOT EXISTS `cloud_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `height` double(20,0) DEFAULT NULL,
  `width` double(20,0) DEFAULT NULL,
  `owner` varchar(255) NOT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parameters` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_card 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_card` ENABLE KEYS */;


-- 导出  表 cloud.cloud_card_service 结构
CREATE TABLE IF NOT EXISTS `cloud_card_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cardId` bigint(20) NOT NULL,
  `serviceId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_card_service 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_card_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_card_service` ENABLE KEYS */;


-- 导出  表 cloud.cloud_config 结构
CREATE TABLE IF NOT EXISTS `cloud_config` (
  `key` varchar(64) COLLATE utf8_bin NOT NULL,
  `value` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KEY_INDEX` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  cloud.cloud_config 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_config` ENABLE KEYS */;


-- 导出  表 cloud.cloud_invitation 结构
CREATE TABLE IF NOT EXISTS `cloud_invitation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `inviter` varchar(255) DEFAULT NULL,
  `userMail` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `userAccount` varchar(255) DEFAULT NULL,
  `inviteTime` datetime DEFAULT NULL,
  `againInviteTime` datetime DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  `registerStatus` bigint(11) DEFAULT NULL,
  `registerType` bigint(11) DEFAULT NULL,
  `inviteCode` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_invitation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_invitation` ENABLE KEYS */;


-- 导出  表 cloud.cloud_message 结构
CREATE TABLE IF NOT EXISTS `cloud_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `toTenantId` bigint(20) unsigned DEFAULT NULL,
  `theme` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `content` varchar(1000) NOT NULL,
  `messageType` int(11) NOT NULL,
  `isRead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_message 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_message` ENABLE KEYS */;


-- 导出  表 cloud.cloud_mobile_code 结构
CREATE TABLE IF NOT EXISTS `cloud_mobile_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_mobile_code 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_mobile_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_mobile_code` ENABLE KEYS */;


-- 导出  表 cloud.cloud_role 结构
CREATE TABLE IF NOT EXISTS `cloud_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `readOnly` tinyint(1) NOT NULL,
  `roleDisplayName` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `serviceId` bigint(20) NOT NULL,
  `serviceName` varchar(255) DEFAULT NULL,
  `display` tinyint(1) DEFAULT '1',
  `permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_role` ENABLE KEYS */;


-- 导出  表 cloud.cloud_server 结构
CREATE TABLE IF NOT EXISTS `cloud_server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpu` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `disk` bigint(20) NOT NULL,
  `mem` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `server_id` varchar(255) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  cloud.cloud_server 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_server` ENABLE KEYS */;


-- 导出  表 cloud.cloud_service 结构
CREATE TABLE IF NOT EXISTS `cloud_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `app` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `show` tinyint(3) unsigned DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `is_public` tinyint(3) unsigned DEFAULT '0',
  `public_only` tinyint(3) DEFAULT '0',
  `mandatory` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_service 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_service` ENABLE KEYS */;


-- 导出  表 cloud.cloud_service_instance 结构
CREATE TABLE IF NOT EXISTS `cloud_service_instance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `private_deploy` tinyint(3) DEFAULT NULL,
  `comment` varchar(2047) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_service_instance 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_service_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_service_instance` ENABLE KEYS */;


-- 导出  表 cloud.cloud_session_verifycode 结构
CREATE TABLE IF NOT EXISTS `cloud_session_verifycode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sessionKey` varchar(255) NOT NULL,
  `verifyCode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessionKey` (`sessionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_session_verifycode 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_session_verifycode` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_session_verifycode` ENABLE KEYS */;


-- 导出  表 cloud.cloud_tenant 结构
CREATE TABLE IF NOT EXISTS `cloud_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `external_account` tinyint(1) DEFAULT NULL,
  `internal_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `register_id` bigint(20) DEFAULT '0',
  `comment` varchar(2047) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `isPrivateDeployedEmailSent` tinyint(4) DEFAULT '0',
  `hasLogin` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ibhhkhdqcebq9ckcirx106bgf` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_tenant 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_tenant` ENABLE KEYS */;


-- 导出  表 cloud.cloud_tenant_bak 结构
CREATE TABLE IF NOT EXISTS `cloud_tenant_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `external_account` tinyint(1) DEFAULT NULL,
  `internal_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `register_id` bigint(20) DEFAULT '0',
  `comment` varchar(2047) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `isPrivateDeployedEmailSent` tinyint(4) DEFAULT '0',
  `hasLogin` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ibhhkhdqcebq9ckcirx106bgf` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_tenant_bak 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_tenant_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_tenant_bak` ENABLE KEYS */;


-- 导出  表 cloud.cloud_tenant_register 结构
CREATE TABLE IF NOT EXISTS `cloud_tenant_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `external_account` tinyint(1) DEFAULT '0',
  `internal_id` int(11) DEFAULT '0',
  `phone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `contact_name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `comment` varchar(2047) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `last_action_time` datetime DEFAULT NULL,
  `commentForSales` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IND_CLOUD_TENANT_REGISTER_DOMAIN` (`domain`) USING BTREE,
  KEY `IND_CLOUD_TENANT_REGISTER_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_tenant_register 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_tenant_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_tenant_register` ENABLE KEYS */;


-- 导出  表 cloud.cloud_tenant_service 结构
CREATE TABLE IF NOT EXISTS `cloud_tenant_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL,
  `private_deploy` tinyint(3) unsigned DEFAULT '0',
  `ready` tinyint(1) DEFAULT '0',
  `tenant_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_TENANT_SERVICE` (`tenant_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_tenant_service 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_tenant_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_tenant_service` ENABLE KEYS */;


-- 导出  表 cloud.cloud_tenant_service_register 结构
CREATE TABLE IF NOT EXISTS `cloud_tenant_service_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL,
  `private_deploy` tinyint(1) unsigned DEFAULT '0',
  `register_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_TENANT_SERVICE_REGISTER` (`register_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_tenant_service_register 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_tenant_service_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_tenant_service_register` ENABLE KEYS */;


-- 导出  表 cloud.cloud_tenant_storage 结构
CREATE TABLE IF NOT EXISTS `cloud_tenant_storage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auid` int(11) NOT NULL,
  `bucket_quota_enabled` tinyint(1) NOT NULL,
  `bucket_quota_max_objects` bigint(20) NOT NULL,
  `bucket_quota_max_size_kb` bigint(20) NOT NULL,
  `default_replacement` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `max_buckets` bigint(20) NOT NULL,
  `op_mask` varchar(255) NOT NULL,
  `suspended` tinyint(1) NOT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_quota_enabled` tinyint(1) NOT NULL,
  `user_quota_max_objects` bigint(20) NOT NULL,
  `user_quota_max_size_kb` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1j7c0snon1dqfj49nljcapg6c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  cloud.cloud_tenant_storage 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_tenant_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_tenant_storage` ENABLE KEYS */;


-- 导出  表 cloud.cloud_tenant_storage_key 结构
CREATE TABLE IF NOT EXISTS `cloud_tenant_storage_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_key` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `tenant_storage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g52h17lgxua09vb01nqoslbo1` (`tenant_storage_id`),
  CONSTRAINT `FK_g52h17lgxua09vb01nqoslbo1` FOREIGN KEY (`tenant_storage_id`) REFERENCES `cloud_tenant_storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 正在导出表  cloud.cloud_tenant_storage_key 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_tenant_storage_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_tenant_storage_key` ENABLE KEYS */;


-- 导出  表 cloud.cloud_url_instance 结构
CREATE TABLE IF NOT EXISTS `cloud_url_instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instanceName` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_url_instance 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_url_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_url_instance` ENABLE KEYS */;


-- 导出  表 cloud.cloud_user_layout 结构
CREATE TABLE IF NOT EXISTS `cloud_user_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principalName` varchar(255) NOT NULL,
  `layout` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `principalNameindex` (`principalName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_user_layout 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_user_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_user_layout` ENABLE KEYS */;


-- 导出  表 cloud.cloud_user_mail_bind 结构
CREATE TABLE IF NOT EXISTS `cloud_user_mail_bind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_user_mail_bind 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_user_mail_bind` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_user_mail_bind` ENABLE KEYS */;


-- 导出  表 cloud.cloud_validation_code 结构
CREATE TABLE IF NOT EXISTS `cloud_validation_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `code_type` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `register_id` bigint(20) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_itvwh1d4g6qon2j1jj2ofqvdx` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  cloud.cloud_validation_code 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `cloud_validation_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_validation_code` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
