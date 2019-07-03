-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: bigdata
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bookss`
--

DROP TABLE IF EXISTS `Bookss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bookss` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookss`
--

LOCK TABLES `Bookss` WRITE;
/*!40000 ALTER TABLE `Bookss` DISABLE KEYS */;
INSERT INTO `Bookss` VALUES (1,'축구의 역사','굿스포츠',7000,'2019-02-26 05:42:55'),(2,'축구아는 여자','나무수',13000,'2019-02-26 05:42:55'),(3,'축구의 이해','대한미디어',22000,'2019-02-26 05:42:55'),(4,'골프 바이블','대한미디어',35000,'2019-02-26 05:42:55'),(5,'피겨 교본','굿스포츠',8000,'2019-02-26 05:42:55'),(6,'역도 단계별기술','굿스포츠',6000,'2019-02-26 05:42:55'),(7,'야구의 추억','이상미디어',20000,'2019-02-26 05:42:55'),(8,'야구를 부탁해','이상미디어',13000,'2019-02-26 05:42:55'),(9,'올림픽 이야기','삼성당',7500,'2019-02-26 05:42:55'),(10,'Olympic Champions','Pearson',13000,'2019-02-26 05:42:55');
/*!40000 ALTER TABLE `Bookss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `ordno` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `cuid` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `prdno` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `addr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `orddate` datetime NOT NULL,
  PRIMARY KEY (`ordno`),
  KEY `cuid` (`cuid`),
  KEY `prdno` (`prdno`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`cuid`) REFERENCES `Customers` (`cuid`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`prdno`) REFERENCES `Products` (`prdno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('o01','apple','p03',10,'서울시 마포구','2019-01-01 00:00:00'),('o02','melon','p01',5,'인천시 계약구','2019-01-10 00:00:00'),('o03','banana','p06',45,'경기도 부천시','2019-01-11 00:00:00'),('o04','carrot','p02',8,'부산시 금정구','2019-02-01 00:00:00'),('o05','melon','p06',36,'경기도 용인시','2019-02-20 00:00:00'),('o06','banana','p01',19,'충청북도 보은군','2019-03-02 00:00:00'),('o07','apple','p03',22,'서울시 영등포구','2019-03-15 00:00:00'),('o08','pear','p02',50,'강원도 춘천시','2019-04-10 00:00:00'),('o09','banana','p04',15,'전라남도 목포시','2019-04-11 00:00:00'),('o10','carrot','p03',20,'경기도 안양시','2019-05-22 00:00:00');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-29  2:38:06
