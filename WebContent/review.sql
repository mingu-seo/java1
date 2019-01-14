﻿# Host: localhost  (Version: 5.6.42-log)
# Date: 2019-01-09 16:57:51
# Generator: MySQL-Front 5.3  (Build 4.123)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "review"
#

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `NO` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL DEFAULT '',
  `TITLE` varchar(50) NOT NULL DEFAULT '' COMMENT '영화제목',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '리뷰내용',
  `SCORE` int(11) DEFAULT NULL COMMENT '점수',
  `VIEW_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '관람일',
  `CRE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '작성일',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "review"
#
