-- --------------------------------------------------------
-- Host:                         91.219.194.4
-- Server version:               10.3.39-MariaDB-cll-lve - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bh35910_kurs1711
CREATE DATABASE IF NOT EXISTS `bh35910_kurs1711` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `bh35910_kurs1711`;

-- Dumping structure for table bh35910_kurs1711.kuzmin_parts
CREATE TABLE IF NOT EXISTS `kuzmin_parts` (
  `Parts_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PArt_name` varchar(80) DEFAULT NULL,
  `Material` varchar(80) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL CHECK (`Weight` > 0),
  PRIMARY KEY (`Parts_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table bh35910_kurs1711.kuzmin_parts: ~2 rows (approximately)
INSERT INTO `kuzmin_parts` (`Parts_ID`, `PArt_name`, `Material`, `Weight`) VALUES
	(1, 'MaterPlata', 'Steel', 750),
	(2, 'JeskiDisk', 'Steel', 250);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
