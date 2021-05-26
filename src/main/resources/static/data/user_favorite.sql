SELECT * FROM happyhouse.user_favorite;CREATE TABLE `user_favorite` (
  `no` int NOT NULL AUTO_INCREMENT,
  `userno` int NOT NULL,
  `dealno` int NOT NULL,
  `aptName` varchar(50) DEFAULT NULL,
  `dong` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `userno_idx` (`userno`),
  KEY `dealno_idx` (`dealno`),
  CONSTRAINT `dealno` FOREIGN KEY (`dealno`) REFERENCES `housedeal` (`no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userno` FOREIGN KEY (`userno`) REFERENCES `user` (`userno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
