# Host: localhost  (Version: 5.6.42-log)
# Date: 2019-01-09 16:57:42
# Generator: MySQL-Front 5.3  (Build 4.123)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "event"
#

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `NO` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) NOT NULL DEFAULT '' COMMENT '이벤트명',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '내용',
  `STA_DATE` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '시작일',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일',
  `WRITER` varchar(50) NOT NULL DEFAULT '' COMMENT '작성자',
  `STATE` int(11) NOT NULL DEFAULT '0' COMMENT '노출여부',
  `CRE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '작성일',
  `READNO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "event"
#

