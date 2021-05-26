use happyhouse;

drop table if exists notice_board;
CREATE TABLE `notice_board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  KEY `writer_idx` (`writer`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

drop table if exists notice_reply;
CREATE TABLE `notice_reply` (
  `no` int NOT NULL AUTO_INCREMENT,
  `bno` int NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` varchar(200) NOT NULL,
  `writetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  CONSTRAINT `notice_reply_ibfk_1` FOREIGN KEY (`bno`) REFERENCES `notice_board` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

