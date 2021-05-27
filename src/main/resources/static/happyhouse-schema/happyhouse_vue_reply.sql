-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: happyhouse
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `vue_reply`
--

DROP TABLE IF EXISTS `vue_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vue_reply` (
  `no` int NOT NULL AUTO_INCREMENT,
  `bno` int NOT NULL,
  `writer` varchar(20) NOT NULL,
  `content` varchar(200) NOT NULL,
  `writetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  KEY `vue_reply_ibfk_1` (`bno`),
  CONSTRAINT `vue_reply_ibfk_1` FOREIGN KEY (`bno`) REFERENCES `vue_board` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vue_reply`
--

LOCK TABLES `vue_reply` WRITE;
/*!40000 ALTER TABLE `vue_reply` DISABLE KEYS */;
INSERT INTO `vue_reply` VALUES (13,28,'ssafy','제발수정 절대수정!?!','2021-05-21 14:49:19'),(15,28,'ssafy','무야호~~~~~','2021-05-21 15:16:28'),(18,29,'ssafy','무야호야호!!! 제발무야호~~~~','2021-05-21 15:41:44'),(19,29,'ssafy','돌아돌아벌여벌여','2021-05-21 15:43:11'),(20,28,'ssafy','왜 수정은 안되는가?','2021-05-21 15:44:52'),(21,29,'ssafy','엥 왜 또 돼? 뭐했는데?','2021-05-21 15:50:22'),(24,29,'ssafy','설마','2021-05-21 15:53:29'),(26,28,'작성자(ssafy)','제발','2021-05-22 01:14:05'),(28,29,'작성자(ssafy)','응?!','2021-05-22 01:17:23'),(29,29,'작성자(ssafy)','왜일까','2021-05-22 01:19:37'),(30,29,'작성자(ssafy)','업데이트','2021-05-22 01:21:08'),(31,29,'작성자(ssafy)','웅','2021-05-22 02:39:32'),(32,29,'작성자(ssafy)','ㅇㅇㅇ','2021-05-22 02:45:12'),(33,29,'작성자(ssafy)','웅','2021-05-22 03:11:22'),(36,31,'작성자(ssafy)','hello','2021-05-22 08:57:42'),(37,31,'작성자(ssafy)','d','2021-05-22 08:58:20'),(38,31,'작성자(ssafy)','짜증','2021-05-22 09:42:48'),(40,29,'ssafy','제발요ㅠㅠㅠㅠ','2021-05-22 10:30:52'),(42,34,'ssafy','ddd','2021-05-22 14:46:04'),(44,34,'은송','뿌엥ㅠㅠ','2021-05-22 16:10:53'),(47,31,'은송','안녕하세요~','2021-05-23 08:16:18'),(49,38,'은송','수정!!!!~~~~?','2021-05-23 08:34:02'),(53,38,'은송','가즈아','2021-05-23 11:12:23'),(56,38,'은송','gone rose','2021-05-23 11:26:06'),(62,38,'은송','헤이즈','2021-05-23 11:44:03'),(63,38,'은송','백예린','2021-05-23 11:46:00'),(64,38,'은송','딘','2021-05-23 12:00:56'),(67,39,'은송','댓글 테스트','2021-05-23 12:42:00'),(68,39,'은송','ㄹㄹㄹ','2021-05-26 02:34:52');
/*!40000 ALTER TABLE `vue_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 21:10:19
