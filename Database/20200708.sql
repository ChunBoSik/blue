-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.19-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- webdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `webdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webdb`;

-- 테이블 webdb.aa 구조 내보내기
CREATE TABLE IF NOT EXISTS `aa` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `aa` varchar(50) NOT NULL DEFAULT '',
  `bb` int(11) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.aa:~0 rows (대략적) 내보내기
DELETE FROM `aa`;
/*!40000 ALTER TABLE `aa` DISABLE KEYS */;
INSERT INTO `aa` (`idx`, `aa`, `bb`) VALUES
	(1, '', 1);
/*!40000 ALTER TABLE `aa` ENABLE KEYS */;

-- 테이블 webdb.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `homepage` varchar(60) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `wdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `readnum` int(11) NOT NULL DEFAULT '0',
  `hostip` varchar(50) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.board:~52 rows (대략적) 내보내기
DELETE FROM `board`;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`idx`, `name`, `email`, `homepage`, `title`, `pwd`, `wdate`, `readnum`, `hostip`, `content`) VALUES
	(1, '관리자', 'cjsk1126@hanmail.net', 'blog.daum.net/cjsk1126', '게시판 서비스를 시작합니다.', '1234', '2020-05-06 17:46:55', 3, '218.236.203.76', '게시판 서비스....'),
	(2, '홍길동', 'hkd1234@hanmail.net', 'blog.daum.net/hkd1234', '안녕하세요!!', '1234', '2020-05-07 10:22:53', 3, '127.0.0.1', '자주 애용하겠습니다.\r\n\r\n감사합니다.'),
	(3, '홍대장', 'aaa@aaa.aaa', 'http://333.bbbb', '잘 부탁드립니다.', '1234', '2020-05-07 11:29:03', 1, '127.0.0.1', '게시글 연습입니다.\r\n\r\n수정중...'),
	(4, '홍대장', '', '', '단군상', '1234', '2020-05-07 11:51:14', 2, '127.0.0.1', '반갑습니다,.\r\n\r\n즐거운 시간들 되세요..'),
	(5, '이기자', '', '', '오랜만입니다.', '1234', '2020-05-07 11:51:53', 27, '127.0.0.1', '잘 지내십니까?\r\n\r\n그럼 다음에...'),
	(6, '강감찬', '', '', '이곳은 어디인가요?', '1234', '2020-05-07 11:52:20', 1, '127.0.0.1', '잘 보고 갑니다.\r\n\r\n수고하세요.'),
	(7, '홍대장', '', '', '연습', '1234', '2020-05-07 12:52:04', 5, '127.0.0.1', '연습이빙ㅇㅇㅇ'),
	(8, '홍대장', 'asdf', 'asdf', '1234', '1234', '2020-05-07 14:47:38', 3, '127.0.0.1', 'asdfasdfasdfadf'),
	(10, '열심히', '', '', '수정중입니다.', '1234', '2020-05-07 15:36:53', 0, '127.0.0.1', '그래도 열심히...\r\n합시다.'),
	(11, '또하나', '', '', '또 하나만 더 ....', '1234', '2020-05-07 15:37:18', 0, '127.0.0.1', 'test합니다.\r\n\r\n그러게요..'),
	(12, '홍대장', '', '', '글 제목은?', '1234', '2020-05-07 15:37:34', 1, '127.0.0.1', '없습니다.'),
	(13, '연습이', '', '', '연습이 최고', '1234', '2020-05-07 15:39:10', 9, '127.0.0.1', '이것도 연습입니다.\r\n\r\n\r\n그래도 수정합니다.\r\n\r\n수정됨...'),
	(15, '홍대장', '', '', '송년회 행사건', '1234', '2020-05-08 09:32:21', 0, '127.0.0.1', 'ghghgh'),
	(16, '홍대장', '', '', '4444', '1234', '2020-05-08 09:32:29', 1, '127.0.0.1', '4444'),
	(17, '홍대장', '', '', '5555', '1234', '2020-05-08 09:32:37', 0, '127.0.0.1', '5555'),
	(18, '홍대장', '', '', '6666', '1234', '2020-05-08 09:32:47', 0, '127.0.0.1', '6666'),
	(19, '홍대장', '', '', '7777', '1234', '2020-05-08 09:32:56', 0, '127.0.0.1', '7777'),
	(20, '홍대장', '', '', '6666', '1234', '2020-05-08 09:33:04', 0, '127.0.0.1', '6666'),
	(21, '홍대장', '', '', '3434', '1234', '2020-05-08 09:33:18', 0, '127.0.0.1', '3434'),
	(22, '홍대장', '', '', '1234', '1234', '2020-05-08 09:33:26', 0, '127.0.0.1', '12434'),
	(23, '홍대장', '', '', '2211', '1234', '2020-05-08 09:33:36', 1, '127.0.0.1', '2211'),
	(24, '홍대장', '', '', '4343', '1234', '2020-05-08 09:33:42', 0, '127.0.0.1', '4343'),
	(25, '홍대장', '', '', '이글은 연습입니다.', '1234', '2020-05-08 09:33:54', 1, '127.0.0.1', '333'),
	(26, '홍대장', '', '', '6767', '1234', '2020-05-08 09:36:21', 1, '127.0.0.1', '6767'),
	(27, '홍대장', '', '', '78787', '1234', '2020-05-08 09:36:31', 0, '127.0.0.1', '7878'),
	(28, '홍대장', '', '', 'err', '1234', '2020-05-08 09:36:40', 5, '127.0.0.1', 'erer'),
	(29, '홍대장', '', '', 'yuyu', '1234', '2020-05-08 09:36:47', 0, '127.0.0.1', 'yuyu'),
	(30, '홍대장', '', '', 'aaaa', '1234', '2020-05-08 09:36:55', 0, '127.0.0.1', 'aaaa'),
	(31, '홍대장', '', '', 'tttt', '1234', '2020-05-08 09:37:02', 0, '127.0.0.1', 'ttttt'),
	(32, '홍대장', '', '', '7766', '1234', '2020-05-08 09:37:10', 2, '127.0.0.1', '7766'),
	(33, '홍대장', '', '', '5454', '1234', '2020-05-08 09:37:19', 0, '127.0.0.1', '5454'),
	(34, '홍대장', '', '', '4343', '1234', '2020-05-08 09:37:26', 7, '127.0.0.1', '4343'),
	(35, '홍대장', '', '', 'ppp', '1234', '2020-05-08 09:37:33', 19, '127.0.0.1', 'ppp'),
	(36, '홍대장', '', '', 'sss', '1234', '2020-05-08 09:37:40', 17, '127.0.0.1', 'ssss'),
	(37, '홍대장', '', '', 'ppoo', '1234', '2020-05-08 09:37:49', 6, '127.0.0.1', 'ppoo'),
	(38, '홍대장', '', '', '4qqq', '1234', '2020-05-08 09:38:00', 53, '127.0.0.1', '4qqqq'),
	(41, '대장금', '', '', '새로운 글 입니다.', '1234', '2020-05-11 11:21:09', 5, '127.0.0.1', '잘 됩니까???\r\n시간을 체크해 주세요.'),
	(42, '대장금', '', '', '대장금이 올립니다.', '1234', '2020-05-11 11:21:42', 8, '127.0.0.1', '오늘 하루도 즐겁게\r\n\r\n...^.^....'),
	(43, '홍대장', 'hkd1234@aaa.bbb', 'http://blog.daum.net/cjsk1126', '666', '1234', '2020-05-21 11:12:01', 1, '0:0:0:0:0:0:0:1', '55555'),
	(44, '홍대장', '', '', '안녕하세요', '1234', '2020-05-22 11:02:33', 0, '0:0:0:0:0:0:0:1', '오랜만에 오네요..\r\n수고하세요.'),
	(45, '낙성대', 'hkd1234@aaa.bbb', 'http://blog.daum.net/cjsk1126', '게시글 연습입니다.', '1234', '2020-06-15 11:23:17', 0, '0:0:0:0:0:0:0:1', '이곳은 글내용...\r\n입니다.'),
	(46, '낙성대', 'aaa@aaa.aaa', 'http://blog.daum.net/cjsk1126', '666', '1234', '2020-06-15 11:25:59', 0, '0:0:0:0:0:0:0:1', 'dfgdfg'),
	(47, '낙성대', 'hkd1234@aaa.bbb', 'http://aaa.bbb.com', '연습', '1234', '2020-06-15 11:32:09', 2, '0:0:0:0:0:0:0:1', '연습입니다\r\n안녕..'),
	(48, '낙성대', 'bbb@bbb.ccc', '', '이곳은??', '1234', '2020-06-15 11:46:47', 0, '0:0:0:0:0:0:0:1', '연습 게시판입니다.\r\n\r\n잘 될까요?'),
	(49, '낙성대', 'bbb@bbb.ccc', '', '게시글 연습입니다.', '1234', '2020-06-15 14:09:53', 0, '127.0.0.1', '이곳은 게시판..\r\n글을 올리고 있습니다\r\n\r\n잘 표시 되나요?'),
	(50, '낙성대', 'bbb@bbb.ccc', '', '다시 연습', '1234', '2020-06-15 14:11:15', 11, '218.236.203.76', '연습창입니다.\r\n\r\n아이피를 확인하세요.'),
	(51, '낙성대', 'bbb@bbb.ccc', '', '그림파일 업로드', '1234', '2020-06-16 09:38:30', 2, '127.0.0.1', '<p><img alt="" src="/blue/resources/ckeditor/images/src//200616093755+0900_1cd6de81-f41c-4b94-a7de-79239bb5ac7d.jpeg" style="height:334px; width:500px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/ckeditor/images/src//200616093813+0900_20.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(52, '낙성대', 'bbb@bbb.ccc', '', '11', '1234', '2020-06-16 09:48:11', 4, '127.0.0.1', '<p><img alt="" src="/blue/resources/ckeditor/images/src//200616094748+0900_1.jpg" style="height:667px; width:500px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/ckeditor/images/src//200616094801+0900_18.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(53, '낙성대', 'bbb@bbb.ccc', '', '12', '1234', '2020-06-16 09:52:53', 18, '127.0.0.1', '<p><img alt="" src="/blue/resources/ckeditor/images/src//src/200616095131+0900_30.jpg" style="height:667px; width:500px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/ckeditor/images/src//src/200616095154+0900_14.jpg" style="height:960px; width:498px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(54, '낙성대', 'bbb@bbb.ccc', '', '15', '1234', '2020-06-16 10:20:06', 11, '127.0.0.1', '<p><img alt="" src="/blue/resources/ckeditor/images/src//200616101827+0900_1.jpg" style="height:667px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/ckeditor/images/src//200616101856+0900_3.jpg" style="height:960px; width:498px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(55, '낙성대', 'bbb@bbb.ccc', '', '22', '1234', '2020-06-16 11:25:43', 7, '127.0.0.1', '<p><img alt="" src="/blue/resources/ckeditor/images/src//200616112534+0900_15.jpg" style="height:259px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(62, '낙성대', 'bbb@bbb.ccc', 'http://blog.daum.net/cjsk1126', '글쓰기 연습', '1234', '2020-06-17 09:31:52', 19, '127.0.0.1', '<h1>이곳은 내용 입력창입니다.</h1>\r\n\r\n<p><img alt="" src="/blue/resources/ckeditor/images/src/200617093025+0900_01_002.jpg" style="height:333px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span class="marker">화면 이미지 연습입니다.</span></p>\r\n\r\n<p><img alt="" src="/blue/resources/ckeditor/images/src/200617093055+0900_01_07.jpg" style="height:750px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(63, '낙성대', 'bbb@bbb.ccc', 'http://blog.daum.net/cjsk1126', '댓글 사용 연습입니다.', '1234', '2020-06-17 09:40:42', 94, '127.0.0.1', '<p>댓글처리...</p>\r\n\r\n<p><img alt="" src="/blue/resources/ckeditor/images/src/200617094001+0900_3_1_12.jpg" style="height:333px; width:500px" /></p>\r\n');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 webdb.board_cont 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_cont` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `board_idx` int(11) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `wdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hostip` varchar(50) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `board_idx` (`board_idx`),
  CONSTRAINT `board_cont_ibfk_1` FOREIGN KEY (`board_idx`) REFERENCES `board` (`idx`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.board_cont:~22 rows (대략적) 내보내기
DELETE FROM `board_cont`;
/*!40000 ALTER TABLE `board_cont` DISABLE KEYS */;
INSERT INTO `board_cont` (`idx`, `board_idx`, `nickname`, `wdate`, `hostip`, `content`) VALUES
	(3, 38, '아톰', '2020-05-08 16:05:31', '127.0.0.1', '아무거나 넣읍시다.'),
	(4, 38, '아톰', '2020-05-08 16:49:16', '127.0.0.1', '댓글 연습중..\r\n아무거나...\r\n연습중...'),
	(5, 38, '아톰', '2020-05-08 16:56:44', '127.0.0.1', '하나 더 댓글 연습입니다.\r\n이건 어떻게 나올 까요?'),
	(6, 28, '아톰', '2020-05-08 16:57:09', '127.0.0.1', '댓글입니다.\r\n도...'),
	(7, 28, '아톰', '2020-05-08 17:07:30', '127.0.0.1', '또 작성...'),
	(8, 37, '아톰', '2020-05-08 17:22:03', '127.0.0.1', 'ㅀㅀㅀㅀㅀ'),
	(9, 35, '아톰', '2020-05-08 17:40:33', '127.0.0.1', '연습입니다.\r\n이곳은 댓글 다는곳~'),
	(11, 36, '대장금', '2020-05-11 10:41:39', '127.0.0.1', 'sdfsdfsdf'),
	(12, 36, '대장금', '2020-05-11 10:41:45', '127.0.0.1', 'dfdfdfd'),
	(16, 42, '아톰', '2020-05-11 13:59:29', '127.0.0.1', '감사합니다.\r\n즐거운 시간 되세요~'),
	(17, 36, '아톰', '2020-05-11 14:00:47', '127.0.0.1', '이곳도 연습하는 곳인가요?\r\n댓글이 말이 안되는 내용이라서...'),
	(19, 34, '홍대장', '2020-05-11 18:53:29', '127.0.0.1', 'asdf'),
	(20, 63, '이기자', '2020-06-17 09:41:40', '1.1.1.1', '안녕'),
	(21, 63, '낙성대', '2020-06-17 11:02:22', '127.0.0.1', '댓글연습'),
	(22, 63, '낙성대', '2020-06-17 11:02:46', '127.0.0.1', '이곳은 연습 댓글...\r\n입니다....'),
	(23, 63, '낙성대', '2020-06-17 11:07:18', '127.0.0.1', 'ㅁㄴㅇㄻㅇㄻㄴㅇㄹ'),
	(24, 63, '낙성대', '2020-06-17 11:15:02', '127.0.0.1', 'ㅌㅀㄴㄹㄴㅇㅀㄴㅇㄹ\r\n123412341234'),
	(25, 63, '사사네', '2020-06-17 11:22:45', '127.0.0.1', '안녕하세요...\r\n반갑습니다.'),
	(31, 62, '낙성대', '2020-06-17 14:26:38', '127.0.0.1', 'sdsdfsdf'),
	(32, 62, '낙성대', '2020-06-17 14:26:44', '127.0.0.1', 'sdsdf'),
	(33, 62, '낙성대', '2020-06-17 14:26:56', '127.0.0.1', 'sdfsdfsdfsfd'),
	(34, 63, '낙성대', '2020-06-17 14:33:43', '127.0.0.1', 'ghghghghgh'),
	(35, 63, '낙성대', '2020-06-17 14:33:56', '127.0.0.1', 'fghfghfgh'),
	(36, 63, '낙성대', '2020-06-17 14:36:35', '127.0.0.1', 'asdfasdfasdf');
/*!40000 ALTER TABLE `board_cont` ENABLE KEYS */;

-- 테이블 webdb.book1 구조 내보내기
CREATE TABLE IF NOT EXISTS `book1` (
  `bIdx` int(11) NOT NULL AUTO_INCREMENT,
  `bName` varchar(50) NOT NULL,
  `bPrice` int(11) DEFAULT NULL,
  `bDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.book1:~12 rows (대략적) 내보내기
DELETE FROM `book1`;
/*!40000 ALTER TABLE `book1` DISABLE KEYS */;
INSERT INTO `book1` (`bIdx`, `bName`, `bPrice`, `bDate`) VALUES
	(1, '노인과바다', 15000, '2015-05-25 00:00:00'),
	(2, '봉제인형살인사건', 10000, '2020-03-23 16:20:11'),
	(3, '어린왕자', 24000, '2010-01-02 00:00:00'),
	(4, '흔한남매', 10800, '2015-10-02 00:00:00'),
	(5, '데이안', 22000, '2018-11-02 00:00:00'),
	(6, '에이트', 15300, '2020-03-23 16:25:30'),
	(7, '아내를모자로착각한남자', 16650, '2018-05-02 00:00:00'),
	(8, '작은아씨들', 14800, '2017-07-04 00:00:00'),
	(9, '스스로행복하라', 10000, '2019-12-02 00:00:00'),
	(10, '기생충', 33000, '2017-07-02 00:00:00'),
	(11, '트렌트코리아2020', 16000, '2020-01-01 00:00:00'),
	(12, '노인과바다', 20000, '2020-03-23 16:31:10');
/*!40000 ALTER TABLE `book1` ENABLE KEYS */;

-- 테이블 webdb.careroom 구조 내보내기
CREATE TABLE IF NOT EXISTS `careroom` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `room` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.careroom:~8 rows (대략적) 내보내기
DELETE FROM `careroom`;
/*!40000 ALTER TABLE `careroom` DISABLE KEYS */;
INSERT INTO `careroom` (`idx`, `room`, `gender`, `name`) VALUES
	(1, '1호실', '남자', '김사과'),
	(2, '3호실', '여자', '김메론'),
	(3, '2호실', '남자', '박수박'),
	(4, '3호실', '여자', '서레몬'),
	(5, '2호실', '남자', '강단감'),
	(6, '1호실', '남자', '오참외'),
	(7, '4호실', '여자', '유배'),
	(8, '4호실', '여자', '유수리');
/*!40000 ALTER TABLE `careroom` ENABLE KEYS */;

-- 테이블 webdb.dbtest1 구조 내보내기
CREATE TABLE IF NOT EXISTS `dbtest1` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.dbtest1:~2 rows (대략적) 내보내기
DELETE FROM `dbtest1`;
/*!40000 ALTER TABLE `dbtest1` DISABLE KEYS */;
INSERT INTO `dbtest1` (`idx`, `mid`, `pwd`, `name`) VALUES
	(1, 'hkd1234', '1234', '홍길동'),
	(2, 'kms1234', '1234', '김말숙');
/*!40000 ALTER TABLE `dbtest1` ENABLE KEYS */;

-- 테이블 webdb.dechul 구조 내보내기
CREATE TABLE IF NOT EXISTS `dechul` (
  `dIdx` int(11) NOT NULL AUTO_INCREMENT,
  `d_bIdx` int(11) NOT NULL,
  `d_mIdx` int(11) NOT NULL,
  `dDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.dechul:~10 rows (대략적) 내보내기
DELETE FROM `dechul`;
/*!40000 ALTER TABLE `dechul` DISABLE KEYS */;
INSERT INTO `dechul` (`dIdx`, `d_bIdx`, `d_mIdx`, `dDate`) VALUES
	(1, 1, 1, '2020-01-05 00:00:00'),
	(2, 2, 1, '2020-03-05 00:00:00'),
	(3, 5, 2, '2020-01-15 00:00:00'),
	(4, 6, 4, '2020-03-15 00:00:00'),
	(5, 8, 2, '2020-02-05 00:00:00'),
	(6, 1, 2, '2020-02-15 00:00:00'),
	(7, 8, 1, '2020-02-25 00:00:00'),
	(8, 10, 2, '2020-03-05 00:00:00'),
	(9, 10, 1, '2020-03-01 00:00:00'),
	(10, 3, 4, '2020-01-09 00:00:00');
/*!40000 ALTER TABLE `dechul` ENABLE KEYS */;

-- 테이블 webdb.exam 구조 내보내기
CREATE TABLE IF NOT EXISTS `exam` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.exam:~16 rows (대략적) 내보내기
DELETE FROM `exam`;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` (`idx`, `mid`, `pwd`, `name`) VALUES
	(1, 'hkd1234', '1234', '홍길동'),
	(2, 'kms1234', '1234', '김말숙'),
	(3, 'lgj1234', '1234', '이기자'),
	(4, 'ohn1234', '1234', '오하늘'),
	(5, 'snm1234', '1234', '소나무'),
	(6, 'snm4321', '1234', '또나무'),
	(9, 'kkc1234', '1234', '강감찬'),
	(13, 'lkj1234', '1234', '이기자'),
	(15, 'asdf', 'asdf', '아무거나'),
	(17, '1111', '1111', '1234'),
	(18, '333', '333', '333'),
	(19, '444', '444', '444'),
	(20, '555', '555', '555'),
	(21, 'qwer', '1234', 'asdf'),
	(22, '5555', '1234', 'asdf'),
	(23, '666', '666', '666');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;

-- 테이블 webdb.goods1 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods1` (
  `product1` varchar(50) NOT NULL,
  PRIMARY KEY (`product1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.goods1:~2 rows (대략적) 내보내기
DELETE FROM `goods1`;
/*!40000 ALTER TABLE `goods1` DISABLE KEYS */;
INSERT INTO `goods1` (`product1`) VALUES
	('신발류'),
	('의류'),
	('전자제품');
/*!40000 ALTER TABLE `goods1` ENABLE KEYS */;

-- 테이블 webdb.goods2 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods2` (
  `product1` varchar(50) NOT NULL,
  `product2` varchar(50) NOT NULL,
  PRIMARY KEY (`product2`),
  KEY `product1` (`product1`),
  CONSTRAINT `goods2_ibfk_1` FOREIGN KEY (`product1`) REFERENCES `goods1` (`product1`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.goods2:~8 rows (대략적) 내보내기
DELETE FROM `goods2`;
/*!40000 ALTER TABLE `goods2` DISABLE KEYS */;
INSERT INTO `goods2` (`product1`, `product2`) VALUES
	('신발류', '나이키'),
	('신발류', '블랙야크'),
	('신발류', '아디다스'),
	('의류', 'K2'),
	('의류', '노스페이스'),
	('의류', '크로커다일'),
	('전자제품', 'LG'),
	('전자제품', '삼성'),
	('전자제품', '현대');
/*!40000 ALTER TABLE `goods2` ENABLE KEYS */;

-- 테이블 webdb.goods3 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods3` (
  `product1` varchar(50) NOT NULL,
  `product2` varchar(50) NOT NULL,
  `product3` varchar(50) NOT NULL,
  KEY `product1` (`product1`),
  KEY `product2` (`product2`),
  CONSTRAINT `goods3_ibfk_1` FOREIGN KEY (`product1`) REFERENCES `goods1` (`product1`) ON UPDATE CASCADE,
  CONSTRAINT `goods3_ibfk_2` FOREIGN KEY (`product2`) REFERENCES `goods2` (`product2`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.goods3:~32 rows (대략적) 내보내기
DELETE FROM `goods3`;
/*!40000 ALTER TABLE `goods3` DISABLE KEYS */;
INSERT INTO `goods3` (`product1`, `product2`, `product3`) VALUES
	('전자제품', '삼성', '냉장고'),
	('전자제품', '삼성', '선풍기'),
	('전자제품', '삼성', '세탁기'),
	('전자제품', '삼성', '오디오'),
	('전자제품', 'LG', '냉장고'),
	('전자제품', 'LG', '오디오'),
	('전자제품', 'LG', '전자레인지'),
	('전자제품', 'LG', 'TV'),
	('전자제품', 'LG', '컴퓨터'),
	('전자제품', 'LG', '프린터'),
	('전자제품', '현대', '냉장고'),
	('전자제품', '현대', '청소기'),
	('전자제품', '현대', '정수기'),
	('전자제품', '현대', '드라이기'),
	('신발류', '나이키', '등산화'),
	('신발류', '나이키', '운동화'),
	('신발류', '나이키', '실내화'),
	('신발류', '나이키', '조깅화'),
	('신발류', '아디다스', '농구화'),
	('신발류', '아디다스', '실내화'),
	('신발류', '아디다스', '등산화'),
	('신발류', '블랙야크', '농구화'),
	('신발류', '블랙야크', '등산화'),
	('신발류', '블랙야크', '실내화'),
	('의류', '크로커다일', '스커트'),
	('의류', '노스페이스', '자켓'),
	('의류', 'K2', '언더웨어'),
	('의류', '노스페이스', '패딩'),
	('의류', '노스페이스', '원피스'),
	('의류', '크로커다일', '바지'),
	('의류', '노스페이스', '티셔츠'),
	('의류', '크로커다일', '블라우스');
/*!40000 ALTER TABLE `goods3` ENABLE KEYS */;

-- 테이블 webdb.guest 구조 내보내기
CREATE TABLE IF NOT EXISTS `guest` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `homepage` varchar(50) DEFAULT NULL,
  `vdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hostip` varchar(40) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.guest:~30 rows (대략적) 내보내기
DELETE FROM `guest`;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` (`idx`, `name`, `email`, `homepage`, `vdate`, `hostip`, `content`) VALUES
	(1, '홍길동', 'cjsk1126@naver.com', 'blog.daum.net/cjsk1126', '2020-04-27 13:09:37', '218.236.203.76', '방명록 서비스 개시....'),
	(4, '홍길', 'hkd1234@hanmail.net', 'blog.daum.net/hkd1234', '2020-04-28 10:39:13', '0:0:0:0:0:0:0:1', '안녕하세요. 길동이 입니다.\r\n잘 부탁드립니다.'),
	(5, '나그네', '', '', '2020-04-28 11:00:53', '0:0:0:0:0:0:0:1', '잘 부탁합니다.'),
	(6, '소나무', '', '', '2020-04-28 11:34:01', '127.0.0.1', '안녕!!! 친구들...\r\n난 소나무라고해...\r\n\r\n잘 지내자..'),
	(7, '오늘도', 'aaa@aaa.aaa', 'http://aaa.bbb.com', '2020-04-28 11:59:56', '127.0.0.1', '오늘도....\r\n열심히...'),
	(8, '연습이', 'atom1234@ddd.com', 'blog.daum.net/hkd1234', '2020-04-28 12:00:22', '127.0.0.1', '열심히 에러를 잡읍시다..\r\n파이팅!!!'),
	(9, '소나무', '', '', '2020-04-28 12:00:40', '127.0.0.1', '늘 푸른 소나무...\r\n\r\n언제나 푸르게...'),
	(10, '홍길동', 'hkd1234@hanmail.net', 'blog.daum.net/hkd1234', '2020-04-28 12:01:20', '127.0.0.1', ''),
	(11, '나그네', '', '', '2020-04-28 12:03:19', '127.0.0.1', '바람따라, 구름따라... 정처없이.... 간다...\r\n\r\n어디로????'),
	(12, '오늘도', 'aaa@aaa.aaa', 'blog.daum.net/aaa', '2020-04-28 12:04:04', '127.0.0.1', '오늘도...\r\n\r\nJSP와 함께....하루를...'),
	(13, '연습이', '', '', '2020-04-28 12:04:24', '127.0.0.1', '이곳은 에러가 없나요?...\r\n\r\n내가 에러좀 찾아봐 줄께요.'),
	(14, '구름', '', '', '2020-04-28 12:04:48', '127.0.0.1', '구름에 달 가듯이 가는 나그네..\r\n\r\n오늘은 2020년 4월 28일'),
	(15, '연습이', '', '', '2020-04-28 12:05:13', '127.0.0.1', '연습중... 입니다.\r\n\r\n\' 기호 처리는????'),
	(16, '나그네', '', '', '2020-04-28 12:05:57', '127.0.0.1', '특수글자?...\r\n\r\n< > \\ \' " ~ ` . , ? ! @ # $ % ^ & \r\n\r\n잘 되나요???'),
	(17, '연습이', '', '', '2020-04-28 12:06:21', '127.0.0.1', '제어코드는??\r\n\r\n\\n \\t \\\\  처리는???'),
	(18, '홍길동', '', '', '2020-04-28 12:06:51', '127.0.0.1', '태그 처리는?\r\n\r\n<font color=\'red">빨강으로 보이니</font>'),
	(19, '나그네', '', '', '2020-04-28 12:08:11', '127.0.0.1', '일부로 오타나 태그를 이용한 해킹...\r\n\r\n<font size=7 color=pink><b><i><u>안녕</u></i></b></font>'),
	(20, '안녕하세요', '', '', '2020-04-28 12:13:43', '218.236.203.85', '소스좀 올려주세요'),
	(21, '행복천', 'cjsk1126@hanmail.net', 'blog.daum.net/cjsk1126', '2020-04-28 17:26:37', '127.0.0.1', '안녕하십니까...\r\n\r\n방명록에 처음 글 남깁니다.\r\n\r\n자주 뵙지요...'),
	(27, '연습맨', '', '', '2020-05-06 09:31:02', '127.0.0.1', '긴~ 휴가 잘 마치고 왔습니다.\r\n\r\n다시 새로운 마음으로 시작~~~'),
	(28, '나그네', 'aaa@aaa.aaa', 'http://aaa.bbb.com', '2020-06-04 11:35:40', '127.0.0.1', '둘러 봅니다.\r\n\r\n잘 지내시죠?...'),
	(29, '소나무', '', '', '2020-06-04 11:48:38', '127.0.0.1', '오늘도 푸르게\r\n\r\n또 푸르게...'),
	(30, '아하하하하', 'ahaha@naver.com', 'ahaha@naver.blog.com', '2020-06-04 11:50:26', '218.236.203.91', '아하하하하하하하하하하 잇힝~'),
	(31, '방문객입니다', '', '', '2020-06-04 11:50:43', '218.236.203.80', '방문했어요.'),
	(32, '나그네', '', '', '2020-06-04 15:21:40', '127.0.0.1', '연습중입니다.'),
	(34, '안녕맨', 'aaa@bb.ccc', 'blog.daum.net/hkd1234', '2020-06-11 14:01:12', '127.0.0.1', '안녕하세요.\r\n반갑습니다.\r\n다음에 또 만나요.'),
	(36, 'tyutuy', '', '', '2020-06-11 17:39:57', '0:0:0:0:0:0:0:1', 'tyutyutuy');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;

-- 테이블 webdb.login 구조 내보내기
CREATE TABLE IF NOT EXISTS `login` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.login:~4 rows (대략적) 내보내기
DELETE FROM `login`;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`idx`, `mid`, `pwd`, `name`) VALUES
	(1, 'hkd1234', '1234', '홍길동'),
	(2, 'kms1234', '1234', '김말숙'),
	(3, 'lkj1234', '1234', '이기자'),
	(4, 'kkc1234', '1234', '강감찬');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- 테이블 webdb.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` char(2) DEFAULT 'm',
  `birth` date DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `job` varchar(15) DEFAULT NULL,
  `hobby` varchar(50) DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  `homepage` varchar(50) DEFAULT NULL,
  `userinfor` char(2) DEFAULT 'OK',
  `level` varchar(10) DEFAULT '준회원',
  `userdel` char(2) DEFAULT 'NO',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.member:~22 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`idx`, `mid`, `pwd`, `nickname`, `name`, `gender`, `birth`, `tel`, `address`, `job`, `hobby`, `email`, `homepage`, `userinfor`, `level`, `userdel`) VALUES
	(1, 'hkd1234', '1234', '홍대장', '홍길동', 'm', '1969-02-20', '010-3423-2704', '전라북도', '기타', '등산/싸이클/영화감상/꽃꽂이/', 'cjsk1126@daum.net', 'http://blog.daum.net/cjsk1126', 'NO', '특별회원', 'NO'),
	(3, 'onr1234', '1234', '대장금', '큐큐큐', 'f', '2017-04-01', '010-666-5656', '충청남도', '학생', '등산', 'qqq@daum.net', 'http://', 'OK', '정회원', 'NO'),
	(4, 'ddd', '1234', '연습d', '디디디', 'f', '2017-04-01', '010-3333-4444', '충청남도', '학생', '', 'ddd@daum.net', 'http://', 'OK', '준회원', 'NO'),
	(7, 'admin', '1234', '관리자', '행복천', 'm', '2017-04-01', '010-3423-2704', '충청남도', '학생', '등산', 'qqq@daum.net', 'http://', 'OK', '관리자', 'NO'),
	(9, 'yyyy', '1234', '연습y', '와이', 'f', '2017-04-01', '042-666-5656', '경상북도', '군인', '등산/싸이클/꽃꽂이/', 'yyyy@daum.net', 'http://', 'OK', '정회원', 'NO'),
	(10, 'atom1234', '1234', '아톰', '아톰', 'm', '1973-03-02', '010-3333-4444', '경기도', '변호사', '낚시/싸이클/', 'atom@yahoo.co.kr', 'http://', 'OK', '준회원', 'NO'),
	(12, 'qqq', '1234', '연습q', '큐큐큐', 'f', '2017-04-01', '031-6669-5656', '제주도', '학생', '낚시/싸이클/영화감상/독서/경기관람/꽃꽂이/', 'qqq@hanmail.net', 'http://qqq.com', 'OK', '정회원', 'NO'),
	(14, 'bbbbb', '1234', '연습b', '비비비비비', 'f', '2014-07-04', '010-1111-2222', '강원도', '학생', '싸이클/', '@없음', 'http://', 'OK', '정회원', 'NO'),
	(15, 'ttttt', '1234', '연습t', '티티티', 'm', '2016-09-01', '010--', '서울', '학생', '경기관람/', '@없음', 'http://', 'OK', '정회원', 'NO'),
	(16, 'aaaaa', '1234', '연습a', '에이', 'f', '2014-06-01', '010--', '서울', '학생', '음악감상/독서/', '@없음', 'http://', 'OK', '정회원', 'NO'),
	(17, 'uuuu', '1234', '연습u', '유유유', 'f', '2006-09-07', '010-6767-6767', '경상북도', '공무원', '기타', 'hhh@naver.com', 'http://', 'OK', '정회원', 'NO'),
	(18, 'zzzz', '1234', '연습z', '제트맨', 'm', '2020-01-01', '010--', '서울', '학생', '기타', '@없음', 'http://', 'OK', '준회원', 'NO'),
	(19, '8888', '1234', '연습8', '팔팔팔', 'm', '2016-01-01', '010--', '서울', '학생', '기타', '@없음', 'http://', 'OK', '정회원', 'NO'),
	(20, 'yuyu', '1234', '연습y', '와이유', 'f', '2008-10-21', '010-1234-1234', '서울', '회사원', '기타', '@없음', 'http://', 'OK', '정회원', 'NO'),
	(22, 'hkd12345', '3', '길동2', 'a333', 'm', '2020-03-01', '010-2-2', '서울', '학생', '', '@없음', 'http://', 'OK', '정회원', 'NO'),
	(23, '999', '1234', '연습9', 'a999', 'm', '2020-01-01', '010--', '서울', '학생', '', '@없음', 'http://', 'OK', '정회원', 'NO'),
	(24, 'qqq1234', '1234', '큐큐큐', '큐공주', 'f', '1999-06-18', '010-9999-9999', '제주도', '기타', '낚시/꽃꽂이/', 'qqq@naver.com', 'http://blog.qqq.net', 'OK', '정회원', 'NO'),
	(26, 'ddddd', '1234', '디디디d', '디디디d', 'm', '2020-01-01', '010--', '서울', '학생', '', '@없음', 'http://', 'OK', '준회원', 'NO'),
	(27, 'sssss', '1234', '에스s', '에스s', 'm', '2020-01-01', '010--', '서울', '학생', '', '@없음', 'http://', 'OK', '준회원', 'NO'),
	(28, 'eeeee', '1234', '이e', '이e', 'm', '2020-01-01', '010--', '서울', '학생', '', '@없음', 'http://', 'OK', '준회원', 'NO'),
	(29, 'wwwww', '1234', '데블유w', '데블유w', 'm', '2020-01-01', '010--', '서울', '학생', '', '@없음', 'http://', 'OK', '특별회원', 'NO'),
	(30, '777', '1234', '칠칠칠', '칠천량', 'm', '2020-03-19', '010-4444-7777', '전라남도', '의사', '수영/꽃꽂이/', '777@naver.com', 'http://777.com', 'OK', '정회원', 'OK');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 webdb.member2 구조 내보내기
CREATE TABLE IF NOT EXISTS `member2` (
  `mIdx` int(11) NOT NULL COMMENT '고유번호',
  `m_id` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT '20',
  `gender` char(2) DEFAULT NULL,
  `ipsail` datetime DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `buser` varchar(10) DEFAULT NULL,
  `jikkub` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.member2:~14 rows (대략적) 내보내기
DELETE FROM `member2`;
/*!40000 ALTER TABLE `member2` DISABLE KEYS */;
INSERT INTO `member2` (`mIdx`, `m_id`, `pwd`, `name`, `age`, `gender`, `ipsail`, `address`, `sal`, `bonus`, `buser`, `jikkub`) VALUES
	(1, 'hkd1234', '1234', '홍길동', 40, 'm', '2000-10-02 00:00:00', '서울', 4000000, 300000, '총무과', '부장'),
	(2, 'kms5678', '1234', '김말숙', 33, 'f', '1998-08-12 00:00:00', '부산', 3500000, 400000, '인사과', '과장'),
	(3, 'lgj1234', '1234', '이기자', 30, 'm', '2002-11-22 00:00:00', '청주', 2500000, 550000, '영업과', '사원'),
	(4, 'kkc1234', '1234', '강감찬', 30, 'm', '2010-12-03 00:00:00', '제주', 3000000, 550000, '생산과', '대리'),
	(5, 'ohn1234', '1234', '오하늘', 22, 'f', '2008-09-14 00:00:00', '부산', 2500000, 550000, '총무과', '사원'),
	(6, 'ksr1234', '1234', '김사랑', 20, 'f', '2003-05-23 00:00:00', '서울', 2500000, 550000, '총무과', '사원'),
	(7, 'snm1234', '1234', '소나무', 27, 'm', '2013-03-17 00:00:00', '청주', 3000000, 550000, '생산과', '대리'),
	(8, 'cis1234', '1234', '참이슬', 23, 'm', '2016-07-30 00:00:00', '대전', 2500000, 550000, '영업과', '사원'),
	(9, 'lsh1234', '1234', '이선희', 32, 'f', '2018-02-11 00:00:00', '서울', 3500000, 400000, '인사과', '과장'),
	(10, 'shm1234', '1234', '손흥민', 26, 'm', '2009-09-09 00:00:00', '청주', 2500000, 550000, '영업과', '사원'),
	(13, 'abc1234', '1234', '에이비씨', 30, 'm', '2020-03-23 00:00:00', '서울', 1500000, 0, '영업과', '사원'),
	(12, 'ddd1234', '1234', '디디디', 20, 'f', NULL, '서울', 2000000, NULL, '영업과', NULL),
	(11, 'abc1234', '1234', '에이비씨', 30, 'm', '2020-03-23 00:00:00', '서울', 1500000, 0, '영업과', '사원'),
	(14, 'ddd1234', '1234', '디디디', 20, 'f', NULL, '서울', 2000000, NULL, '영업과', NULL);
/*!40000 ALTER TABLE `member2` ENABLE KEYS */;

-- 테이블 webdb.membership 구조 내보내기
CREATE TABLE IF NOT EXISTS `membership` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `gender` char(2) DEFAULT '남자',
  `tel` varchar(15) DEFAULT NULL,
  `hobby` varchar(50) DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  `joinday` datetime DEFAULT CURRENT_TIMESTAMP,
  `userinfor` char(2) DEFAULT 'OK',
  `level` int(11) NOT NULL DEFAULT '4',
  `userdel` char(2) DEFAULT 'NO',
  `content` text,
  PRIMARY KEY (`idx`,`nickname`),
  UNIQUE KEY `mid` (`mid`,`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.membership:~12 rows (대략적) 내보내기
DELETE FROM `membership`;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` (`idx`, `mid`, `pwd`, `name`, `nickname`, `gender`, `tel`, `hobby`, `email`, `joinday`, `userinfor`, `level`, `userdel`, `content`) VALUES
	(3, 'kms1234', '1234', '김말숙', '김천사', '남자', '010-3333-2222', '낚시', 'kms1234@naver.com', '2020-06-04 16:26:09', 'OK', 2, 'NO', '안녕하세요'),
	(5, 'snk1234', '$2a$10$zhK8ARwDAzVOLlXFuAli4e1nRnOA1ZtXeyA81LPAjd5WdincUwaTW', '소나기', '소낙비', '남자', '010-222-2222', '등산/기타/', 'aaa@aaa.aaa', '2020-06-09 16:38:20', 'OK', 3, 'NO', NULL),
	(6, 'ohn1234', '$2a$10$45KwaN8fgi07VsSeS59aV.bsR1eGcA54KMlLgtOkS8DT7CLS3MLFG', '오하늘', '파란하늘', '여자', '010-3232-3232', '승마/', 'ohn1234@naver.com', '2020-06-09 16:41:54', 'OK', 4, 'NO', '오하늘 입니다.\r\n\r\n수고하세요.'),
	(7, 'kkc1234', '$2a$10$ztUdXGmZ1cnzWTE3EgTSCu/kqW9yYV4wlQsmCnKmrisS2QVQuasue', '강감찬', '낙성대', '남자', '010-5555-2250', '승마/', 'bbb@bbb.ccc', '2020-06-10 12:27:12', 'OK', 2, 'NO', '낙성대가 내 고향...\r\n많이 놀러들 오세요..\r\n다시...수정완료..!!..!!'),
	(8, 'admin', '$2a$10$XaI6odkvs8iF77bqfxf1TOJahKDpxWKSlZGlRlXdrAa3WxG/bQynK', '관리자', '관리맨', '남자', '02-656-4537', '등산/', 'admin@blue.com', '2020-06-10 12:30:42', 'NO', 0, 'NO', '관리자 입니다.\r\n잘 부탁드립니다.'),
	(9, '1111', '$2a$10$d9iXXZ1Dn.IPKW6ecpin8OGYBRIKBzuDWtkPZJ2/.JA2LSbGHppbS', '나그네', '나나나', '남자', '02-333-3333', '낚시/', 'aaa@aaa.aaa', '2020-06-10 13:11:58', 'OK', 4, 'OK', 'ㅇㅇㅇ'),
	(10, '2222', '$2a$10$6YmDHzru6B36SjST/PiwEuI4/1ucYxWxiFlRyHQQPZpQHjWKnqsnu', '이이이', '이이다', '여자', '061-333-3333', '영화감상/', 'hkd1234@aaa.bbb', '2020-06-10 14:41:45', 'OK', 3, 'NO', ''),
	(11, '3333', '$2a$10$Jh1d53Xzselgmr/fx/IsKudab4RuyVXGIblhmMDog48t2CwUsW.ke', '삼삼삼', '삼삼이', '남자', '051-3333-3333', '승마/', 'flyshon@naver.com', '2020-06-10 14:54:25', 'OK', 3, 'OK', ''),
	(13, '4444', '$2a$10$4WwoUGIJI0nAqE2ns4JmtOBUF94pI56UHqir8f28cNehU/A4fgDf2', '사사사', '사사네', '남자', '010-444-4444', '낚시/', 'atom@ddd.com', '2020-06-10 17:10:30', 'OK', 3, 'NO', '444'),
	(14, 'gnd1234', '$2a$10$jST7f/ViVbLRNEgUaB4hrOvZ7Sr3qNijNdSYP8qTcecdQpI17asDK', '가나다', '한글맨', '남자', '042-444-3333', '등산/', '', '2020-06-11 10:06:47', 'NO', 4, 'NO', ''),
	(15, 'ojm1234', '$2a$10$5QBDz9tjaUos5finNlFjFePSbUDdsVzyC9o9bPsv7HIGmVbYgYmza', '오장미', '장미', '여자', '051-5454-5454', '승마/영화감상/', '', '2020-06-11 14:16:49', 'OK', 3, 'NO', '오장미라고 합니다.\r\n오월을 좋아하죠..'),
	(16, 'onr1234', '$2a$10$LayrZzXeZtnBkv9X8u6AIOKVjiFGL56YrCxB/ckN7ImVD7mdCGaTa', '오나라', '대장금', '여자', '010-9999-9898', '낚시/영화감상/', 'onr1234@naver.com', '2020-06-11 15:18:47', 'OK', 3, 'NO', '오나라 입니다.\r\n\r\n잘 부탁드려요..!!'),
	(17, 'hkd1234', '$2a$10$nCR3i0CKT6uu9lBvK8usounTr/kjptn9fpnD1hNAI/v1VT4UXQi9.', '홍길동', '홍장군', '남자', '010-3423-2704', '등산/', 'hkd1234@hanmail.net', '2020-06-23 07:54:49', 'NO', 3, 'NO', '홍길동입니다.\r\n오래전에 가입했다가 강퇴 당했습니다.\r\n억울해서 다시 가입합니다.\r\n또? 강퇴??? 시킬때?... 폭파~~~~');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;

-- 테이블 webdb.mvcboard 구조 내보내기
CREATE TABLE IF NOT EXISTS `mvcboard` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.mvcboard:~13 rows (대략적) 내보내기
DELETE FROM `mvcboard`;
/*!40000 ALTER TABLE `mvcboard` DISABLE KEYS */;
INSERT INTO `mvcboard` (`idx`, `name`, `title`, `content`) VALUES
	(1, '홍길동', 'mvc게시판 연습', '이곳은 MVC게시판 입니다.'),
	(2, '연습이', '단군상', '676767'),
	(3, '연습이', '단군상', '676767'),
	(4, '연습이', '단군상', '676767'),
	(5, '홍길동', '1234', '2222'),
	(6, '소나무', '송년회 행사건', '66666'),
	(7, '오늘도', '이글은 연습입니다.', 'rrrr'),
	(8, '홍길동', '연습입니다.', '이것은\r\n연습이예요.\r\n엔터키 연습...'),
	(9, '홍길동', '연습입니다.', '이것은\r\n연습이예요.\r\n엔터키 연습...'),
	(10, '강남', '클럽', '조심하세요.\r\n요즘은...'),
	(11, '강남', '클럽', '조심하세요.\r\n요즘은...'),
	(12, '다시한번', '더 연습..', '가자...\r\n\r\n프로그램 짜러...'),
	(13, '이순신', '장군1', '글올리기 연습\r\n입니다...\r\n수정합니다.');
/*!40000 ALTER TABLE `mvcboard` ENABLE KEYS */;

-- 테이블 webdb.pds 구조 내보내기
CREATE TABLE IF NOT EXISTS `pds` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `rfname` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `part` varchar(20) NOT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `fdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fsize` int(11) NOT NULL,
  `downnum` int(11) NOT NULL DEFAULT '0',
  `opensw` varchar(10) NOT NULL DEFAULT '공개',
  `content` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.pds:~15 rows (대략적) 내보내기
DELETE FROM `pds`;
/*!40000 ALTER TABLE `pds` DISABLE KEYS */;
INSERT INTO `pds` (`idx`, `nickname`, `fname`, `rfname`, `title`, `part`, `pwd`, `fdate`, `fsize`, `downnum`, `opensw`, `content`) VALUES
	(2, '홍대장', '3.zip', '3.zip', '연습자료', '학습', '1234', '2020-05-20 17:37:10', 145006, 1, '공개', '지금은 연습입니다.\r\n잘 되나요?'),
	(3, '홍대장', '34.jpg', '34.jpg', '자연으로 갑니다.', '학습', '1234', '2020-05-20 18:14:13', 259327, 0, '공개', '파란 하늘과 함께..\r\n시원한 곳으로..\r\n출발~~'),
	(4, '홍대장', 'bg.jpg', 'bg.jpg', '사무용 사진', '기타', '1234', '2020-05-21 09:41:12', 420777, 2, '공개', '태블릿 사진입니다.\r\n참고하세요.'),
	(5, '홍대장', '2.jpg', '2.jpg', 'fgfgfg', '학습', '1234', '2020-05-21 10:15:15', 36677, 5, '공개', 'dfgdfgdfgdfgd'),
	(6, '대장금', 'avatar1.png', 'avatar1.png', '아바타', '학습', '1234', '2020-05-21 10:49:51', 11721, 10, '공개', '채팅에 필요한 남자 아바타입니다.'),
	(7, '홍대장', '3.zip', '31.zip', '이건 나만 봅니다.', '학습', '1234', '2020-05-21 11:56:18', 145006, 0, '비공개', '중요하니깐...'),
	(8, '홍대장', '반복문.txt', '반복문.txt', '반복문', '학습', '1234', '2020-05-21 16:10:06', 700, 2, '공개', '텍스트파일'),
	(9, '홍대장', '반복문1.txt', '반복문1.txt', '반복문1번파일', '학습', '1234', '2020-05-21 16:11:19', 16, 1, '공개', '연습(영문)'),
	(10, '홍대장', '4.jpg', '4.jpg', '연습파일', '학습', '1234', '2020-05-21 16:45:47', 236664, 4, '공개', 'ㅇㅇㅇ'),
	(11, '홍대장', '47.jpg', '47.jpg', '천황산', '여행', '1234', '2020-05-22 09:52:56', 280432, 0, '공개', '영남알프스 천황산입니다.\r\n한번 다녀오세요..'),
	(12, '홍대장', 'Untitled-1.jpg', 'Untitled-1.jpg', '사무실의 기억들', '영화', '1234', '2020-05-22 09:53:43', 42154, 0, '공개', '직장생활 영화입니다.'),
	(13, '홍대장', 'avatar2.png', 'avatar2.png', '아바타2', '영화', '1234', '2020-05-22 11:17:36', 21494, 1, '공개', '여자 아바타...\r\n\r\n내용 입력부입니다.'),
	(14, '홍대장', '34.jpg', '341.jpg', '아무거나', '영화', '1234', '2020-05-22 12:19:52', 259327, 1, '공개', '언제나 완성이 될가요?\r\n\r\n글쎄...\r\n\r\n연습은 충분히..\r\n\r\n이곳이 보이나요?\r\n\r\n글쎄요?...\r\n\r\n아마도...\r\n\r\n여기까지는 안 보이겠죠?...\r\n\r\n그러게요...'),
	(15, '홍대장', 'DSC01477.jpg', 'DSC01477.jpg', '그림파일', '여행', '1234', '2020-05-25 10:28:34', 145218, 0, '비공개', '연습입니다.\r\n홍대장이 올린것입니다.'),
	(22, '홍대장', '17.jpg', '17.jpg', '1212', '학습', '1234', '2020-05-25 16:08:40', 109554, 0, '공개', '1212');
/*!40000 ALTER TABLE `pds` ENABLE KEYS */;

-- 테이블 webdb.pds2 구조 내보내기
CREATE TABLE IF NOT EXISTS `pds2` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `rfname` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `part` varchar(20) NOT NULL,
  `fdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fsize` int(11) NOT NULL,
  `downnum` int(11) NOT NULL DEFAULT '0',
  `opensw` varchar(10) NOT NULL DEFAULT '공개',
  `content` text,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.pds2:~11 rows (대략적) 내보내기
DELETE FROM `pds2`;
/*!40000 ALTER TABLE `pds2` DISABLE KEYS */;
INSERT INTO `pds2` (`idx`, `nickname`, `fname`, `rfname`, `title`, `part`, `fdate`, `fsize`, `downnum`, `opensw`, `content`) VALUES
	(1, '홍길동', '123.jpg', '20200618_1.jpg', '풍경그림', '여행', '2020-06-18 10:54:44', 100, 2, '공개', '제주도 풍경...'),
	(2, '낙성대', '01_002.jpg', '202051824410620_01_002.jpg', '정상에서...', '여행', '2020-06-18 14:44:10', 302832, 0, '공개', '즐거운 산행길\r\n\r\n입니다.'),
	(3, '낙성대', '01_14_6.jpg', '20205182444372_01_14_6.jpg', '이것도 그림입니다.', '학습', '2020-06-18 14:44:43', 253577, 0, '공개', '그림파일업로드\r\n잘될까요?'),
	(4, '낙성대', '3.zip', '20205182470650_3.zip', '압축파일 관리', '학습', '2020-06-18 14:47:00', 145006, 0, '공개', '압축파일 잘 올라갈까요?\r\n연습입니다.'),
	(5, '낙성대', '22.jpg', '202051993833461_22.jpg', '천황산', '여행', '2020-06-19 09:38:33', 470651, 1, '공개', '영남 알프스의 위치한 산..'),
	(6, '낙성대', '20.jpg', '202051995058282_20.jpg', '323232', '여행', '2020-06-19 09:50:58', 286869, 0, '공개', '23232'),
	(7, '낙성대', '37.jpg', '20205199513758_37.jpg', '영남알프스', '여행', '2020-06-19 09:51:37', 290569, 0, '공개', '천황산~재약산'),
	(8, '낙성대', '3.zip', '202051995157867_3.zip', '압축파일', '학습', '2020-06-19 09:51:57', 145006, 1, '공개', '입니다.\r\n압축'),
	(9, '낙성대', '3.zip', '202051995225485_3.zip', '자료연습', '학습', '2020-06-19 09:52:25', 145006, 1, '비공개', '글 내용 연습\r\n압축파일'),
	(10, '낙성대', '01_002.jpg', '202051995251791_01_002.jpg', '별장사진', '여행', '2020-06-19 09:52:51', 302832, 2, '공개', '관리도 별장'),
	(11, '낙성대', 'DSC11463.jpg', '202051995318374_DSC11463.jpg', '송년회 행사건', '여행', '2020-06-19 09:53:18', 227935, 3, '공개', '저녁식사\r\n메뉴입니다.'),
	(12, '낙성대', '1_031_021_02.jpg', '202051995444650_1_031_021_02.jpg', '비공개 영상', '학습', '2020-06-19 09:54:44', 443045, 3, '비공개', '비공개 자료입니다.');
/*!40000 ALTER TABLE `pds2` ENABLE KEYS */;

-- 테이블 webdb.photogallery 구조 내보내기
CREATE TABLE IF NOT EXISTS `photogallery` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `photoIdx` int(11) NOT NULL,
  `rfname` varchar(100) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `photoIdx` (`photoIdx`),
  CONSTRAINT `photogallery_ibfk_1` FOREIGN KEY (`photoIdx`) REFERENCES `phototitle` (`idx`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43556 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.photogallery:~48 rows (대략적) 내보내기
DELETE FROM `photogallery`;
/*!40000 ALTER TABLE `photogallery` DISABLE KEYS */;
INSERT INTO `photogallery` (`idx`, `photoIdx`, `rfname`) VALUES
	(43344, 14, '200623111623+0900_IMG_6576.JPG'),
	(43345, 14, '200623111639+0900_IMG_6586.JPG'),
	(43346, 15, '200623112233+0900_IMG_6514.JPG'),
	(43347, 15, '200623112250+0900_IMG_6583.JPG'),
	(43348, 15, '200623112303+0900_IMG_6651.JPG'),
	(43349, 16, '200623153748+0900_IMG_6487.JPG'),
	(43350, 16, '200623153810+0900_IMG_6502.JPG'),
	(43351, 16, '200623153827+0900_IMG_6513.JPG'),
	(43352, 16, '200623153842+0900_IMG_6545.JPG'),
	(43353, 16, '200623153859+0900_IMG_6570.JPG'),
	(43354, 16, '200623153916+0900_IMG_6523.JPG'),
	(43355, 16, '200623153932+0900_IMG_6587.JPG'),
	(43356, 16, '200623153955+0900_IMG_6621.JPG'),
	(43357, 16, '200623154012+0900_IMG_6641.JPG'),
	(43358, 16, '200623154032+0900_IMG_6721.JPG'),
	(43359, 16, '200623154048+0900_IMG_6719.JPG'),
	(43360, 16, '200623154104+0900_IMG_6713.JPG'),
	(43361, 16, '200623154119+0900_IMG_6749.JPG'),
	(43362, 16, '200623154138+0900_IMG_6792.JPG'),
	(43363, 16, '200623154155+0900_IMG_6804.JPG'),
	(43364, 16, '200623154215+0900_IMG_6863.JPG'),
	(43365, 16, '200623154234+0900_IMG_6886.JPG'),
	(43366, 16, '200623154254+0900_IMG_6827.JPG'),
	(43367, 16, '200623154317+0900_IMG_6945.JPG'),
	(43368, 16, '200623154345+0900_IMG_6903.JPG'),
	(43406, 18, '200624122659+0900_25a042da-2bc4-4ff6-a92d-a13326505280.jpeg'),
	(43422, 17, '200624100510+0900_IMG_1572.jpg'),
	(43423, 17, '200624100524+0900_IMG_1604.jpg'),
	(43482, 19, '200624102442+0900_10.gif'),
	(43508, 20, '200624123056+0900_DSC01477.jpg'),
	(43509, 20, '200624122844+0900_20.jpg'),
	(43510, 20, '200624122903+0900_49.jpg'),
	(43511, 20, '200624122919+0900_23.jpg'),
	(43512, 20, '200624123005+0900_39.jpg'),
	(43525, 6, '200623074846+0900_b8e27bd8-5071-417b-936c-13869d5a054d.jpeg'),
	(43526, 6, '200623074905+0900_top_bg2.jpg'),
	(43527, 6, '200623074922+0900_top_bg4.jpg'),
	(43532, 22, '200624163325+0900_18.jpg'),
	(43533, 22, '200624163342+0900_25.jpg'),
	(43546, 30, '200625092822+0900_18.jpg'),
	(43547, 30, '200625092838+0900_1.jpg'),
	(43548, 30, '200625092855+0900_01_13.jpg'),
	(43549, 30, '200625092906+0900_1_121_1.jpg'),
	(43550, 30, '200625092917+0900_31.jpg'),
	(43552, 31, '200630090646+0900_01_14_1.jpg'),
	(43553, 31, '200630090926+0900_01_13_1.jpg'),
	(43554, 32, '200703150352+0900_01_06.jpg'),
	(43555, 32, '200703150405+0900_01_04_1.jpg');
/*!40000 ALTER TABLE `photogallery` ENABLE KEYS */;

-- 테이블 webdb.phototitle 구조 내보내기
CREATE TABLE IF NOT EXISTS `phototitle` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `part` varchar(20) NOT NULL,
  `title` text NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.phototitle:~22 rows (대략적) 내보내기
DELETE FROM `phototitle`;
/*!40000 ALTER TABLE `phototitle` DISABLE KEYS */;
INSERT INTO `phototitle` (`idx`, `nickname`, `part`, `title`, `thumbnail`, `content`) VALUES
	(1, '낙성대', '여행', '연습1', '200622172748+0900_IMG_2761.JPG', '<p><img alt="" src="/blue/resources/photo/200622172748+0900_IMG_2761.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200622172818+0900_1.jpg" style="height:169px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(2, '낙성대', '여행', '연습2', '200622181310+0900_2.jpg', '<p><img alt="" src="/blue/resources/photo/200622181310+0900_2.jpg" style="height:324px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200622181324+0900_20.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(3, '낙성대', '여행', 'ㅇㅇ', '200622181803+0900_21.jpg', '<p><img alt="" src="/blue/resources/photo/200622181803+0900_21.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(4, '낙성대', '여행', '123', '200622182920+0900_25.jpg', '<p><img alt="" src="/blue/resources/photo/200622182920+0900_25.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(5, '낙성대', '여행', '연습3', '200622183141+0900_20.jpg', '<p><img alt="" src="/blue/resources/photo/200622183141+0900_20.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200622183153+0900_top_bg4.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(6, '낙성대', '기타', '연습4', '200623074846+0900_b8e27bd8-5071-417b-936c-13869d5a054d.jpeg', '<p><img alt="" src="/blue/resources/photo/200623074846+0900_b8e27bd8-5071-417b-936c-13869d5a054d.jpeg" style="height:400px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623074905+0900_top_bg2.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623074922+0900_top_bg4.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(7, '홍장군', '여행', '제주여행', '200623093429+0900_IMG_0375.jpg', '<p><img alt="" src="/blue/resources/photo/200623093429+0900_IMG_0375.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623093444+0900_IMG_0268.jpg" style="height:666px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623093502+0900_IMG_0436.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(8, '홍장군', '여행', '연습5', '200623100048+0900_IMG_0261.jpg', '<p><img alt="" src="/blue/resources/photo/200623100048+0900_IMG_0261.jpg" style="height:666px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623100100+0900_IMG_0285.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(9, '홍장군', '여행', '555', '200623102021+0900_IMG_0240.jpg', '<p><img alt="" src="/blue/resources/photo/200623102021+0900_IMG_0240.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623102032+0900_IMG_0241.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623102042+0900_IMG_0253.jpg" style="height:666px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(10, '홍장군', '여행', '666', '200623102929+0900_IMG_0268.jpg', '<p><img alt="" src="/blue/resources/photo/200623102929+0900_IMG_0268.jpg" style="height:666px; width:500px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623102940+0900_IMG_0279.jpg" style="height:375px; width:500px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623102951+0900_IMG_0350.jpg" style="height:666px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(11, '홍장군', '여행', '실전연습1', '200623110511+0900_IMG_6485.JPG', '<p><img alt="" src="/blue/resources/photo/200623110511+0900_IMG_6485.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>이곳은 해수욕장 입구...</p>\r\n\r\n<p>상 품 명 :&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623110529+0900_IMG_6504.JPG" style="height:666px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623110540+0900_IMG_6564.JPG" style="height:375px; width:500px" /><br />\r\n&nbsp;</p>\r\n'),
	(12, '홍장군', '여행', '실전연습2', '200623111000+0900_IMG_6494.JPG', '<p><img alt="" src="/blue/resources/photo/200623111000+0900_IMG_6494.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>한번에 성공하기....</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623111020+0900_IMG_6567.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623111031+0900_IMG_6585.JPG" style="height:375px; width:500px" /></p>\r\n'),
	(13, '홍장군', '여행', '실전연습3', '200623111345+0900_IMG_6517.JPG', '<p><img alt="" src="/blue/resources/photo/200623111345+0900_IMG_6517.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>사정사정해서 테스트 완료하기...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623111405+0900_IMG_6571.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623111417+0900_IMG_6573.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(14, '홍장군', '여행', '실전연습4', '200623111623+0900_IMG_6576.JPG', '<p><img alt="" src="/blue/resources/photo/200623111623+0900_IMG_6576.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>이것이 마지막이길.....</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623111639+0900_IMG_6586.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623111652+0900_IMG_6712.JPG" style="height:666px; width:500px" /></p>\r\n'),
	(15, '홍장군', '여행', '실전연습5', '200623112233+0900_IMG_6514.JPG', '<p><img alt="" src="/blue/resources/photo/200623112233+0900_IMG_6514.JPG" style="height:375px; width:500px" /></p>\r\n\r\n<p>왜이럴까???</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623112250+0900_IMG_6583.JPG" style="height:666px; width:500px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623112303+0900_IMG_6651.JPG" style="height:375px; width:500px" /></p>\r\n'),
	(16, '홍장군', '여행', '해파랑길 49코스', '200623153748+0900_IMG_6487.JPG', '<p><img alt="" src="/blue/resources/photo/200623153748+0900_IMG_6487.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623153810+0900_IMG_6502.JPG" style="height:933px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623153827+0900_IMG_6513.JPG" style="height:933px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623153842+0900_IMG_6545.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623153859+0900_IMG_6570.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623153916+0900_IMG_6523.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623153932+0900_IMG_6587.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623153955+0900_IMG_6621.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154012+0900_IMG_6641.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154032+0900_IMG_6721.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154048+0900_IMG_6719.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154104+0900_IMG_6713.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154119+0900_IMG_6749.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154138+0900_IMG_6792.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154155+0900_IMG_6804.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154215+0900_IMG_6863.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154234+0900_IMG_6886.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154254+0900_IMG_6827.JPG" style="height:525px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154317+0900_IMG_6945.JPG" style="height:933px; width:700px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200623154345+0900_IMG_6903.JPG" style="height:933px; width:700px" /></p>\r\n'),
	(17, '낙성대', '건강', '수정연습', '200624100510+0900_IMG_1572.jpg', '<p><img alt="" src="/blue/resources/photo/200624100510+0900_IMG_1572.jpg" style="height:799px; width:600px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200624100524+0900_IMG_1604.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>수정연습</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>수정....</p>\r\n'),
	(18, '낙성대', '기타', '시골영화', '200624122659+0900_25a042da-2bc4-4ff6-a92d-a13326505280.jpeg', '<p><img alt="" src="/blue/resources/photo/200624122659+0900_25a042da-2bc4-4ff6-a92d-a13326505280.jpeg" style="height:840px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(19, '낙성대', '영화', '연습영화', '200624102442+0900_10.gif', '<p><img alt="" src="/blue/resources/photo/200624102442+0900_10.gif" style="height:352px; width:623px" /></p>\r\n'),
	(20, '낙성대', '건강', '사진 갤러리 연습입니다.', '200624123056+0900_DSC01477.jpg', '<p><img alt="" src="/blue/resources/photo/200624123056+0900_DSC01477.jpg" style="height:400px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>이곳은 경남 밀양에 있는 천황산 입니다.</p>\r\n\r\n<p>가을에는 억새길이 유명하기로 소문나 있죠...</p>\r\n\r\n<p>영남알프스~~~ 여러분도 꼭 다녀오세요.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200624122844+0900_20.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200624122903+0900_49.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200624122919+0900_23.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200624123005+0900_39.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(22, '낙성대', '기타', '자료 삭제 연습', '200624163325+0900_18.jpg', '<p><img alt="" src="/blue/resources/photo/200624163325+0900_18.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>케이블카 안에서 바라다본 목포시...</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200624163342+0900_25.jpg" style="height:311px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(30, '홍장군', '기타', '꿈꾸는 시간들', '200625092822+0900_18.jpg', '<p><img alt="" src="/blue/resources/photo/200625092822+0900_18.jpg" style="height:450px; width:600px" /></p>\r\n\r\n<p>통영에서...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200625092838+0900_1.jpg" style="height:800px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200625092855+0900_01_13.jpg" style="height:800px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200625092906+0900_1_121_1.jpg" style="height:800px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200625092917+0900_31.jpg" style="height:400px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(31, '홍장군', '여행', '1234', '200630090646+0900_01_14_1.jpg', '<p><img alt="" src="/blue/resources/photo/200630090646+0900_01_14_1.jpg" style="height:960px; width:720px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200630090926+0900_01_13_1.jpg" style="height:574px; width:800px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n'),
	(32, '홍장군', '여행', '연습파일', '200703150352+0900_01_06.jpg', '<p><img alt="" src="/blue/resources/photo/200703150352+0900_01_06.jpg" style="height:533px; width:800px" /></p>\r\n\r\n<p><img alt="" src="/blue/resources/photo/200703150405+0900_01_04_1.jpg" style="height:533px; width:800px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n');
/*!40000 ALTER TABLE `phototitle` ENABLE KEYS */;

-- 테이블 webdb.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `part` varchar(20) NOT NULL,
  `p_option` varchar(200) DEFAULT NULL,
  `subContent` text NOT NULL,
  `content` text NOT NULL,
  `pdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fsize` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `rfname` varchar(100) NOT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.product:~0 rows (대략적) 내보내기
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 webdb.school 구조 내보내기
CREATE TABLE IF NOT EXISTS `school` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT '20',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.school:~9 rows (대략적) 내보내기
DELETE FROM `school`;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`idx`, `name`, `age`) VALUES
	(4, '이기자', 33),
	(9, '홍길동', 34),
	(10, '이기자', 33),
	(11, '홍길동', 34),
	(12, '이기자', 32),
	(14, '소나무', 55),
	(15, '가나다', 32),
	(16, '한사랑', 39),
	(17, '오하늘', 23);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- 테이블 webdb.survey 구조 내보내기
CREATE TABLE IF NOT EXISTS `survey` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `kwajung` varchar(60) NOT NULL,
  `kwamok` varchar(60) NOT NULL,
  `kcode` varchar(60) NOT NULL,
  `danwi` varchar(60) NOT NULL,
  `wdate` varchar(30) NOT NULL,
  `question1` varchar(100) NOT NULL,
  `question2` varchar(100) NOT NULL,
  `question3` varchar(100) NOT NULL,
  `question4` varchar(100) NOT NULL,
  `question5` varchar(100) NOT NULL,
  `question6` varchar(100) NOT NULL,
  `question7` varchar(100) NOT NULL,
  `question8` varchar(100) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.survey:~4 rows (대략적) 내보내기
DELETE FROM `survey`;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` (`idx`, `kwajung`, `kwamok`, `kcode`, `danwi`, `wdate`, `question1`, `question2`, `question3`, `question4`, `question5`, `question6`, `question7`, `question8`) VALUES
	(1, '자바(JAVA) & 스프링프레임워크 응용SW엔지니어링 양성과정', '애플리케이션 설계 및 화면설계, 구현', '2001020201_16v3', '요구사항 확인', '2020년 03월 02일 (월)', '1. 능력단위 편성시간은 적절하십니까?', '2. 능력단위 종료시 산출결과물에 만족하십니까?', '3. 능력단위 평가시 평가시간은 적절하였습니까?', '4. 능력단위 평가시 평가문항의 난이도는 적절하였습니까?', '5. 능력단위 평가시 평가방법(서술형 평가 및 포트폴리오)은 적절하였습니까?', '6. 능력단위 평가시 평가횟수는 적절하였습니까?', '7. 능력단위 훈련교사에 대해 만족하십니까?', '8. 기타 및 건의사항'),
	(2, '자바(JAVA) & 스프링프레임워크 응용SW엔지니어링 양성과정', '33', '33', '33', '33', '1. 능력단위 편성시간은 적절하십니까?', '2. 능력단위 종료시 산출결과물에 만족하십니까?', '3. 능력단위 평가시 평가시간은 적절하였습니까?', '4. 능력단위 평가시 평가문항의 난이도는 적절하였습니까?', '5. 능력단위 평가시 평가방법(서술형 평가 및 포트폴리오)은 적절하였습니까?', '6. 능력단위 평가시 평가횟수는 적절하였습니까?', '7. 능력단위 훈련교사에 대해 만족하십니까?', '8. 기타 및 건의사항'),
	(3, '자바(JAVA) & 스프링프레임워크 응용SW엔지니어링 양성과정', '33', '33', '33', '33', '1. 능력단위 편성시간은 적절하십니까?', '2. 능력단위 종료시 산출결과물에 만족하십니까?', '3. 능력단위 평가시 평가시간은 적절하였습니까?', '4. 능력단위 평가시 평가문항의 난이도는 적절하였습니까?', '5. 능력단위 평가시 평가방법(서술형 평가 및 포트폴리오)은 적절하였습니까?', '6. 능력단위 평가시 평가횟수는 적절하였습니까?', '7. 능력단위 훈련교사에 대해 만족하십니까?', '8. 기타 및 건의사항'),
	(4, '자바(JAVA) & 스프링프레임워크 응용SW엔지니어링 양성과정', '33', '33', '33', '33', '1. 능력단위 편성시간은 적절하십니까?', '2. 능력단위 종료시 산출결과물에 만족하십니까?', '3. 능력단위 평가시 평가시간은 적절하였습니까?', '4. 능력단위 평가시 평가문항의 난이도는 적절하였습니까?', '5. 능력단위 평가시 평가방법(서술형 평가 및 포트폴리오)은 적절하였습니까?', '6. 능력단위 평가시 평가횟수는 적절하였습니까?', '7. 능력단위 훈련교사에 대해 만족하십니까?', '8. 기타 및 건의사항');
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;

-- 테이블 webdb.survey_answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `survey_answer` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `survey_idx` int(11) NOT NULL,
  `answer1` int(11) NOT NULL,
  `answer2` int(11) NOT NULL,
  `answer3` int(11) NOT NULL,
  `answer4` int(11) NOT NULL,
  `answer5` int(11) NOT NULL,
  `answer6` int(11) NOT NULL,
  `answer7` int(11) NOT NULL,
  `answer8` text,
  `hostip` varchar(30) NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `survey_idx` (`survey_idx`),
  CONSTRAINT `survey_answer_ibfk_1` FOREIGN KEY (`survey_idx`) REFERENCES `survey` (`idx`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.survey_answer:~27 rows (대략적) 내보내기
DELETE FROM `survey_answer`;
/*!40000 ALTER TABLE `survey_answer` DISABLE KEYS */;
INSERT INTO `survey_answer` (`idx`, `survey_idx`, `answer1`, `answer2`, `answer3`, `answer4`, `answer5`, `answer6`, `answer7`, `answer8`, `hostip`) VALUES
	(1, 1, 3, 4, 3, 5, 3, 4, 5, '건의사항 없음', '127.0.0.1'),
	(2, 1, 5, 3, 1, 4, 5, 5, 5, '잘 부탁드립니다.', '127.0.0.1'),
	(3, 1, 5, 4, 4, 4, 1, 5, 4, '감사합니다.', '127.0.0.1'),
	(4, 1, 4, 2, 4, 3, 3, 4, 5, '77777', '127.0.0.1'),
	(5, 2, 4, 3, 4, 4, 5, 3, 4, '', '127.0.0.1'),
	(6, 2, 4, 4, 4, 3, 4, 3, 5, '', '127.0.0.1'),
	(7, 1, 4, 4, 1, 4, 3, 5, 5, '', '127.0.0.1'),
	(8, 3, 5, 3, 5, 4, 1, 5, 4, '감사합니다.', '127.0.0.1'),
	(9, 3, 4, 2, 4, 5, 2, 4, 4, '', '127.0.0.1'),
	(10, 3, 2, 4, 1, 5, 4, 4, 4, '', '127.0.0.1'),
	(11, 3, 4, 3, 2, 4, 5, 5, 4, '', '127.0.0.1'),
	(12, 3, 4, 4, 4, 4, 4, 4, 4, '5번자료', '127.0.0.1'),
	(13, 2, 5, 5, 5, 5, 5, 5, 5, '', '127.0.0.1'),
	(14, 3, 5, 5, 5, 5, 5, 5, 5, '', '127.0.0.1'),
	(15, 3, 3, 3, 3, 3, 3, 3, 3, '보통..', '127.0.0.1'),
	(16, 1, 4, 4, 4, 4, 4, 4, 5, '내용이 정말 많네요..', '127.0.0.1'),
	(17, 1, 1, 4, 2, 4, 3, 4, 5, '하루가 정말 빠름니다.', '127.0.0.1'),
	(18, 3, 4, 4, 4, 5, 4, 4, 5, '공부시간이 부족합니다.', '127.0.0.1'),
	(19, 1, 4, 4, 4, 5, 4, 4, 5, '잘 배워서 잘 사용하겠습니다.', '127.0.0.1'),
	(20, 1, 3, 3, 4, 5, 5, 3, 5, '많이 힘드네요.', '127.0.0.1'),
	(21, 1, 4, 4, 4, 5, 5, 5, 5, '힘들지만 열심히 하겠습니다. 감사합니다.', '127.0.0.1'),
	(22, 3, 4, 4, 4, 4, 5, 3, 5, '또, 만나요...', '127.0.0.1'),
	(26, 4, 4, 4, 4, 4, 4, 4, 4, '', '0:0:0:0:0:0:0:1'),
	(27, 4, 4, 4, 4, 4, 4, 4, 5, '가가가', '0:0:0:0:0:0:0:1'),
	(28, 4, 4, 5, 5, 4, 4, 5, 5, '', '0:0:0:0:0:0:0:1'),
	(29, 4, 4, 4, 5, 5, 5, 4, 5, '', '0:0:0:0:0:0:0:1'),
	(30, 4, 2, 3, 4, 4, 4, 5, 5, '1123', '0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `survey_answer` ENABLE KEYS */;

-- 테이블 webdb.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.test:~5 rows (대략적) 내보내기
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`mid`, `pwd`, `name`) VALUES
	('1', '1', '1'),
	('aaaa', '1234', NULL),
	('hkd1234', '1234', NULL),
	('kms4321', '4321', NULL),
	('lss1234', '1234', '이순신');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 테이블 webdb.test1 구조 내보내기
CREATE TABLE IF NOT EXISTS `test1` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT '20',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.test1:~3 rows (대략적) 내보내기
DELETE FROM `test1`;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
INSERT INTO `test1` (`idx`, `name`, `age`) VALUES
	(1, '홍길동', 20),
	(2, '김말숙', 30),
	(3, '강감찬', 20);
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;

-- 테이블 webdb.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.user:~9 rows (대략적) 내보내기
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`idx`, `mid`, `pwd`) VALUES
	(5, 'ohn1234', '1234'),
	(8, 'sss1234', '$2a$10$RFfeCyIGLLqDKUcKIgazqeDDgHH64R281jTQ7xTZN0MaED.ZdkVAG'),
	(9, 'hkd1234', '$2a$10$vgNwMTtZAi0TpVVjNN93De/STINZWFMGQNr3kF/J6a9l09RlaUb.y'),
	(10, 'snm1234', '$2a$10$0pggCVIjm9P3vHQuRKC.4.UuYTMi.NLkVMBbPDlbf9m5n3YrB5.Ni'),
	(11, 'aaa1111', '$2a$10$XS9jODoW3OA.z62zvfMLMeCe/.fOtHypJLGglKDctb5SjS048e4H6'),
	(13, 'eee4444', '$2a$10$ICMC3MBTd.us5K5c5Dn1KOkqC.aud3vZaan2Bz0nStgc4vWMCvYPu'),
	(14, 'eee5555', '$2a$10$HcMyzSykBtDVcPgzUcPMHOn6kUK4SPImpM6nRPrQ56e/ZszDiJW/m'),
	(15, 'aaa1234', '$2a$10$QqJ7VN2KNnMovJeJRLMva.1PBJUGGFJvyxH4RX3ihH9jA3eR9d4nm'),
	(16, '666', '$2a$10$jujnGeJedzca56wEKo6fsuX1VqNLVX5QYSQphQb3o0136XxwZx6uO');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 webdb.userf 구조 내보내기
CREATE TABLE IF NOT EXISTS `userf` (
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `addr` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 webdb.userf:~12 rows (대략적) 내보내기
DELETE FROM `userf`;
/*!40000 ALTER TABLE `userf` DISABLE KEYS */;
INSERT INTO `userf` (`name`, `age`, `gender`, `addr`) VALUES
	('홍길동', 22, '남자', '서울'),
	('홍사랑', 23, '여자', '부산'),
	('이사랑', 22, '여자', '대구'),
	('오하늘', 32, '여자', '광주'),
	('강감찬', 42, '남자', '서울'),
	('이기자', 53, '남자', '울산'),
	('김길동', 21, '남자', '대구'),
	('이길동', 20, '남자', '부산'),
	('홍순동', 33, '남자', '광주'),
	('홍길동', 43, '남자', '서울'),
	('홍길자', 29, '여자', '대구'),
	('홍길순', 28, '여자', '서울');
/*!40000 ALTER TABLE `userf` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
