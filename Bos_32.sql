/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.21-log : Database - bos32
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bos32` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bos32`;

/*Table structure for table `auth_function` */

DROP TABLE IF EXISTS `auth_function`;

CREATE TABLE `auth_function` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `generatemenu` varchar(255) DEFAULT NULL,
  `zindex` int(11) DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AK_Key_2` (`name`),
  KEY `FK33r6np87v1p6gge7t6rpcao5h` (`pid`),
  CONSTRAINT `FK33r6np87v1p6gge7t6rpcao5h` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_1x` FOREIGN KEY (`pid`) REFERENCES `auth_function` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_function` */

insert  into `auth_function`(`id`,`name`,`code`,`description`,`page`,`generatemenu`,`zindex`,`pid`) values 
('11','基础档案','jichudangan',NULL,NULL,'1',0,NULL),
('112','收派标准','standard',NULL,'page_base_standard.action','1',1,'11'),
('113','取派员设置','staff',NULL,'page_base_staff.action','1',2,'11'),
('114','区域设置','region',NULL,'page_base_region.action','1',3,'11'),
('115','管理分区','subarea',NULL,'page_base_subarea.action','1',4,'11'),
('116','管理定区/调度排班','decidedzone',NULL,'page_base_decidedzone.action','1',5,'11'),
('12','受理','shouli',NULL,NULL,'1',1,NULL),
('121','业务受理','noticebill',NULL,'page_qupai_noticebill_add.action','1',0,'12'),
('122','工作单快速录入','quickworkordermanage',NULL,'page_qupai_quickworkorder.action','1',1,'12'),
('124','工作单导入','workordermanageimport',NULL,'page_qupai_workorderimport.action','1',3,'12'),
('13','调度','diaodu',NULL,NULL,'1',2,NULL),
('131','查台转单','changestaff',NULL,NULL,'1',0,'13'),
('132','人工调度','personalassign',NULL,'page_qupai_diaodu.action','1',1,'13'),
('14','物流配送流程管理','zhongzhuan',NULL,NULL,'1',3,NULL),
('141','启动配送流程','start',NULL,'workOrderManageAction_list.action','1',0,'14'),
('142','查看个人任务','personaltask',NULL,'taskAction_findPersonalTask.action','1',1,'14'),
('143','查看我的组任务','grouptask',NULL,'taskAction_findGroupTask.action','1',2,'14'),
('4028ab0e67a7b1490167a7b5f7420000','取派员显示','staff-list','菜单显示','staff-list','0',2,'11'),
('8a7e843355a4392d0155a43aa7150000','删除取派员','staff.delete','xxx','staffAction_delete.action','0',1,'113'),
('8a7e843355a442460155a442bcfc0000','杨兴雕','shuaige','','http://www.baidu.com','1',1,NULL),
('ff80808167a15bb00167a15d90aa0000','aa','hello','11','/staffAction_delete','0',1,'12');

/*Table structure for table `auth_role` */

DROP TABLE IF EXISTS `auth_role`;

CREATE TABLE `auth_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AK_Key_2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_role` */

insert  into `auth_role`(`id`,`name`,`code`,`description`) values 
('002','赵丽颖',NULL,'我的女神赵丽颖，是杨兴雕的女人,对的'),
('003','赵丽颖的老公',NULL,'杨兴雕'),
('004','关晓彤',NULL,'女友'),
('006','ttt',NULL,'大佬'),
('007','内置账号',NULL,'帅哥'),
('100','admin',NULL,'超级用户'),
('10000','你雕哥',NULL,'帅哥一枚'),
('987','csac',NULL,'c');

/*Table structure for table `bc_decidedzone` */

DROP TABLE IF EXISTS `bc_decidedzone`;

CREATE TABLE `bc_decidedzone` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh0xplk12o52a6eryw4hcqnfwt` (`staff_id`),
  CONSTRAINT `FK_decidedzone_staff` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FKh0xplk12o52a6eryw4hcqnfwt` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_decidedzone` */

