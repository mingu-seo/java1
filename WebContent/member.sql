# Host: localhost  (Version: 5.6.42-log)
# Date: 2019-01-08 18:14:25
# Generator: MySQL-Front 5.3  (Build 4.123)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "member"
#

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

