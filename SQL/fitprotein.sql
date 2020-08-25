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

-- Listage des données de la table fitprotein2.category : ~2 rows (environ)
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

-- Listage des données de la table fitprotein2.doctrine_migration_versions : ~16 rows (environ)
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

-- Listage des données de la table fitprotein2.product : ~46 rows (environ)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `sub_category_id`, `price`, `discount`, `title`, `quantity`, `description`, `created_at`, `updated_at`) VALUES
	(6, 1, 55, 20, 'Whey Advanced', 15, 'Cette pure Whey Protéine ultrafiltrée est le top des protéines pour prendre du muscle sec le plus rapidement possible. La protéine de lactosérum (Whey) offre un meilleur aminogramme et une plus forte concentration en BCAA que toutes les autres sources de protéines.\r\nLe concentrat de lactosérum naturellement riche en BCAA et en glutamine est complété par une importante charge en acides aminés libres issus de l’isolat et de l\'hydrolysat.\r\n 22g de protéines\r\n Seulement 115 Kcal\r\n 1,5g de glucides', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(7, 1, 60, 0, '100% WHEY GOLD (450GR)', 15, 'Dans son format pouch 450g, vous pourrez la tester, et l\'approuver comme les autres avant vous !\r\nAvec plus de 24g de protéines par dose, la 100% Whey Gold d\'Optimum est une protéine parfaite pour contruire de la masse maigre ! 100% Whey Gold est une mélange de protéine concentrate et isolat de lactosérum.\r\nLe Concentrate de whey est une des protéines les plus connues car très complète et très faible en lactose. Elle contient d\'autant plus les 8 (ou 9) acides aminés essentiels. \r\nL\'isolat de lactosérum possède une qualité nutritionnelle très élevée, une forte concentration en BCAA et sa teneur en lactose est quasi nulle.\r\nDe plus, elle ne comporte que 1,6g de glucides par portion ce qui est très peu et permet de contrôler au mieux l\'apport en sucres. Les 1g de lipides lui permettent également d\'être parfaitement adaptée en période de sèche.\r\nCette protéine est une protéine rapide, c\'est à dire qu\'elle s\'assimile rapidement par l\'organisme. Elle est donc idéale au réveil afin de casser le catabolisme des muscles ou juste après l\'entrainement afin de permettre aux muscles de se réparer.\r\nLa protéine 100% Whey Gold a été améliorée avec un complexe enzymatique (lactase et enzymes digestives) pour favoriser l\'absorption des protéines et acides aminés et améliorer le confort digestif, même des personnes intolérantes au lactose !', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(8, 1, 65, 10, '100% WHEY PROFESSIONAL (920GR)', 20, '100% Whey Protein Professional de Scitec Nutrition est une protéine en poudre de haute qualité conçue à base d’un mélange de deux whey ultrafiltrées : le concentré de whey qui est la protéine en poudre la plus vendue et l’isolat de whey, une protéine dont la technique de filtrage permet de retenir plus de 90% des protéines d’origine, possédant également une teneur en acide glutamique et BCAA très importante.\r\nCette protéine de whey participe efficacement au maintien et au développement de la masse musculaire sèche ainsi qu’à la solidité du squelette.\r\nLa 100% Whey Protein contient tous les acides aminés essentiels dont les 9 acides aminés que l’organisme ne parvient pas à synthétiser naturellement (Histidine, Isoleucine, Leucine, Lysine, Méthionine, Phénylalanine, Thréonine, Tryptophane, Valine).\r\nAvec sa faible teneur en lactose la protéine 100% Whey Professional convient aux personnes intolérantes au lactose. Cette protéine contient également peu de lipides et glucides, ce qui lui permet d’être une protéine idéale en période prise de muscle sec ou période de sèche, et sa texture fluide permet d’être digérée facilement.\r\nSon format 920g permet à ceux qui souhaitent tester les différents parfums de la gamme d’en changer régulièrement !', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(9, 1, 60, 10, '100% WHEY PROFESSIONAL (2,350KG)', 20, '100% Whey Protein Professional de Scitec est un mélange de protéines de grande qualité à base d’isolat de lactosérum et de concentré de whey. Les protéines alimentaires apportent de l’azote et des acides aminés indispensables, dont le corps a besoin afin d’assurer la croissance et la préservation des tissus.\r\nPar conséquent, les protéines présentes dans 100% Whey Protein Professional contribuent au développement et à la maintenance de la masse musculaire ainsi qu’au bon état du squelette.*\r\nObtenue à partir du lait, la 100% whey professional est considérée comme une protéine complète, car elle fournit à l’organisme tous les acides aminés indispensables, dont les 9 acides aminés et BCAA que le corps est incapable de synthétiser et qui doivent être apportés par l’alimentation (Histidine, Isoleucine, Leucine, Lysine, Méthionine, Phénylalanine, Thréonine, Tryptophane, Valine)\r\n100% Whey Protein contient également d’autres ingrédients : une « matrice d’acides aminés », qui apportent d’autres acides aminés, à savoir de la L-leucine, de la L-Glutamine et de la taurine. Nous avons également inclus dans notre formule deux enzymes digestives, à savoir la papaïne et la bromélaïne.\r\nSon goût délicieux et sa texture parfaitement fluide ainsi que sa teneur très faible en lactose font de cette 100% Whey Protein Professional l’une des toutes meilleures protéines en poudre disponibles actuellement.\r\n100% Whey Protein Professional est utilisée par tous les plus grands athlètes pour développer leur masse musculaire tout en restant sec.\r\nSon format 2,3kg permet aux consommateurs réguliers de compléter leur apport en protéines au quotidien !', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(10, 1, 65, 10, 'MUTANT WHEY (900G)', 20, 'Mutant Whey (900g) est une nouvelle formule améliorée pour un meilleur mélange. \r\nLa whey protéine convient à bien des objectifs (masse musculaire, sèche…) et cumule beaucoup de bénéfices. En plus d’être efficace, car elle est très assimilable, elle offre un grand choix de goûts plutôt réussis.\r\nElle contient 4 types de whey protéines : whey concentrée, phospholipide, isolate et hydrolysée. Cette combinaison de protéines permet de bénéficier des avantages des unes et des autres mais aussi de profiter des différentes vitesses d\'assimilation. \r\nChaque dose apporte 22g de protéines qui contribue à favoriser la croissance des cellules musculaires et la création de nouvelles fibres musculaires.\r\nCette whey de qualité supérieure est proposée sous plusieurs saveurs selon les goûts : Cookies & cream, Triple chocolat, Strawberry & Cream, Vanilla Ice Cream', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(11, 1, 50, 10, 'MARS PROTEIN POWDER (875G)', 30, 'Tu suis un programme sportif pour atteindre un objectif et tu recherches une whey protéine avec une excellente saveur ? On a le meilleur produit pour toi : Mars Protein Powder (875g).\r\nC\'est une whey protéine qui possède une excellente concentration en protéines avec environ 21g de protéines par dose. Cette protéine se dissout facilement et s\'assimile rapidement dans l\'organisme. Elle contribue à construire et à maintenir un corps fort. C\'est aussi un renfort en acides aminés. \r\nElle s\'adresse à tous les gourmands qui souhaitent éveiller leurs papilles tout en faisant attention pendant une période de sèche ou de prise de muscle sec car elle ne contient que 140 calories par dose. \r\nSa délicieuse saveur de chocolat et de caramel qui rappelle fidèlement la célèbre barre Mars te fera forcément craquer ! \r\nEt si tu remplaçais ta barre Mars classique par un shaker de whey protéine Mars ?', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(12, 1, 50, 10, 'SNICKERS PROTEIN POWDER (875G)', 15, 'Tu es gourmand et tu souhaites prendre du muscle sec ?\r\nIl est temps de se faire plaisir avec une protéine au goût extra de la célèbre barre de chocolat Snickers !\r\nSnickers Protein Powder (875g) est une poudre de protéine de lactosérum à haute teneur en protéines avec 21g par dose.  C\'est aussi une saveur tentante de chocolat, caramel et cacahuète Snickers pour se faire plaisir même en période de sèche ou de prise de muscle sec car elle n\'apporte que 142 calories par dose. \r\nCe produit s\'adresse à ceux qui ont un programme d\'entraînement modéré à intense et qui souhaitent une protéine pour favoriser leur construction et récupération musculaire.\r\nCette protéine se dissout facilement et s\'assimile rapidement dans l\'organisme. Elle contribue à construire et  à maintenir un corps fort. C\'est aussi un bon renfort en acides aminés. \r\nEt si tu remplaçais ta barre Snickers par un shaker de whey protéine Snickers ?', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(13, 1, 55, 10, 'TWIX PROTEIN POWDER (875G)', 20, 'Tu es gourmand et tu souhaites prendre du muscle sec ? Tu cherches une protéine avec un goût extra ? Il te faut ce produit !\r\nTwix Protein Powder (875g) possède une excellente concentration en protéines avec environ 21g de protéines par dose.\r\nSa saveur tentante des barres de chocolat Twix éveillera tes papilles pour seulement 140 calories par dose.\r\nCette protéine contient également peu de lipides et glucides, ce qui lui permet d’être idéale en période prise de muscle sec ou période de sèche.\r\nNotre organisme a un besoin constant de protéines pour se maintenir et renouveler ses cellules. Ce produit s\'adresse à ceux qui ont un programme d\'entraînement modéré à intense et qui souhaitent une protéine pour favoriser leur construction et récupération musculaire.', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(14, 1, 40, 5, 'NITRO-TECH', 60, 'NITRO-TECH® est une marque leader sur le marché des protéines depuis plus de 20 ans. La formule 100% Whey Gold basée sur des sources de protéines supérieures associe la meilleure formule, le goût et des qualités nutritionnelles exceptionnelles.\r\nD\'après les études, les peptides de lactosérum permettent de favoriser la récupération rapide après l\'exercice et même augmenter la réponse à l’insuline pour une meilleure assimilation des nutriments. Les peptides de lactosérum présents dans Nitro-Tech 100% Whey Gold sont reconnus comme ayant la meilleure valeur biologique ce qui garantit à cette protéine une efficacité, une assimilation et une digestibilité optimale.\r\nNitro-Tech 100% Whey Gold est donc une protéine ultra-pure, rapidement absorbée et digérée et qui permet une récupération plus rapide. Elle participe également à la croissance de la masse musculaire maigre.', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(15, 1, 60, 15, 'ELITE WHEY (2100G)', 25, 'Elite 100% Whey de la marque américaine Dymatize est une combinaison de protéines de haute qualité pour les athlètes ambitieux à chaque niveau d’entraînement, à utiliser n\'importe quand. De très grande valeur biologique, elle permet de soutenir la croissance des muscles et d\'augmenter la consommation de protéines avant ou après un entraînement.\r\nLa formule Elite 100% Whey de Dymatize est assimilable rapidement grâce à sa combinaison de whey protéines, d\'isolate de whey et de peptides whey. Elle contient également des Acides Aminés Essentiels (entre 2,7 et 2,8g) et Non Essentiels (entre 6,0g et 6,2g) pour la croissance et le maintien des muscles et aussi des enzymes digestives. \r\nLe produit est :\r\n- faible en sucre avec seulement 1,7g\r\n- sans gluten\r\n- certifié "Informed-Choice"\r\nC\'est le produit idéal pour la construction musculaire et pour la prise de masse sèche !', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(16, 2, 25, 5, 'BCAA ZERO VARIETY PACK', 15, 'BCAA Zero Variety Pack est une boite de plusieurs sachets de BCAA Zero de la marque Biotech USA.\r\nCe sont des poudres d\'acides aminés aromatisées disponibles en plusieurs saveurs afin de plaire à tous les goûts. Ces poudres contiennent de la leucine, de l\'isoleucine et de la valine au ratio 2:1:1 qui correspond à une proportion naturelle et spécifique dans la structure des muscles.\r\nOn y retrouve près de 7g d’acides aminés purs dont 6g de BCAA avec de la vitamine B6 qui contribue au métabolisme normal des glucides et des protéines. \r\nBCAA Zero est un produit d’acides aminés en poudre qui peut être consommé dans le cadre de n’importe quel type d’entraînement. Il est sans gluten, sans lactose, sans aspartame, sans agent de conservateur et sans sucre.\r\nLe pack contient 20 sachets de BCAA et 10 parfums pour varier les saveurs selon les envies !', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(17, 2, 40, 5, 'PLATINUM BCAA 8:1:1 (200 CAPS)', 30, 'Le Platinium 100% Bcaa 8:1:1 de la marque Muscletech apporte les trois acides aminés essentiels (leucine, isoleucine, valine) et contient une proportion de 8:1:1 de leucine qui vous permettra de stimuler et avoir une meilleure croissance musculaire.\r\nLes BCAA, ou acides aminés ramifiés, sont très importants pour les sportifs. Ils doivent être apportés par l\'alimentation ou la supplémentation car l\'organisme ne peut pas les fabriquer. Les BCAA sont des éléments indispensables à la croissance et la récupération musculaires. Ils réduisent la dégradation musculaire et alimentent les muscles pour une croissance musculaire optimale.\r\nAvec son ratio 8.1.1, Platinum BCAA 8:1:1 (200 caps) de Muscletech est une formule en capsule qui offre 8 fois plus de leucine que l\'isoleucine ou la valine.\r\nC\'est aussi un puissant constructeur de masse musculaire qui prévient la perte de muscle, étant le plus efficace pour optimiser l\'anabolisme musculaire post-entraînement. Il aide à maigrir sans perdre de muscle pendant les régimes et contribue à la conservation la plus efficace de la masse musculaire maigre. \r\nIl conviendra parfaitement pour tous les sportifs ou sportives voulant améliorer leurs performances et obtenir plus d\'endurance lors des entraînements mais aussi une meilleure récupération par la suite.', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(18, 2, 30, 5, 'MUTANT BCAA 9.7 (348G)', 20, 'Mutant BCAA 9.7 (348g) est une formule de BCAA (leucine, isoleucine, valine) de la marque Mutant. \r\nLeucine, isoleucine et valine sont des acides aminés essentiels. Ils doivent donc être apportés à partir de l’alimentation. Les BCAA sont impliqués dans la synthèse des protéines, la réparation des tissus, les signaux des processus biochimiques essentiels pour la synthèse des protéines et le contrôle du taux de sucre dans le sang. Ils ne peuvent pas se substituer totalement aux protéines mais forment la base pour fournir de l’énergie durant l’exercice et aider à la récupération\r\nCe complément alimentaire est aussi un mélange de 8 électrolytes et d\'acides aminés comme la taurine, la glutamine, l\'arginine et la tyrosine. \r\nLes électrolytes sont des sels minéraux qui circulent dans le sang et qui sont présents dans les cellules: sodium, potassium, calcium et magnésium. Ces sels minéraux sont très importants durant l’effort car certains sont pas mal perdus dans la sueur, un apport est donc fortement conseillé notamment en cas de forte chaleur et/ou d’effort longue durée.\r\nLa taurine est particulièrement intéressante, en cas d’activité physique. En effet, elle réduit le catabolisme et accroît la force de contraction du muscle. La glutamine est l’alliée du surentraînement. Connue pour prévenir le catabolisme, elle est particulièrement utile lors d’efforts physiques intenses et de longue durée, car elle va favoriser la récupération et la réparation musculaires. L’arginine intervient dans divers processus métaboliques comme la circulation et notamment la vasodilatation des artères. Elle agit en tant que précurseur de NO (oxyde nitrique), sur la production d’hormone de croissance et de créatine, la cicatrisation, le soutien de l’immunité, la santé cardio vasculaire. La L.tyrosine accroît les niveaux d’énergie et permet d’obtenir un « coup de fouet » pour un entrainement plus intensif.\r\nCes éléments favorisent une bonne hydratation & récupération musculaire et soutiennent la performance.', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(19, 2, 40, 5, 'BCAA COMPLETE AMINO + EAA (400G)', 20, 'Bcaa Complete Amino + Eaa (400g) de la marque USN est un complexe de BCAA 2:1:1, d\'EAA avec 6500mg et de 1000mg de taurine, conçu pour le développement musculaire. Elle est renforcée par la présence de 2750mg de L-Leucine. \r\nLes EAA sont l\'ensemble des 9 acides aminés essentiels pour l\'organisme qui sont apportés par l\'alimentation ou les suppléments. \r\nLa formule contient également de la vitamine B6 et est adaptée aux vegans. \r\nLa prise de ce supplément permet d\'assurer des niveaux optimaux d\'acides aminés avant et pendant l\'entrainement !\r\nProposé en deux saveurs : Apple et Blue Raspberry', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(20, 2, 35, 5, 'BCAA XPRESS (700G)', 20, 'BCAA Xpress de Scitec Nutrition est un complexe de BCAA rapidement assimilable.\r\nLes BCAA sont essentiels pendant et après l’entrainement pour maitriser les niveaux de cortisol et ainsi éviter le catabolisme autrement dit la destruction des protéines musculaires.\r\n\r\nLes BCAA Xpress sont traditionnellement utilisés dans le cadre de la récupération des athlètes. Après un entrainement intense, il faut s\'assurer de la réparation rapide des cellules endommagées, en accélérant leur cicatrisation et donc le renouvellement de nouvelles fibres. En créant de nouvelles fibres musculaires, vous allez alors développer votre muscle et gagner en volume ! En effet, la synthèse de nouveau tissu musculaire augmente le volume des muscles rapidement.\r\nLa formule de BCAA Xpress contient comme son nom l\'indique des BCAA ou acides aminés ramifiés (Leucine, Isoleucine, Valine), acides aminés qui constituent 35% des acides aminés présents dans le muscle.\r\n\r\nOn parle des BCAA commes des acides aminés essentiels, simplement parce que l’organisme ne peut les synthétiser naturellement. Ils doivent donc être apportés par l’alimentation ou par les suppléments.\r\nLes BCAA jouent également d\'autres rôles fondamentaux puisqu\'ils interviennent dans d’autres fonctions organiques comme la création d’anticorps, la synthèse de l’ARN et de l’ADN et le transport d’oxygène dans le corps.', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(21, 2, 55, 5, 'BCAA 2200', 30, 'Les BCAA (leucine, isoleucine et valine) représentent 35% des acides aminés présents dans le tissu musculaire et font partie des acides aminés essentiels que l’organisme ne peut synthétiser. Un apport est donc nécessaire sous forme de complément alimentaire (ou par l’alimentation) pour éviter la dégradation des protéines et favoriser leur synthèse. Les BCAA favorisent une meilleure récupération après un entraînement intensif. \r\nBCAA 2200 de la marque américaine Dymatize est un complexe de trois acides aminés essentiels dans une formule 2 :1 :1, qui permet une augmentation rapide de la masse musculaire dans le cadre d\'un entrainement intensif. \r\nChaque portion fournit 5,1g de BCAA (leucine, isoleucine et valine), ainsi que de la vitamine B2 (riboflavine), vitamine C et la vitamine B6. Ces dernières aident à réduire la fatigue et protègent les cellules musculaires. \r\nCette formule est complète et parfaitement adaptée à la pratique matinale, avant ou après l\'entraînement, pour les prises de masse mais aussi pour les phases de définition musculaire.\r\nBonus : BCAA 2200 est certifié "Informed-Choice"', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(22, 1, 40, 5, 'BCAA Complex', 30, 'BCAA Complex en poudre de Scitec est une matrice associant des BCAA (Leucine, Isoleucine, Valine), de la L-Glutamine et de la L-Alanine.\r\nBCAA Complex contient des BCAA qui vont empêcher la fuite des acides aminés du muscle pour jouer un rôle important dans la préservation du muscle avec leur action anti catabolique.\r\n\r\nLa présence de L-Alanine dans la formule BCAA Complex, qui est une composante essentielle de l’ATP (adénosine triphosphate) responsable de la contraction musculaire permet d\'augmenter l’endurance musculaire pour vous permettre d\'aller plus loin dans l\'effort..\r\n\r\nBCAA Complex contient aussi de L-Glutamine, qui va permettre une meilleure réparation des tissus musculaires (action anabolique) et donc une croissance musculaire plus intense. La Glutamine va également participer au maintien des niveaux de glycogènes qui sont largement sollicités lors d\'efforts comme la musculation, et qui en cas de niveau trop bas, peuvent avoir une influence sur les performances et sur le système immunitaire en général.\r\nIdéal à prendre le matin au réveil pour réduire le catabolisme, ou en post-entraînement pour aider à la récupération musculaire !', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(23, 3, 35, 5, 'REDBURN HARDCORE (100CAPS)', 20, 'Redburn Hardcore est actuellement notre brûleur de graisse le plus efficace. En élevant la thermogénèse et parallèlement à une diminution de l’apport calorique, le thé vert contenu dans le Redburn Hardcore de Superset permet une mobilisation optimale des graisses en vue de diminuer la masse grasse.\r\nRedburn Hardcore est un supplément diététique fortement recommandé par les coachs, dans le cadre d\'un régime alimentaire, pour venir en renfort d’un programme de perte de poids.\r\n Brûleur de graisses naturel\r\n 1000mg d’extrait de thé vert\r\n A base de capsaïcine\r\nLes meilleurs ingrédients du marché pour la sèche\r\nSuperset a sélectionné les meilleurs ingrédients du marché pour mettre au point une formule innovante et puissante sans les inconvénients des stimulants hautement dosés en caféine. Il combine les effets du thé vert et de la capsaïcine pour aider à mincir en complément de mesures diététiques. En effet, le thé vert de haute qualité sélectionné (camelia sinensis) riche en catéchines et EGCG, est reconnu pour augmenter la thermogenèse, contribuer à l’oxydation des graisses, soutenir un métabolisme sain, favoriser l’élimination rénale de l’eau et aider à mincir en compléments de mesures diététiques. De l’autre côté, la capsaïcine extraite du Piment de Cayenne, stimule l’oxydation des sucres et des graisses, améliore la thermogenèse, réduit l’apport calorique.\r\nD’autres ingrédients comme l’extrait de saule blanc et la tyrosine viennent compléter la formule et créent une véritable combinaison qui rend cette formule vraiment efficace. La Niacine contribue elle aussi à un métabolisme énergétique optimal, permettant de réduire la masse grasse parallèlement à un programme alimentaire de sèche.\r\nEnfin Redburn Hardcore délivre une dose précise de Chrome et d’extrait de cannelle de Ceylan qui tous deux régulent le sucre sanguin et aident à maintenir une glycémie normale, en complément de mesures diététiques.', '2020-08-25 14:00:00', '2020-08-25 14:00:00'),
	(24, 3, 35, 5, 'REDBURN LADIES (100CAPS)', 20, 'Redburn Ladies est une formule spécifiquement adaptée aux femmes, développée par les nutritionnistes, préparateurs physiques et coachs de la marque Superset Nutrition.\r\nSuperset conçoit des suppléments performants développés spécialement par des équipes d’experts en associant des molécules fonctionnant en synergie pour créer un environnement physiologique favorable à une transformation physique optimale.\r\nRedburn Ladies comme son équivalent masculin Redburn Hardcore possède une action thermogénique, en accompagnement de mesures diététiques, même si elle contient volontairement peu de caféine (100% issue du thé vert), pour contribuer à oxyder les graisses tout en évitant les inconvénients désagréables des stimulants hautement dosés.\r\n Action 3 en 1\r\n Thermogénique efficace\r\n 9 actifs puissants', '2020-08-20 14:00:00', '2020-08-20 14:00:00'),
	(25, 3, 25, 5, 'GEL REDBURN (200ML)', 20, 'REDBURN GEL est un gel sculptant formulé à partir de 13 principes actifs permettant d\'attaquer la graisse sous-cutanée localement grâce à une application régulière.\r\n\r\nLa formule REDBURN GEL est à base de guarana, particulièrement riche en caféine, tanins, extrait de prêle, saponosides et polyphénols.\r\nAvec une application régulière, le grain de peau va s\'affiner et la définition musculaire va ressortir. L’extrait de laminaria digitata, riche en iode, améliore l’aspect de la peau en régénérant les cellules cutanées.\r\nDe plus, REDBURN GEL contient du nicotinate de methyl qui a une action vasodilatatrice permettant de rétablir une microcirculation optimale sous la peau et d\'éviter efficacement le restockage graisseux et hydrique.\r\nEnfin, riche en principe hydratants, REDBURN GEL nourrit la peau et laisse un léger parfum frais pour permettre une utilisation agréable et efficace à tout moment de la journée.\r\nUn régime alimentaire adapté avec une utilisation régulière du REDBURN GEL permet de diminuer rapidement les graisses localisées et d\'améliorer nettement la qualité de la peau.\r\nTesté dermatologiquement et sans parabènes, le gel Redburn ne cause pas d\'allérgie, l\'effet chauffant étant simplement dû aux différents principes actifs et à l\'activation de la micro-circulation !', '2020-08-23 15:00:00', '2020-08-23 15:00:00'),
	(26, 3, 40, 5, 'LIPORAZOR (90 CAPS)', 30, 'Liporazor est une formule brûle-graisse à base d\'extraits de plantes actifs et efficaces, proposée sous forme de gélules pour aider le corps à lutter contre l\'excès de graisse dans le cadre d\'un mode de vie actif et d\'un régime alimentaire de perte de poids.\r\nCe complément, conçu par Olimp, a fait l\'objet de tests biologiques et chimiques pour démontrer ses effets sur la silhouette.\r\nComposé uniquement d\'ingrédients naturels, Liporazor agit sur la thermogenèse grâce à sa teneur en capsaïcine (extrait du poivre de Cayenne), de l\'extrait d\'orange amère et de l\'extrait de cacao.\r\nL\'autre spécificité de la formule est qu\'elle ne contient pas de caféine, elle n\'a donc pas d\'effet excitant pour les personnes ayant une sensibilité accrue à la caféine.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(27, 3, 30, 5, 'THERMO DRINE LIQUID (500ML)', 30, 'Thermo Drine Liquid de BioTech USA est une formule thermogénique pour vous accompagner dans votre perte de gras et l\'affinement de votre silhouette.\r\nProposé dans un format liquide, sa composition est hautement assimilable et absorbable par l\'organisme pour vous permettre de bénéficier des meilleurs résultats. \r\nThermo Drine Liquid contient de la choline, un composant naturel qui contribue au métabolisme lipidique et au métabolisme de l\'homocystéine normal. Cette dernière participe également au maintien des fonctions hépatiques normales.\r\nLa L-carnitine permet de transporter les acides gras dans les mitochondries des cellules afin qu\'ils soient brûlés et transformés en énergie pour l\'organisme, tandis que l\'extrait de thé vert favorise l\'oxydation des graisses.\r\nEgalement enrichi en différentes vitamines pour compléter les besoins journaliers, la présence de vitamines B2, B6, B12 et C contribue au métabolisme énergétique normal.\r\nUn formule drainante tout en un qui aide à réduire l\'excédant d\'eau, et participe à votre perte de poids dans le cadre d\'un régime dédié. Ce complément BioTech a été spécialement conçue pour vous aider à atteindre vos objectifs et drainer l\'organisme', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(28, 1, 35, 5, 'MEGA FAT BURNER (90 CAPS)', 30, 'Mega Fat Burner de Biotech USA est une formule spécifique à base d\'actifs minceur puissants.\r\nIl contient principalement de la carnitine, connue pour son action endogène sur le stockage des graisses, du chrome, qui contribue au bon fonctionnement du métabolisme des macronutriments, du thé vert et EGCG qui possède une action thermogénique en augmentant les dépenses énergétiques du corps.\r\nLa formulation contient également des vitamines, des minéraux et des fibres naturelles.\r\nLe petit plus : Mega Fat Burner ne contient pas de caféine et n\'a donc pas d\'effet excitant ou d\'impact sur la filière énergétique.\r\nUn complément avec une action concrète et complète sur les graisses, à utiliser dans le cadre d\'une perte de poids et d\'un régime adapté pour augmenter la combustion des graisses et réguler la sensation de faim.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(29, 3, 40, 5, 'THERMO-CUTS (100 CAPS)', 30, 'Vous êtes en période de sèche ou vous suivez un régime ? Vous voulez mettre toutes les chances de votre côté pour atteindre vos objectifs et avoir un effet rapide ? \r\nThermo-Cuts d\'Optimum Nutrition est un complexe thermogénique composé d\'extraits végétaux et de nutriments naturels. A base de caféine (100mg), d\'extrait de thé vert et de guarana, il est destiné à aider la transformation du corps grâce à son processus de thermogenèse (production de la chaleur physiologique). \r\nThermo-Cuts est proposé sous forme de gélules pour soutenir le métabolisme des graisses avec du zinc et de la L-Carnitine. Sa teneur en capsaïcine (extrait du poivre de Cayenne) agit sur la thermogenèse et ainsi sur le métabolisme qui a besoin de source d\'énergie comme la graisse. \r\nCe brûleur de graisse est à consommer en complément d\'un régime alimentaire équilibré et d\'un mode de vie actif pour une meilleure énergie et un déstockage rapide. \r\nBonus : le produit est certifié Informed Choice', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(30, 4, 25, 5, 'PRO MESH SHORT - NOIR', 20, 'Quoi d\'autre à porter lors d\'une séance d\'entraînement de fou qu\'un de vos shorts favori GASP ?\r\n\r\nTaille élastique cousue avec cordon intérieur pour le serrage.\r\nMatière fluide polyester, avec poches avant et fermeture à glissière.\r\nEt juste au cas où vous tourneriez le dos à des gens, la griffe GASP a été ajoutée à l\'arrière !', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(31, 4, 25, 5, 'T-SHIRT FITADIUM MEN', 20, 'Le nouveau t-shirt pour homme Join My Fit Squad de la marque Fitadium débarque dans les starting blocks ! Et toi ? Tu rejoins my fit squad ?\r\nIl va à tout le monde, convient à tous les styles vestimentaires. D\'une qualité Jersey 190, ce tee-shirt est en 100% coton semi-peigné Ringspun. Sa surface de tissu est donc plus lisse et son toucher plus doux, ce qui le rend plus agréable à porter.\r\nT-shirt Fitadium Men a un style moderne & slim fit, avec un col rond ajusté et une bande de propreté en élasthanne. Il est coupé cousu avec des manches courtes.\r\nSon design dynamique te motivera à ne pas lâcher tes efforts que ce soit chez toi ou à la salle de sport. Le logo Fitadium est présent en discrétion sur la partie avant du tee-shirt. \r\nMontre-nous ton appartenance à la communauté Fitadium et sape-toi avec ce nouveau tee-shirt Fitadium !', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(32, 4, 40, 5, 'MUSCLE JOE PREMIUM STRINGER', 30, 'Le nouveau Muscle Joe Premium Stringer est une version retravaillée et améliorée du débardeur classique rétro Stringer Y-Back Gold\'s Gym.\r\nBien que ce nouveau débardeur possède une coupe très échancrée exactement identique à son prédécesseur, il utilise un coton plus résistant et plus doux, extensible et plus respirant (par opposition au coton peigné plus épais d\'origine).\r\nUn marquage au col sans étiquette vient encore améliorer cette version perfectionnée de ce grand classique Gold\'s Gym pour plus de confort!\r\nLa marque de fabrique de Gold\'s Gym et son célèbre logo viennent habiller l\'avant du buste pour vous motiver toujours plus, et vous rappeler que vous aussi, vous faites partie de la grande famille du fitness !', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(33, 4, 50, 5, 'TRIBECA PULLOVER', 30, 'Tribeca Pullover de la marque Better Bodies est un sweat à capuche de style old school classique en 100% coton. On peut le porter tous les jours et même à la salle pour avoir du style en toutes circonstances.\r\nHyper confortable avec sa coupe régulière, ce sweat pour homme reste simple mais tendance et il pourra s\'associer aussi bien à un jean qu\'à un look plus sportif. \r\nSa capuche est doublée et réglable grâce à son cordon de serrage. Quoi de mieux pour être à l\'aise dans sa capuche ? \r\nLe sweat possède le logo Better Bodies imprimé sur le torse, et une bande décorative sur les bras et le dos. Vous trouverez également une poche kangourou pour y glisser vos clés, votre carte de gym ou votre téléphone. Les poignets sont côtelés en bas aux extrémités des manches.\r\nLe tissu d\'épaisseur moyenne et la sensation de coton véritable rendent ce pull extrêmement confortable.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(34, 1, 40, 5, 'ON PROVEN MALE HOODIE', 20, 'C\'est le sweat zippé très tendance qu\'il vous faut dans votre garde de robe de cet hiver. Son effet dégradé marque son originalité.\r\nAvec sa matière douce et élastique, le sweat Proven de chez Optimum Nutrition vous permettra d\'être à l\'aise en toute circonstance, pendant vos trainings, mais aussi toute la journée, au travail, à la maison ou en balade à l\'extérieur.\r\nSon tissu doux et ses manches longues vous aideront à conserver votre chaleur corporelle et vous protégeront du froid.\r\nArmé d\'une capuche, et de ses cordons de serrage, il est facile à ajuster, tandis que la fermeture éclair devant et des poches sur les côtés le rende hyper pratique au quotidien.\r\nProposé uniquement dans ce coloris.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(35, 1, 25, 5, 'ON PROVEN BASEBALL TEE', 20, 'Ce tee-shirt manches longues moulant de la marque Optimum Nutrition est créé pour s’entraîner à la salle de gym mais également pour être porté en ville ! Parfait pour avoir un look incroyable avec son logo Proven !\r\nConçu en coton et polyester, il est très doux et agréable à porter. Léger et respirant, il sèche rapidement ce qui le rend hyper pratique pour vous accompagner tout au long de vos séances, ou pour vous remettre un peu plus au chaud après un training intense.\r\nProposé uniquement dans ce coloris', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(36, 4, 30, 5, 'PERFORMANCE T-BACK', 20, 'Le Performance T-Back de Better Bodies est un débardeur avec un super look pour la salle, conçu en tissu souple et fonctionnel 40 MTS haute performance permettant une parfaite évacuation de l’humidité.\r\nSa large encolure arrondie et sa super coupe échancrée au dos et épaules laissent apparaître vos muscles surdimensionnés.\r\nSa coupe droite permet de mettre en valeur les corps musclés sans être moulant.\r\nExtensible et flexible, sa matière polyester incluant du lycra pour exécuter sans aucune gêne une gamme complète de mouvements (et sans aucun risque de craquer les coutures !) permet d’avoir une forme physique terrible.\r\nLe Performance T-Back de Better Bodies possède en signature le logo Better Bodies sur toute la hauteur côté, inscrit en effet transfert ton sur ton selon le coloris de fond : rouge et blanc sur gris, noir et blanc sur rouge et rouge et blanc sur noir, pour plus de contraste.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(37, 4, 30, 5, 'BRONX TANK', 20, 'Bronx Tank est une nouveauté Better Bodies ! Ce vêtement est un superbe débardeur avce une coupe regular fit, idéale pour mettre en valeur les physiques sportifs et musclés sans être moulante.\r\nLe design de ce débardeur est parfaitement tendance avec l\'arrière plus long, et un tombé au niveau des fesses. Le logo Better Bodies est imprimé à l\'arrière, sur le bas du vêtement.\r\nEn matière jersey, ce débardeur pour homme est très agréable à porter, doux au toucher, léger et il sèche rapidement. Au top donc pour ne pas être trempé pendant votre séance d\'entraînement, ou pour gagner un style streetwear et sportif lors de vos balades en ville.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(38, 4, 40, 10, 'FITTED JOG PANTS', 40, 'Le style rencontre le côté pratique avec ce jogging de haute qualité !\r\nAvec sa coupe moderne et resserée sur la bas, ce pantalon aux coloris classiques est un indispensable de la collection Gold\'s Gym. La coupe fuselée offre une silhouette flatteuse sans oublier le confort pour des entrainements avec un maximum de performance.\r\nDeux poches horizontales et une poche arrière viennent habiller le vêtement, et lui donne un côté pratique, tandis que le logo en coloris contrasté au niveau de l\'aine gauche donne un peu de pep\'s au jogging.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(39, 5, 50, 5, 'PERFORMANCE LS HOOD', 20, 'Ce superbe t-shirt à manches longues pour femme est signé par la célèbre marque de fitness Better Bodies.\r\nAvec sa coupe ajustée et féminine, Performance LS Hood convient parfaitement pour la pratique du fitness, du yoga, de la musculation, pour aller courir ou pour sortir avec un style casual et décontracté.\r\nEn matière polyester et élasthane, très fine, ce top pour femme manches longues est léger, doux et agréable à porter et sèche rapidement. Idéal pour ne pas rentrer trempée après une bonne séance. Le tissu est également doté d\'une protection anti-UV 40, idéale pour des trainings en extérieur.\r\nPerformance LS Hood possède une capuche fine et légère qui habille le vêtement, et des impressions discrètes Better Bodies. La griffe est positionnée sur la poitrine côté gauche, tandis que le logo est imprimé le long du bras droit.', '2020-08-20 15:00:00', '2020-08-20 15:00:00'),
	(40, 5, 30, 5, 'RIB SEAMLESS LONG SLEEVE', 20, 'Rib Seamless Long Sleeve de la marque Better Bodies est le top parfait à associer avec son legging taille haute Rib Seamless Legging.\r\nParfaitement coupé, son design sans couture et sa matière légère te donneront une liberté totale de mouvement. Avec ce top absolument sublime, tu te sentiras belle et féminine même à la salle de sport ! \r\nLa ceinture du top permet d\'assurer un maintien afin de ne pas être gênée pendant ton entraînement. Designé avec son logo Better Bodies, tu seras tendance quoi qu\'il arrive!', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(41, 5, 30, 5, 'RIB SEAMLESS SHORTS', 10, 'Rib seamless shorts est un nouveau short de la gamme de vêtement de la marque Better Bodies.\r\nIl fait partie de la gamme sans coutures qui sont les nouveaux favoris des Fit Girls. \r\nCe short sans coutures côtelé a une coupe slim et une taille haute. Sa longueur est mi-cuisse pour une bonne liberté de mouvement. Cet article est extrêmement doux grâce au tissu unique et à la technique de tricot. La ceinture épaisse garantit un bon maintien. \r\nEn matière polyester, polyamide et élasthanne, Rib seamless shorts est moulant & résistant, parfait pour t\'accompagner lors de tes séances bas du corps intense !\r\nParfait combo avec le crop top sans coutures côtelé.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(42, 1, 30, 5, 'DEFINE SEAMLESS SPORT BRA', 20, 'La brassière Define Seamless est une brassière de sport pour des impacts faibles à moyens, proposée avec un design simple mais avec de très jolis détails élégants.\r\nEn tissu léger et respirant, elle offre un confort parfait, pour la pratique du fitness, de la musculation ou du yoga ! Essayez-la et vous ne voudrez plus jamais porter un autre modèle ! \r\nConçu avec la technologie Seamless, avec un minimum de coutures, cette brassière élastique « four-way stretch » vous permet une incroyable liberté de mouvement, pour que vous puissiez vous entraîner au mieux, dans le meilleur des conforts. \r\nGrâce à son élastique large à la taille et sa matière flex, cette brassière reste en place et s’adapte à votre morphologie pour que vous puissiez vous sentir à l\'aise.\r\nLe logo ICIW est inséré dans le maillage au niveau de la poitrine et dans le dos. Les bretelles croisées apportent style, féminité et élégance à cette pièce incontournable du dressing.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(43, 5, 40, 5, 'PERFORMANCE CUT TEE', 30, 'Performance Cut Tee est un t-shirt de sport pour femme de la marque Better Bodies avec un tissu protection UV 40. Très fin et léger, et composé de polyester et élasthane, il résistante à l\'effort lors de vos entraînements de fitness ou musculation.\r\nCe t-shirt est particulièrement agréable à porter du fait de cette matière douce qui sèche très rapidement pour vous permettre de poursuivre votre séance sans être trempée.\r\nPerformance Cut Tee possède un col rond ornée d\'une jolie surpiqûre pour les finitions, et une coupe cintrée très moulante qui mettra en valeur votre taille et vos épaules.\r\nDe plus, ce t-shirt performance offre une très jolie découpe en forme de goutte dans le dos, sexy et féminine, qui dévoile les omoplates.\r\nAvec le Performance Cut Tee de Better Bodies, vous aurez une parfaite liberté de mouvement lors de vos entraînements tout en ayant la silhouette parfaitement mise en valeur !', '2025-08-25 15:00:00', '2020-08-25 15:00:00'),
	(44, 5, 40, 5, 'DEFINE SEAMLESS TIGHTS', 30, 'Le legging Define Seamless 7/8ème est proposé en technologie Seamless avec un minimum de coutures pour plus de confort et de mobilité pendant vos séances. Taille haute, il reste en place et est incroyablement confortable. Il donne en plus un effet gainant / ventre plat pour une silhouette mise en valeur.\r\nTrès élastique, il offre une coupe qui s\'adapte au mieux à votre morphologie pour galber la silhouette, mais aussi de vous garantir une amplitude de mouvement optimale lors de vos trainings.\r\nAvec ses très jolies finitions, ce legging peut être porté à la salle comme en ville, pour un look sportif et dynamique.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(45, 5, 45, 5, 'SEAMLESS TIGHTS', 40, 'Avec son superbe tissage camouflage, ce legging est un véritable bijou !\r\nAgréable à porter, proposé en matière extensible pour un confort absolu et une liberté de mouvement sans limite, il vous accompagnera sur tous vos trainings, et même au quotidien pour un look sportif et élégant.\r\nAvec sa finition seamless, il possède une très belle coupe qui mettra parfaitement la silhouette en valeur, en galbant un maximum.\r\nDe jolis détails en maille habillent la jambe, et le logo ICIW est inséré dans le tissage au niveau de la ceinture.\r\nDe plus la taille haute offre un maintien supplémentaire et garantit une bonne tenue de vêtement pendant l\'entraînement.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(46, 5, 40, 5, 'CHRYSTIE SHINY TIGHTS', 20, 'Better Bodies innove encore en proposant un superbe legging femme dans la collection Chrystie !\r\nAvec sa coupe au niveau des chevilles il ira parfaitement aux petites comme aux grandes. Sa taille mi-haute garantit un confort unique.\r\nSon petit plus ? Le legging Chrystie shiny possède des empiècements brillants au niveau de la cambrure et des genoux, ainsi qu\'une impression Better Bodies au niveau des mollets.\r\nDe quoi habiller le legging tout en restant sur du ton sur ton pour un look féminin et sportif, à la salle comme en ville.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(47, 6, 20, 5, 'BANDE DE MUSCULATION (208CM)', 20, 'Cette Bande de Musculation élastique a été fabriquée en France par Excellerator. En Latex naturel, elle se plie à toutes vos exigences et vos exercices. Idéale pour débuter en musculation et réaliser toutes sortes d’exercices en résistance. Essayez et vous verrez, ce n’est pas aussi facile que ça en a l’air ! La résistance progressive de la bande de latex permet de renforcer et tonifier toutes les parties du corps sans risque de blessure. Vous pouvez vous entrainer où et quand bon vous semble, quel que soit votre objectif. Plusieurs couleurs et largeurs correspondants à des niveaux de résistance variables, à utiliser en fonction de votre niveau.\r\nLivrée avec son sac de transport.\r\nRésistance Moyenne : Jaune : Longueur 208 cm largeur 20 mm. Résistance de 3 à 16 kg.\r\nRésistance Elevée : Rouge : Longueur 208 cm largeur 25 mm. Résistance de 4 à 25 Kg. \r\nForte résistance: Verte : Longueur 208 cm, largeur 45 mm. Résistance de 20 à 40 Kg.', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(48, 6, 30, 5, 'HARBINGER AB CARVER PRO', 20, 'Sais-tu que la roulette abdos est l\'un des meilleurs exercices pour les abdos? Il fait travailler les muscles profonds. A toi le ventre plat et la posture idéale. Mais pas seulement! Le grand droit, le muscle transverse, le muscle fléchisseur de hanche, mais aussi les épaules, les dorsaux, les ischio-jambiers, les bras sont engagés.\r\nCette roue à abdos dispose d\'un moteur cinétique qui est composé d\'un ressort en acier au carbone offrant une résistance pendant tes exercices et une assistance lors de mouvements de recul afin d\'amplifier tes séances d\'entraînement des abdominaux et bras.   \r\nSa bande de roulement ultra-large permet une stabilité totale de tes mouvements vers la gauche ou la droite pour travailler en oblique et sculpter davantage ton corps.  \r\nAb carver pro possède des poignées ergonomiques qui sont inclinées pour augmenter le travail des bras et des pectoraux. Elles sont anti-dérapantes et confortables pour la prise en main.\r\nBonus, les poignées sont amovibles pour faciliter le rangement et le transport.  Tu peux t’entraîner chez toi sans avoir besoin de beaucoup de place!\r\nLe produit comprend aussi une genouillère en mousse de haute qualité et densité pour un confort total pendant tes exercices.  \r\nLimite de poids de l\'utilisateur : 136 kg.', '2020-08-25 15:00:00', '2015-08-25 15:00:00'),
	(49, 6, 15, 0, 'BARRE DE TRACTION', 10, 'On te propose la barre de traction qu\'il te faut pour tes entraînements de musculation indoor !\r\nCette barre de porte s\'adapte aux encadrements de 62 cm à 96 cm de large. Elle est parfaite pour tes trainings du dos, trapèzes, bras, biceps et pectoraux. Elle va clairement t\'aider à atteindre ton objectif pour l\'été ! \r\nSes poignées en mousse vont t\'assurer un confort extrême ! \r\nSuggestions d\'utilisation :\r\n- Positionnez la barre en haut de la porte pour travailler les tirages, relevés de dos et tractions\r\n- Ou en bas de porte pour travailler les abdominaux\r\nAttention poids maximal recommandé : 100kg\r\nComposition : Acier + jeu de vis fourni', '2020-08-25 15:00:00', '2020-08-25 15:00:00'),
	(50, 6, 20, 5, 'TAPIS DE SOL BLEU - 180 CM', 30, 'Le tapis de sol bleu - 180 cm est indispensable pour tes entraînements indoor, cours de fitness, pilates, ou yoga. D\'une longueur de 180cm, ce tapis d\'entrainement t\'offrira douceur et confort grâce à son épaisseur de mousse de 1.6 cm. \r\nLe tapis de sol bleu ultra résistant et haute densité permet de ne pas s\'enfoncer dans la mousse, il préserve ton dos et tes articulations en absorbant les éventuels chocs.\r\nSes coins sont arrondis et sa surface est striée. Il est résistant et anti-dérapant pour garantir une meilleure stabilité. Pour encore plus de praticité, il est doté d\'une sangle de transport.\r\nCe tapis peut être autant utilisé pour les exercices d’aérobic, de fitness que pour des séances de yoga et de pilates. Tu n\'as plus aucune excuse pour réaliser ton home training!\r\nTaille : 180 cm\r\nÉpaisseur : 1.6 cm', '2020-08-20 15:00:00', '2020-08-20 15:00:00'),
	(51, 6, 30, 5, 'GYMBALL FITNESS (55CM)', 5, 'Ce produit est très efficace pour les abdominaux, bras, dos, pectoraux, jambes et épaules. De top qualité, il permet de rester stable grâce à sa technologie Setpoint qui revient toujours dans la position parfaite et qui guide ta position corporelle. Parfait pour maximiser tes résultats !\r\nEn dehors, d’être le ballon de remise en forme parfait pour ton renforcement musculaire, il est anti-crevaison !\r\nBonus, tu trouveras à l’intérieur du produit ta pompe de gonflage.\r\nConvient à tous types d’utilisateurs : débutant à confirmé.\r\nVendu avec sa pompe de gonflage', '2020-08-25 15:00:00', '2020-08-25 15:00:00');
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

-- Listage des données de la table fitprotein2.product_image : ~48 rows (environ)
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`id`, `product_id`, `created_at`, `updated_at`, `filename`) VALUES
	(8, 6, NULL, NULL, '5f44fb8d93b89228884831.JPG'),
	(9, 7, NULL, NULL, '5f44fc1c04091552373168.JPG'),
	(10, 8, NULL, NULL, '5f44fcc5ade0c741147196.JPG'),
	(11, 9, NULL, NULL, '5f44fd673953d196816781.JPG'),
	(12, 10, NULL, NULL, '5f44fde0ef37a593082802.JPG'),
	(13, 11, NULL, NULL, '5f44fe708c39d763046719.JPG'),
	(14, 12, NULL, NULL, '5f44ff20404af873631617.JPG'),
	(15, 13, NULL, NULL, '5f44ffbbbd101542634482.JPG'),
	(16, 14, NULL, NULL, '5f4500685530c610805722.JPG'),
	(17, 15, NULL, NULL, '5f450102eb309140114587.JPG'),
	(18, 16, NULL, NULL, '5f4501cbb17a7257548840.JPG'),
	(19, 17, NULL, NULL, '5f4502dd6aa67676144832.JPG'),
	(20, 18, NULL, NULL, '5f4503d346d6f959879439.JPG'),
	(21, 19, NULL, NULL, '5f450456b2886954942826.JPG'),
	(22, 20, NULL, NULL, '5f4504fa7b59f738077153.JPG'),
	(23, 21, NULL, NULL, '5f4505b382295318271633.JPG'),
	(24, 22, NULL, NULL, '5f45064244219777625744.JPG'),
	(25, 23, NULL, NULL, '5f45072800f47587892987.JPG'),
	(26, 24, NULL, NULL, '5f4507e791c4b646700809.JPG'),
	(27, 25, NULL, NULL, '5f450a06e2b0b468998201.JPG'),
	(28, 26, NULL, NULL, '5f450ae279376287559926.JPG'),
	(29, 27, NULL, NULL, '5f450b97a7c71780157376.JPG'),
	(30, 28, NULL, NULL, '5f450c2bdd742697140186.JPG'),
	(31, 29, NULL, NULL, '5f450cb3a803c893884913.JPG'),
	(32, 30, NULL, NULL, '5f450e50d4b14669729087.JPG'),
	(33, 31, NULL, NULL, '5f450f141df3c281424947.JPG'),
	(34, 32, NULL, NULL, '5f45107478774274805777.JPG'),
	(35, 33, NULL, NULL, '5f4511177935d970219823.JPG'),
	(36, 34, NULL, NULL, '5f45122cd7c27936148550.JPG'),
	(37, 35, NULL, NULL, '5f4512fbdb7fb409409527.JPG'),
	(38, 36, NULL, NULL, '5f45137c3ec50177112765.JPG'),
	(39, 37, NULL, NULL, '5f45140af2ed3712543479.JPG'),
	(40, 38, NULL, NULL, '5f4514b78351c047327681.JPG'),
	(41, 39, NULL, NULL, '5f451598457ee335851135.JPG'),
	(42, 40, NULL, NULL, '5f45162d3cd8a118873404.JPG'),
	(43, 41, NULL, NULL, '5f4516cac5ede381087714.JPG'),
	(44, 42, NULL, NULL, '5f45177f92177716633247.JPG'),
	(45, 43, NULL, NULL, '5f4517ee643f0251855072.JPG'),
	(46, 44, NULL, NULL, '5f4518798a73e407938430.JPG'),
	(47, 45, NULL, NULL, '5f45190f90137911718894.JPG'),
	(48, 46, NULL, NULL, '5f451991c8b4d376517052.JPG'),
	(49, 47, NULL, NULL, '5f451a2010e55424733810.JPG'),
	(50, 48, NULL, NULL, '5f451acb761b1054488428.JPG'),
	(51, 49, NULL, NULL, '5f451b619e531433401399.JPG'),
	(52, 50, NULL, NULL, '5f451bd708db8412425266.JPG'),
	(53, 51, NULL, NULL, '5f451c51f009a961195204.JPG'),
	(54, 7, NULL, NULL, '5f44fcc5ade0c741147196.JPG'),
	(55, 7, NULL, NULL, '5f44fd673953d196816781.JPG');
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

-- Listage des données de la table fitprotein2.sub_category : ~6 rows (environ)
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

-- Listage des données de la table fitprotein2.user : ~3 rows (environ)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `civility`, `first_name`, `last_name`, `address`, `city`, `zip_code`, `created_at`, `updated_at`) VALUES
	(1, 'toto@gmail.com', '["ROLE_ADMIN"]', '$argon2id$v=19$m=65536,t=4,p=1$aFQzTVFwRzlMVGFNNTZuNg$yDN/7ozhIOEnbPqC7njWlioCOgyhQwuDR8vjZRkIV0s', 'Monsieur', 'Prenom', 'Nom', '120 rue toto', 'Montpellier', 34000, '2020-07-24 08:24:28', '2020-07-24 08:24:28'),
	(2, 'tata@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$aFQzTVFwRzlMVGFNNTZuNg$yDN/7ozhIOEnbPqC7njWlioCOgyhQwuDR8vjZRkIV0s', NULL, 'tata', 'tata', NULL, NULL, NULL, '2020-08-23 14:09:48', NULL),
	(3, 'test@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$ZklRSjVKQTJaSzhiZDJBLg$cG/1oDdFOB8IgEPffqp4CbZG3WbTazCMhhj15bTZ23M', NULL, 'test', 'test', NULL, NULL, NULL, '2020-08-24 10:13:22', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
