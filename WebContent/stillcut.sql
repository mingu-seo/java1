# Host: localhost  (Version 5.6.41-log)
# Date: 2019-01-09 10:56:58
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "stillcut"
#

DROP TABLE IF EXISTS `stillcut`;
CREATE TABLE `stillcut` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '스틸컷 일련번호',
  `movie_no` varchar(255) NOT NULL DEFAULT '' COMMENT '영화 일련번호',
  `stillCut` varchar(255) NOT NULL DEFAULT '' COMMENT '스틸컷',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "stillcut"
#

