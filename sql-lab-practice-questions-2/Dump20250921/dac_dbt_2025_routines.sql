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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-21 23:14:18