insert  into `bc_decidedzone`(`id`,`name`,`staff_id`) values 
('110','茶南街','4028ab0e66e8275e0166e8289a430000'),
('111','ainima','4028ab0e66e3bdb90166e3bf58030000'),
('152','平西府','4028ab0e66e3bdb90166e3bf58030000'),
('456','平西府','4028ab0e66e3bdb90166e3bf58030000');

/*Table structure for table `bc_region` */

DROP TABLE IF EXISTS `bc_region`;

CREATE TABLE `bc_region` (
  `id` varchar(32) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `postcode` varchar(50) DEFAULT NULL,
  `shortcode` varchar(30) DEFAULT NULL,
  `citycode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_region` */

insert  into `bc_region`(`id`,`province`,`city`,`district`,`postcode`,`shortcode`,`citycode`) values 
('QY001','北京市','北京市','东城区','110101','BJBJDC','beijing'),
('QY002','北京市','北京市','西城区','110102','BJBJXC','beijing'),
('QY003','北京市','北京市','朝阳区','110105','BJBJCY','beijing'),
('QY004','北京市','北京市','丰台区','110106','BJBJFT','beijing'),
('QY005','北京市','北京市','石景山区','110107','BJBJSJS','beijing'),
('QY006','北京市','北京市','海淀区','110108','BJBJHD','beijing'),
('QY007','北京市','北京市','门头沟区','110109','BJBJMTG','beijing'),
('QY008','北京市','北京市','房山区','110111','BJBJFS','beijing'),
('QY009','北京市','北京市','通州区','110112','BJBJTZ','beijing'),
('QY010','北京市','北京市','顺义区','110113','BJBJSY','beijing'),
('QY011','北京市','北京市','昌平区','110114','BJBJCP','beijing'),
('QY012','北京市','北京市','大兴区','110115','BJBJDX','beijing'),
('QY013','北京市','北京市','怀柔区','110116','BJBJHR','beijing'),
('QY014','北京市','北京市','平谷区','110117','BJBJPG','beijing'),
('QY015','北京市','北京市','密云县','110228','BJBJMY','beijing'),
('QY016','北京市','北京市','延庆县','110229','BJBJYQ','beijing'),
('QY017','河北省','石家庄市','长安区','130102','HBSJZZA','shijiazhuang'),
('QY018','河北省','石家庄市','桥东区','130103','HBSJZQD','shijiazhuang'),
('QY019','河北省','石家庄市','桥西区','130104','HBSJZQX','shijiazhuang'),
('QY020','河北省','石家庄市','新华区','130105','HBSJZXH','shijiazhuang'),
('QY021','河北省','石家庄市','井陉矿区','130107','HBSJZJXK','shijiazhuang'),
('QY022','河北省','石家庄市','裕华区','130108','HBSJZYH','shijiazhuang'),
('QY023','河北省','石家庄市','井陉县','130121','HBSJZJX','shijiazhuang'),
('QY024','河北省','石家庄市','正定县','130123','HBSJZZD','shijiazhuang'),
('QY025','河北省','石家庄市','栾城县','130124','HBSJZLC','shijiazhuang'),
('QY026','河北省','石家庄市','行唐县','130125','HBSJZXT','shijiazhuang'),
('QY027','河北省','石家庄市','灵寿县','130126','HBSJZLS','shijiazhuang'),
('QY028','河北省','石家庄市','高邑县','130127','HBSJZGY','shijiazhuang'),
('QY029','河北省','石家庄市','深泽县','130128','HBSJZSZ','shijiazhuang'),
('QY030','河北省','石家庄市','赞皇县','130129','HBSJZZH','shijiazhuang'),
('QY031','河北省','石家庄市','无极县','130130','HBSJZWJ','shijiazhuang'),
('QY032','河北省','石家庄市','平山县','130131','HBSJZPS','shijiazhuang'),
('QY033','河北省','石家庄市','元氏县','130132','HBSJZYS','shijiazhuang'),
('QY034','河北省','石家庄市','赵县','130133','HBSJZZ','shijiazhuang'),
('QY035','河北省','石家庄市','辛集市','130181','HBSJZXJ','shijiazhuang'),
('QY036','河北省','石家庄市','藁城市','130182','HBSJZGC','shijiazhuang'),
('QY037','河北省','石家庄市','晋州市','130183','HBSJZJZ','shijiazhuang'),
('QY038','河北省','石家庄市','新乐市','130184','HBSJZXL','shijiazhuang'),
('QY039','河北省','石家庄市','鹿泉市','130185','HBSJZLQ','shijiazhuang'),
('QY040','天津市','天津市','和平区','120101','TJTJHP','tianjin'),
('QY041','天津市','天津市','河东区','120102','TJTJHD','tianjin'),
('QY042','天津市','天津市','河西区','120103','TJTJHX','tianjin'),
('QY043','天津市','天津市','南开区','120104','TJTJNK','tianjin'),
('QY044','天津市','天津市','河北区','120105','TJTJHB','tianjin'),
('QY045','天津市','天津市','红桥区','120106','TJTJHQ','tianjin'),
('QY046','天津市','天津市','滨海新区','120116','TJTJBHX','tianjin'),
('QY047','天津市','天津市','东丽区','120110','TJTJDL','tianjin'),
('QY048','天津市','天津市','西青区','120111','TJTJXQ','tianjin'),
('QY049','天津市','天津市','津南区','120112','TJTJJN','tianjin'),
('QY050','天津市','天津市','北辰区','120113','TJTJBC','tianjin'),
('QY051','天津市','天津市','武清区','120114','TJTJWQ','tianjin'),
('QY052','天津市','天津市','宝坻区','120115','TJTJBC','tianjin'),
('QY053','天津市','天津市','宁河县','120221','TJTJNH','tianjin'),
('QY054','天津市','天津市','静海县','120223','TJTJJH','tianjin'),
('QY055','天津市','天津市','蓟县','120225','TJTJJ','tianjin'),
('QY056','山西省','太原市','小店区','140105','SXTYXD','taiyuan'),
('QY057','山西省','太原市','迎泽区','140106','SXTYYZ','taiyuan'),
('QY058','山西省','太原市','杏花岭区','140107','SXTYXHL','taiyuan'),
('QY059','山西省','太原市','尖草坪区','140108','SXTYJCP','taiyuan'),
('QY060','山西省','太原市','万柏林区','140109','SXTYWBL','taiyuan'),
('QY061','山西省','太原市','晋源区','140110','SXTYJY','taiyuan'),
('QY062','山西省','太原市','清徐县','140121','SXTYQX','taiyuan'),
('QY063','山西省','太原市','阳曲县','140122','SXTYYQ','taiyuan'),
('QY064','山西省','太原市','娄烦县','140123','SXTYLF','taiyuan'),
('QY065','山西省','太原市','古交市','140181','SXTYGJ','taiyuan');

/*Table structure for table `bc_staff` */

DROP TABLE IF EXISTS `bc_staff`;

CREATE TABLE `bc_staff` (
  `id` varchar(32) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `haspda` char(1) DEFAULT NULL,
  `deltag` char(1) DEFAULT NULL,
  `station` varchar(40) DEFAULT NULL,
  `standard` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_staff` */

insert  into `bc_staff`(`id`,`name`,`telephone`,`haspda`,`deltag`,`station`,`standard`) values 
('402881eb67bbf0660167bbf38cbd0000','迪丽热巴','17834586898','1','0','上海pp','女神级'),
('4028ab0e66e3bdb90166e3bf58030000','赵丽颖','14718530587','1','0','上海戏剧学院','杨兴雕女友'),
('4028ab0e66e81b5d0166e81c33d40000','ainima','13457554263','1','1','上海戏剧学院','女神一枚'),
('4028ab0e66e8275e0166e8289a430000','杨兴雕','14718530257','1','0','北京电影学院的妹子','帅哥一枚'),
('4028ab0e66e8275e0166e8298d830001','江疏影','18745852657','1','0','上海戏剧学院','女神一枚'),
('4028ab0e66e8275e0166e82a0ff60002','关晓彤','14585455825','1','0','北京二婚','Shaun'),
('4028ab0e66e8275e0166e82aed700003','杨幂','14718526844','1','1','北京二婚Xa','解决'),
('ff80808166fc8df50166fc8f1c7b0000','dchva达成是advs','13560348751','1','0','czcdc','都是'),
('ff80808166fc8df50166fc8f706f0001','cdcsc','13568754891','1','0','cacd','多次'),
('ff80808166fc8df50166fc8fbd730002','的厂生产的','13548285156','1','0','北京二婚Xa','都是'),
('ff80808166fc8df50166fc9057270003','ainima','13560318350','1','0','我是一个女朋友','都是'),
('ff80808166fc8df50166fc9098800004','ainima','13587552532','1','0','北京二婚Xa','都是'),
('ff80808166fca3990166fca8dd890000','ainima','13560341587','1','0','北京二婚Xa','都是'),
('ff808081670d213601670d22a9320000','潘春春','13547895461','1','0','北京二婚的不可以吗','都是'),
('ff808081670d566301670d583d3c0000','mam','13560134875','1','0','妹子','都是');

/*Table structure for table `bc_subarea` */

DROP TABLE IF EXISTS `bc_subarea`;

CREATE TABLE `bc_subarea` (
  `id` varchar(32) NOT NULL,
  `decidedzone_id` varchar(32) DEFAULT NULL,
  `region_id` varchar(32) DEFAULT NULL,
  `addresskey` varchar(100) DEFAULT NULL,
  `startnum` varchar(30) DEFAULT NULL,
  `endnum` varchar(30) DEFAULT NULL,
  `single` char(1) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlndbc8oldgbg3k1x63n3n6t7n` (`decidedzone_id`),
  KEY `FKcjwxm19mx5njn3xyqgqp431mb` (`region_id`),
  CONSTRAINT `FK_area_decidedzone` FOREIGN KEY (`decidedzone_id`) REFERENCES `bc_decidedzone` (`id`),
  CONSTRAINT `FK_area_region` FOREIGN KEY (`region_id`) REFERENCES `bc_region` (`id`),
  CONSTRAINT `FKcjwxm19mx5njn3xyqgqp431mb` FOREIGN KEY (`region_id`) REFERENCES `bc_region` (`id`),
  CONSTRAINT `FKlndbc8oldgbg3k1x63n3n6t7n` FOREIGN KEY (`decidedzone_id`) REFERENCES `bc_decidedzone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bc_subarea` */

insert  into `bc_subarea`(`id`,`decidedzone_id`,`region_id`,`addresskey`,`startnum`,`endnum`,`single`,`position`) values 
('402881eb670daada01670dac16e40000','110','QY007','爬虫','110','111','0','北京市昌平区'),
('402881eb670daada01670dad8f660001',NULL,'QY003','迪丽热巴','112','113','0','北京市朝阳区'),
('ff8080816701783e01670179317f0000','456','QY027','你好','1111','1112','0','北京市南山区'),
('ff808081670d213601670d2330f00001','111','QY001','你好','1111','1112','0','北京市南山区'),
('ff808081670d213601670d235edd0002','152','QY005','你好','1111','1112','0','北京市南山区');

/*Table structure for table `qp_noticebill` */

DROP TABLE IF EXISTS `qp_noticebill`;

CREATE TABLE `qp_noticebill` (
  `id` varchar(32) NOT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `delegater` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `pickaddress` varchar(200) DEFAULT NULL,
  `arrivecity` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `pickdate` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `volume` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ordertype` varchar(20) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl5j3pm969oy1qdc1318jrmbgt` (`user_id`),
  KEY `FKhmbqr6qlg0uets978w5xshler` (`staff_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FKhmbqr6qlg0uets978w5xshler` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FKl5j3pm969oy1qdc1318jrmbgt` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qp_noticebill` */

insert  into `qp_noticebill`(`id`,`staff_id`,`customer_id`,`customer_name`,`delegater`,`telephone`,`pickaddress`,`arrivecity`,`product`,`pickdate`,`num`,`weight`,`volume`,`remark`,`ordertype`,`user_id`) values 
('402881eb674afc3901674afeee8d0000','4028ab0e66e3bdb90166e3bf58030000','002','小白','小白','18511111111','内蒙古自治区呼和浩特市和平路100号','','','2018-11-13',NULL,NULL,'','','自动分单','3');

/*Table structure for table `qp_workbill` */

DROP TABLE IF EXISTS `qp_workbill`;

CREATE TABLE `qp_workbill` (
  `id` varchar(32) NOT NULL,
  `noticebill_id` varchar(32) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `pickstate` varchar(20) DEFAULT NULL,
  `buildtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attachbilltimes` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `staff_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKggojlcovnpimuukxcueb18apt` (`noticebill_id`),
  KEY `FK55ckcnjyvwinnnniu5jpelg7y` (`staff_id`),
  CONSTRAINT `FK55ckcnjyvwinnnniu5jpelg7y` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`staff_id`) REFERENCES `bc_staff` (`id`),
  CONSTRAINT `FK_workbill_noticebill_fk` FOREIGN KEY (`noticebill_id`) REFERENCES `qp_noticebill` (`id`),
  CONSTRAINT `FKggojlcovnpimuukxcueb18apt` FOREIGN KEY (`noticebill_id`) REFERENCES `qp_noticebill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qp_workbill` */

insert  into `qp_workbill`(`id`,`noticebill_id`,`type`,`pickstate`,`buildtime`,`attachbilltimes`,`remark`,`staff_id`) values 
('402881eb674afc3901674afef2ae0001','402881eb674afc3901674afeee8d0000','新单','未取件','2018-11-25 21:11:21',0,'','4028ab0e66e3bdb90166e3bf58030000');

/*Table structure for table `qp_workordermanage` */

DROP TABLE IF EXISTS `qp_workordermanage`;

CREATE TABLE `qp_workordermanage` (
  `id` varchar(32) NOT NULL,
  `arrivecity` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `floadreqr` varchar(255) DEFAULT NULL,
  `prodtimelimit` varchar(40) DEFAULT NULL,
  `prodtype` varchar(40) DEFAULT NULL,
  `sendername` varchar(20) DEFAULT NULL,
  `senderphone` varchar(20) DEFAULT NULL,
  `senderaddr` varchar(200) DEFAULT NULL,
  `receivername` varchar(20) DEFAULT NULL,
  `receiverphone` varchar(20) DEFAULT NULL,
  `receiveraddr` varchar(200) DEFAULT NULL,
  `feeitemnum` int(11) DEFAULT NULL,
  `actlweit` double DEFAULT NULL,
  `vol` varchar(20) DEFAULT NULL,
  `managerCheck` varchar(1) DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qp_workordermanage` */

insert  into `qp_workordermanage`(`id`,`arrivecity`,`product`,`num`,`weight`,`floadreqr`,`prodtimelimit`,`prodtype`,`sendername`,`senderphone`,`senderaddr`,`receivername`,`receiverphone`,`receiveraddr`,`feeitemnum`,`actlweit`,`vol`,`managerCheck`,`updatetime`) values 
('003','广州','啤酒',1,1,'无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('ff808081674efcf301674efe83a20000','北京','海鲜',1,1,'没',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('ff808081674efcf301674eff305b0001','上海','梨子',1,1,'无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `role_function` */

DROP TABLE IF EXISTS `role_function`;

CREATE TABLE `role_function` (
  `role_id` varchar(32) NOT NULL,
  `function_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`function_id`),
  KEY `FK5f8riddotqjpm9vly0b8c5nmf` (`function_id`),
  CONSTRAINT `FK10qo908yd9evkyb40vf88og85` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`),
  CONSTRAINT `FK5f8riddotqjpm9vly0b8c5nmf` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_2x` FOREIGN KEY (`function_id`) REFERENCES `auth_function` (`id`),
  CONSTRAINT `FK_Reference_3x` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_function` */

insert  into `role_function`(`role_id`,`function_id`) values 
('003','11'),
('004','11'),
('006','11'),
('10000','11'),
('003','112'),
('004','112'),
('006','112'),
('10000','112'),
('003','113'),
('004','113'),
('006','113'),
('10000','113'),
('003','114'),
('004','114'),
('006','114'),
('10000','114'),
('003','115'),
('004','115'),
('006','115'),
('10000','115'),
('003','116'),
('004','116'),
('006','116'),
('10000','116'),
('003','12'),
('004','12'),
('006','12'),
('10000','12'),
('003','121'),
('004','121'),
('006','121'),
('10000','121'),
('003','122'),
('004','122'),
('006','122'),
('10000','122'),
('003','124'),
('004','124'),
('006','124'),
('10000','124'),
('003','13'),
('004','13'),
('006','13'),
('10000','13'),
('003','131'),
('004','131'),
('006','131'),
('10000','131'),
('003','132'),
('004','132'),
('006','132'),
('10000','132'),
('003','14'),
('004','14'),
('006','14'),
('10000','14'),
('003','141'),
('004','141'),
('006','141'),
('10000','141'),
('003','142'),
('004','142'),
('006','142'),
('10000','142'),
('003','143'),
('004','143'),
('006','143'),
('10000','143'),
('003','4028ab0e67a7b1490167a7b5f7420000'),
('004','4028ab0e67a7b1490167a7b5f7420000'),
('006','4028ab0e67a7b1490167a7b5f7420000'),
('10000','4028ab0e67a7b1490167a7b5f7420000'),
('003','8a7e843355a4392d0155a43aa7150000'),
('004','8a7e843355a4392d0155a43aa7150000'),
('006','8a7e843355a4392d0155a43aa7150000'),
('007','8a7e843355a4392d0155a43aa7150000'),
('100','8a7e843355a4392d0155a43aa7150000'),
('10000','8a7e843355a4392d0155a43aa7150000'),
('003','8a7e843355a442460155a442bcfc0000'),
('004','8a7e843355a442460155a442bcfc0000'),
('006','8a7e843355a442460155a442bcfc0000'),
('007','8a7e843355a442460155a442bcfc0000'),
('100','8a7e843355a442460155a442bcfc0000'),
('10000','8a7e843355a442460155a442bcfc0000'),
('987','8a7e843355a442460155a442bcfc0000'),
('002','ff80808167a15bb00167a15d90aa0000'),
('003','ff80808167a15bb00167a15d90aa0000'),
('004','ff80808167a15bb00167a15d90aa0000'),
('006','ff80808167a15bb00167a15d90aa0000'),
('007','ff80808167a15bb00167a15d90aa0000'),
('100','ff80808167a15bb00167a15d90aa0000'),
('10000','ff80808167a15bb00167a15d90aa0000');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salary` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `station` varchar(40) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`salary`,`birthday`,`gender`,`station`,`telephone`,`remark`) values 
('1','zs','81dc9bdb52d04dc20036dbd8313ed055',NULL,NULL,NULL,NULL,NULL,NULL),
('2','lisi','81dc9bdb52d04dc20036dbd8313ed055',NULL,NULL,NULL,NULL,NULL,NULL),
('3','ws','1234',NULL,NULL,NULL,NULL,NULL,NULL),
('4','zhaoliu','81dc9bdb52d04dc20036dbd8313ed055',NULL,NULL,NULL,NULL,NULL,NULL),
('402881eb67ad5c760167ad5de72d0000','yxd','81dc9bdb52d04dc20036dbd8313ed055',10000,'2018-12-19','女','总公司','13548752488',NULL),
('4028ab0e67a7c7920167a7cbe8390000','dg','81dc9bdb52d04dc20036dbd8313ed055',10000,'2018-12-11','男','分公司','14718590026',NULL),
('5','ww','81dc9bdb52d04dc20036dbd8313ed055',NULL,NULL,NULL,NULL,NULL,NULL),
('ff80808167a18a890167a18bfb330000','admin','81dc9bdb52d04dc20036dbd8313ed055',10000,'2018-12-19','女','总公司','13548752488',NULL);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKqqlqhas35obkljn18mrh6mmms` (`role_id`),
  CONSTRAINT `FK_Reference_4x` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_5x` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`),
  CONSTRAINT `FKeqon9sx5vssprq67dxm3s7ump` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKqqlqhas35obkljn18mrh6mmms` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`) values 
('ff80808167a18a890167a18bfb330000','002'),
('4028ab0e67a7c7920167a7cbe8390000','003'),
('ff80808167a18a890167a18bfb330000','003'),
('402881eb67ad5c760167ad5de72d0000','004');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
