# Host: localhost  (Version 5.6.41-log)
# Date: 2019-01-09 10:57:57
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "movie"
#

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '영화 일련번호',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '영화 제목',
  `director` varchar(255) NOT NULL DEFAULT '' COMMENT '감독',
  `genre` varchar(255) NOT NULL DEFAULT '' COMMENT '장르',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '등급',
  `runtime` int(11) NOT NULL DEFAULT '0' COMMENT '상영시간',
  `releaseDate` char(10) DEFAULT '' COMMENT '개봉일',
  `endDate` char(10) DEFAULT NULL COMMENT '상영종료일',
  `poster` varchar(255) DEFAULT NULL COMMENT '포스터',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "movie"
#

