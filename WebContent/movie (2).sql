# Host: localhost  (Version 5.6.41-log)
# Date: 2019-01-16 15:45:10
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


#
# Structure for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL COMMENT '아이디',
  `password` varchar(255) NOT NULL COMMENT '패스워드',
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT '이름',
  `memo` text COMMENT '메모',
  `registdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일',
  PRIMARY KEY (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "admin"
#

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (2,'test','*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29','test@test.com','관리자','테스트입니다.','2018-12-30 11:11:11'),(3,'test2','*676243218923905CF94CB52A3C9D3EB30CE8E20D','test@test.com','test','<p>testtest</p>','2018-12-30 13:53:34'),(13,'test22','*3D3B92F242033365AE5BC6A8E6FC3E1679F4140A','','test','<p>zzzzzz</p>','2018-12-30 22:27:46');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

#
# Structure for table "admin_loginhistory"
#

DROP TABLE IF EXISTS `admin_loginhistory`;
CREATE TABLE `admin_loginhistory` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) NOT NULL COMMENT '아이디',
  `name` varchar(255) NOT NULL COMMENT '이름',
  `logindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '등록일',
  `ip` varchar(255) DEFAULT NULL COMMENT '아이피',
  PRIMARY KEY (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=357 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "admin_loginhistory"
#

/*!40000 ALTER TABLE `admin_loginhistory` DISABLE KEYS */;
INSERT INTO `admin_loginhistory` VALUES (1,'test','관리자','2018-12-30 22:16:10','0:0:0:0:0:0:0:1'),(2,'test','관리자','2018-12-30 23:06:58','0:0:0:0:0:0:0:1'),(302,'test','관리자','2019-01-14 10:47:56','0:0:0:0:0:0:0:1'),(303,'test','관리자','2019-01-14 10:51:51','0:0:0:0:0:0:0:1'),(304,'test','관리자','2019-01-14 11:00:42','0:0:0:0:0:0:0:1'),(305,'test','관리자','2019-01-14 11:02:27','0:0:0:0:0:0:0:1'),(306,'test','관리자','2019-01-14 11:05:26','0:0:0:0:0:0:0:1'),(307,'test','관리자','2019-01-14 11:46:06','0:0:0:0:0:0:0:1'),(308,'test','관리자','2019-01-14 11:47:54','0:0:0:0:0:0:0:1'),(309,'test','관리자','2019-01-14 11:52:48','0:0:0:0:0:0:0:1'),(310,'test','관리자','2019-01-14 11:59:58','0:0:0:0:0:0:0:1'),(311,'test','관리자','2019-01-14 12:01:19','0:0:0:0:0:0:0:1'),(312,'test','관리자','2019-01-14 12:28:23','0:0:0:0:0:0:0:1'),(313,'test','관리자','2019-01-14 12:29:39','0:0:0:0:0:0:0:1'),(314,'test','관리자','2019-01-14 12:30:53','0:0:0:0:0:0:0:1'),(315,'test','관리자','2019-01-14 12:38:57','0:0:0:0:0:0:0:1'),(316,'test','관리자','2019-01-14 13:44:23','0:0:0:0:0:0:0:1'),(317,'test','관리자','2019-01-14 13:51:12','0:0:0:0:0:0:0:1'),(318,'test','관리자','2019-01-14 13:52:13','0:0:0:0:0:0:0:1'),(319,'test','관리자','2019-01-14 13:56:02','0:0:0:0:0:0:0:1'),(320,'test','관리자','2019-01-14 14:08:44','0:0:0:0:0:0:0:1'),(321,'test','관리자','2019-01-14 14:17:58','0:0:0:0:0:0:0:1'),(322,'test','관리자','2019-01-14 14:28:47','0:0:0:0:0:0:0:1'),(323,'test','관리자','2019-01-14 14:41:38','0:0:0:0:0:0:0:1'),(324,'test','관리자','2019-01-14 14:43:28','0:0:0:0:0:0:0:1'),(325,'test','관리자','2019-01-14 15:10:31','0:0:0:0:0:0:0:1'),(326,'test','관리자','2019-01-14 15:12:17','0:0:0:0:0:0:0:1'),(327,'test','관리자','2019-01-14 15:33:07','0:0:0:0:0:0:0:1'),(328,'test','관리자','2019-01-14 17:57:16','0:0:0:0:0:0:0:1'),(329,'test','관리자','2019-01-14 17:58:13','0:0:0:0:0:0:0:1'),(330,'test','관리자','2019-01-14 18:03:40','0:0:0:0:0:0:0:1'),(331,'test','관리자','2019-01-14 18:05:47','0:0:0:0:0:0:0:1'),(332,'test','관리자','2019-01-15 10:10:33','0:0:0:0:0:0:0:1'),(333,'test','관리자','2019-01-15 10:15:32','0:0:0:0:0:0:0:1'),(334,'test','관리자','2019-01-15 10:34:21','0:0:0:0:0:0:0:1'),(335,'test','관리자','2019-01-15 10:41:23','0:0:0:0:0:0:0:1'),(336,'test','관리자','2019-01-15 11:05:49','0:0:0:0:0:0:0:1'),(337,'test','관리자','2019-01-15 11:11:31','0:0:0:0:0:0:0:1'),(338,'test','관리자','2019-01-15 11:16:44','0:0:0:0:0:0:0:1'),(339,'test','관리자','2019-01-15 11:22:37','0:0:0:0:0:0:0:1'),(340,'test','관리자','2019-01-15 11:58:02','0:0:0:0:0:0:0:1'),(341,'test','관리자','2019-01-15 12:02:06','0:0:0:0:0:0:0:1'),(342,'test','관리자','2019-01-15 12:31:01','0:0:0:0:0:0:0:1'),(343,'test','관리자','2019-01-15 16:10:45','0:0:0:0:0:0:0:1'),(344,'test','관리자','2019-01-15 16:41:21','0:0:0:0:0:0:0:1'),(345,'test','관리자','2019-01-15 17:46:57','0:0:0:0:0:0:0:1'),(346,'test','관리자','2019-01-16 14:15:23','0:0:0:0:0:0:0:1'),(347,'test','관리자','2019-01-16 14:25:41','0:0:0:0:0:0:0:1'),(348,'test','관리자','2019-01-16 14:43:03','0:0:0:0:0:0:0:1'),(349,'test','관리자','2019-01-16 14:46:41','0:0:0:0:0:0:0:1'),(350,'test','관리자','2019-01-16 14:51:18','0:0:0:0:0:0:0:1'),(351,'test','관리자','2019-01-16 14:56:26','0:0:0:0:0:0:0:1'),(352,'test','관리자','2019-01-16 15:22:37','0:0:0:0:0:0:0:1'),(353,'test','관리자','2019-01-16 15:27:01','0:0:0:0:0:0:0:1'),(354,'test','관리자','2019-01-16 15:29:11','0:0:0:0:0:0:0:1'),(355,'test','관리자','2019-01-16 15:31:45','0:0:0:0:0:0:0:1'),(356,'test','관리자','2019-01-16 15:35:42','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `admin_loginhistory` ENABLE KEYS */;

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


#
# Structure for table "member"
#

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '회원명',
  `birth` char(10) NOT NULL DEFAULT '' COMMENT '생년월일',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '이메일(id)',
  `pw` varchar(255) NOT NULL DEFAULT '' COMMENT '비밀번호',
  `gender` int(1) NOT NULL DEFAULT '1' COMMENT '성별"1=male" "2=female"',
  `hp` varchar(20) NOT NULL DEFAULT '' COMMENT '휴대폰번호',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '영화 포인트',
  `credate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '회원 가입일',
  `moddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '회원정보 수정일',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원';

#
# Data for table "member"
#


#
# Structure for table "movie"
#

DROP TABLE IF EXISTS `movie`;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "movie"
#

INSERT INTO `movie` VALUES (8,'아쿠아맨','제임스 완','action',15,0,'2019-01-03','2019-01-12','movie_1547443093490.jpg',0,NULL,NULL,NULL,0),(9,'주먹왕 랄프','필 존스턴','family',0,0,'2019-01-01','2019-01-31','movie_1547443362960.jpg',1,NULL,NULL,NULL,0),(10,'보헤미안 랩소디','브라이언 싱어',NULL,19,0,'2018-12-01','2019-01-23','movie_1547444355269.jpg',1,NULL,NULL,NULL,0),(11,'말모이','엄유나','family',0,0,'2019-01-31','2019-03-14','movie_1547447695004.jpg',0,'<p>말모이 말모이&nbsp;</p>',NULL,NULL,0),(12,'내안의 그놈','강효진','comic',15,0,'2019-03-01','2019-03-22','movie_1547456425288.jpg',1,'<p>ㅁㅁㅁㅁㅁ</p>',NULL,NULL,0),(13,'극장판 공룡메카드: 타이니소어의 섬 ','최신규','child',0,0,'2019-01-02','2019-01-16','movie_1547456698350.jpg',1,'<p>ㅇㅁㅇㅁㅇㅁㅁ</p>',NULL,NULL,0),(14,'극장판 포켓몬스터 모두의 이야기','야지마 테츠오','child',0,0,'2019-05-30','2019-07-08','movie_1547456870784.jpg',1,'<p>ㅁㅇㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</p>',NULL,NULL,0),(17,'그린 북','피터 패럴리','comic',12,0,'2019-04-04','2019-05-02','movie_1547519050822.jpg',0,'<p>그린 북&nbsp;</p>',NULL,NULL,0);

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


#
# Structure for table "stillcut"
#

DROP TABLE IF EXISTS `stillcut`;
CREATE TABLE `stillcut` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '스틸컷 일련번호',
  `movie_no` varchar(255) NOT NULL DEFAULT '' COMMENT '영화 일련번호',
  `stillCut1` varchar(255) DEFAULT NULL COMMENT '스틸컷1',
  `stillCut2` varchar(255) DEFAULT NULL COMMENT '스틸컷2',
  `stillCut3` varchar(255) DEFAULT NULL COMMENT '스틸컷3',
  `stillCut4` varchar(255) DEFAULT NULL COMMENT '스틸컷4',
  `stillCut5` varchar(255) DEFAULT NULL COMMENT '스틸컷5',
  `stillCut6` varchar(255) DEFAULT NULL COMMENT '스틸컷6',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "stillcut"
#

INSERT INTO `stillcut` VALUES (1,'0',NULL,NULL,NULL,NULL,NULL,NULL),(2,'16','stillCut_1547516516099.jpg',NULL,NULL,NULL,NULL,NULL),(3,'17','stillCut_1547519050973.jpg','stillCut_1547519050978.jpg','stillCut_1547519050984.jpg',NULL,NULL,NULL);

#
# Structure for table "trailer"
#

DROP TABLE IF EXISTS `trailer`;
CREATE TABLE `trailer` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '영상 url 일련번호',
  `movie_no` int(11) NOT NULL DEFAULT '0' COMMENT '영화 일련번호',
  `trailer1` varchar(255) DEFAULT '' COMMENT '동영상1',
  `trailer2` varchar(255) DEFAULT NULL COMMENT '동영상2',
  `trailer3` varchar(255) DEFAULT NULL COMMENT '동영상3',
  `trailer4` varchar(255) DEFAULT NULL COMMENT '동영상4',
  `trailer5` varchar(255) DEFAULT NULL COMMENT '동영상5',
  `trailer6` varchar(255) DEFAULT NULL COMMENT '동영상6',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "trailer"
#

INSERT INTO `trailer` VALUES (1,16,'1','2','','','',''),(2,17,'1','2','3','','','');
