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

-- 导出 mobilemaster 的数据库结构
CREATE DATABASE IF NOT EXISTS `mobilemaster` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mobilemaster`;


-- 导出  表 mobilemaster.device_token 结构
CREATE TABLE IF NOT EXISTS `device_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_token` varchar(255) DEFAULT NULL,
  `device_type` tinyint(4) DEFAULT NULL COMMENT '0 iPhone 1 iPad 2 Android百度联盟等等',
  `principal_name` varchar(255) DEFAULT NULL,
  `app_id` bigint(20) NOT NULL,
  `badge` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `device_token_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `mobile_app` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- 正在导出表  mobilemaster.device_token 的数据：~58 rows (大约)
/*!40000 ALTER TABLE `device_token` DISABLE KEYS */;
INSERT INTO `device_token` (`id`, `device_token`, `device_type`, `principal_name`, `app_id`, `badge`) VALUES
	(1, '321', 1, 'zhou.fang@datayes.com', 1, 0),
	(2, '', 1, '121FB568-3E8F-45D2-A6B3-865B5C986450@anonymous.com', 2, 24),
	(3, '4259977592668057848|587287174250215040', 3, '863637020079963@anonymous.com', 2, 0),
	(4, '698a90dd5bd272f564589d74441f5e5f94d46fe6444448c616ca1c30a4db2f15', 1, 'A9E1414C-4A88-427C-989C-72ED4B4513C9@anonymous.com', 2, 0),
	(5, '051a020a826dbc46e58f8d0c9b3be44efd80dd2759b05e0deb440e13e21d74ae', 1, 'FD82F932-87C0-41B5-BBF3-05A73024AFCC@anonymous.com', 2, 13),
	(6, '', 1, '4A28087D-4196-422C-AC34-499F88252E9D@anonymous.com', 2, 0),
	(7, 'ac3437c076c3c36628d8b68f36e36eead3f973b1077996b4fcf3198956e95866', 1, '11F95867-23B1-40D7-B900-A7E4C024D189@anonymous.com', 2, 0),
	(8, '', 1, 'EC9D0A4E-DFDF-49B7-BFAF-5CC78FA2122B@anonymous.com', 2, 24),
	(9, '3a2934db567f8280ad6fd70233c9c9bc7806b9e097e15e162a0892416ec4cb29', 1, 'E34C22D8-6E31-4077-B2F7-B941055DC086@anonymous.com', 2, 38),
	(10, '4014180123068923201|950701193865980653', 3, '868331012115432@anonymous.com', 2, 0),
	(11, '4027279938324057018|1018773708270983993', 3, '359535052203256@anonymous.com', 2, 0),
	(12, '', 1, 'FD9C7191-8B72-4E8A-A820-C031FE6EE9FC@anonymous.com', 2, 30),
	(13, '', 1, 'E50667AA-11F0-40F7-9A98-DC47299BB25E@anonymous.com', 2, 4),
	(14, 'fc7fef9131119b147f511bcdb98dabe6560bee8be703118cc5909c91bca57ee4', 1, '9C64636B-6126-4198-9F04-4C66D04ECFA4@anonymous.com', 2, 63),
	(15, 'ce69a3d27f9943eac0930106f30b738e0121e3562be9ca6c36e0b9f4e69d9412', 1, '83869A45-5E9C-4879-ADB2-02F553B5C9CD@anonymous.com', 2, 35),
	(16, 'a6a857da016e5f6b28b324b264080d25ab7eb0705bc458400d5e4a3417b70fe2', 1, '5458295E-BE5D-48BC-A9CE-14C20C93CFE8@anonymous.com', 2, 109),
	(17, '147c7f4044f26d99a77a91f1b8aadaa81aaf6a2cd3828b23ab215ced69d0feb9', 1, '62E3803A-292F-40F6-9024-A05A9645EC3F@anonymous.com', 2, 40),
	(18, 'a4286164bf683dae90d1aea98bce3b612d61a0b66e62492c39f888f5d5e8293f', 1, 'D9950D86-DD95-43A1-BE1E-90C13D8C3B5B@anonymous.com', 2, 16),
	(19, '9e8d0b854b3726c1e9c67bd763fb60ce024650ac563ec7d31215cb62d804c1d3', 1, '9C5B68E2-C7FC-4531-8420-40115CC8CA58@anonymous.com', 2, 0),
	(20, '2acea83c19131d1dcb9f0fd9a196bc6d4406b5dd1d235432059c363b1595546a', 1, '55C8384C-FAF2-4B9F-A1FF-10228CE6B7DC@anonymous.com', 2, 19),
	(21, 'c336f3ec338b37198f95b11a58868d63d143bb2e23010dc2c05149cd9ce279f1', 1, '1162A7DA-0E14-4968-BFB6-AE64B32E0DED@anonymous.com', 2, 17),
	(22, 'bee6bd2644f1032343e9ce895fc400e40fb3652673ceee3002139edf97606e7b', 1, '949C51CF-3373-4678-8F76-57FB76D97573@anonymous.com', 2, 0),
	(23, 'efa719051fd2b59131f11418e7a84b82d5239d8dd0db1f57997600b2f3e64553', 1, '924A688C-59D1-4195-A042-279F7EBC8776@anonymous.com', 2, 36),
	(24, '204f1536a8ee043b0065631eca10ab1c891e848a7094046fd882a7b2d365ecc5', 1, '131D7A85-EAB2-4B19-A142-0DC8E0C41BE9@anonymous.com', 2, 0),
	(25, '4469113687240452022|692198654274864049', 3, '864103024681006@anonymous.com', 2, 0),
	(26, '3776407220070758849|598374582344877750', 3, '863908025353210@anonymous.com', 2, 0),
	(27, 'ca19733b28b23c7480aaa138eba8535f5b2cf29e3bd067b7a39ed70d7cee514b', 1, '69AD2B4C-B8B5-420E-B55F-C2744124C40C@anonymous.com', 2, 0),
	(28, '4402854290552309103|732274503996641766', 3, '355637057795296@anonymous.com', 2, 0),
	(29, '51c18251d51424e67310a2cbd35da7443c5260d03b34c6ec1a1d64919ca8dfc6', 1, '3B003C91-E4CB-4B17-AAF3-1A558FAE589D@anonymous.com', 2, 1),
	(30, '4584475098660185307|1133086369258184182', 3, '863396020695498@anonymous.com', 2, 0),
	(31, '4217890953447133690|723213085380270625', 3, '862396020165444@anonymous.com', 2, 0),
	(32, '3751064272066656823|955338131876244231', 3, '863121020323093@anonymous.com', 2, 0),
	(33, '8926eb24dd17f1a70521644b005f0c0bf98532c667d2e6aa17f1d053f4893020', 1, '2BA8D553-F14C-408E-9C36-4CA6EE4C248B@anonymous.com', 2, 1),
	(34, '4325445651736013732|1058667341151355005', 3, '000000000000000@anonymous.com', 2, 0),
	(35, '8d191c2929551381005e0d6a11f5ba30bc7d73b92ba3fd66a81e31e89ded5625', 1, '9EE3594F-3B60-4587-B1E4-80E2AA11DD22@anonymous.com', 2, 0),
	(36, '0617b0554a6c9930f72e7b31494b6e4d8613083b10747691564d49e0a56c77b1', 1, '42B29BFE-593E-4115-93D7-3C85BC55FCA4@anonymous.com', 2, 0),
	(37, '4377344215656046166|582953320453700537', 3, '863990021394091@anonymous.com', 2, 0),
	(38, '3940043760027295666|1061182908491300192', 3, 'a000004f709430@anonymous.com', 2, 0),
	(39, '9587b00b6082b9367841007576d68d023f6a2af1d239502b61ff0921af93e90c', 1, 'F6268BEC-E184-44B0-8731-DACB4F5437C6@anonymous.com', 2, 0),
	(40, 'd71b25d317852e9b71ec486cdac145c7eba1700fe7d4b07fa5a3a4167faf4774', 1, '8550C66A-1CC9-4CCF-AFCB-F980EAFAB3AF@anonymous.com', 2, 39),
	(41, '4534118362000868019|724208106641695676', 3, '860463021149223@anonymous.com', 2, 0),
	(42, '4197525194342880256|863377544824800179', 3, '866330020594093@anonymous.com', 2, 0),
	(43, '4226066577747051683|1078073859301583418', 3, '359681050460934@anonymous.com', 2, 0),
	(44, '6841fb5c106b5fafd27e3b15c4537f7649926fb7a11a568d7218edf8a78be565', 1, 'CB8C6BB6-65C9-4D62-8A64-8C2673015139@anonymous.com', 2, 0),
	(45, 'a6a857da016e5f6b28b324b264080d25ab7eb0705bc458400d5e4a3417b70fe2', 1, '467E9451-3369-473D-AA7F-620FDEC32C3F@anonymous.com', 2, 109),
	(46, 'a6a857da016e5f6b28b324b264080d25ab7eb0705bc458400d5e4a3417b70fe2', 1, 'E469D031-9E9D-49D1-98F2-63CCF9B8B529@anonymous.com', 2, 47),
	(47, '4130640993358716983|635158348256497304', 3, '352107066077055@anonymous.com', 2, 0),
	(48, 'dac365f39ad2d188a37240d013c6d438d180ba9f874e080a6d634c595801e654', 1, '34759A2F-D2B2-4B9E-B889-D8045E8C669C@anonymous.com', 2, 0),
	(49, '8b356a8f0bf4c23cc70649530bc35a88241f60898ab3d8a0a1fe71adb9b76681', 1, 'C500CE71-39F3-4AF8-A7F7-316BA44EBF9B@anonymous.com', 2, 35),
	(50, '11fd08842a326230a4628ee47badd2d0afd550e0df8884646f402da263af0ba8', 1, '250D0323-AE6C-4368-8A87-18ADBD3D4EF5@anonymous.com', 2, 35),
	(51, '', 1, 'ACEB2FDD-213C-4BAF-A6EA-4DFAA33630E6@anonymous.com', 2, 22),
	(52, '9d44c2faf41e3ccc4175746124f02ba232e6125ba573b59226008a0e52af65ac', 1, '6F3AD335-FB4E-49C9-8D8C-9F10A59AE0E9@anonymous.com', 2, 0),
	(53, '4498475399800807874|1023222991188635601', 3, '355533053433729@anonymous.com', 2, 0),
	(54, '4043442765380264521|1011383396945622817', 3, '356000052586807@anonymous.com', 2, 0),
	(55, '7f084b8cdffd93cba6009d344d23e2f42437bcb22d645167f7b85c20d5c55dd4', 1, '24056ED8-757C-4E32-98B7-E100D63AAE67@anonymous.com', 2, 0),
	(56, '5bf33acd835e784ceecfeb0d932f2b184207739972cae5ceda971456670efb38', 1, '6C4847B5-3998-4621-AC30-04D56FB85FC2@anonymous.com', 2, 0),
	(57, '4063724040913754164|957707896889165614', 3, '357633050932869@anonymous.com', 2, 0),
	(58, '3684975799916963654|879867939007854792', 3, '864895024460220@anonymous.com', 2, 0);
