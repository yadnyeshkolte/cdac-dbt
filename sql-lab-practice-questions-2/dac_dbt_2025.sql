-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: dac_dbt_2025
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `deptcode` varchar(15) NOT NULL,
  `deptname` varchar(60) DEFAULT NULL,
  `budget` int DEFAULT NULL,
  PRIMARY KEY (`deptcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES ('ACCT','Accounts',19),('FACL','Facilities',42),('PERS','Personal',12),('PRCH','Purchase',25),('SALE','Sales',39),('STOR','Stores',33);
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `deptmax`
--

DROP TABLE IF EXISTS `deptmax`;
/*!50001 DROP VIEW IF EXISTS `deptmax`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deptmax` AS SELECT 
 1 AS `deptcode`,
 1 AS `deptname`,
 1 AS `employeeSalary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `desig`
--

DROP TABLE IF EXISTS `desig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desig` (
  `desigcode` varchar(15) NOT NULL,
  `designame` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`desigcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desig`
--

LOCK TABLES `desig` WRITE;
/*!40000 ALTER TABLE `desig` DISABLE KEYS */;
INSERT INTO `desig` VALUES ('CLRK','Clerk'),('MNGR','Manager'),('PRES','Personal'),('SLMN','Sales Man'),('SPRV','Supervisor');
/*!40000 ALTER TABLE `desig` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Temporary view structure for view `empactualsalary`
--

DROP TABLE IF EXISTS `empactualsalary`;
/*!50001 DROP VIEW IF EXISTS `empactualsalary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empactualsalary` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `totalSalary`,
 1 AS `deptcode`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empmax`
--

DROP TABLE IF EXISTS `empmax`;
/*!50001 DROP VIEW IF EXISTS `empmax`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empmax` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `deptcode`,
 1 AS `totalpay`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `femaleemployee`
--

DROP TABLE IF EXISTS `femaleemployee`;
/*!50001 DROP VIEW IF EXISTS `femaleemployee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `femaleemployee` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `sex`,
 1 AS `deptname`,
 1 AS `totalSalary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `gradecode` varchar(15) NOT NULL,
  `gradelevel` varchar(30) NOT NULL,
  `gradedescription` varchar(60) DEFAULT NULL,
  `basic` int DEFAULT NULL,
  PRIMARY KEY (`gradecode`,`gradelevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES ('GC1','GL1','GC-GL-1',25000),('GC12','GL1','GC-12-GL-1',9000),('GC12','GL2','GC-12-GL-2',8500),('GC12','GL3','GC-12-GL-3',8000),('GC15','GL1','GC-15-GL-1',7000),('GC15','GL2','GC-15-GL-2',6500),('GC15','GL3','GC-15-GL-3',6000),('GC20','GL1','GC-20-GL-1',3500),('GC20','GL2','GC-20-GL-2',3000),('GC20','GL3','GC-20-GL-3',2500),('GC20','GL4','GC-20-GL-4',2000),('GC4','GL1','GC-4-GL-1',21000),('GC4','GL4','GC-4-GL-4',15000),('GC6','GL1','GC-6-GL-1',13000),('GC6','GL2','GC-6-GL-2',11000);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `empcode` varchar(15) NOT NULL,
  `changedate` date NOT NULL,
  `desigcode` varchar(15) NOT NULL,
  `gradecode` varchar(15) NOT NULL,
  `gradelevel` varchar(30) NOT NULL,
  `basicpay` int DEFAULT NULL,
  PRIMARY KEY (`empcode`,`changedate`,`desigcode`,`gradecode`,`gradelevel`),
  KEY `desigcode` (`desigcode`),
  KEY `gradecode` (`gradecode`,`gradelevel`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`empcode`) REFERENCES `emp` (`empcode`),
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`desigcode`) REFERENCES `desig` (`desigcode`),
  CONSTRAINT `history_ibfk_3` FOREIGN KEY (`gradecode`, `gradelevel`) REFERENCES `grade` (`gradecode`, `gradelevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('7369','1983-12-17','SLMN','GC12','GL3',8000),('7369','1993-12-17','SLMN','GC12','GL2',8500),('7369','2003-12-17','CLRK','GC12','GL1',9000),('7369','2006-12-17','CLRK','GC6','GL2',11000),('7499','1981-02-20','SLMN','GC12','GL3',8000),('7499','1991-02-20','SLMN','GC12','GL2',8500),('7499','2001-02-20','SLMN','GC12','GL1',9000),('7499','2006-02-20','SLMN','GC6','GL2',11000),('7499','2011-02-20','SLMN','GC6','GL1',13000),('7521','1981-02-22','CLRK','GC12','GL3',8000),('7521','1991-02-22','SLMN','GC12','GL2',8500),('7521','2001-02-22','SPRV','GC12','GL1',9000),('7521','2011-02-22','MNGR','GC6','GL2',11000),('7566','1981-04-02','CLRK','GC12','GL3',8000),('7566','1991-12-31','SLMN','GC12','GL2',8500),('7566','2001-12-31','SPRV','GC12','GL1',9000),('7566','2011-12-31','MNGR','GC6','GL2',11000),('7654','1981-09-28','SLMN','GC12','GL3',8000),('7654','1991-09-28','SLMN','GC12','GL2',8500),('7654','2001-09-28','SLMN','GC12','GL1',9000),('7654','2011-09-28','SLMN','GC6','GL2',11000),('7698','1981-05-01','CLRK','GC12','GL3',8000),('7698','1991-05-01','SLMN','GC12','GL2',8500),('7698','2001-05-01','MNGR','GC12','GL1',9000),('7698','2006-05-01','SPRV','GC6','GL2',11000),('7698','2011-05-01','MNGR','GC6','GL1',13000),('7782','1981-06-09','CLRK','GC12','GL3',8000),('7782','1991-06-09','SLMN','GC12','GL2',8500),('7782','2001-06-09','SPRV','GC12','GL1',9000),('7782','2011-06-09','MNGR','GC6','GL2',11000),('7788','1982-12-09','SLMN','GC12','GL3',8000),('7788','1992-12-09','CLRK','GC12','GL2',8500),('7788','2002-12-09','MNGR','GC12','GL1',9000),('7788','2012-12-09','SPRV','GC6','GL2',11000),('7839','1981-09-17','CLRK','GC15','GL1',7000),('7839','1985-12-31','SLMN','GC12','GL3',8000),('7839','1988-12-31','SPRV','GC12','GL2',8500),('7839','1990-12-31','MNGR','GC12','GL1',9000),('7839','1994-12-31','CLRK','GC6','GL2',11000),('7839','1998-12-31','SLMN','GC6','GL1',13000),('7839','2001-12-31','SPRV','GC4','GL4',15000),('7839','2006-12-31','MNGR','GC4','GL1',21000),('7839','2011-12-31','PRES','GC1','GL1',25000),('7844','1981-09-08','SLMN','GC12','GL3',8000),('7844','1991-09-08','SLMN','GC12','GL2',8500),('7844','2001-09-08','SLMN','GC12','GL1',9000),('7844','2006-09-08','SLMN','GC6','GL2',11000),('7844','2011-09-08','SLMN','GC6','GL1',13000),('7900','1981-12-03','SLMN','GC12','GL3',8000),('7900','1991-12-03','SLMN','GC12','GL2',8500),('7900','2001-12-03','CLRK','GC12','GL1',9000),('7900','2011-12-03','CLRK','GC6','GL2',11000),('7902','1981-12-03','CLRK','GC12','GL3',8000),('7902','1991-12-03','SLMN','GC12','GL2',8500),('7902','2001-12-03','SPRV','GC12','GL1',9000),('7902','2011-12-03','MNGR','GC6','GL2',11000),('7934','1982-01-23','SLMN','GC12','GL3',8000),('7934','1992-01-23','SLMN','GC12','GL2',8500),('7934','2002-01-23','CLRK','GC12','GL1',9000),('7934','2012-01-23','CLRK','GC6','GL2',11000);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `maleemployee`
--

DROP TABLE IF EXISTS `maleemployee`;
/*!50001 DROP VIEW IF EXISTS `maleemployee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maleemployee` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `sex`,
 1 AS `deptname`,
 1 AS `totalSalary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maxfemaleemployee`
--

DROP TABLE IF EXISTS `maxfemaleemployee`;
/*!50001 DROP VIEW IF EXISTS `maxfemaleemployee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maxfemaleemployee` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `sex`,
 1 AS `deptname`,
 1 AS `max(s.basic + s.allow - s.deduct)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maxone`
--

DROP TABLE IF EXISTS `maxone`;
/*!50001 DROP VIEW IF EXISTS `maxone`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maxone` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `TotalPay`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maxsalaries`
--

DROP TABLE IF EXISTS `maxsalaries`;
/*!50001 DROP VIEW IF EXISTS `maxsalaries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maxsalaries` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `deptcode`,
 1 AS `totalPay`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `minfemalesalary`
--

DROP TABLE IF EXISTS `minfemalesalary`;
/*!50001 DROP VIEW IF EXISTS `minfemalesalary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `minfemalesalary` AS SELECT 
 1 AS `empcode`,
 1 AS `empname`,
 1 AS `sex`,
 1 AS `totalSalary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `empcode` varchar(15) NOT NULL,
  `salmonth` date NOT NULL,
  `basic` int DEFAULT NULL,
  `allow` int DEFAULT NULL,
  `deduct` int DEFAULT NULL,
  PRIMARY KEY (`empcode`,`salmonth`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`empcode`) REFERENCES `emp` (`empcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES ('6569','2011-12-01',11800,600,400),('6569','2012-01-01',12400,1240,550),('6569','2012-02-01',12400,1240,550),('7192','2011-12-01',11700,600,500),('7192','2012-01-01',12300,1230,550),('7192','2012-02-01',12300,1230,550),('7369','2011-12-01',11600,600,450),('7369','2012-01-01',12200,1220,550),('7369','2012-02-01',12200,1220,550),('7499','2011-12-01',13400,800,550),('7499','2012-01-01',14200,1420,650),('7499','2012-02-01',14200,1420,650),('7521','2011-12-01',11400,800,500),('7521','2012-01-01',12200,1220,550),('7521','2012-02-01',12200,1220,550),('7566','2011-12-01',12000,600,400),('7566','2012-01-01',12400,1240,550),('7566','2012-02-01',12400,1240,550),('7654','2011-12-01',11900,700,500),('7654','2012-01-01',12600,1260,550),('7654','2012-02-01',12600,1260,550),('7698','2011-12-01',13900,800,500),('7698','2012-01-01',14700,1470,650),('7698','2012-02-01',14700,1470,650),('7782','2011-12-01',11800,600,500),('7782','2012-01-01',12400,1240,550),('7782','2012-02-01',12400,1240,550),('7788','2011-12-01',11300,600,450),('7788','2012-01-01',11900,1190,550),('7788','2012-02-01',11900,1190,550),('7802','2011-12-01',11900,500,300),('7802','2012-01-01',12400,1240,550),('7802','2012-02-01',12400,1240,550),('7839','2011-12-01',30000,3000,1200),('7839','2012-01-01',32000,3200,1250),('7839','2012-02-01',32000,3200,1250),('7844','2011-12-01',13400,900,600),('7844','2012-01-01',14300,1430,650),('7844','2012-02-01',14300,1430,650),('7876','2011-12-01',11700,600,500),('7876','2012-01-01',12300,1230,550),('7876','2012-02-01',12300,1230,550),('7900','2011-12-01',11500,500,300),('7900','2012-01-01',12000,1200,550),('7900','2012-02-01',12000,1200,550),('7902','2011-12-01',11200,600,450),('7902','2012-01-01',11800,1180,550),('7902','2012-02-01',11800,1180,550),('7934','2011-12-01',11450,500,250),('7934','2012-01-01',11950,1195,550),('7934','2012-02-01',11950,1195,550),('7939','2011-12-01',11100,700,400),('7939','2012-01-01',11800,1180,550),('7939','2012-02-01',11800,1180,550),('7999','2011-12-01',13950,650,600),('7999','2012-01-01',14600,1460,650),('7999','2012-02-01',14600,1460,650),('9902','2011-12-01',13400,800,500),('9902','2012-01-01',14200,1420,650),('9902','2012-02-01',14200,1420,650);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `deptmax`
--

/*!50001 DROP VIEW IF EXISTS `deptmax`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `deptmax` (`deptcode`,`deptname`,`employeeSalary`) AS select `d`.`deptcode` AS `deptcode`,`d`.`deptname` AS `deptname`,max(`a`.`totalSalary`) AS `employeeSalary` from (`dept` `d` join `empactualsalary` `a` on((`d`.`deptcode` = `a`.`deptcode`))) group by `d`.`deptcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empactualsalary`
--

/*!50001 DROP VIEW IF EXISTS `empactualsalary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empactualsalary` (`empcode`,`empname`,`totalSalary`,`deptcode`) AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,max(((`s`.`basic` + `s`.`allow`) - `s`.`deduct`)) AS `max(s.basic+s.allow-s.deduct)`,`e`.`deptcode` AS `deptcode` from (`emp` `e` join `salary` `s` on((`e`.`empcode` = `s`.`empcode`))) group by `s`.`empcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empmax`
--

/*!50001 DROP VIEW IF EXISTS `empmax`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empmax` (`empcode`,`empname`,`deptcode`,`totalpay`) AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,`e`.`deptcode` AS `deptcode`,max(((`s`.`basic` + `s`.`allow`) - `s`.`deduct`)) AS `totalpay` from (`emp` `e` join `salary` `s` on((`e`.`empcode` = `s`.`empcode`))) group by `s`.`empcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `femaleemployee`
--

/*!50001 DROP VIEW IF EXISTS `femaleemployee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `femaleemployee` AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,`e`.`sex` AS `sex`,`d`.`deptname` AS `deptname`,((`s`.`basic` + `s`.`allow`) - `s`.`deduct`) AS `totalSalary` from ((`emp` `e` join `dept` `d` on((`e`.`deptcode` = `d`.`deptcode`))) join `salary` `s` on(((`e`.`empcode` = `s`.`empcode`) and (`e`.`sex` = 'f') and `s`.`salmonth` >= all (select `s1`.`salmonth` from `salary` `s1`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maleemployee`
--

/*!50001 DROP VIEW IF EXISTS `maleemployee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maleemployee` AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,`e`.`sex` AS `sex`,`d`.`deptname` AS `deptname`,((`s`.`basic` + `s`.`allow`) - `s`.`deduct`) AS `totalSalary` from ((`emp` `e` join `dept` `d` on((`e`.`deptcode` = `d`.`deptcode`))) join `salary` `s` on(((`e`.`empcode` = `s`.`empcode`) and (`e`.`sex` = 'm') and `s`.`salmonth` >= all (select `s1`.`salmonth` from `salary` `s1`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maxfemaleemployee`
--

/*!50001 DROP VIEW IF EXISTS `maxfemaleemployee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maxfemaleemployee` AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,`e`.`sex` AS `sex`,`d`.`deptname` AS `deptname`,max(((`s`.`basic` + `s`.`allow`) - `s`.`deduct`)) AS `max(s.basic + s.allow - s.deduct)` from ((`emp` `e` join `dept` `d` on((`e`.`deptcode` = `d`.`deptcode`))) join `salary` `s` on((`e`.`empcode` = `s`.`empcode`))) where (((`s`.`basic` + `s`.`allow`) - `s`.`deduct`) >= all (select ((`s1`.`basic` + `s1`.`allow`) - `s1`.`deduct`) from (`salary` `s1` join `emp` `e1` on((`e1`.`empcode` = `s1`.`empcode`))) where (`e1`.`sex` = 'f')) and (`e`.`sex` = 'f')) group by `d`.`deptcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maxone`
--

/*!50001 DROP VIEW IF EXISTS `maxone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maxone` AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,max(((`s`.`basic` + `s`.`allow`) - `s`.`deduct`)) AS `TotalPay` from (`emp` `e` join `salary` `s` on((`e`.`empcode` = `s`.`empcode`))) where ((`s`.`basic` + `s`.`allow`) - `s`.`deduct`) >= all (select ((`s2`.`basic` + `s2`.`allow`) - `s2`.`deduct`) from `salary` `s2`) group by `e`.`empcode`,`s`.`empcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maxsalaries`
--

/*!50001 DROP VIEW IF EXISTS `maxsalaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maxsalaries` AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,`e`.`deptcode` AS `deptcode`,max(((`s`.`basic` + `s`.`allow`) - `s`.`deduct`)) AS `totalPay` from (`emp` `e` join `salary` `s` on((`e`.`empcode` = `s`.`empcode`))) group by `s`.`empcode` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `minfemalesalary`
--

/*!50001 DROP VIEW IF EXISTS `minfemalesalary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `minfemalesalary` AS select `e`.`empcode` AS `empcode`,`e`.`empname` AS `empname`,`e`.`sex` AS `sex`,`e`.`totalSalary` AS `totalSalary` from `femaleemployee` `e` where `e`.`totalSalary` <= all (select `femaleemployee`.`totalSalary` from `femaleemployee`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-21 23:06:58
