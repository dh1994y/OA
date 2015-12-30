/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.20 : Database - oa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oa`;

/*Table structure for table `equipment` */

DROP TABLE IF EXISTS `equipment`;

CREATE TABLE `equipment` (
  `id` varchar(255) NOT NULL,
  `equipName` varchar(255) DEFAULT NULL,
  `equipNum` int(11) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `equipType` varchar(255) DEFAULT NULL,
  `equipSpec` varchar(255) DEFAULT NULL,
  `equipVender` varchar(255) DEFAULT NULL,
  `equipStatus` varchar(255) DEFAULT NULL,
  `comment` text,
  `createUser` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastModifyUser` varchar(255) DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `equipment` */

insert  into `equipment`(`id`,`equipName`,`equipNum`,`department`,`equipType`,`equipSpec`,`equipVender`,`equipStatus`,`comment`,`createUser`,`createDate`,`lastModifyUser`,`lastModifyDate`,`isDelete`) values ('ff80808151d7c35f0151d7c44bd00001','服务器',0,'技术部','通讯','大型','科创','报废','卡卡卡卡卡','40287d8f51ccde0b0151cce2cd630004','2015-12-25 14:12:24','40287d8f51ccde0b0151cce2cd630004','2015-12-25 17:41:44',0),('ff80808151d7c5560151d7c75f460001','无线电',0,'技术部','无线','小型','普拓','正常',NULL,'40287d8f51ccde0b0151cce2cd630004','2015-12-25 14:15:46',NULL,NULL,0),('ff80808151d7d3a00151d7d8ea910002','无线电',1,'总裁办','通讯','小型','普拓','正常','','40287d8f51ccde0b0151cce2cd630004','2015-12-25 14:34:49','40287d8f51ccde0b0151cce2cd630004','2015-12-26 00:09:56',0),('ff80808151d80a380151d80af8a10001','服务器',1,'技术部','通讯','中型','科创','正常','呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-25 15:29:36',NULL,NULL,0);

/*Table structure for table `equipment_maintenance` */

DROP TABLE IF EXISTS `equipment_maintenance`;

