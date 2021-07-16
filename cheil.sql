-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.19 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para cheil
CREATE DATABASE IF NOT EXISTS `cheil` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cheil`;

-- Volcando estructura para tabla cheil.hotels
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cheil.hotels: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `name`, `category`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Ayenda Vida', 3, 120000, '2021-07-15 16:31:30', NULL, NULL),
	(2, 'Ayenda Salmo', 4, 146000, '2021-07-15 16:31:30', NULL, NULL),
	(3, 'Ayenda Real', 5, 190000, '2021-07-15 16:31:30', NULL, NULL),
	(4, 'Hotel Marrion', 2, 60000, '2021-07-16 02:09:05', '2021-07-16 06:36:10', '2021-07-16 06:36:10'),
	(5, 'Hotel Palma', 1, 45000, '2021-07-16 06:42:07', '2021-07-16 06:42:07', NULL),
	(6, 'villa real', 3, 65000, NULL, NULL, '2021-07-16 09:39:23'),
	(7, 'villa real', 3, 65000, NULL, NULL, '2021-07-16 09:39:24'),
	(8, 'villa real', 3, 65000, NULL, NULL, '2021-07-16 09:39:24'),
	(9, 'villa real', 3, 65000, NULL, NULL, '2021-07-16 09:39:26'),
	(10, 'villa real', 3, 65000, NULL, NULL, '2021-07-16 09:39:29'),
	(11, 'Villa real', 3, 65000, NULL, NULL, '2021-07-16 13:44:18'),
	(12, 'Villa mayor', 2, 45000, NULL, NULL, '2021-07-16 13:44:19');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Volcando estructura para tabla cheil.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cheil.migrations: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(6, '2021_07_15_205622_create_hotels_table', 1),
	(7, '2021_07_15_210422_create_pictures_table', 1),
	(8, '2021_07_15_210724_create_qualifications_table', 1),
	(9, '2021_07_15_210940_add_hotel_id_column_to_pictures_table', 1),
	(10, '2021_07_15_211054_add_hotel_id_column_to_qualifications_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla cheil.pictures
CREATE TABLE IF NOT EXISTS `pictures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint(20) unsigned DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pictures_hotel_id_foreign` (`hotel_id`),
  CONSTRAINT `pictures_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cheil.pictures: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` (`id`, `hotel_id`, `picture`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'hotels/ayendavida/ayendavida1.jpg', '2021-07-15 16:35:48', NULL, NULL),
	(2, 1, 'hotels/ayendavida/ayendavida2.jpg', '2021-07-15 16:35:48', NULL, NULL),
	(3, 1, 'hotels/ayendavida/ayendavida3.jpg', '2021-07-15 16:35:48', NULL, NULL),
	(4, 2, 'hotels/ayendasalmo/ayendasalmo1.jpg', '2021-07-15 16:43:42', NULL, NULL),
	(5, 2, 'hotels/ayendasalmo/ayendasalmo2.jpg', '2021-07-15 16:43:43', NULL, NULL),
	(6, 2, 'hotels/ayendasalmo/ayendasalmo3.jpg', '2021-07-15 16:43:44', NULL, NULL),
	(7, 3, 'hotels/ayendareal/ayendareal1.jpg', '2021-07-15 16:43:39', NULL, NULL),
	(8, 3, 'hotels/ayendareal/ayendareal2.jpg', '2021-07-15 16:43:40', NULL, NULL),
	(9, 3, 'hotels/ayendareal/ayendareal3.jpg', '2021-07-15 16:43:41', NULL, NULL),
	(10, 11, 'hotels/Villareal553/Fk6gANl6xxkata7tAiH4zX8ijdu4JO7YBWDauW1q.jpg', '2021-07-16 15:19:29', '2021-07-16 15:19:29', NULL),
	(11, 12, 'hotels/Villamayor221/58Pw0evm2kzclQOHe7dKtWalHOk3CX45ulBgn3yO.jpg', '2021-07-16 15:31:51', '2021-07-16 15:31:51', NULL),
	(12, 12, 'hotels/Villamayor221/1RkwNpqREEESmYTz4Yj9bH9wHGOw6BrJovICM78c.jpg', '2021-07-16 15:31:51', '2021-07-16 15:31:51', NULL),
	(13, 12, 'hotels/Villamayor221/iayx50eYbPDzQIYogmgbEFRe51JO7drYuz7VME4L.jpg', '2021-07-16 15:31:51', '2021-07-16 15:31:51', NULL);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;

-- Volcando estructura para tabla cheil.qualifications
CREATE TABLE IF NOT EXISTS `qualifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint(20) unsigned DEFAULT NULL,
  `score` tinyint(4) NOT NULL,
  `commentary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qualifications_hotel_id_foreign` (`hotel_id`),
  CONSTRAINT `qualifications_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cheil.qualifications: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `qualifications` DISABLE KEYS */;
INSERT INTO `qualifications` (`id`, `hotel_id`, `score`, `commentary`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 3, 'Hotel limpio pero con poco espacio', NULL, NULL, NULL),
	(2, 1, 4, 'Hotel muy aseado perfecto para dos personas', NULL, NULL, NULL),
	(3, 1, 3, 'Es comodo pero tiene un mal aroma', NULL, NULL, NULL),
	(4, 2, 5, 'Espectacular hotel para pasarlo en familia', NULL, NULL, NULL),
	(5, 2, 2, 'Comodo pero el servicio es malisimo', NULL, NULL, NULL),
	(6, 2, 4, 'Perfecto para pasar la noche en pareja', NULL, NULL, NULL),
	(7, 3, 5, 'El hotel perfecto para venir a descansar con la fmailia', NULL, NULL, NULL),
	(8, 3, 5, 'Increible servicio', NULL, NULL, NULL),
	(9, 3, 5, 'Lo mejor en comodidad y precios', NULL, NULL, NULL),
	(10, 11, 3, 'bueno', '2021-07-16 16:43:25', '2021-07-16 16:43:25', NULL),
	(11, 12, 1, 'no son claros', '2021-07-16 16:52:23', '2021-07-16 16:52:23', NULL);
/*!40000 ALTER TABLE `qualifications` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
