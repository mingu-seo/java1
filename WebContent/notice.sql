# Host: localhost  (Version: 5.6.42-log)
# Date: 2019-01-09 16:57:01
# Generator: MySQL-Front 5.3  (Build 4.123)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "notice"
#

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `NO` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `TYPE` int(11) NOT NULL DEFAULT '0' COMMENT '종류',
  `TITLE` varchar(50) DEFAULT NULL COMMENT '제목',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '내용',
  `STATE` int(11) NOT NULL DEFAULT '0' COMMENT '노출여부',
  `CRE_DATE` datetime DEFAULT NULL COMMENT '작성일',
  `READNO` int(11) NOT NULL DEFAULT '0',
  `WRITER` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "notice"
#

