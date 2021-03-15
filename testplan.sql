/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.21 : Database - testplan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testplan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `testplan`;

/*Table structure for table `country_course` */

DROP TABLE IF EXISTS `country_course`;

CREATE TABLE `country_course` (
  `country_course_id` char(5) NOT NULL,
  `course_name` longtext NOT NULL,
  `course_credit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `country_course` */

insert  into `country_course`(`country_course_id`,`course_name`,`course_credit`) values 
('1','计算机网络基础',4),
('4','中国文化概论',2),
('3','艺术欣赏',2);

/*Table structure for table `country_major` */

DROP TABLE IF EXISTS `country_major`;

CREATE TABLE `country_major` (
  `country_major` text NOT NULL,
  `major_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_credit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `country_major` */

insert  into `country_major`(`country_major`,`major_name`,`level`,`total_credit`) values 
('1923','软件工程','本科',140),
('1903','经济学','本科',154),
('1904','舞蹈','本科',95),
('1905','摄影','本科',92),
('1906','电子信息','本科',150);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` char(5) NOT NULL,
  `country_course_id` longtext NOT NULL,
  `course_name` longtext NOT NULL,
  `course_explain` longtext NOT NULL,
  `question_from` longtext NOT NULL,
  `course_status` longtext NOT NULL,
  `course_credit` int NOT NULL,
  `qualify_grade` int NOT NULL,
  `jifen` longtext NOT NULL,
  `subject_grade` longtext NOT NULL,
  `object_grade` longtext NOT NULL,
  `total_grade` int NOT NULL,
  `exam_time` int NOT NULL,
  `course_type` longtext NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`course_id`,`country_course_id`,`course_name`,`course_explain`,`question_from`,`course_status`,`course_credit`,`qualify_grade`,`jifen`,`subject_grade`,`object_grade`,`total_grade`,`exam_time`,`course_type`) values 
('00001','1','计算机网络','大学基础课程','全国命题','正常',4,0,'100分制','60','40',100,120,'是'),
('10002','4','中国文化概论','公共课','省内命题','正常',2,60,'100分制','60','40',100,90,'否'),
('12345','2','LINUX','软工专业课','全国命题','停用',5,60,'100分制','60','30\r\n',100,90,'是'),
('22222','3','艺术欣赏','公共课','省外协作命题','正常',2,60,'100分制','60','40',100,90,'是');

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `exam_id` char(3) NOT NULL,
  `exam_type` char(11) NOT NULL,
  `plan_exam_status` char(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `exam_free` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exam` */

insert  into `exam`(`exam_id`,`exam_type`,`plan_exam_status`,`start_date`,`end_date`,`exam_free`) values 
('1','省考','未用','2020-01-16 17:48:28','2020-01-23 17:48:37',150),
('2','统考','已用','2020-01-01 17:49:24','2020-01-23 17:49:28',330),
('3','统考','已用','2020-01-16 17:50:07','2020-01-26 17:50:12',50);

/*Table structure for table `exam_course` */

DROP TABLE IF EXISTS `exam_course`;

CREATE TABLE `exam_course` (
  `exam_id` char(3) NOT NULL,
  `time_id` char(5) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exam_course` */

insert  into `exam_course`(`exam_id`,`time_id`,`date`,`start_time`,`end_time`) values 
('1','1903','2020-01-01','17:00:00','20:00:00'),
('2','1904','2020-01-24','15:00:00','17:00:00'),
('3','1905','2020-01-25','09:00:00','14:00:00');

/*Table structure for table `exam_course_date` */

DROP TABLE IF EXISTS `exam_course_date`;

CREATE TABLE `exam_course_date` (
  `exam_id` char(3) NOT NULL,
  `time_id` char(5) NOT NULL,
  `course_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exam_course_date` */

insert  into `exam_course_date`(`exam_id`,`time_id`,`course_id`) values 
('1','1903','00001'),
('2','1903','22222'),
('1','1904','00001');

/*Table structure for table `exam_major` */

DROP TABLE IF EXISTS `exam_major`;

CREATE TABLE `exam_major` (
  `exam_id` char(3) NOT NULL,
  `major_code` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exam_major` */

insert  into `exam_major`(`exam_id`,`major_code`) values 
('2','1904'),
('3','1905'),
('1','1903'),
('1','1701'),
('1','A34521');

/*Table structure for table `exam_plan_check` */

DROP TABLE IF EXISTS `exam_plan_check`;

CREATE TABLE `exam_plan_check` (
  `exam_id` char(3) NOT NULL,
  `exam_plan_check_status` longtext NOT NULL,
  `plan_check_suggest` longtext NOT NULL,
  `xuelichu_suggest` longtext NOT NULL,
  `leader_suggest` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `exam_plan_check` */

insert  into `exam_plan_check`(`exam_id`,`exam_plan_check_status`,`plan_check_suggest`,`xuelichu_suggest`,`leader_suggest`) values 
('1','计划科提交','未审核','未审核','未审核'),
('2','学历处确认','同意','未审核','未审核'),
('3','领导审核','同意','同意','未审核');

/*Table structure for table `major` */

DROP TABLE IF EXISTS `major`;

CREATE TABLE `major` (
  `major_code` char(7) NOT NULL,
  `country_major_code` longtext NOT NULL,
  `major_name` longtext NOT NULL,
  `level` text NOT NULL,
  `main_school` longtext NOT NULL,
  `major_status` int NOT NULL,
  `total_credit` int NOT NULL,
  `graduate_credit` int NOT NULL,
  `exam_explain` longtext NOT NULL,
  `graduate_explain` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `major` */

insert  into `major`(`major_code`,`country_major_code`,`major_name`,`level`,`main_school`,`major_status`,`total_credit`,`graduate_credit`,`exam_explain`,`graduate_explain`) values 
('A0000','11111','计算机类','2','电子科技大学',1,200,180,'无','1111111'),
('A141516','111123','应用数学','本科','电子科大',1,129,120,'数学130以上','英语六级'),
('C123121','122455','YINGYU','本科','成都理工',0,200,111,'数学130以上','英语四级450分'),
('B87878','12314','软件工程','本科','西安交大',0,130,120,'数学物理130以上','计算机三级'),
('D1234','13132','电子信息','本科','西南大学',1,111,110,'ASFSDAG','四级');

/*Table structure for table `major_course` */

DROP TABLE IF EXISTS `major_course`;

CREATE TABLE `major_course` (
  `major_code` char(7) NOT NULL,
  `course_id` char(5) NOT NULL,
  `course_type` char(11) NOT NULL,
  `course_kind` char(11) NOT NULL,
  `exam_kind` char(11) NOT NULL,
  `exam_type` char(11) NOT NULL,
  `belong` longtext NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `major_course` */

insert  into `major_course`(`major_code`,`course_id`,`course_type`,`course_kind`,`exam_kind`,`exam_type`,`belong`,`id`) values 
('A0000','00001','公共基础课','必考','笔试','统考','电影欣赏',1),
('A123456','3','专业核心','必考','机考','省考','虚拟现实',2),
('A101111','5','专业选考','选考','笔试','统考','智能',3),
('1903','12345','选考','专业核心','机考','统考','专业方向',4),
('1904','00001','选考','专业核心','机考','统考','专业方向',5),
('1802','00001','选考','专业核心','机考','统考','专业方向',6),
('1701','00001','选考','专业核心','机考','统考','专业方向',7),
('A1010','00001','公共基础课','必考','笔试','统考','电影欣赏',8),
('A1011','00001','公共基础课','必考','笔试','统考','计算机',11),
('1702','00001','必考','专业选修','笔试','统考','数字媒体',12),
('A10100','00001','公共基础课','必考','笔试','统考','电影欣赏',13),
('A101000','00001','公共基础课','必考','笔试','统考','测试',14),
('A1230','6666','必考','专业选修','笔试','统考','嵌入式开发',16),
('A101020','12345','必考','专业选修','非笔试','省考','数字媒体',17),
('A10108','12121','必考','必修','机考','省考','LINUX',20);

/*Table structure for table `major_direction` */

DROP TABLE IF EXISTS `major_direction`;

CREATE TABLE `major_direction` (
  `major_code` char(7) NOT NULL,
  `direction_id` int NOT NULL AUTO_INCREMENT,
  `direction_name` longtext NOT NULL,
  `total_credit` int NOT NULL,
  PRIMARY KEY (`direction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32432502 DEFAULT CHARSET=utf8;

/*Data for the table `major_direction` */

insert  into `major_direction`(`major_code`,`direction_id`,`direction_name`,`total_credit`) values 
('A0000',10001,'数字媒体',120),
('A0000',10002,'物联网',130),
('A010105',1010501,'软件工程',120),
('A128900',12890002,'宝石学',150),
('A324325',32432501,'通信工程',132);

/*Table structure for table `major_school` */

DROP TABLE IF EXISTS `major_school`;

CREATE TABLE `major_school` (
  `major_code` char(7) NOT NULL,
  `main_school` longtext NOT NULL,
  `main_school_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `major_school` */

insert  into `major_school`(`major_code`,`main_school`,`main_school_id`) values 
('A101020','成都理工',1),
('A324233','川大',2),
('A0000','电子科技大学',1);

/*Table structure for table `plan_table` */

DROP TABLE IF EXISTS `plan_table`;

CREATE TABLE `plan_table` (
  `plan_version` longtext,
  `plan_name` longtext,
  `status` longtext,
  `create_date` date DEFAULT NULL,
  `approval_status` longtext,
  `xuelichu_suggest` longtext,
  `leader_idea` longtext,
  `major_code` char(7) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `plan_table` */

insert  into `plan_table`(`plan_version`,`plan_name`,`status`,`create_date`,`approval_status`,`xuelichu_suggest`,`leader_idea`,`major_code`,`id`) values 
('1','2000专业计划','已启用','2020-01-09','计划科提交','通过','通过','A101020',1),
('2','2020专业计划','新建','2020-01-01','计划科提交','通过','审核中','A123456',2),
('2','2050专业计划','新建','2020-01-09','计划科提交','通过','审核中','A1010',4),
('3','2021专业计划','新建','2020-01-01','计划科提交','通过','审核中','A1230',5),
('3','2016专业计划','新建','2020-01-09','计划科提交','审核中','审核中','A10100',7),
('5','2016专业计划','已启用','2020-09-13','计划科提交','通过','通过','A101000',8),
('6','2016专业计划','已启用','2020-09-13','计划科提交','通过','通过','A10108',27),
('3','2000专业计划','已启用','2020-01-09','计划科提交','通过','通过','A101111',30);

/*Table structure for table `unified_exam` */

DROP TABLE IF EXISTS `unified_exam`;

CREATE TABLE `unified_exam` (
  `exam_id` char(3) NOT NULL,
  `course_id` char(5) NOT NULL,
  `time_type` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `unified_exam` */

insert  into `unified_exam`(`exam_id`,`course_id`,`time_type`) values 
('1','1903','A'),
('2','1904','B'),
('3','1905','C'),
('002','11012','0');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`username`,`pwd`,`id`) values 
('ayu','123',1),
('xiix','234',2),
('admin','111',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
