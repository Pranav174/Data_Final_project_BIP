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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card_swipes`
--

LOCK TABLES `Card_swipes` WRITE;
/*!40000 ALTER TABLE `Card_swipes` DISABLE KEYS */;
INSERT INTO `Card_swipes` VALUES (1,201111111,1,3,'2019-10-27 17:35:31',1),(2,201301023,2,5,'2019-10-28 14:10:31',1),(3,201611101,1,2,'2019-10-27 14:09:00',4),(4,201111111,3,1,'2019-10-20 07:51:51',1),(5,201666017,3,14,'2019-10-31 12:37:56',3),(6,201710111,2,21,'2019-11-02 21:08:52',2),(7,201811117,1,19,'2019-11-02 08:53:21',2),(8,201301023,3,8,'2019-10-29 13:53:21',3),(9,201910118,2,7,'2019-10-29 08:45:34',4),(10,201811117,3,13,'2019-10-31 07:45:48',3),(11,201710111,1,15,'2019-10-31 17:45:48',1),(12,201111111,4,2,'2019-10-27 14:09:00',4),(13,201666017,4,15,'2019-10-07 20:43:32',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,30000,'Virat',NULL,'Kohli','9560876599',35,1),(2,27000,'Rohit ',NULL,'Sharma','9560876598',32,1),(3,34000,'Shikhar','K','Dhawan','9560876597',34,2),(4,17000,'Ramesh',NULL,'Powar','9560876596',50,3),(5,50000,'David','P','Badguy','9560876595',55,2),(6,30000,'Rehan','L','Karim','9560876594',42,4),(7,47000,'Jagdish',NULL,'Mukherjee','9560876593',62,4),(8,32000,'Rama',NULL,'Rao','9560876592',26,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_item_ingredients_requirements`
--

LOCK TABLES `Food_item_ingredients_requirements` WRITE;
/*!40000 ALTER TABLE `Food_item_ingredients_requirements` DISABLE KEYS */;
INSERT INTO `Food_item_ingredients_requirements` VALUES (1,20,2,1),(2,10,2,5),(3,10,2,6),(4,40,1,4),(5,30,1,2),(6,20,4,8),(7,15,4,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_items`
--

LOCK TABLES `Food_items` WRITE;
/*!40000 ALTER TABLE `Food_items` DISABLE KEYS */;
INSERT INTO `Food_items` VALUES (1,1,'Aloo Paratha'),(2,1,'Curd'),(3,2,'Biryani'),(4,2,'Custard'),(5,4,'Raita'),(6,3,'Paneer Paratha'),(7,7,'Idli'),(8,3,'Sambhar'),(9,5,'Banana'),(10,1,'Dal');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES (1,'Rice',500),(2,'Flour',700),(3,'Cabbage',300),(4,'Potato',800),(5,'Onion',700),(6,'Tomato',900),(7,'Milk',600),(8,'Sugar',1000),(9,'Salt',800),(10,'Pepper',1200);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meal`
--

LOCK TABLES `Meal` WRITE;
/*!40000 ALTER TABLE `Meal` DISABLE KEYS */;
INSERT INTO `Meal` VALUES (1,'Sunday','Breakfast'),(2,'Sunday','Lunch'),(3,'Sunday','Dinner'),(4,'Monday','Breakfast'),(5,'Monday','Lunch'),(6,'Monday','Dinner'),(7,'Tuesday','Breakfast'),(8,'Tuesday','Lunch'),(9,'Tuesday','Dinner'),(10,'Wednesday','Breakfast'),(11,'Wednesday','Lunch'),(12,'Wednesday','Dinner'),(13,'Thursday','Breakfast'),(14,'Thursday','Lunch'),(15,'Thursday','Dinner'),(16,'Friday','Breakfast'),(17,'Friday','Lunch'),(18,'Friday','Dinner'),(19,'Saturday','Breakfast'),(20,'Saturday','Lunch'),(21,'Saturday','Dinner');
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
INSERT INTO `Menu` VALUES (1,1,1,25),(2,1,2,25),(3,1,3,50),(4,2,1,24),(5,2,2,24),(6,2,3,52),(7,3,1,27),(8,3,2,27),(9,3,3,52),(10,4,1,20),(11,4,2,25),(12,4,3,50),(13,1,6,50),(14,2,7,22),(15,3,15,90);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mess`
--

LOCK TABLES `Mess` WRITE;
/*!40000 ALTER TABLE `Mess` DISABLE KEYS */;
INSERT INTO `Mess` VALUES (1,'Kadamb'),(2,'North'),(3,'South'),(4,'Yuktahaar');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registration`
--

LOCK TABLES `Registration` WRITE;
/*!40000 ALTER TABLE `Registration` DISABLE KEYS */;
INSERT INTO `Registration` VALUES (1,1,201111111,3),(2,1,201301023,5),(3,4,201611101,2),(4,1,201111111,1),(5,3,201666017,14),(6,2,201710111,21),(7,2,201811117,19),(8,3,201301023,8),(9,4,201910118,7),(10,3,201811117,13),(11,1,201710111,15),(12,4,201111111,2),(13,3,201666017,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revenue`
--

LOCK TABLES `Revenue` WRITE;
/*!40000 ALTER TABLE `Revenue` DISABLE KEYS */;
INSERT INTO `Revenue` VALUES (1,1,1,'2019-10-27',10000,20000,17085),(2,1,2,'2019-11-03',15000,25000,26000),(3,1,3,'2019-11-03',12000,17000,18081),(4,2,4,'2019-10-28',14000,18000,18000),(5,2,5,'2019-10-21',12000,16000,15891),(6,2,6,'2019-11-04',17000,20000,21000),(7,3,7,'2019-11-05',11000,17000,16890),(8,3,8,'2019-10-29',12000,17000,18000),(9,4,16,'2019-11-01',18000,19000,19000),(10,2,17,'2019-10-25',19000,24000,24056),(11,4,18,'2019-11-08',10000,14000,15000);
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
INSERT INTO `Students` VALUES (201111111,'Suresh',NULL,'Patel',20,'9999999919',NULL),(201301023,'Kalpana ','P','Chawla',18,'7676767676',3),(201611101,'Rajpal','J','Yadav',22,'6767676767',NULL),(201666017,'Max','Good','Boy',22,'9876543210',1),(201710111,'Rakesh',NULL,'Sharma',23,'9595995955',1),(201810101,'Chintu',NULL,'Sharma',19,'9999911111',1),(201810103,'Mintu',NULL,'Bansal ',19,'9898989898',4),(201811117,'Nemo',NULL,'Chaturvedi',18,'8888888888',1),(201910101,'Ramesh','M','Kathuria',20,'9797979797',NULL),(201910118,'Dory',NULL,'John',21,'9456782190',3);
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

-- Dump completed on 2019-11-13  3:45:27
