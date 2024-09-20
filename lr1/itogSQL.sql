-- --------------------------------------------------------
-- Хост:                         91.219.194.4
-- Версия сервера:               10.3.39-MariaDB-cll-lve - MariaDB Server
-- Операционная система:         Linux
-- HeidiSQL Версия:              12.7.0.6885
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных bh35910_kurs1711
CREATE DATABASE IF NOT EXISTS `bh35910_kurs1711` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `bh35910_kurs1711`;

-- Дамп структуры для таблица bh35910_kurs1711.glagolev_City
CREATE TABLE IF NOT EXISTS `glagolev_City` (
  `City_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Дамп данных таблицы bh35910_kurs1711.glagolev_City: ~2 rows (приблизительно)
INSERT INTO `glagolev_City` (`City_ID`, `name`) VALUES
	(1, 'Birobidzhan'),
	(2, 'Habarovsk');

-- Дамп структуры для таблица bh35910_kurs1711.glagolev_Company
CREATE TABLE IF NOT EXISTS `glagolev_Company` (
  `Company_ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Дамп данных таблицы bh35910_kurs1711.glagolev_Company: ~2 rows (приблизительно)
INSERT INTO `glagolev_Company` (`Company_ID`, `name`) VALUES
	(1, 'ДНС'),
	(2, 'Mvideo');

-- Дамп структуры для таблица bh35910_kurs1711.glagolev_Delivery
CREATE TABLE IF NOT EXISTS `glagolev_Delivery` (
  `Delivery_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Part_ID` int(10) unsigned DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Delivery_ID`) USING BTREE,
  KEY `FK_glagolev_Delivery_glagolev_Parts` (`Part_ID`),
  KEY `Company_ID` (`Company_ID`),
  CONSTRAINT `FK_glagolev_Delivery_glagolev_Company` FOREIGN KEY (`Company_ID`) REFERENCES `glagolev_Company` (`Company_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_glagolev_Delivery_glagolev_Parts` FOREIGN KEY (`Part_ID`) REFERENCES `glagolev_Parts` (`Part_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Дамп данных таблицы bh35910_kurs1711.glagolev_Delivery: ~3 rows (приблизительно)
INSERT INTO `glagolev_Delivery` (`Delivery_ID`, `Part_ID`, `Quantity`, `Comment`, `Company_ID`) VALUES
	(1, 3, 80, 'DNS Процессор Core i5', 1),
	(2, 6, 10, 'MVideo Системный блок R3', 2),
	(3, 3, 90, 'DNS Процессор Core i7', 1);

-- Дамп структуры для таблица bh35910_kurs1711.glagolev_Parts
CREATE TABLE IF NOT EXISTS `glagolev_Parts` (
  `Part_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Part_name` varchar(80) DEFAULT NULL,
  `Material` varchar(80) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL CHECK (`Weight` > 0),
  PRIMARY KEY (`Part_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Дамп данных таблицы bh35910_kurs1711.glagolev_Parts: ~5 rows (приблизительно)
INSERT INTO `glagolev_Parts` (`Part_ID`, `Part_name`, `Material`, `Weight`) VALUES
	(2, 'Материнская плата', 'Сталь', 300),
	(3, 'Процессор', 'Сталь', 300),
	(4, 'Видеокарта', 'Сталь', 800),
	(5, 'Блок питания ATX', 'Сталь', 1800),
	(6, 'Системный блок', NULL, 1800);

-- Дамп структуры для таблица bh35910_kurs1711.glagolev_Postavki
CREATE TABLE IF NOT EXISTS `glagolev_Postavki` (
  `Postavki_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Delivery_ID` int(11) NOT NULL DEFAULT 0,
  `Project_ID` int(11) NOT NULL DEFAULT 0,
  `kolvo` int(11) NOT NULL DEFAULT 0,
  `datez` date NOT NULL,
  `datep` date NOT NULL,
  PRIMARY KEY (`Postavki_ID`),
  KEY `Delivery_ID` (`Delivery_ID`),
  KEY `Project_ID` (`Project_ID`),
  CONSTRAINT `FK_glagolev_Postavki_glagolev_Delivery` FOREIGN KEY (`Delivery_ID`) REFERENCES `glagolev_Delivery` (`Delivery_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_glagolev_Postavki_glagolev_Project` FOREIGN KEY (`Project_ID`) REFERENCES `glagolev_Project` (`Project_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Дамп данных таблицы bh35910_kurs1711.glagolev_Postavki: ~1 rows (приблизительно)
INSERT INTO `glagolev_Postavki` (`Postavki_ID`, `Delivery_ID`, `Project_ID`, `kolvo`, `datez`, `datep`) VALUES
	(1, 3, 1, 180, '2024-09-20', '2024-12-31');

-- Дамп структуры для таблица bh35910_kurs1711.glagolev_Project
CREATE TABLE IF NOT EXISTS `glagolev_Project` (
  `Project_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Дамп данных таблицы bh35910_kurs1711.glagolev_Project: ~2 rows (приблизительно)
INSERT INTO `glagolev_Project` (`Project_ID`, `Name`) VALUES
	(1, 'Atom Collaider'),
	(2, 'School Bus');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