/*!40000 ALTER TABLE `device_token` ENABLE KEYS */;


-- 导出  表 mobilemaster.mobile_app 结构
CREATE TABLE IF NOT EXISTS `mobile_app` (
  `id` bigint(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `current_version` varchar(45) DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `app_type` tinyint(4) DEFAULT NULL COMMENT '0 iOS 1 Android',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mobilemaster.mobile_app 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `mobile_app` DISABLE KEYS */;
INSERT INTO `mobile_app` (`id`, `name`, `current_version`, `last_update_time`, `app_type`) VALUES
	(0, 'datayes_service', '1.0.0', '2015-04-09 17:51:06', 2),
	(1, 'sns', '1.5.11', '2014-11-12 00:00:00', 0),
	(2, 'robot', '1.0.0', '2015-01-12 14:14:21', 0),
	(3, 'robo', '1.0.0', '2015-04-10 09:55:49', 2),
	(4, 'login', '1.0.0', '2015-04-10 09:55:49', 2);
/*!40000 ALTER TABLE `mobile_app` ENABLE KEYS */;


-- 导出  表 mobilemaster.mobile_app_version 结构
CREATE TABLE IF NOT EXISTS `mobile_app_version` (
  `id` bigint(20) NOT NULL,
  `mobile_app_id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `feature` text,
  `create_date` datetime DEFAULT NULL,
  `version` varchar(30) DEFAULT NULL,
  `install_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mobile_app_version_mobile_app_idx` (`mobile_app_id`),
  CONSTRAINT `fk_mobile_app_version_mobile_app` FOREIGN KEY (`mobile_app_id`) REFERENCES `mobile_app` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mobilemaster.mobile_app_version 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `mobile_app_version` DISABLE KEYS */;
INSERT INTO `mobile_app_version` (`id`, `mobile_app_id`, `title`, `feature`, `create_date`, `version`, `install_url`) VALUES
	(1, 1, '发现新版本V1.5.11', '1.优化了流程管理，在3G网络情况下也能快速完成流程审批和管理 2.修复了上版本的一些Bugs', '2014-11-12 00:00:00', '1.5.11', 'http://www.datayes.com/#/mobile');
/*!40000 ALTER TABLE `mobile_app_version` ENABLE KEYS */;


-- 导出  表 mobilemaster.weixin_open_account 结构
CREATE TABLE IF NOT EXISTS `weixin_open_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_code` varchar(255) NOT NULL DEFAULT '',
  `app_id` varchar(255) NOT NULL DEFAULT '',
  `app_secret` varchar(255) NOT NULL DEFAULT '',
  `mobile_app_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_app_id` (`mobile_app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  mobilemaster.weixin_open_account 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `weixin_open_account` DISABLE KEYS */;
INSERT INTO `weixin_open_account` (`id`, `app_code`, `app_id`, `app_secret`, `mobile_app_id`) VALUES
	(6, 'datayes_service', 'wxcbc18c8cd4afc580', 'a7132488823c4bf717452672d763413b', 0),
	(7, 'robo', 'wxc6773613f4e5e17e', '82ca6d668a358306ffb3df691eb6ddd3', 3),
	(8, 'login', 'wx32101e21e1a4727f', 'f4934b7694de41cc15b102e5d38a21f3', 4);
/*!40000 ALTER TABLE `weixin_open_account` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
