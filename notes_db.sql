-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: notes_db
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'compras'),(2,'familia'),(3,'trabajo'),(4,'estudio'),(5,'música'),(6,'viajes'),(7,'mascota'),(8,'entretenimiento'),(9,'deporte'),(10,'cuidado');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_category`
--

DROP TABLE IF EXISTS `note_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_category` (
  `note_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  PRIMARY KEY (`note_category_id`),
  KEY `category_id` (`category_id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `note_id` FOREIGN KEY (`note_id`) REFERENCES `notes` (`note_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_category`
--

LOCK TABLES `note_category` WRITE;
/*!40000 ALTER TABLE `note_category` DISABLE KEYS */;
INSERT INTO `note_category` VALUES (0,10,4),(1,1,1),(2,3,2),(3,7,3),(4,1,4),(5,5,5),(6,1,6),(7,6,7),(8,2,8),(9,9,9),(10,4,10),(11,1,8),(12,8,7);
/*!40000 ALTER TABLE `note_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL,
  `note_title` varchar(100) NOT NULL,
  `note_creation_date` date NOT NULL,
  `note_modification_date` date NOT NULL,
  `note_description` longtext NOT NULL,
  `can_delete` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Realizar compras','2021-10-03','2021-10-05','juguetes, smartphones, tablets, patines.',0,1),(2,'Trabajo','2022-02-22','2022-02-23','almacenar agua',0,2),(3,'Perro','2021-10-03','2021-10-05','comprar el concentrado y un nuevo collar.',1,3),(4,'Droguería','2022-02-22','2022-02-23','comprar pastillas para el dolor de muelas',1,4),(5,'Descargar música','2022-03-13','2022-03-23','Últimos albumes de Edson Velandia y Cuarteto de Nos',0,5),(6,'Mercado des domingo','2021-10-03','2021-10-05','huevos, lenteja, tomates, champiñones.',1,6),(7,'Plan de vacaciones','2022-02-22','2022-02-23','Encontrar airbnb para un mes, reservar tiquetes, comprar vestido de baño.',1,7),(8,'Picnic','2022-03-13','2022-03-23','Comprar los ingredientes para los wraps, comprar vino, jugo y postres. Decirle a los hijos que no hagan plan para ese día. ',0,8),(9,'Rutina de ejercicio','2021-10-03','2021-10-05','Hoy voy a hacer 30 burpees, 50 flexiones de pecho y 100 abdominales.',1,9),(10,'Proyecto final','2022-02-22','2022-02-23','Pendientes: terminar el resumen, reunirme con el grupo para organizar la bibliografía, ajustar las imágenes',0,10);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rodolfo Reno','reno@email.com'),(2,'Ernesto Pérez','ernesto@email.com'),(3,'Pepito Pérez','pepito@email.com'),(4,'Ratón Pérez','dientes@email.com'),(5,'Roberto Esponja','bob@email.com'),(6,'Arnulfo Hernández','arnulfo@email.com'),(7,'Cirin Firin','cirin@email.com'),(8,'Lola Vaca','lola@email.com'),(9,'María Martínez','maria@email.com'),(10,'Nadia Nikolnicova','nadia@email.com');
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

-- Dump completed on 2022-04-12 19:14:17
