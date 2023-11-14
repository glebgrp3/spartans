CREATE DATABASE  IF NOT EXISTS `fitness` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitness`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: fitness
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
-- Table structure for table `abonement`
--

DROP TABLE IF EXISTS `abonement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonement` (
  `idabonement` int NOT NULL,
  `abonementcost` int DEFAULT NULL,
  `abonementduration` int DEFAULT NULL,
  `abonementdate` date DEFAULT NULL,
  `client` varchar(45) DEFAULT NULL,
  `lessontype` int DEFAULT NULL,
  PRIMARY KEY (`idabonement`),
  KEY `idclient_idx` (`client`),
  KEY `lest_idx` (`lessontype`),
  CONSTRAINT `idclient` FOREIGN KEY (`client`) REFERENCES `client` (`passport`),
  CONSTRAINT `lest` FOREIGN KEY (`lessontype`) REFERENCES `lessontype` (`idlessontype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonement`
--

LOCK TABLES `abonement` WRITE;
/*!40000 ALTER TABLE `abonement` DISABLE KEYS */;
INSERT INTO `abonement` VALUES (1,500,30,NULL,NULL,NULL),(2,300,30,NULL,NULL,NULL),(3,200,30,NULL,NULL,NULL);
/*!40000 ALTER TABLE `abonement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `surname` text,
  `name` text,
  `patronymic` text,
  `passport` varchar(45) NOT NULL,
  `issuedby` text,
  `dateofissue` date DEFAULT NULL,
  `address` text,
  `dateofbirth` date DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`passport`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Коваленко','Мария ','Павловна','1104_658903','ОВД Кировского р-на г.Уфы','2018-03-12','Уфа, Кирова 98-15','2004-03-12','89174056897','blue','black'),('Лютикова','Елена ','Дмитриевна','1106_235896','ОВД Орджоникидзевского р-на','2019-06-13','Уфа, Космонавтов 25-63','2005-06-13','89173489562','anna','anna'),('Тарасов','Павел ','Андреевич','1109_453695','ОВД Советского р-на г.Уфы','2017-09-19','Уфа, Мингажева 23/2-10','2003-09-19','89572569783','red','red'),('Никитин ','Олег ','Витальевич','1204_236319','ОВД Кировского р-на г.Уфы','2019-01-15','Уфа, ул.Авроры, 5-65','2005-01-15','89613698765','nata','nata'),('Королева ','Наталия ','Степановна','6001_956843','ОВД Кировского р-на г.Уфы','2018-09-10','Уфа, ул.Кувыкина, 13-9','2004-09-10','89173445687','kons','kons'),('Петров ','Сергей','Петрович','6704_235689','ОВД Демского р-на г.Уфы','2019-05-01','Уфа, Правды 7-2','2005-05-01','89672658742','petr','petr'),('Трофимов','Олег ','Яковлевич','8000_235689','ОВД Калинского р-на г.Уфы','2004-03-26','Уфа, Борисоглебского 25-63','1990-03-26','89173440202','naty','naty'),('Царегородцева','Лариса','Сергеевна','8000_321456','ОВД Советского р-на г.Уфы','2009-09-10','Уфа,Подводников 134-6','1995-09-10','89173489876','lara','lara'),('Власов ','Константин ','Львович','8001_238017','ОВД Ленинского р-на г.Уфы','2020-04-02','Уфа, Ленина 15-23','2006-04-02','89052356489','lena','lena'),('Воронина','Светлана','Яковлевна','8001_589645','ОВД Кировского р-на г.Уфы','2013-04-02','Уфа, Айская 16-52','1999-04-02','89613698555','svet','svet'),('Гребнева','Галина','Борисовна','8002_125369','ОВД Калинского р-на г.Уфы','2002-02-25','Уфа, Мира 188-6','1988-02-25','89174687897','nady','nady'),('Хасанов','Альберт','Маратович','8002_235879','ОВД Демского р-на г.Уфы','2013-03-25','Уфа, Правды 74-9','1999-03-25','89535969783','gali','gali'),('Мазитов','Ринат','Ирекович','8002_895615','ОВД Демского р-на г.Уфы','2017-12-14','Уфа, Невского 17-2','2003-12-14','89613978765','oleq','oleq'),('Шайхутдинова','Альфия','Гариповна','8003_235684','ОВД Кировского р-на г.Уфы','2018-12-10','Уфа, Кувыкина 13-9','2004-12-10','89173444462','alfi','alfi'),('Ишманов','Рустем','Радикович','8003_588999','ОВД Кировского р-на г.Уфы','2018-03-27','Уфа, Рабкоров 7-98','2004-03-27','89052356555','ryst','ryst'),('Руслякова','Ирина','Анатольевна','8003_864525','ОВД Кировского р-на г.Уфы','2004-06-24','Уфа, Пархоменко 98-15','1990-06-24','89672601012','adel','adel'),('Бывальцева','Валентина','Петровна','8004_256987','ОВД Орджоникидзевского р-на','2015-01-01','Уфа, Бабушкина 125-63','2001-01-01','89173400340','rina','rina'),('Хусаинова ','Адель','Рифовна','8004_389645','ОВД Ленинского р-на г.Уфы','2001-12-01','Уфа, Ленина 121-13','1987-12-01','89613654894','albe','albe'),('Ишимбаева','Наталья','Яковлевна','8004_755988','ОВД Кировского р-на г.Уфы','2019-07-01','Уфа, Трудовая 32-5','2005-07-01','89572511183','nash','nash'),('Самойлова','Наталия ','Евгеньевна','8005_237519','ОВД Советского р-на г.Уфы','2001-06-13','Уфа, Ибрагимова23/2-10','1987-06-13','89052350101','mara','mara'),('Маркова ','Надежда ','Юрьевна','8006_123456','ОВД Советского р-на г.Уфы','2018-12-23','Уфа, Кустарная 12-5','2004-12-23','89173481234','oleg','oleg'),('Нуриев','Марат','Альбертович','8006_235689','ОВД Кировского р-на г.Уфы','2014-12-12','Уфа, Летчиков 98-15','2000-12-12','89173345662','irin','irin'),('Адельгареева','Клара','Адамовна','8006_365987','ОВД Ленинского р-на г.Уфы','2018-03-25','Уфа, Центральная 225-63','2004-03-25','89174000000','klar','klar'),('Микрюков','Игорь','Владимирович','8006_454545','ОВД Советского р-на г.Уфы','2022-06-13','Уфа, Советская 1-15','2008-06-13','89613654222','igor','igor'),('Антипина','Светлана','Игоревна','8008_454545','ОВД Ленинского р-на г.Уфы','2005-04-02','Уфа, Первомайская 45-96','1991-04-02','89173403034','cvet','cvet'),('Николова','Эмма','Борисовна','8008_808080','ОВД Советского р-на г.Уфы','2015-05-01','Уфа, Кустарная 3-7','2001-05-01','89173488887','emma','emma'),('Саттарова','Гузель','Ринатовна','8008_963258','ОВД Демского р-на г.Уфы','2004-06-13','Уфа, Радужная 65-89','1990-06-13','89613698999','gyze','gyze'),('Петряева','Галина','Власовна','8009_232556','ОВД Калинского р-на г.Уфы','2013-04-02','Уфа, 50 лет ВЛКСМ 3-58','1999-04-02','89673338742','gala','gala'),('Шайхинуров','Ильгиз','Ахметович','8009_587965','ОВД Кировского р-на г.Уфы','2012-09-10','Уфа, Цюрупы 103-5','1998-09-10','89173444444','ilgi','ilgi'),('Федоров','Михаил ','Иванович','8301_238957','ОВД Калинского р-на г.Уфы','2018-03-15','Уфа, Мира 15-36','2004-03-15','89613654894','fedr','fedr');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `surname` text,
  `name` text,
  `patronymic` varchar(45) DEFAULT NULL,
  `passport` varchar(45) NOT NULL,
  `issuedby` text,
  `dateofissue` date DEFAULT NULL,
  `address` text,
  `dateofbirth` date DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `room` int DEFAULT NULL,
  PRIMARY KEY (`passport`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `typeemployee_idx` (`type`),
  KEY `roomid_idx` (`room`),
  CONSTRAINT `roomid` FOREIGN KEY (`room`) REFERENCES `room` (`idroom`),
  CONSTRAINT `typeemployee` FOREIGN KEY (`type`) REFERENCES `employeetype` (`idtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Игнатьев','Семен','Александрович','0302_123546','ОВД Советского р-на г.Уфы','2004-10-23','Уфа, Достоевского 3-20','1990-07-05','89174912178','men','345',1,1),('Марченко','Кира','Олеговна','1934_125893','ОВД Ленинского р-на г.Уфы','2000-01-12','Уфа, Ленина 8-15','1986-01-05','89173445899','man','123',1,2),('Котов','Иван','Иванович','3659_987456','ОВД Советского р-на г.Уфы','2014-05-01','Уфа, Пархоменко 9-58','2000-02-02','89611212156','mat','789',1,3),('Сидоров','Яков','Иванович','7935_356987','ОВД Орджоникиджевского р-на г.Уфы','2017-03-19','Уфа, Первомайская 24-3','2003-09-05','89616565897','ment','567',2,4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetype`
--

DROP TABLE IF EXISTS `employeetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetype` (
  `idtype` int NOT NULL AUTO_INCREMENT,
  `typename` text,
  PRIMARY KEY (`idtype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetype`
--

LOCK TABLES `employeetype` WRITE;
/*!40000 ALTER TABLE `employeetype` DISABLE KEYS */;
INSERT INTO `employeetype` VALUES (1,'Тренер'),(2,'Администратор-ресепшн');
/*!40000 ALTER TABLE `employeetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `idlesson` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `lessontype` int DEFAULT NULL,
  `room` int DEFAULT NULL,
  `group` tinyint DEFAULT NULL,
  PRIMARY KEY (`idlesson`),
  KEY `ltype_idx` (`lessontype`),
  KEY `idroom_idx` (`room`),
  CONSTRAINT `idroom` FOREIGN KEY (`room`) REFERENCES `room` (`idroom`),
  CONSTRAINT `ltype` FOREIGN KEY (`lessontype`) REFERENCES `lessontype` (`idlessontype`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'2023-09-09','09:00:00',60,1,NULL,NULL),(2,'2023-03-01','13:00:00',40,1,4,1),(3,'2023-03-01','15:00:00',60,7,3,1),(4,'2023-03-01','17:00:00',40,5,1,1),(5,'2023-03-01','18:00:00',60,9,2,1),(6,'2023-03-01','19:00:00',60,8,3,1),(7,'2023-03-01','20:00:00',40,12,1,1),(8,'2023-03-02','10:00:00',60,3,1,1),(9,'2023-03-02','12:00:00',60,6,3,1),(10,'2023-03-02','14:00:00',60,10,4,1),(11,'2023-03-02','16:00:00',40,14,2,1),(12,'2023-03-02','17:00:00',60,7,3,1),(13,'2023-03-02','19:00:00',60,10,4,1),(14,'2023-03-02','20:00:00',40,5,1,1),(15,'2023-03-03','10:00:00',40,2,2,1),(16,'2023-03-03','11:00:00',40,14,2,1),(17,'2023-03-03','13:00:00',60,11,4,1),(18,'2023-03-03','15:00:00',60,8,3,1),(19,'2023-03-03','17:00:00',60,3,1,1),(20,'2023-03-03','19:00:00',60,9,2,1),(21,'2023-03-03','20:00:00',40,12,1,1),(22,'2023-03-04','10:00:00',60,4,1,1),(23,'2023-03-04','11:00:00',60,7,3,1),(24,'2023-03-04','13:00:00',40,1,4,1),(25,'2023-03-04','15:00:00',40,5,1,1),(26,'2023-03-04','17:00:00',60,6,3,1),(27,'2023-03-04','19:00:00',60,11,4,1),(28,'2023-03-04','20:00:00',60,8,3,1),(29,'2023-03-05','10:00:00',40,2,2,1),(30,'2023-03-05','11:00:00',40,5,1,1),(31,'2023-03-05','13:00:00',60,3,1,1),(32,'2023-03-05','15:00:00',60,8,3,1),(33,'2023-03-05','17:00:00',40,1,4,1),(34,'2023-03-05','19:00:00',60,4,1,1),(35,'2023-03-05','20:00:00',60,13,4,1),(36,'2023-03-06','10:00:00',40,5,1,1),(37,'2023-03-06','11:00:00',40,2,2,1),(38,'2023-03-06','13:00:00',60,4,1,1),(39,'2023-03-06','15:00:00',60,6,3,1),(40,'2023-03-06','17:00:00',40,14,2,1),(41,'2023-03-06','19:00:00',60,11,4,1),(42,'2023-03-06','20:00:00',60,13,4,1),(43,'2023-03-07','10:00:00',60,4,1,1),(44,'2023-03-07','11:00:00',40,5,1,1),(45,'2023-03-07','13:00:00',60,7,3,1),(46,'2023-03-07','15:00:00',60,10,4,1),(47,'2023-03-07','17:00:00',60,8,3,1),(48,'2023-03-07','19:00:00',40,14,2,1),(49,'2023-03-07','20:00:00',40,12,1,1);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessonclient`
--

DROP TABLE IF EXISTS `lessonclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessonclient` (
  `idlessonclient` int NOT NULL,
  `lesson` int DEFAULT NULL,
  `client` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idlessonclient`),
  KEY `ls_idx` (`lesson`),
  KEY `cl_idx` (`client`),
  CONSTRAINT `cl` FOREIGN KEY (`client`) REFERENCES `client` (`passport`),
  CONSTRAINT `ls` FOREIGN KEY (`lesson`) REFERENCES `lesson` (`idlesson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessonclient`
--

LOCK TABLES `lessonclient` WRITE;
/*!40000 ALTER TABLE `lessonclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessonclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessontype`
--

DROP TABLE IF EXISTS `lessontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessontype` (
  `idlessontype` int NOT NULL AUTO_INCREMENT,
  `lessontypename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idlessontype`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessontype`
--

LOCK TABLES `lessontype` WRITE;
/*!40000 ALTER TABLE `lessontype` DISABLE KEYS */;
INSERT INTO `lessontype` VALUES (1,'Танцы'),(2,'Силовые тренировки'),(3,'Йога'),(4,'Целостная йога'),(5,'Бодифлекс'),(6,'Восточные танцы'),(7,'Зумба'),(8,'Хип-Хоп'),(9,'Кикбоксинг'),(10,'Split'),(11,'Силовые тренировки'),(12,'Кардиотренировки'),(13,'Crossfit'),(14,'Пластика');
/*!40000 ALTER TABLE `lessontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `idroom` int NOT NULL,
  `roomname` varchar(45) DEFAULT NULL,
  `maxpeople` int DEFAULT NULL,
  PRIMARY KEY (`idroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Фитнес зал',15),(2,'Тренажерный зал',10),(3,'Танцевальный зал',12),(4,'Зал силовых нагрузок',6);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14  6:15:41
