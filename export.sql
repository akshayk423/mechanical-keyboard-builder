-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: mkdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case`
--

DROP TABLE IF EXISTS `case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case` (
  `size` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case`
--

LOCK TABLES `case` WRITE;
/*!40000 ALTER TABLE `case` DISABLE KEYS */;
/*!40000 ALTER TABLE `case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyboardParts`
--

DROP TABLE IF EXISTS `keyboardParts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyboardParts` (
  `partID` int NOT NULL AUTO_INCREMENT,
  `URL` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`partID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyboardParts`
--

LOCK TABLES `keyboardParts` WRITE;
/*!40000 ALTER TABLE `keyboardParts` DISABLE KEYS */;
INSERT INTO `keyboardParts` VALUES (1,'www.google.com','name','brand',100);
/*!40000 ALTER TABLE `keyboardParts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycaps`
--

DROP TABLE IF EXISTS `keycaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keycaps` (
  `material` varchar(45) NOT NULL,
  `profile` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycaps`
--

LOCK TABLES `keycaps` WRITE;
/*!40000 ALTER TABLE `keycaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `keycaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderators` (
  `modID` int NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`modID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderators`
--

LOCK TABLES `moderators` WRITE;
/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partList`
--

DROP TABLE IF EXISTS `partList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partList` (
  `partListID` int NOT NULL AUTO_INCREMENT,
  `totalPrice` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`partListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partList`
--

LOCK TABLES `partList` WRITE;
/*!40000 ALTER TABLE `partList` DISABLE KEYS */;
/*!40000 ALTER TABLE `partList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcb`
--

DROP TABLE IF EXISTS `pcb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pcb` (
  `hotSwappable` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  `containsRGB` varchar(45) NOT NULL,
  `connectionType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcb`
--

LOCK TABLES `pcb` WRITE;
/*!40000 ALTER TABLE `pcb` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prebuilt`
--

DROP TABLE IF EXISTS `prebuilt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prebuilt` (
  `switchName` varchar(45) NOT NULL,
  `hotSwappable` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prebuilt`
--

LOCK TABLES `prebuilt` WRITE;
/*!40000 ALTER TABLE `prebuilt` DISABLE KEYS */;
/*!40000 ALTER TABLE `prebuilt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellingList`
--

DROP TABLE IF EXISTS `sellingList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellingList` (
  `sellingListID` int NOT NULL,
  PRIMARY KEY (`sellingListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellingList`
--

LOCK TABLES `sellingList` WRITE;
/*!40000 ALTER TABLE `sellingList` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellingList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stabilizers`
--

DROP TABLE IF EXISTS `stabilizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stabilizers` (
  `stabType` varchar(45) NOT NULL,
  `info` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stabilizers`
--

LOCK TABLES `stabilizers` WRITE;
/*!40000 ALTER TABLE `stabilizers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stabilizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switches` (
  `PartID` varchar(45) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `SwitchType` varchar(45) DEFAULT NULL,
  `Brand` varchar(45) DEFAULT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `Price` varchar(10) DEFAULT NULL,
  `URL` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`PartID`),
  UNIQUE KEY `PartID_UNIQUE` (`PartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switches`
--

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;
INSERT INTO `switches` VALUES ('partIDExample','ExampleName','exampleType','exampleBrand','exampleUser','1500','asdflkj'),('SW001','Cherry MX Red','Cherry','Cherry Company','testUserName','120.50','kbb.net/doesntwork');
/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userName` varchar(128) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`userName`),
  UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('janedoe','123456'),('jasonsmith','Password1'),('johndoe','password'),('username1','123456789'),('username10','qwertyuiop'),('username11','password123'),('username12','000000'),('username2','12345678'),('username3','1234567'),('username4','12345'),('username5','qwerty123'),('username6','qwerty'),('username7','azerty'),('username8','Sparky1985'),('username9','abc123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-30 16:12:11