CREATE TABLE `equipment_maintenance` (
  `id` varchar(255) NOT NULL,
  `equipId` varchar(255) DEFAULT NULL,
  `maintenanceUser` varchar(255) DEFAULT NULL,
  `maintenanceDate` datetime DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `equipment_maintenance` */

insert  into `equipment_maintenance`(`id`,`equipId`,`maintenanceUser`,`maintenanceDate`,`comment`) values ('402881e751d9dff60151d9e88c730004','ff80808151d7d3a00151d7d8ea910002','40287d8f51ccde0b0151cce2cd630004','2015-12-26 00:11:14','修好了');

/*Table structure for table `equipment_reject` */

DROP TABLE IF EXISTS `equipment_reject`;

CREATE TABLE `equipment_reject` (
  `id` varchar(255) NOT NULL,
  `equipId` varchar(255) DEFAULT NULL,
  `rejectUser` varchar(255) DEFAULT NULL,
  `rejectDate` datetime DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `equipment_reject` */

/*Table structure for table `matter` */

DROP TABLE IF EXISTS `matter`;

CREATE TABLE `matter` (
  `id` varchar(100) NOT NULL COMMENT 'id',
  `matter` text COMMENT '代办事宜',
  `feel` text COMMENT '最近心情',
  `createDate` datetime DEFAULT NULL COMMENT '创建日期',
  `createUser` varchar(100) DEFAULT NULL COMMENT '创建人id',
  `lastUpdateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `matter` */

insert  into `matter`(`id`,`matter`,`feel`,`createDate`,`createUser`,`lastUpdateDate`) values ('40287d8f51a418da0151a419715b0001','<p style=\"text-indent:2em;\" align=\"center\">\r\n	<span style=\"color:#4C33E5;font-family:FangSong_GB2312;font-size:24px;\"><br />\r\n</span> \r\n</p>\r\n<h1 align=\"center\">\r\n	<span style=\"color:#337FE5;font-family:FangSong_GB2312;font-size:32px;\">用户模块的搭建</span>\r\n</h1>\r\n<p style=\"text-indent:2em;\">\r\n	<br />\r\n</p>','<h1 align=\"center\">\r\n	<img style=\"width:252px;height:257px;\" alt=\"\" src=\"/oa/resource/kindeditor/attached/image/20151216/20151216102827_277.png\" height=\"565\" width=\"495\" /><br />\r\n</h1>',NULL,'123','2015-12-17 09:31:40'),('40287d8f51b3fdf00151b4011dcb0001','<div align=\"center\">\r\n	<span style=\"color:#337FE5;font-size:16px;\"><strong>jquery validate</strong></span><br />\r\n<br />\r\n<br />\r\n<span style=\"color:#337FE5;font-size:16px;\"><strong> datatables 插件</strong></span><br />\r\n<br />\r\n<br />\r\n<span style=\"color:#337FE5;font-size:16px;\"><strong>设备管理模块</strong></span><br />\r\n</div>','<h1 align=\"center\">\r\n	<br />\r\n<strong><span style=\"background-color:#FFFFFF;color:#337FE5;font-family:NSimSun;font-size:32px;\"></span></strong>\r\n</h1>\r\n<h1 align=\"center\">\r\n	<strong><span style=\"background-color:#FFFFFF;color:#337FE5;font-family:NSimSun;font-size:32px;\">呵呵哒</span></strong>\r\n</h1>',NULL,'1','2015-12-21 16:32:03'),('40287d8f51d30dfc0151d31bc12a0001','<p align=\"center\">\r\n	<span style=\"font-size:32px;font-family:FangSong_GB2312;\"><br />\r\n</span> \r\n</p>\r\n<p align=\"center\">\r\n	<span style=\"font-size:32px;font-family:FangSong_GB2312;color:#00D5FF;\">权限</span> \r\n</p>','<div align=\"center\">\r\n	<p>\r\n		<span style=\"font-family:NSimSun;font-size:32px;\"><br />\r\n</span> \r\n	</p>\r\n	<p>\r\n		<span style=\"font-family:NSimSun;font-size:32px;color:#00D5FF;\">呵呵哒。。</span> \r\n	</p>\r\n</div>',NULL,'40287d8f51ccde0b0151cce2cd630004','2015-12-30 08:55:41');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `orderValue` int(11) DEFAULT NULL,
  `parentId` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `isUse` int(1) DEFAULT NULL,
  `menuId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33155F499C5AF0` (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`level`,`orderValue`,`parentId`,`url`,`isUse`,`menuId`) values ('(NUL1L)',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('a01','我的面板',1,1,NULL,NULL,1,NULL),('a02','系统管理',1,2,NULL,NULL,1,NULL),('a03','工作流程管理',1,3,NULL,NULL,1,NULL),('a04','设备管理',1,4,NULL,NULL,1,NULL),('a05','字典管理',1,5,NULL,NULL,0,NULL),('a06','日志管理',1,6,NULL,NULL,0,NULL),('c01','代办事宜',2,1,'a01','/oa/myPanel/matter/matterAction_home.action',1,NULL),('c02','个人信息维护',2,2,'a01','/oa/myPanel/personal/personalInfoAction_home.action',1,NULL),('c03','修改密码',2,3,'a01','/oa/myPanel/personal/personalInfoAction_editPwd.action',1,NULL),('c04','用户管理',2,1,'a02','/oa/system/user/userAction_home.action',1,NULL),('c05','权限管理',2,2,'a02','/oa/system/auth/authAction_roleHome.action',1,NULL),('c06','工作流程申请',2,1,'a03','xxx',1,NULL),('c07','我的申请查询',2,2,'a03','xxx',1,NULL),('c08','待我审批',2,3,'a03','xxx',1,NULL),('c09','申请归档模块',2,4,'a03','xxx',1,NULL),('c10','工作流程部署',2,5,'a03','xxx',1,NULL),('c11','设备基本信息维护',2,1,'a04','/oa/equipment/equipmentAction_home.action',1,NULL),('c12','设备维护记录',2,2,'a04','/oa/equipment/equipmentMaintenanceAction_home.action',0,NULL),('c13','设备报废记录',2,3,'a04','/oa/equipment/equipmentRejectAction_home.action',0,NULL);

/*Table structure for table `menu_permission` */

DROP TABLE IF EXISTS `menu_permission`;

CREATE TABLE `menu_permission` (
  `menuId` varchar(100) DEFAULT NULL COMMENT '菜单id',
  `permissionId` varchar(100) DEFAULT NULL COMMENT '权限id',
  KEY `menuId` (`menuId`),
  KEY `permissionId` (`permissionId`),
  CONSTRAINT `menu_permission_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_permission_ibfk_2` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu_permission` */

insert  into `menu_permission`(`menuId`,`permissionId`) values ('c04','puser01'),('c04','puser02'),('c04','puser03'),('c04','puser04'),('c04','puser05'),('c04','puser06'),('c04','puser07'),('c04','puser08'),('c04','puser09'),('c11','pequip01'),('c11','pequip02'),('c11','pequip03'),('c11','pequip04'),('c11','pequip05'),('c11','pequip06'),('c11','pequip07'),('c11','pequip08'),('c11','pequip09'),('c11','pequipM02'),('c11','pequipM03'),('c11','pequipR02'),('c11','pequipR03'),('c05','pauth01'),('c05','pauth02'),('c05','pauth03'),('c05','pauth04'),('c05','pauth05');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` varchar(100) NOT NULL,
  `actionName` varchar(255) DEFAULT NULL COMMENT '访问路径',
  PRIMARY KEY (`id`),
  UNIQUE KEY `actionName` (`actionName`),
  KEY `FKE125C5CF89D6B63A` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

insert  into `permission`(`id`,`actionName`) values ('pauth01','authAction_findFunctionsByRoleId'),('pauth04','authAction_queryUser'),('pauth03','authAction_roleHome'),('pauth02','authAction_updateRole'),('pauth05','authAction_updateUserRole'),('pequip09','equipmentAction_checkStatus'),('pequip07','equipmentAction_delete'),('pequip02','equipmentAction_detail'),('pequip05','equipmentAction_equipAdd'),('pequip03','equipmentAction_equpEdit'),('pequip01','equipmentAction_home'),('pequip08','equipmentAction_page'),('pequip06','equipmentAction_save'),('pequip04','equipmentAction_update'),('pequipM02','equipmentMaintenanceAction_add'),('pequipM04','equipmentMaintenanceAction_detail'),('pequipM01','equipmentMaintenanceAction_home'),('pequipM03','equipmentMaintenanceAction_save'),('pequipR02','equipmentRejectAction_add'),('pequipR04','equipmentRejectAction_detail'),('pequipR01','equipmentRejectAction_home'),('pequipR03','equipmentRejectAction_save'),('puser04','userAction_add'),('puser09','userAction_checkAccountUnique'),('puser07','userAction_delete'),('puser01','userAction_home'),('puser08','userAction_page'),('puser06','userAction_update'),('puser03','userAction_userAdd'),('puser02','userAction_userDetail'),('puser05','userAction_userEdit');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` varchar(100) NOT NULL,
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`) values ('r01','系统管理员'),('r03','经理'),('r02','设备管理员'),('r04','通用');

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `roleId` varchar(100) DEFAULT NULL COMMENT '角色id',
  `menuId` varchar(100) DEFAULT NULL COMMENT '菜单id',
  KEY `roleId` (`roleId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_menu` */

insert  into `role_menu`(`roleId`,`menuId`) values ('r01','c01'),('r01','c02'),('r01','c03'),('r01','c04'),('r01','c05'),('r01','c06'),('r01','c07'),('r01','c08'),('r01','c09'),('r01','c10'),('r01','c11'),('r03','c01'),('r03','c02'),('r03','c03'),('r03','c06'),('r03','c07'),('r03','c08'),('r04','c01'),('r04','c02'),('r04','c03'),('r04','c06'),('r04','c07'),('r02','c03'),('r02','c01'),('r02','c07'),('r02','c06'),('r02','c11'),('r02','c02');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Id` varchar(100) NOT NULL,
  `account` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mobilephone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `isDuty` varchar(30) DEFAULT NULL,
  `units` varchar(30) DEFAULT NULL,
  `onDutyDate` date DEFAULT NULL,
  `offDutyDate` date DEFAULT NULL,
  `comment` text,
  `createUser` varchar(100) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastModifyUser` varchar(100) DEFAULT NULL,
  `lastModifyDate` datetime DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`Id`,`account`,`password`,`username`,`gender`,`birthday`,`telephone`,`mobilephone`,`email`,`address`,`isDuty`,`units`,`onDutyDate`,`offDutyDate`,`comment`,`createUser`,`createDate`,`lastModifyUser`,`lastModifyDate`,`isDelete`) values ('40287d8f51ccde0b0151cce2cd630004','admin','21232f297a57a5a743894a0e4a801fc3','admin','男','2015-12-15','123456789','15566665555','1234@qq.com','china','在职','技术部','2015-12-23',NULL,'admin','40287d8f51cd51890151cd8a64e40001','2015-12-23 11:29:54','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:28:02',0),('40287d8f51cd51890151cd8a64e40001','root','670b14728ad9902aecba32e22fa4f6bd','零落','男','2015-12-22','','15555555555','1555555555@163','china','在职','技术部','2015-12-23',NULL,'专注开发一百年。。','40287d8f51ccde0b0151cce2cd630004','2015-12-23 14:32:57','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:28:34',0),('402881e751d473d20151d476fd790001','hehe0','670b14728ad9902aecba32e22fa4f6bd','呵呵哒0','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476fdf40002','hehe1','670b14728ad9902aecba32e22fa4f6bd','呵呵哒1','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476fe3e0003','hehe2','670b14728ad9902aecba32e22fa4f6bd','呵呵哒2','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476fe8d0004','hehe3','670b14728ad9902aecba32e22fa4f6bd','呵呵哒3','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476feba0005','hehe4','670b14728ad9902aecba32e22fa4f6bd','呵呵哒4','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476ff540006','hehe5','670b14728ad9902aecba32e22fa4f6bd','呵呵哒5','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476ff810007','hehe6','670b14728ad9902aecba32e22fa4f6bd','呵呵哒6','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476ffad0008','hehe7','670b14728ad9902aecba32e22fa4f6bd','呵呵哒7','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476ffd10009','hehe8','670b14728ad9902aecba32e22fa4f6bd','呵呵哒8','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d476fffd000a','hehe9','670b14728ad9902aecba32e22fa4f6bd','呵呵哒9','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477002a000b','hehe10','670b14728ad9902aecba32e22fa4f6bd','呵呵哒10','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770054000c','hehe11','670b14728ad9902aecba32e22fa4f6bd','呵呵哒11','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770080000d','hehe12','670b14728ad9902aecba32e22fa4f6bd','呵呵哒12','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47700a2000e','hehe13','670b14728ad9902aecba32e22fa4f6bd','呵呵哒13','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47700c8000f','hehe14','670b14728ad9902aecba32e22fa4f6bd','呵呵哒14','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47701130010','hehe15','670b14728ad9902aecba32e22fa4f6bd','呵呵哒15','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477013d0011','hehe16','670b14728ad9902aecba32e22fa4f6bd','呵呵哒16','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477015e0012','hehe17','670b14728ad9902aecba32e22fa4f6bd','呵呵哒17','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47701800013','hehe18','670b14728ad9902aecba32e22fa4f6bd','呵呵哒18','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47701a40014','hehe19','670b14728ad9902aecba32e22fa4f6bd','呵呵哒19','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47701ce0015','hehe20','670b14728ad9902aecba32e22fa4f6bd','呵呵哒20','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47701ee0016','hehe21','670b14728ad9902aecba32e22fa4f6bd','呵呵哒21','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47702180017','hehe22','670b14728ad9902aecba32e22fa4f6bd','呵呵哒22','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477023c0018','hehe23','670b14728ad9902aecba32e22fa4f6bd','呵呵哒23','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477025e0019','hehe24','670b14728ad9902aecba32e22fa4f6bd','呵呵哒24','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770286001a','hehe25','670b14728ad9902aecba32e22fa4f6bd','呵呵哒25','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47702ac001b','hehe26','670b14728ad9902aecba32e22fa4f6bd','呵呵哒26','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770303001c','hehe27','670b14728ad9902aecba32e22fa4f6bd','呵呵哒27','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770348001d','hehe28','670b14728ad9902aecba32e22fa4f6bd','呵呵哒28','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770374001e','hehe29','670b14728ad9902aecba32e22fa4f6bd','呵呵哒29','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770395001f','hehe30','670b14728ad9902aecba32e22fa4f6bd','呵呵哒30','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47703b60020','hehe31','670b14728ad9902aecba32e22fa4f6bd','呵呵哒31','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47703db0021','hehe32','670b14728ad9902aecba32e22fa4f6bd','呵呵哒32','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704040022','hehe33','670b14728ad9902aecba32e22fa4f6bd','呵呵哒33','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704250023','hehe34','670b14728ad9902aecba32e22fa4f6bd','呵呵哒34','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704470024','hehe35','670b14728ad9902aecba32e22fa4f6bd','呵呵哒35','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704680025','hehe36','670b14728ad9902aecba32e22fa4f6bd','呵呵哒36','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704890026','hehe37','670b14728ad9902aecba32e22fa4f6bd','呵呵哒37','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704af0027','hehe38','670b14728ad9902aecba32e22fa4f6bd','呵呵哒38','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704d70028','hehe39','670b14728ad9902aecba32e22fa4f6bd','呵呵哒39','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47704f80029','hehe40','670b14728ad9902aecba32e22fa4f6bd','呵呵哒40','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477051a002a','hehe41','670b14728ad9902aecba32e22fa4f6bd','呵呵哒41','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477053c002b','hehe42','670b14728ad9902aecba32e22fa4f6bd','呵呵哒42','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770569002c','hehe43','670b14728ad9902aecba32e22fa4f6bd','呵呵哒43','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477058c002d','hehe44','670b14728ad9902aecba32e22fa4f6bd','呵呵哒44','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47705b5002e','hehe45','670b14728ad9902aecba32e22fa4f6bd','呵呵哒45','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47705d6002f','hehe46','670b14728ad9902aecba32e22fa4f6bd','呵呵哒46','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47705f80030','hehe47','670b14728ad9902aecba32e22fa4f6bd','呵呵哒47','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47706190031','hehe48','670b14728ad9902aecba32e22fa4f6bd','呵呵哒48','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477063e0032','hehe49','670b14728ad9902aecba32e22fa4f6bd','呵呵哒49','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47706670033','hehe50','670b14728ad9902aecba32e22fa4f6bd','呵呵哒50','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47706890034','hehe51','670b14728ad9902aecba32e22fa4f6bd','呵呵哒51','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47706ec0035','hehe52','670b14728ad9902aecba32e22fa4f6bd','呵呵哒52','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477070e0036','hehe53','670b14728ad9902aecba32e22fa4f6bd','呵呵哒53','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477072f0037','hehe54','670b14728ad9902aecba32e22fa4f6bd','呵呵哒54','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47707540038','hehe55','670b14728ad9902aecba32e22fa4f6bd','呵呵哒55','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477077f0039','hehe56','670b14728ad9902aecba32e22fa4f6bd','呵呵哒56','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47707aa003a','hehe57','670b14728ad9902aecba32e22fa4f6bd','呵呵哒57','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47707cb003b','hehe58','670b14728ad9902aecba32e22fa4f6bd','呵呵哒58','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47707ed003c','hehe59','670b14728ad9902aecba32e22fa4f6bd','呵呵哒59','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770819003d','hehe60','670b14728ad9902aecba32e22fa4f6bd','呵呵哒60','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d477083d003e','hehe61','670b14728ad9902aecba32e22fa4f6bd','呵呵哒61','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770868003f','hehe62','670b14728ad9902aecba32e22fa4f6bd','呵呵哒62','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47708930040','hehe63','670b14728ad9902aecba32e22fa4f6bd','呵呵哒63','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47708b40041','hehe64','670b14728ad9902aecba32e22fa4f6bd','呵呵哒64','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47708d60042','hehe65','670b14728ad9902aecba32e22fa4f6bd','呵呵哒65','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47708fa0043','hehe66','670b14728ad9902aecba32e22fa4f6bd','呵呵哒66','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47709240044','hehe67','670b14728ad9902aecba32e22fa4f6bd','呵呵哒67','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47709450045','hehe68','670b14728ad9902aecba32e22fa4f6bd','呵呵哒68','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47709660046','hehe69','670b14728ad9902aecba32e22fa4f6bd','呵呵哒69','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47709880047','hehe70','670b14728ad9902aecba32e22fa4f6bd','呵呵哒70','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47709a90048','hehe71','670b14728ad9902aecba32e22fa4f6bd','呵呵哒71','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47709cf0049','hehe72','670b14728ad9902aecba32e22fa4f6bd','呵呵哒72','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d47709f6004a','hehe73','670b14728ad9902aecba32e22fa4f6bd','呵呵哒73','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770a19004b','hehe74','670b14728ad9902aecba32e22fa4f6bd','呵呵哒74','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770a44004c','hehe75','670b14728ad9902aecba32e22fa4f6bd','呵呵哒75','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770a65004d','hehe76','670b14728ad9902aecba32e22fa4f6bd','呵呵哒76','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770a87004e','hehe77','670b14728ad9902aecba32e22fa4f6bd','呵呵哒77','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770aac004f','hehe78','670b14728ad9902aecba32e22fa4f6bd','呵呵哒78','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770aec0050','hehe79','670b14728ad9902aecba32e22fa4f6bd','呵呵哒79','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770b1b0051','hehe80','670b14728ad9902aecba32e22fa4f6bd','呵呵哒80','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770b440052','hehe81','670b14728ad9902aecba32e22fa4f6bd','呵呵哒81','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770b650053','hehe82','670b14728ad9902aecba32e22fa4f6bd','呵呵哒82','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770b860054','hehe83','670b14728ad9902aecba32e22fa4f6bd','呵呵哒83','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770bae0055','hehe84','670b14728ad9902aecba32e22fa4f6bd','呵呵哒84','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770bd40056','hehe85','670b14728ad9902aecba32e22fa4f6bd','呵呵哒85','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770bf50057','hehe86','670b14728ad9902aecba32e22fa4f6bd','呵呵哒86','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770c160058','hehe87','670b14728ad9902aecba32e22fa4f6bd','呵呵哒87','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770c380059','hehe88','670b14728ad9902aecba32e22fa4f6bd','呵呵哒88','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770c5d005a','hehe89','670b14728ad9902aecba32e22fa4f6bd','呵呵哒89','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770c86005b','hehe90','670b14728ad9902aecba32e22fa4f6bd','呵呵哒90','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770ca7005c','hehe91','670b14728ad9902aecba32e22fa4f6bd','呵呵哒91','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770cc8005d','hehe92','670b14728ad9902aecba32e22fa4f6bd','呵呵哒92','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770ce9005e','hehe93','670b14728ad9902aecba32e22fa4f6bd','呵呵哒93','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770d0c005f','hehe94','670b14728ad9902aecba32e22fa4f6bd','呵呵哒94','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770d300060','hehe95','670b14728ad9902aecba32e22fa4f6bd','呵呵哒95','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','总裁办','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770d590061','hehe96','670b14728ad9902aecba32e22fa4f6bd','呵呵哒96','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','技术部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770d7a0062','hehe97','670b14728ad9902aecba32e22fa4f6bd','呵呵哒97','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','组织部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770d9b0063','hehe98','670b14728ad9902aecba32e22fa4f6bd','呵呵哒98','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','公关部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0),('402881e751d473d20151d4770dbd0064','hehe99','670b14728ad9902aecba32e22fa4f6bd','呵呵哒99','男','2015-12-16','123','15566665555','1234@qq.com','123','在职','人事部','2015-12-24',NULL,'呵呵哒','40287d8f51ccde0b0151cce2cd630004','2015-12-24 22:49:06',NULL,NULL,0);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `userId` varchar(100) DEFAULT NULL COMMENT '用户id',
  `roleId` varchar(100) DEFAULT NULL COMMENT '角色id',
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`userId`,`roleId`) values ('40287d8f51ccde0b0151cce2cd630004','r01'),('40287d8f51cd51890151cd8a64e40001','r02'),('402881e751d473d20151d476fd790001','r03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
