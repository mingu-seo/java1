# Host: localhost  (Version: 5.6.42-log)
# Date: 2019-01-15 15:53:45
# Generator: MySQL-Front 5.3  (Build 4.123)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "notice"
#

CREATE TABLE `notice` (
  `NO` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `TYPE` int(11) NOT NULL DEFAULT '0' COMMENT '종류',
  `TITLE` varchar(50) DEFAULT NULL COMMENT '제목',
  `CONTENTS` varchar(255) DEFAULT NULL COMMENT '내용',
  `DISPLAY` int(11) NOT NULL DEFAULT '0' COMMENT '노출여부',
  `CRE_DATE` datetime DEFAULT NULL COMMENT '작성일',
  `READNO` int(11) NOT NULL DEFAULT '0',
  `WRITER` int(11) DEFAULT '0',
  `FILENAME_ORG` varchar(255) DEFAULT NULL COMMENT '첨부(사용자)',
  `FILENAME` varchar(255) DEFAULT NULL COMMENT '첨부(시스템)',
  `FILESIZE` bigint(20) DEFAULT NULL COMMENT '첨부크기',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "notice"
#

INSERT INTO `notice` VALUES (12,1,'시스템공지 숨김','<p>시스템공지 숨김</p>',0,'2019-01-10 11:52:13',0,2,NULL,NULL,0),(13,2,'극장 노출','<p>ㅁㄴㅇㄹ</p>',1,'2019-01-10 11:52:28',2,2,NULL,NULL,0),(14,3,'기타 노출','<p><img title=\"팔벌린포즈.png\" src=\"http://localhost/upload/editor/1547096147814_775.png\" alt=\"\"><br style=\"clear:both;\">ㅇㅇ</p>',1,'2019-01-10 11:52:38',1,2,NULL,NULL,0),(15,1,'시스템 점검 안내','<p><img title=\"1fc8f1bf935fcfab98bf7be2edae56ca.jpg\" src=\"http://localhost/upload/editor/1547090884062_398.jpg\" alt=\"\"><br style=\"clear:both;\">~시까지&nbsp;</p>',0,'2019-01-10 11:53:03',0,2,'물고기.png','notice_1547091563243.png',52670),(22,1,'첨부파일테스트','<p><img title=\"물고기.png\" src=\"http://localhost/upload/editor/1547434662941_477.png\" alt=\"\"><br style=\"clear:both;\">ffㅁㄴㅇㄹ</p>',0,'2019-01-10 17:51:58',1,2,'1fc8f1bf935fcfab98bf7be2edae56ca.jpg','notice_1547434664534.jpg',38983),(23,1,'test','<p>testㅇㅇ</p>',0,'2019-01-14 17:36:14',2,2,NULL,NULL,0);
