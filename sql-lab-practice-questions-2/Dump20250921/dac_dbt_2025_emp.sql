-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: dac_dbt_2025
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `empcode` varchar(15) NOT NULL,
  `empname` varchar(60) DEFAULT NULL,
  `deptcode` varchar(15) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `joindate` date NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `desigcode` varchar(15) DEFAULT NULL,
  `supcode` varchar(15) DEFAULT NULL,
  `gradecode` varchar(15) DEFAULT NULL,
  `gradelevel` varchar(30) DEFAULT NULL,
  `basicpay` int DEFAULT NULL,
  PRIMARY KEY (`empcode`),
  KEY `deptcode` (`deptcode`),
  KEY `desigcode` (`desigcode`),
  KEY `supcode` (`supcode`),
  KEY `gradecode` (`gradecode`,`gradelevel`),
  CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`deptcode`) REFERENCES `dept` (`deptcode`),
  CONSTRAINT `emp_ibfk_2` FOREIGN KEY (`desigcode`) REFERENCES `desig` (`desigcode`),
  CONSTRAINT `emp_ibfk_3` FOREIGN KEY (`supcode`) REFERENCES `emp` (`empcode`),
  CONSTRAINT `emp_ibfk_4` FOREIGN KEY (`gradecode`, `gradelevel`) REFERENCES `grade` (`gradecode`, `gradelevel`),
  CONSTRAINT `emp_chk_1` CHECK ((`sex` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'T')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES ('6569','Tiwari','STOR','1989-08-19','2010-08-21','M','MNGR','7782','GC6','GL2',12400),('7192','John','ACCT','1968-11-05','1994-12-03','M','CLRK','7902','GC6','GL2',12300),('7369','Shah','PRCH','1960-05-25','1983-12-17','M','CLRK','7902','GC6','GL2',12200),('7499','Roy','SALE','1957-09-27','1981-02-20','M','SLMN','7698','GC6','GL1',14200),('7521','Wilson','STOR','1956-03-18','1981-02-22','M','MNGR','7698','GC6','GL2',12200),('7566','Jain','PRCH','1955-01-24','1981-04-02','F','MNGR','7839','GC6','GL2',12400),('7654','Gupta','SALE','1957-01-22','1981-09-28','M','SLMN','7698','GC6','GL2',12600),('7698','Murthy','SALE','1960-09-16','1981-05-01','F','MNGR','7839','GC6','GL1',14700),('7782','Menon','ACCT','1967-08-30','1981-06-09','M','MNGR','7839','GC6','GL2',12400),('7788','Khan','PRCH','1957-02-03','1982-12-09','M','SPRV','7566','GC6','GL2',11900),('7802','Sanghvi','STOR','1980-05-06','1993-01-01','M','MNGR','7566','GC6','GL2',12400),('7839','Reddy','ACCT','1959-12-12','1981-07-17','M','PRES',NULL,'GC1','GL1',32000),('7844','Singh','SALE','1956-09-09','1981-09-08','F','SLMN','7698','GC6','GL1',14300),('7876','Patil','PRCH','1965-09-02','1990-12-17','M','CLRK','7788','GC6','GL2',12300),('7900','Shroff','SALE','1956-06-28','1981-12-03','M','CLRK','7698','GC6','GL2',12000),('7902','Naik','PRCH','1958-02-20','1981-12-03','M','MNGR','7839','GC6','GL2',11800),('7934','Kaul','ACCT','1957-05-02','1982-01-23','M','CLRK','7782','GC6','GL2',11950),('7939','Rai','PRCH','1988-08-10','2012-12-06','M','CLRK','7782','GC6','GL2',11800),('7999','Sinha','SALE','1970-04-11','1992-02-20','M','SLMN','7782','GC6','GL1',14600),('9902','Ahmad','SALE','1970-02-16','1992-04-17','M','SLMN','7698','GC6','GL1',14200);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-21 23:14:18
