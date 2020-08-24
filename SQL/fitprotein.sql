-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           10.4.13-MariaDB-log - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour fitprotein2
CREATE DATABASE IF NOT EXISTS `fitprotein2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fitprotein2`;

-- Listage de la structure de la table fitprotein2. cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA388B77E3C61F9` (`owner_id`),
  KEY `IDX_BA388B74584665A` (`product_id`),
  CONSTRAINT `FK_BA388B74584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_BA388B77E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.cart : ~0 rows (environ)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.category : ~3 rows (environ)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Nutrition sportive'),
	(4, 'Vêtements & Accessoires');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. contact
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sended_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.contact : ~1 rows (environ)
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`id`, `last_name`, `first_name`, `email`, `phone`, `subject`, `message`, `sended_at`) VALUES
	(3, 'kabangu', 'Tresor', 'tata@gmail.com', '0767120103', 'Gainer', 'kslkvlqjqlvmvk', '2020-08-22 16:27:09');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table fitprotein2.doctrine_migration_versions : ~14 rows (environ)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20200723153720', '2020-07-24 08:19:56', 155),
	('DoctrineMigrations\\Version20200723155051', '2020-07-24 08:19:57', 120),
	('DoctrineMigrations\\Version20200723160801', '2020-07-24 08:19:57', 461),
	('DoctrineMigrations\\Version20200723161142', '2020-07-24 08:19:57', 51),
	('DoctrineMigrations\\Version20200723161447', '2020-07-24 08:19:57', 9),
	('DoctrineMigrations\\Version20200731140005', '2020-07-31 14:01:02', 199),
	('DoctrineMigrations\\Version20200803131132', '2020-08-04 14:43:27', 104),
	('DoctrineMigrations\\Version20200805132400', '2020-08-05 13:27:36', 127),
	('DoctrineMigrations\\Version20200817100424', '2020-08-17 10:04:34', 245),
	('DoctrineMigrations\\Version20200817200123', '2020-08-17 20:01:35', 138),
	('DoctrineMigrations\\Version20200819144251', '2020-08-19 14:43:12', 184),
	('DoctrineMigrations\\Version20200819144831', '2020-08-19 14:48:41', 134),
	('DoctrineMigrations\\Version20200820072353', '2020-08-20 07:24:00', 246),
	('DoctrineMigrations\\Version20200820072803', '2020-08-20 07:28:11', 72),
	('DoctrineMigrations\\Version20200820075028', '2020-08-20 07:51:22', 131),
	('DoctrineMigrations\\Version20200821150855', '2020-08-21 15:09:12', 209);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. opinion
CREATE TABLE IF NOT EXISTS `opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AB02B027F675F31B` (`author_id`),
  KEY `IDX_AB02B0274584665A` (`product_id`),
  CONSTRAINT `FK_AB02B0274584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_AB02B027F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.opinion : ~0 rows (environ)
/*!40000 ALTER TABLE `opinion` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinion` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. order
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `order_number` bigint(20) NOT NULL,
  `ordered_at` datetime NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F52993987E3C61F9` (`owner_id`),
  CONSTRAINT `FK_F52993987E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.order : ~0 rows (environ)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. order_product
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2530ADE64584665A` (`product_id`),
  KEY `IDX_2530ADE68D9F6D38` (`order_id`),
  CONSTRAINT `FK_2530ADE64584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_2530ADE68D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.order_product : ~0 rows (environ)
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_category_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `discount` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04ADF7BFE87C` (`sub_category_id`),
  CONSTRAINT `FK_D34A04ADF7BFE87C` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.product : ~2 rows (environ)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `sub_category_id`, `price`, `discount`, `title`, `quantity`, `description`, `created_at`, `updated_at`) VALUES
	(4, 2, 35, 10, 'BCAA GAINER', 4, 'hkshfhfkhjsfshflkf', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	(5, 1, 83, 10, 'protein', 7, 'gcq:vh:le!vrpk', '2020-08-23 00:00:00', '2020-08-23 00:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. product_image
CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64617F034584665A` (`product_id`),
  CONSTRAINT `FK_64617F034584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.product_image : ~0 rows (environ)
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`id`, `product_id`, `created_at`, `updated_at`, `filename`) VALUES
	(3, 5, NULL, NULL, '5f42aa5e6497d518151619.JPG'),
	(6, 4, NULL, NULL, '5f42b6535dcd5104511025.jpg'),
	(7, 4, NULL, NULL, '5f438a453a222931235707.jpg');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. promo_code
CREATE TABLE IF NOT EXISTS `promo_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.promo_code : ~1 rows (environ)
/*!40000 ALTER TABLE `promo_code` DISABLE KEYS */;
INSERT INTO `promo_code` (`id`, `code`, `discount`, `created_at`, `updated_at`, `started_at`, `ended_at`) VALUES
	(1, 'azerty', 45, '2015-01-01 00:00:00', '2015-01-01 00:00:00', '2015-01-01 00:00:00', '2015-01-01 00:00:00');
/*!40000 ALTER TABLE `promo_code` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. sub_category
CREATE TABLE IF NOT EXISTS `sub_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BCE3F79812469DE2` (`category_id`),
  CONSTRAINT `FK_BCE3F79812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.sub_category : ~3 rows (environ)
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` (`id`, `category_id`, `name`) VALUES
	(1, 1, 'Protéines'),
	(2, 1, 'BCAA'),
	(3, 1, 'Bruleurs de graisse'),
	(4, 4, 'Vêtements hommes'),
	(5, 4, 'Vêtements femmes'),
	(6, 4, 'Accessoires');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;

-- Listage de la structure de la table fitprotein2. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civility` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table fitprotein2.user : ~0 rows (environ)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `civility`, `first_name`, `last_name`, `address`, `city`, `zip_code`, `created_at`, `updated_at`) VALUES
	(1, 'toto@gmail.com', '["ROLE_ADMIN"]', '$argon2id$v=19$m=65536,t=4,p=1$dVpMaUY4TlpvdC9ndTZaUQ$nyx5VmLhdgV1Q8yXQH/brakLMl6/L4B7kg572Ysma7Y', 'Monsieur', 'Prenom', 'Nom', '120 rue toto', 'Montpellier', 34000, '2020-07-24 08:24:28', '2020-07-24 08:24:28'),
	(2, 'tata@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$aFQzTVFwRzlMVGFNNTZuNg$yDN/7ozhIOEnbPqC7njWlioCOgyhQwuDR8vjZRkIV0s', NULL, 'tata', 'tata', NULL, NULL, NULL, '2020-08-23 14:09:48', NULL),
	(3, 'test@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$ZklRSjVKQTJaSzhiZDJBLg$cG/1oDdFOB8IgEPffqp4CbZG3WbTazCMhhj15bTZ23M', NULL, 'test', 'test', NULL, NULL, NULL, '2020-08-24 10:13:22', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
