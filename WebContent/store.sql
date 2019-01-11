# Host: localhost  (Version: 5.6.42-log)
# Date: 2019-01-09 16:58:01
# Generator: MySQL-Front 5.3  (Build 4.123)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "store"
#

DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `NO` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) NOT NULL DEFAULT '0' COMMENT '종류',
  `NAME` varchar(255) DEFAULT '' COMMENT '이름',
  `IMAGE` varchar(255) DEFAULT NULL COMMENT '이미지',
  `PRICE` varchar(255) DEFAULT NULL COMMENT '가격',
  `DC_PRICE` varchar(255) DEFAULT NULL COMMENT '할인가격',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "store"
#

