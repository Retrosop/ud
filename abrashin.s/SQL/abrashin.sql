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

-- Дамп данных таблицы bh35910_kurs1711.abrashin_City: ~2 rows (приблизительно)
INSERT IGNORE INTO `abrashin_City` (`City_ID`, `name`) VALUES
	(1, 'Birobidjan'),
	(2, 'Khabarovsk');

-- Дамп данных таблицы bh35910_kurs1711.abrashin_Company: ~2 rows (приблизительно)
INSERT IGNORE INTO `abrashin_Company` (`Company_ID`, `name`) VALUES
	(1, 'DNS'),
	(2, 'MVideo');

-- Дамп данных таблицы bh35910_kurs1711.abrashin_Deliviry: ~3 rows (приблизительно)
INSERT IGNORE INTO `abrashin_Deliviry` (`Delivery_ID`, `Part_ID`, `Qality`, `Name`, `Company_ID`) VALUES
	(1, 5, 80, 'AMD Ryzen 9', 1),
	(2, 7, 10, 'RTX 4090', 2),
	(3, 5, 90, 'Intrl core i7', 1);

-- Дамп данных таблицы bh35910_kurs1711.abrashin_Parts: ~6 rows (приблизительно)
INSERT IGNORE INTO `abrashin_Parts` (`Part_ID`, `Part_name`, `Material`, `Weight`) VALUES
	(1, 'Жеский диск', 'Сталь', 235),
	(2, 'Мат_плата', 'Сталь', 305),
	(4, 'Блок питания', 'Сталь', 1800),
	(5, 'Процессрор', NULL, 180),
	(6, 'Куллер охлаждения', 'Пластик', 350),
	(7, 'Видео карта', NULL, 1050);

-- Дамп данных таблицы bh35910_kurs1711.abrashin_Postavki: ~1 rows (приблизительно)
INSERT IGNORE INTO `abrashin_Postavki` (`Postavki_ID`, `Deliviry_ID`, `Project_ID`, `Count`, `Date_post`, `Date`) VALUES
	(1, 1, 1, 90, '2024-12-15', '2024-09-20');

-- Дамп данных таблицы bh35910_kurs1711.abrashin_Project: ~2 rows (приблизительно)
INSERT IGNORE INTO `abrashin_Project` (`Project_ID`, `Name`) VALUES
	(1, 'Atom colider'),
	(2, 'Super computer');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
