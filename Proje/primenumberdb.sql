CREATE DATABASE  IF NOT EXISTS `primenumberdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `primenumberdb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: primenumberdb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `numberentries`
--

DROP TABLE IF EXISTS `numberentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numberentries` (
  `Id` char(36) NOT NULL,
  `NumbersString` text NOT NULL,
  `LargestPrime` int NOT NULL,
  `CreatedAt` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numberentries`
--

LOCK TABLES `numberentries` WRITE;
/*!40000 ALTER TABLE `numberentries` DISABLE KEYS */;
INSERT INTO `numberentries` VALUES ('08dca8f4-6606-4bb6-88d8-30c381763c88','5,7,9',7,'2024-07-20 19:44:41'),('08dca8f4-770b-4392-85c5-d1d2cfa8ce06','5,7,9,12,13,25,33',13,'2024-07-20 19:45:10'),('08dca8f8-0ef6-4d71-8e84-c9eacafa37fc','5,7,9,10,300,500,501,1001',7,'2024-07-20 20:10:53'),('08dca969-9c1f-4338-8816-cb4f44aa9d6c','0,3,5,10,13',13,'2024-07-21 09:43:44'),('08dca9b5-0347-4767-8ddd-1b64a90ff068','0,3,5,6',5,'2024-07-21 18:43:29'),('08dca9bd-e067-403a-82c4-971007ca3b43','0,3,5,6',5,'2024-07-21 19:46:56'),('08dca9be-0809-4664-8057-6242b2ca657e','3,5,6,7',7,'2024-07-21 19:48:02'),('08dcaa1c-c831-4346-8c26-84d6a0cf8e01','0',0,'2024-07-22 07:06:17'),('08dcaa23-b2aa-489d-8968-05a87f45e743','2,3,5,6',5,'2024-07-22 07:55:48'),('08dcaa25-f3e3-47f6-86f6-6b299d5cda66','2,3,5,6',5,'2024-07-22 08:11:55'),('08dcaa31-6f59-41d8-89d5-757bd66cfc29','5,5,5,5',5,'2024-07-22 09:34:06'),('08dcaa31-7bd9-405f-8adb-74f9ce7061eb','0,1,4',0,'2024-07-22 09:34:29'),('08dcaa37-9629-40c3-8861-2bb8ac216f0e','0',0,'2024-07-22 10:18:10'),('08dcaa37-9dae-4ee6-83ec-017b0db85907','0,2,3,4',3,'2024-07-22 10:18:23'),('08dcaa47-685c-4b5d-86d9-cbb6ff7bd256','0,3,5,6',5,'2024-07-22 12:11:25'),('08dcaa54-699f-4bbc-86dd-9e7ed7ac4aea','2,3,5',5,'2024-07-22 13:44:30'),('08dcaa54-c35c-4472-868c-5b76f2dcf1f5','2,3',3,'2024-07-22 13:47:01'),('08dcaa54-da30-4e6e-8100-d115f984f148','2,3',3,'2024-07-22 13:47:39'),('08dcaa54-e4e4-4427-8962-a9c736f43c1a','2,3',3,'2024-07-22 13:47:57'),('08dcaa55-3b10-4756-83b0-faafbd64ae1f','0,2,3',3,'2024-07-22 13:50:22'),('08dcaa55-9bf9-4ea4-8e1e-9e83b916a99d','2,3,5',5,'2024-07-22 13:53:05'),('08dcaa55-c2d0-4591-8fc7-28f13b50371f','2,3,5',5,'2024-07-22 13:54:10'),('08dcaa55-e527-49ca-8e43-3e70f649ed4b','2,5,6',5,'2024-07-22 13:55:07'),('08dcaa55-e757-49b7-8e94-64815367546d','2,5,6,7',7,'2024-07-22 13:55:11'),('08dcaa56-0bf9-47f7-8100-d89f9739fa3e','2,3,5,6',5,'2024-07-22 13:56:12'),('08dcaa5d-a612-498e-842f-b86954213198','2,3,5,6',5,'2024-07-22 14:50:36'),('08dcaa5d-c4dd-489c-8113-5ca026c87341','2,3,5,6',5,'2024-07-22 14:51:29'),('08dcaa62-f3ef-4519-8ccf-12a991c0ba90','0,2,3,113',113,'2024-07-22 15:28:36'),('08dcaa65-e5a8-4f68-849a-c126c976dd73','3,5,6',5,'2024-07-22 15:49:40'),('08dcaa68-93ef-4b88-82a6-c44bb543146e','1,2,3,4,5',5,'2024-07-22 16:08:52'),('08dcaa68-dec8-43bd-837e-7cb68dc72dd0','1',0,'2024-07-22 16:10:57'),('08dcaa68-ef21-4e50-8284-b091a5839f2b','1,2,3',3,'2024-07-22 16:11:25'),('08dcaa69-bc9a-4ddb-89a0-b370a8d14f96','1',0,'2024-07-22 16:17:09'),('08dcaa69-c0ca-49ed-88fc-49d696150074','1,2,5',5,'2024-07-22 16:17:16'),('08dcaa6a-2afe-49ee-8f8a-b250d3e73751','1,2,5',5,'2024-07-22 16:20:14'),('08dcaa6a-30a3-4d56-89ce-216e99c12217','1',0,'2024-07-22 16:20:24'),('08dcaa6a-379f-4bb4-8768-00f487a2e7ae','1,4,6',0,'2024-07-22 16:20:36'),('08dcaa6a-40eb-4834-8141-dec8564ac9af','1,2,5',5,'2024-07-22 16:20:51'),('08dcaa6d-cd09-4b95-84d8-fe810a818ab1','1,2,5',5,'2024-07-22 16:46:15'),('08dcaa6d-d077-49a5-8534-271f3e7577d8','2',2,'2024-07-22 16:46:21'),('08dcaa6d-d20a-49a2-8bff-38196ce1fe41','1',0,'2024-07-22 16:46:23');
/*!40000 ALTER TABLE `numberentries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-22 20:00:10