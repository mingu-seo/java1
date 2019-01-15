# Host: localhost  (Version: 5.6.42-log)
# Date: 2019-01-15 15:53:29
# Generator: MySQL-Front 5.3  (Build 4.123)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "event"
#

CREATE TABLE `event` (
  `NO` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) NOT NULL DEFAULT '' COMMENT '이벤트명',
  `CONTENTS` text COMMENT '내용',
  `STA_DATE` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '시작일',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일',
  `WRITER` varchar(50) DEFAULT '' COMMENT '작성자',
  `DISPLAY` int(11) NOT NULL DEFAULT '0' COMMENT '노출여부',
  `CRE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '작성일',
  `READNO` int(11) NOT NULL DEFAULT '0',
  `FILENAME_ORG` varchar(255) DEFAULT NULL COMMENT '첨부(사용자)',
  `FILENAME` varchar(255) DEFAULT NULL COMMENT '첨부(시스템)',
  `FILESIZE` bigint(20) DEFAULT NULL COMMENT '첨부크기',
  PRIMARY KEY (`NO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "event"
#

INSERT INTO `event` VALUES (2,'새로운이벤트','<p style=\"text-align: center; \" align=\"center\"><font color=\"#ffffff\"><span style=\"font-size: 32px; background-color: rgb(255, 0, 0);\"><b>역대급 이벤투~!@!</b></span></font></p>','2019-01-01 16:11:52','2019-01-04 16:11:52','2',1,'2019-01-10 16:12:03',0,NULL,NULL,0),(3,'1월이벤트','<p><img title=\"bg.jpg\" src=\"http://localhost/upload/editor/1547436447449_40.jpg\" alt=\"\"><br style=\"clear:both;\">&nbsp;</p>','2019-01-01 12:26:53','2019-01-31 12:26:53','2',1,'2019-01-14 12:27:31',1,'바닥2.jpg','notice_1547436451255.jpg',385379),(4,'작성자테스트','<p>dd</p>','2019-01-15 10:13:47','2019-01-15 10:13:47','2',0,'2019-01-15 10:13:59',3,NULL,NULL,0);
