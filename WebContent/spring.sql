# Host: localhost  (Version 5.0.96-community-nt)
# Date: 2018-12-30 23:07:49
# Generator: MySQL-Front 6.0  (Build 1.134)


#
# Structure for table "admin"
#

CREATE TABLE `admin` (
  `no` int(10) NOT NULL auto_increment,
  `id` varchar(255) NOT NULL COMMENT '아이디',
  `password` varchar(255) NOT NULL COMMENT '패스워드',
  `email` varchar(255) default NULL,
  `name` varchar(255) NOT NULL COMMENT '이름',
  `memo` text COMMENT '메모',
  `registdate` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '등록일',
  PRIMARY KEY  (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (2,'test','*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29','test@test.com','관리자','테스트입니다.','2018-12-30 11:11:11'),(3,'test2','*676243218923905CF94CB52A3C9D3EB30CE8E20D','test@test.com','test','<p>testtest</p>','2018-12-30 13:53:34'),(13,'test22','*3D3B92F242033365AE5BC6A8E6FC3E1679F4140A','','test','<p>zzzzzz</p>','2018-12-30 22:27:46');

#
# Structure for table "admin_loginhistory"
#

CREATE TABLE `admin_loginhistory` (
  `no` int(10) NOT NULL auto_increment,
  `id` varchar(255) NOT NULL COMMENT '아이디',
  `name` varchar(255) NOT NULL COMMENT '이름',
  `logindate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '등록일',
  `ip` varchar(255) default NULL COMMENT '아이피',
  PRIMARY KEY  (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "admin_loginhistory"
#

INSERT INTO `admin_loginhistory` VALUES (1,'test','관리자','2018-12-30 22:16:10','0:0:0:0:0:0:0:1'),(2,'test','관리자','2018-12-30 23:06:58','0:0:0:0:0:0:0:1');

#
# Structure for table "notice"
#

CREATE TABLE `notice` (
  `no` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `title` varchar(255) NOT NULL,
  `contents` mediumtext,
  `filename_org` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `filesize` varchar(255) default '0',
  `registdate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `readno` int(11) default '0',
  `display` int(11) default '0' COMMENT '노출여부',
  PRIMARY KEY  (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "notice"
#

INSERT INTO `notice` VALUES (2,NULL,'asdf','<p>asdf</p>',NULL,NULL,'0','2018-12-30 17:12:44',2,1),(8,NULL,'test','<p>&nbsp;</p>','page.jsp','1471847689558_641.jsp','609','2018-12-30 18:34:49',2,0),(14,NULL,'test','&lt;&gt;\r\nalert(1);',NULL,NULL,'0','2018-12-30 19:05:01',5,1),(15,NULL,'test','<p>test</p>',NULL,NULL,'0','2018-12-30 22:46:16',0,0),(16,NULL,'test2','<p>test2</p>','20180706_162410.png','notice_1546177592920.png','4917','2018-12-30 22:46:32',0,1);
