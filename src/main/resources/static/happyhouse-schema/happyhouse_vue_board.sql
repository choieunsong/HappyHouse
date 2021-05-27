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
-- Table structure for table `vue_board`
--

DROP TABLE IF EXISTS `vue_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vue_board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  KEY `writer_idx` (`writer`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vue_board`
--

LOCK TABLES `vue_board` WRITE;
/*!40000 ALTER TABLE `vue_board` DISABLE KEYS */;
INSERT INTO `vue_board` VALUES (28,'ssong','test','swagger test','2021-05-21 06:06:42'),(29,'eunsong','?','테스트ㅇㅇ','2021-05-21 06:22:18'),(31,'eunsong','안뇽','?hello!!⑤','2021-05-22 08:36:48'),(34,'ssafy','작성자 테스트','등록해버리기~','2021-05-22 13:04:56'),(38,'은송','테스트222','22222223333334444445556t666667777\nㅇㄹㄹㄹㄹㄹ','2021-05-23 08:33:14'),(39,'은송','게시글 테스트','안녕하세요?','2021-05-23 12:25:37'),(40,'최싸피','안녕하세요','오기오기!','2021-05-27 10:38:58'),(41,'최싸피(서울5기)','게시글~','안녕하세요!','2021-05-27 11:00:43'),(42,'최싸피','안녕하세요','안녕하세요!','2021-05-27 11:47:25');
/*!40000 ALTER TABLE `vue_board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 21:10:18
