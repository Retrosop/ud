-- --------------------------------------------------------
-- Хост:                         91.219.194.4
-- Версия сервера:               10.3.39-MariaDB-cll-lve - MariaDB Server
-- Операционная система:         Linux
-- HeidiSQL Версия:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица bh35910_udlab1.kochetkov_hirurg
CREATE TABLE IF NOT EXISTS `kochetkov_hirurg` (
  `Номер_патента_хирурга` int(11) NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`Номер_патента_хирурга`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы bh35910_udlab1.kochetkov_hirurg: ~5 rows (приблизительно)
INSERT IGNORE INTO `kochetkov_hirurg` (`Номер_патента_хирурга`, `ФИО`) VALUES
	(1, 'Демин Фёдор Платонович'),
	(2, 'Соколов Михаил Матвеевич'),
	(3, 'Сергеев Матвей Сергеевич'),
	(4, 'Кудрявцев Артемий Борисович'),
	(5, 'Галкин Леон Максимович');

-- Дамп структуры для таблица bh35910_udlab1.kochetkov_operation
CREATE TABLE IF NOT EXISTS `kochetkov_operation` (
  `Номер_операции` int(11) NOT NULL AUTO_INCREMENT,
  `Дата_операции` date DEFAULT NULL,
  `Номер_пациента` int(11) DEFAULT NULL,
  `Номер_патента_хирурга` int(11) DEFAULT NULL,
  `Название_операции` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Указание_по_послеоперационному_лечению` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`Номер_операции`),
  KEY `FK_kochetkov_operation_kochetkov_patient` (`Номер_пациента`),
  KEY `FK_kochetkov_operation_kochetkov_hirurg` (`Номер_патента_хирурга`),
  CONSTRAINT `FK_kochetkov_operation_kochetkov_hirurg` FOREIGN KEY (`Номер_патента_хирурга`) REFERENCES `kochetkov_hirurg` (`Номер_патента_хирурга`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_kochetkov_operation_kochetkov_patient` FOREIGN KEY (`Номер_пациента`) REFERENCES `kochetkov_patient` (`код_пациента`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы bh35910_udlab1.kochetkov_operation: ~5 rows (приблизительно)
INSERT IGNORE INTO `kochetkov_operation` (`Номер_операции`, `Дата_операции`, `Номер_пациента`, `Номер_патента_хирурга`, `Название_операции`, `Указание_по_послеоперационному_лечению`) VALUES
	(1, '2024-12-14', 1, 1, 'Ампутация', NULL),
	(2, '2024-12-12', 5, 4, 'Резекция', NULL),
	(3, '2024-11-29', 3, 3, 'Экстирпация', NULL),
	(4, '2024-12-01', 4, 5, 'Трансплантация', NULL),
	(5, '2023-12-14', 2, 2, 'Протезирование', NULL);

-- Дамп структуры для таблица bh35910_udlab1.kochetkov_operation_procedure
CREATE TABLE IF NOT EXISTS `kochetkov_operation_procedure` (
  `код_оп` int(11) NOT NULL AUTO_INCREMENT,
  `Номер_операции` int(11) NOT NULL,
  `Наименование_процедуры` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`код_оп`),
  KEY `FK_kochetkov_operation_procedure_kochetkov_procedure` (`Наименование_процедуры`),
  KEY `FK_kochetkov_operation_procedure_kochetkov_operation` (`Номер_операции`),
  CONSTRAINT `FK_kochetkov_operation_procedure_kochetkov_operation` FOREIGN KEY (`Номер_операции`) REFERENCES `kochetkov_operation` (`Номер_операции`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_kochetkov_operation_procedure_kochetkov_procedure` FOREIGN KEY (`Наименование_процедуры`) REFERENCES `kochetkov_procedure` (`Наименование_процедуры`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы bh35910_udlab1.kochetkov_operation_procedure: ~3 rows (приблизительно)
INSERT IGNORE INTO `kochetkov_operation_procedure` (`код_оп`, `Номер_операции`, `Наименование_процедуры`) VALUES
	(1, 1, 'Биопсия мозга'),
	(2, 4, 'Ректороманоскопия'),
	(3, 5, 'Бариевая клизма');

-- Дамп структуры для таблица bh35910_udlab1.kochetkov_patient
CREATE TABLE IF NOT EXISTS `kochetkov_patient` (
  `код_пациента` int(11) NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Адрес` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Дата_рождения` date DEFAULT NULL,
  PRIMARY KEY (`код_пациента`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы bh35910_udlab1.kochetkov_patient: ~5 rows (приблизительно)
INSERT IGNORE INTO `kochetkov_patient` (`код_пациента`, `ФИО`, `Адрес`, `Дата_рождения`) VALUES
	(1, 'Иванов Иван Иваныч', 'пушкина 7', '2014-12-14'),
	(2, 'Смирнов Игорь Иваныч', 'мировая 20', '2014-12-14'),
	(3, 'Петров Александр Владимирович', 'казанская 1', '2004-11-24'),
	(4, 'Сидоров Павел Сергеевич', 'советская 65', '2003-11-01'),
	(5, 'Молчанов Сергей Сергеевич', 'Пионерская 54', '1999-09-09');

-- Дамп структуры для таблица bh35910_udlab1.kochetkov_preparat
CREATE TABLE IF NOT EXISTS `kochetkov_preparat` (
  `наименование` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `побочные_эффекты` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`наименование`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы bh35910_udlab1.kochetkov_preparat: ~5 rows (приблизительно)
INSERT IGNORE INTO `kochetkov_preparat` (`наименование`, `побочные_эффекты`) VALUES
	('Аспирин', NULL),
	('Ношпа', NULL),
	('Нурафен', NULL),
	('Парацетомол', NULL),
	('Спазмолгин', NULL);

-- Дамп структуры для таблица bh35910_udlab1.kochetkov_preparat_operation
CREATE TABLE IF NOT EXISTS `kochetkov_preparat_operation` (
  `код_по` int(11) NOT NULL AUTO_INCREMENT,
  `наименование` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `номер_операции` int(11) DEFAULT NULL,
  PRIMARY KEY (`код_по`),
  KEY `FK__kochetkov_priparat` (`наименование`),
  KEY `FK_kochetkov_preparat_operation_kochetkov_operation` (`номер_операции`),
  CONSTRAINT `FK__kochetkov_priparat` FOREIGN KEY (`наименование`) REFERENCES `kochetkov_preparat` (`наименование`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_kochetkov_preparat_operation_kochetkov_operation` FOREIGN KEY (`номер_операции`) REFERENCES `kochetkov_operation` (`Номер_операции`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы bh35910_udlab1.kochetkov_preparat_operation: ~3 rows (приблизительно)
INSERT IGNORE INTO `kochetkov_preparat_operation` (`код_по`, `наименование`, `номер_операции`) VALUES
	(1, 'Нурафен', 1),
	(2, 'Аспирин', 2),
	(3, 'Спазмолгин', 5);

-- Дамп структуры для таблица bh35910_udlab1.kochetkov_procedure
CREATE TABLE IF NOT EXISTS `kochetkov_procedure` (
  `Наименование_процедуры` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Назначенное_оборудование` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`Наименование_процедуры`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Дамп данных таблицы bh35910_udlab1.kochetkov_procedure: ~5 rows (приблизительно)
INSERT IGNORE INTO `kochetkov_procedure` (`Наименование_процедуры`, `Назначенное_оборудование`) VALUES
	('Бариевая клизма', NULL),
	('Биопсия мозга', NULL),
	('Гастроскопия', NULL),
	('Зондирование сердца', NULL),
	('Ректороманоскопия', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
