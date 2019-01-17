# Host: localhost  (Version 5.0.96-community-nt)
# Date: 2019-01-17 10:06:48
# Generator: MySQL-Front 6.0  (Build 1.134)


#
# Structure for table "reply"
#

DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `no` int(11) NOT NULL auto_increment,
  `member_fk` int(11) default '0',
  `gno` int(11) default NULL,
  `ono` smallint(6) default NULL,
  `nested` tinyint(4) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(50) default NULL,
  `email` varchar(150) default NULL,
  `title` varchar(255) NOT NULL,
  `contents` mediumtext,
  `relation_url` varchar(255) default NULL,
  `imagename` varchar(255) default NULL,
  `imagename_org` varchar(255) default NULL,
  `image_alt` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `filename_org` varchar(255) default NULL,
  `filesize` bigint(20) default '0',
  `registdate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `top` char(1) NOT NULL default '0',
  `main` char(1) NOT NULL default '0',
  `newicon` char(1) NOT NULL default '0',
  `readno` int(11) default '0',
  `secret` int(11) default '0',
  PRIMARY KEY  (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "reply"
#

/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (7,0,1,0,0,'*832EB84CB764129D05D498ED9CA7E5CE9B8F83EB','서민구','withsky999@gmail.com','답변게시판 테스트','내용내용',NULL,NULL,NULL,NULL,NULL,NULL,0,'2019-01-17 09:59:48','0','0','0',0,0),(8,0,1,1,1,'*832EB84CB764129D05D498ED9CA7E5CE9B8F83EB','답변자','test@test.com','답변','답변',NULL,NULL,NULL,NULL,NULL,NULL,0,'2019-01-17 10:03:16','0','0','0',0,0);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
