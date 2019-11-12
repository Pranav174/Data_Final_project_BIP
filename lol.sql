-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: MESS_DATABASE
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `Card_swipes`
--

DROP TABLE IF EXISTS `Card_swipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Card_swipes` (
  `swipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_id` int(10) unsigned NOT NULL,
  `Mess_id` int(11) NOT NULL,
  `Meal_id` int(11) NOT NULL,
  `Swipe_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Registered_mess` int(11) DEFAULT NULL,
  PRIMARY KEY (`swipe_id`),
  KEY `student_idx` (`Student_id`),
  KEY `mess_idx` (`Mess_id`),
  KEY `meal_idx` (`Meal_id`),
  KEY `fk_Card_swipes_1_idx` (`Registered_mess`),
  CONSTRAINT `fk_Card_swipes_1` FOREIGN KEY (`Registered_mess`) REFERENCES `Mess` (`Mess_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `meal` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mess` FOREIGN KEY (`Mess_id`) REFERENCES `Mess` (`Mess_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student` FOREIGN KEY (`Student_id`) REFERENCES `Students` (`roll_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card_swipes`
--

LOCK TABLES `Card_swipes` WRITE;
/*!40000 ALTER TABLE `Card_swipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Card_swipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `Employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `Salary` int(11) DEFAULT NULL,
  `First_name` varchar(45) NOT NULL,
  `Middle_name` varchar(45) DEFAULT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Phone_no` varchar(15) DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `Works_in_mess` int(11) NOT NULL,
  PRIMARY KEY (`Employee_id`),
  KEY `Works_in_mess_idx` (`Works_in_mess`),
  CONSTRAINT `Works_in_mess` FOREIGN KEY (`Works_in_mess`) REFERENCES `Mess` (`Mess_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food_item_ingredients_requirements`
--

DROP TABLE IF EXISTS `Food_item_ingredients_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food_item_ingredients_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity` int(10) unsigned NOT NULL,
  `Food_item_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Food_item_ingredients_requirements_1_idx` (`ingredient_id`),
  KEY `fk_Food_item_ingredients_requirements_2_idx` (`Food_item_id`),
  CONSTRAINT `fk_Food_item_ingredients_requirements_1` FOREIGN KEY (`ingredient_id`) REFERENCES `Ingredients` (`Ingredients_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Food_item_ingredients_requirements_2` FOREIGN KEY (`Food_item_id`) REFERENCES `Food_items` (`Food_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_item_ingredients_requirements`
--

LOCK TABLES `Food_item_ingredients_requirements` WRITE;
/*!40000 ALTER TABLE `Food_item_ingredients_requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `Food_item_ingredients_requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food_items`
--

DROP TABLE IF EXISTS `Food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food_items` (
  `Food_id` int(11) NOT NULL AUTO_INCREMENT,
  `Menu_id` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Food_id`),
  KEY `food_item_menu_idx` (`Menu_id`),
  CONSTRAINT `food_item_menu` FOREIGN KEY (`Menu_id`) REFERENCES `Menu` (`Menu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_items`
--

LOCK TABLES `Food_items` WRITE;
/*!40000 ALTER TABLE `Food_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `Food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingredients` (
  `Ingredients_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Cost` int(11) NOT NULL,
  PRIMARY KEY (`Ingredients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meal`
--

DROP TABLE IF EXISTS `Meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Meal` (
  `Meal_id` int(11) NOT NULL AUTO_INCREMENT,
  `Day` varchar(45) NOT NULL,
  `Time` varchar(45) NOT NULL,
  PRIMARY KEY (`Meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meal`
--

LOCK TABLES `Meal` WRITE;
/*!40000 ALTER TABLE `Meal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu` (
  `Menu_id` int(11) NOT NULL,
  `Mess_id` int(11) NOT NULL,
  `Meal_id` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  PRIMARY KEY (`Menu_id`),
  KEY `menu_meal_idx` (`Meal_id`),
  KEY `menu_mess_idx` (`Mess_id`),
  CONSTRAINT `menu_meal` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_mess` FOREIGN KEY (`Mess_id`) REFERENCES `Mess` (`Mess_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mess`
--

DROP TABLE IF EXISTS `Mess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mess` (
  `Mess_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Mess_id`),
  UNIQUE KEY `Mess_id_UNIQUE` (`Mess_id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess`
--

LOCK TABLES `Mess` WRITE;
/*!40000 ALTER TABLE `Mess` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registration`
--

DROP TABLE IF EXISTS `Registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registered_mess_id` int(11) NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `meal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registered_mess_idx` (`registered_mess_id`),
  KEY `registered_student_id_idx` (`student_id`),
  KEY `registered_meal_id_idx` (`meal_id`),
  CONSTRAINT `registered_meal_id` FOREIGN KEY (`meal_id`) REFERENCES `Meal` (`Meal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `registered_mess_id` FOREIGN KEY (`registered_mess_id`) REFERENCES `Mess` (`Mess_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `registered_student_id` FOREIGN KEY (`student_id`) REFERENCES `Students` (`roll_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registration`
--

LOCK TABLES `Registration` WRITE;
/*!40000 ALTER TABLE `Registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `Registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Revenue`
--

DROP TABLE IF EXISTS `Revenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Revenue` (
  `Revenue_id` int(11) NOT NULL AUTO_INCREMENT,
  `Mess_id` int(11) NOT NULL,
  `Meal_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Cost` int(11) NOT NULL,
  `Expected_revenue` int(11) NOT NULL,
  `Actual_revenue` int(11) NOT NULL,
  PRIMARY KEY (`Revenue_id`),
  KEY `revenue_meal_idx` (`Meal_id`),
  KEY `revenue_mess_idx` (`Mess_id`),
  CONSTRAINT `revenue_meal` FOREIGN KEY (`Meal_id`) REFERENCES `Meal` (`Meal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `revenue_mess` FOREIGN KEY (`Mess_id`) REFERENCES `Mess` (`Mess_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revenue`
--

LOCK TABLES `Revenue` WRITE;
/*!40000 ALTER TABLE `Revenue` DISABLE KEYS */;
/*!40000 ALTER TABLE `Revenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `roll_no` int(10) unsigned NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Middle_name` varchar(45) DEFAULT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Phone_number` varchar(15) DEFAULT NULL,
  `Monthly_registered_mess` int(11) DEFAULT NULL,
  PRIMARY KEY (`roll_no`),
  KEY `registered_mess_idx` (`Monthly_registered_mess`),
  CONSTRAINT `registered_mess` FOREIGN KEY (`Monthly_registered_mess`) REFERENCES `Mess` (`Mess_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13  1:15:40
