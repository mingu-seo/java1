# Host: localhost  (Version 5.6.41-log)
# Date: 2019-01-14 16:13:52
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "movie"
#


CREATE TABLE `movie` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '영화 일련번호',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '영화 제목',
  `director` varchar(255) DEFAULT NULL COMMENT '감독',
  `genre` varchar(255) DEFAULT NULL COMMENT '장르',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '등급',
  `runtime` int(11) NOT NULL DEFAULT '0' COMMENT '상영시간',
  `releaseDate` char(10) DEFAULT '' COMMENT '개봉일',
  `endDate` char(10) DEFAULT NULL COMMENT '상영종료일',
  `poster` varchar(255) DEFAULT NULL COMMENT '포스터',
  `display` int(11) NOT NULL DEFAULT '0' COMMENT '노출여부',
  `contents` text COMMENT '줄거리',
  `registDate` varchar(255) DEFAULT NULL COMMENT '등록일',
  `poster_chk` varchar(255) DEFAULT NULL COMMENT '삭제할때 받아올 파일이름값',
  `posterSize` int(11) DEFAULT '0' COMMENT '포스터 첨부파일 크기',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "movie"
#

INSERT INTO `movie` VALUES (8,'아쿠아맨','제임스 완','action',15,0,'2019-01-03','2019-01-12','movie_1547443093490.jpg',0,NULL,NULL,NULL,0),(9,'주먹왕 랄프','필 존스턴','family',0,0,'2019-01-01','2019-01-31','movie_1547443362960.jpg',1,NULL,NULL,NULL,0),(10,'보헤미안 랩소디','브라이언 싱어',NULL,19,0,'2018-12-01','2019-01-23','movie_1547444355269.jpg',1,NULL,NULL,NULL,0),(11,'말모이','엄유나','family',0,0,'2019-01-31','2019-03-14','movie_1547447695004.jpg',0,'<p>말모이 말모이&nbsp;</p>',NULL,NULL,0);
