# Host: localhost  (Version 5.6.41-log)
# Date: 2019-01-09 10:56:47
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "actor"
#

DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '배우 일련번호',
  `movie_no` int(11) NOT NULL DEFAULT '0' COMMENT '영화 일련번호',
  `actor` varchar(255) NOT NULL DEFAULT '' COMMENT '출연배우',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "actor"
#

