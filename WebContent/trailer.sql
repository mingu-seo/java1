# Host: localhost  (Version 5.6.41-log)
# Date: 2019-01-09 10:57:44
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "trailer"
#

DROP TABLE IF EXISTS `trailer`;
CREATE TABLE `trailer` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '영상 url 일련번호',
  `movie_no` int(11) NOT NULL DEFAULT '0' COMMENT '영화 일련번호',
  `trailer` varchar(255) NOT NULL DEFAULT '' COMMENT '동영상',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "trailer"
#

