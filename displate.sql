-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 09 jan. 2022 à 14:41
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `displate`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`) VALUES
(3, 'Anime'),
(5, 'Naruto'),
(6, 'Japon'),
(7, 'Combat'),
(8, 'Film'),
(9, 'Retro'),
(10, 'Design'),
(11, 'Nature'),
(12, 'Voiture'),
(13, 'Neon'),
(14, 'Jeu vidéo'),
(15, 'Réaliste'),
(16, 'Futur'),
(17, 'Espace'),
(18, 'Peinture'),
(19, 'cartoon'),
(20, 'Demon'),
(21, 'Divinité');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `date_commande` datetime NOT NULL,
  `etat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `user_id`, `montant`, `date_commande`, `etat`, `promo_id`) VALUES
(7, 6, 130, '2021-12-27 12:35:50', 'En cours de préparation', NULL),
(8, 6, 80, '2021-12-27 16:39:35', 'En cours de livraison', NULL),
(9, 6, 105, '2021-12-27 16:52:07', 'Livré', NULL),
(12, 6, 80, '2021-12-28 12:09:36', 'En cours de traitement', NULL),
(13, 9, 105, '2021-12-28 12:13:01', 'En cours de préparation', NULL),
(15, 6, 40, '2021-12-31 23:34:18', 'En cours de livraison', NULL),
(16, 6, 40, '2022-01-01 15:19:29', 'En cours de traitement', NULL),
(17, 11, 65, '2022-01-01 15:22:45', 'En cours de traitement', NULL),
(18, 6, 65, '2022-01-03 09:05:29', 'En cours de préparation', NULL),
(19, 15, 170, '2022-01-03 11:53:07', 'Livré', NULL),
(20, 6, 300, '2022-01-03 20:47:52', 'En cours de traitement', NULL),
(21, 18, 105, '2022-01-06 10:25:33', 'En cours de préparation', NULL),
(22, 6, 130, '2022-01-06 10:41:34', 'En cours de traitement', NULL),
(23, 6, 130, '2022-01-08 19:40:21', 'en cours de traitement', 2),
(24, 6, 101.4, '2022-01-09 00:16:02', 'en cours de traitement', 2),
(25, 6, 50, '2022-01-09 01:09:44', 'en cours de traitement', 4),
(27, 6, 101.4, '2022-01-09 14:02:21', 'en cours de traitement', 2),
(28, 6, 36, '2022-01-09 14:05:54', 'en cours de traitement', 5);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `auteur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `produit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `auteur`, `commentaire`, `date`, `produit_id`) VALUES
(1, 'moi', 'oulala', '2021-12-16 15:08:16', 1),
(3, 'Vendeur3 Vendeur3', 'Je test', '2022-01-01 15:04:11', 1),
(4, 'Vendeur3 Vendeur3', 'Il est incroyable', '2022-01-01 15:23:13', 1);

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `format_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` double NOT NULL,
  `commande_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`id`, `produit_id`, `format_id`, `quantite`, `prix`, `commande_id`) VALUES
(3, 12, 3, 2, 130, 7),
(4, 2, 1, 1, 40, 8),
(5, 5, 1, 1, 40, 9),
(6, 5, 1, 1, 40, 12),
(7, 2, 1, 1, 40, 12),
(8, 13, 3, 1, 65, 13),
(9, 13, 1, 1, 40, 13),
(11, 5, 1, 1, 40, 15),
(12, 1, 1, 1, 40, 16),
(13, 1, 3, 1, 65, 17),
(14, 12, 3, 1, 65, 18),
(15, 1, 3, 2, 130, 19),
(16, 1, 1, 1, 40, 19),
(17, 18, 1, 1, 40, 20),
(18, 10, 3, 1, 65, 20),
(19, 15, 3, 1, 65, 20),
(20, 16, 10, 1, 130, 20),
(21, 99, 1, 1, 40, 21),
(22, 99, 3, 1, 65, 21),
(23, 90, 10, 1, 130, 22),
(24, 16, 10, 1, 130, 23),
(25, 16, 10, 1, 130, 24),
(28, 96, 10, 1, 130, 27),
(29, 99, 1, 1, 40, 28);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211215090441', '2021-12-15 10:54:14', 92);

-- --------------------------------------------------------

--
-- Structure de la table `format`
--

CREATE TABLE `format` (
  `id` int(11) NOT NULL,
  `prix` double NOT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `largeur` double NOT NULL,
  `hauteur` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `format`
--

INSERT INTO `format` (`id`, `prix`, `format`, `largeur`, `hauteur`) VALUES
(1, 40, 'M', 32, 45),
(3, 65, 'L', 41, 64),
(10, 130, 'XL', 64, 90),
(11, 50, 'Square', 50, 50);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `photo`, `titre`, `description`, `user_id`) VALUES
(1, 'vegeto-ssj-blue - 61b9ce5cf3861.jpg', 'Vegeto Super Sayan Blue', 'Fan Art de Vegeto SSJ Blue', 5),
(2, 'naruto-sasuke - 61b9f3922106a.jpg', 'Naruto et Sasuke', 'Fan Art de Naruto et Sasuke à la vallée de la fin', 5),
(5, 'Itachi - 61c0570107679.png', 'Itachi Uchiwa', 'Itachi Uchiwa', 6),
(6, 'itachi-peinture - 61c05718f3c81.png', 'Itachi Uchiwa (Peinture)', 'Itachi Uchiwa (Peinture)', 6),
(10, 'onepiece-luffy-kaido - 61c19dbcc3039.png', 'Luffy & Kaido', 'Luffy & Kaido Fan Art', 6),
(11, 'one-piece-ocean - 61c731ca0290f.png', 'Fusion Tableau One Piece', 'Fusion Tableau One Piece', 6),
(12, 'itachi-sasuke - 61c7364132d7d.png', 'Itachi et Sasuke', 'Itachi et Sasuke', 6),
(13, 'renard-3d - 61c7374bef51f.png', 'Renard Style 3D', 'Renard 3D', 6),
(15, 'skyline - 61d055020934a.png', 'Skyline GTR', 'Skyline GTR', 11),
(16, 'supra-rose - 61d055242ca89.png', 'Toyota Supra', 'Toyota Supra', 11),
(17, 'urahara - 61d05541131fe.png', 'Urahara Bleach', 'Urahara Bleach', 11),
(18, 'tanjiro-fanart - 61d05571c21b8.png', 'Tanjiro Kamado FanArt', 'Tanjiro Kamado FanArt de Demon Slayer', 11),
(19, 'itachi - 61d05599769e2.png', 'Fan Art Itachi Uchiwa', 'Fan Art Itachi Uchiwa / Symbole Uchiwa', 11),
(21, 'alexander-j-original-copia - 61d2b7653ab0e.jpg', 'The Origin ( peinture )', 'The Origin ( peinture )', 13),
(31, 'amir-zand-x - 61d2bad98a774.jpg', 'Frozen earth', 'Frozen earth', 14),
(32, 'amir-zand-uplox - 61d2bf52c9641.jpg', 'Desertic planet', 'Desertic planet', 14),
(33, 'amir-zand-uplox-1 - 61d2c0aac6688.jpg', 'Prism Planet', 'Prism Planet', 14),
(35, 'amir-zand-rocksartstation - 61d2c16e725e6.jpg', 'RockSarStation', 'RockSarStation', 14),
(36, 'amir-zand-pinkish-artstation - 61d2c1df3ecaa.jpg', 'Pinkish Art Station', 'Pinkish Art Station', 14),
(37, 'amir-zand-passage280 - 61d2c52b4df27.jpg', 'Road River', 'Road River', 14),
(39, 'amir-zand-msd8-2post - 61d2c63971097.jpg', 'Frozen Boat', 'Frozen Boat', 14),
(40, 'amir-zand-monumentuplox - 61d2cd6dc3094.jpg', 'Mystic cube', 'Mystic cube', 14),
(41, 'amir-zand-lonelyrock2 - 61d2cdb7dafc5.jpg', 'Lonely Rock', 'Lonely Rock', 14),
(42, 'amir-zand-lastsunset - 61d2cdda99770.jpg', 'Last Sunset', 'Last Sunset', 14),
(43, 'amir-zand-insta-2 - 61d2ce078b402.jpg', 'Levitation Rock', 'Levitation Rock', 14),
(45, 'amir-zand-grimdarkup2 - 61d2cea4cf0bf.jpg', 'Lonely Castle', 'Lonely Castle', 14),
(50, 'anato-finnstark-anato-finnstark-anato-finnstark-between-light-and-darkness-batman-by-anatofinnstark-dd05nkl-fullview - 61d2d7e18ea42.jpg', 'Batman Demon', 'Batman Demon Fan Art', 15),
(53, 'anato-finnstark-anato-finnstark-web-petit - 61d2d8717ee09.jpg', 'Batman Archange', 'Batman Archange', 15),
(57, 'anato-finnstark-anato-finnstark-web-pti-bat - 61d2da098ca85.jpg', 'The Batman', 'The Batman', 15),
(60, 'anato-finnstark-cover-6 - 61d2dae9163c4.jpg', 'Geralt execution', 'Geralt execution', 15),
(63, 'anato-finnstark-cover-3-final - 61d2dba79e774.jpg', 'Geralt Zombie', 'Geralt Zombie', 15),
(65, 'anato-finnstark-hatred - 61d2e35e13efc.jpg', 'Demon VS Samurai', 'Demon VS Samurai', 15),
(67, 'anato-finnstark-howl - 61d2e40d349ac.jpg', 'Giant Owl Samurai', 'Giant Owl Samurai', 15),
(69, 'anato-finnstark-monk - 61d2e7c909946.jpg', 'Demon vs Samurai', 'Demon vs Samurai', 15),
(72, 'anato-finnstark-snakefinnal-2 - 61d2e8cf3e099.jpg', 'Viper Giant', 'Viper Giant', 15),
(77, 'Aizen - 61d4be9a42fab.png', 'Sosuke Aizen Bleach', 'Sosuke Aizen Bleach', 16),
(78, 'byakuya - 61d4bec795510.png', 'Byakya Kuchiki', 'Byakya Kuchiki', 16),
(79, 'Byakuya2 - 61d4c001ec63f.png', 'Byakuya Bleach', 'Byakuya Bleach', 16),
(80, 'Grimmjow - 61d4c020abca1.png', 'Grimmjow Pantera', 'Grimmjow Pantera', 16),
(81, 'Hitsugaya - 61d4c046cb43b.png', 'Hitsugaya Toshiro', 'Hitsugaya', 16),
(82, 'Hitsugaya2 - 61d4c0554f26c.png', 'Hitsugaya Toshiro', 'Hitsugaya Toshiro', 16),
(83, 'Ichigo - 61d4c06fbb2ac.png', 'Ichigo Kurosaki', 'Ichigo Kurosaki', 16),
(84, 'JushiroUkitake - 61d4c08519235.png', 'Ukitake Jushiro', 'Ukitake Jushiro', 16),
(85, 'kisuke - 61d4c09b26a2f.png', 'Kisuke Urahara', 'Kisuke Urahara', 16),
(86, 'Neliel - 61d4c0b3575ee.png', 'Nelliel Arancar', 'Nelliel Arancar', 16),
(87, 'Orihime - 61d4c0c7023be.png', 'Orihime Inoue', 'Orihime Inoue', 16),
(88, 'Orihime2 - 61d4c0d4767b2.png', 'Orihime Inoue', 'Orihime Inoue', 16),
(89, 'Rangiku - 61d4c0e8ee9ec.png', 'Rangiku Matsumoto', 'Rangiku Matsumoto', 16),
(90, 'Renji - 61d4c10bc60e3.png', 'Renji Abarai', 'Renji Abarai', 16),
(91, 'Renji2 - 61d4c119cd68a.png', 'Renji Abarai', 'Renji Abarai', 16),
(92, 'Rukia - 61d4c12c68fce.png', 'Rukia Kuchiki', 'Rukia Kuchiki', 16),
(93, 'SoiFon - 61d4c1655fe53.png', 'SoiFon 2nd Captain', 'SoiFon 2nd Captain', 16),
(94, 'Ulquiorra - 61d4c180cca19.png', 'Ulquiorra Cifer', 'Ulquiorra Cifer', 16),
(95, 'urahara - 61d4c19710811.png', 'Kisuke Urahara', 'Kisuke Urahara', 16),
(96, 'Urahara2 - 61d4c1b5b51d0.png', 'Kisuke Urahara', 'Kisuke Urahara', 16),
(97, 'VastoLorde - 61d4c1d1459da.png', 'VastoLorde', 'VastoLorde', 16),
(98, 'Yuroichi - 61d4c1ed46fa7.png', 'Yoruichi Shihouin', 'Yoruichi Shihouin', 16),
(99, 'DodgeChallenger - 61d6b461b0ff1.png', 'Dodge Challenger Retro', 'Dodge Challenger Retro style retrowave', 18);

-- --------------------------------------------------------

--
-- Structure de la table `produit_categorie`
--

CREATE TABLE `produit_categorie` (
  `produit_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit_categorie`
--

INSERT INTO `produit_categorie` (`produit_id`, `categorie_id`) VALUES
(1, 3),
(1, 7),
(2, 3),
(2, 5),
(2, 6),
(2, 7),
(5, 3),
(5, 5),
(6, 3),
(6, 5),
(10, 3),
(10, 6),
(11, 3),
(11, 6),
(12, 3),
(12, 5),
(13, 10),
(15, 12),
(16, 12),
(17, 3),
(18, 3),
(18, 7),
(19, 3),
(19, 5),
(21, 18),
(31, 17),
(31, 18),
(32, 16),
(32, 17),
(33, 16),
(33, 17),
(35, 18),
(36, 17),
(36, 19),
(37, 16),
(37, 17),
(37, 18),
(39, 19),
(40, 16),
(40, 18),
(41, 15),
(41, 18),
(42, 16),
(42, 17),
(42, 19),
(43, 14),
(43, 17),
(43, 19),
(45, 19),
(50, 8),
(50, 14),
(50, 19),
(53, 8),
(53, 14),
(53, 19),
(57, 8),
(57, 14),
(60, 8),
(60, 14),
(60, 20),
(63, 8),
(63, 14),
(63, 20),
(65, 7),
(65, 18),
(67, 6),
(67, 11),
(67, 18),
(69, 7),
(69, 18),
(69, 20),
(72, 6),
(72, 18),
(72, 21),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 9),
(99, 12),
(99, 13);

-- --------------------------------------------------------

--
-- Structure de la table `produit_format`
--

CREATE TABLE `produit_format` (
  `produit_id` int(11) NOT NULL,
  `format_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit_format`
--

INSERT INTO `produit_format` (`produit_id`, `format_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(5, 1),
(5, 3),
(6, 3),
(10, 3),
(11, 1),
(12, 1),
(12, 3),
(12, 10),
(13, 1),
(13, 3),
(15, 3),
(15, 10),
(16, 10),
(17, 1),
(17, 3),
(17, 10),
(18, 1),
(18, 3),
(18, 10),
(19, 3),
(19, 10),
(21, 1),
(21, 3),
(21, 10),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(33, 10),
(35, 3),
(36, 3),
(37, 3),
(37, 10),
(39, 3),
(39, 10),
(40, 3),
(40, 10),
(41, 1),
(41, 3),
(42, 3),
(42, 10),
(43, 10),
(45, 1),
(50, 1),
(50, 10),
(53, 3),
(57, 1),
(57, 3),
(60, 10),
(63, 3),
(63, 10),
(65, 11),
(67, 11),
(69, 11),
(72, 11),
(77, 3),
(77, 10),
(78, 1),
(78, 3),
(78, 10),
(79, 1),
(79, 3),
(80, 3),
(81, 1),
(81, 10),
(82, 1),
(82, 3),
(83, 1),
(83, 3),
(83, 10),
(84, 1),
(85, 1),
(85, 3),
(86, 1),
(86, 3),
(86, 10),
(87, 1),
(87, 3),
(88, 1),
(88, 3),
(89, 1),
(89, 3),
(90, 3),
(90, 10),
(91, 1),
(91, 10),
(92, 1),
(92, 3),
(93, 1),
(93, 3),
(94, 1),
(94, 3),
(94, 10),
(95, 1),
(96, 3),
(96, 10),
(97, 1),
(98, 1),
(98, 3),
(98, 10),
(99, 1),
(99, 3);

-- --------------------------------------------------------

--
-- Structure de la table `promo`
--

CREATE TABLE `promo` (
  `id` int(11) NOT NULL,
  `promo_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_value` int(11) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `quantity_condition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promo`
--

INSERT INTO `promo` (`id`, `promo_code`, `promo_type`, `promo_value`, `date_debut`, `date_fin`, `quantity_condition`) VALUES
(2, 'Hiver22', 'Pourcentage', 22, '2021-12-14 09:00:00', '2022-01-14 08:00:00', 1),
(4, '30Ans', 'Devise', 30, '2022-01-08 00:00:00', '2022-01-10 00:00:00', 2),
(5, 'Test1', 'Pourcentage', 10, '2022-01-01 00:00:00', '2023-01-01 00:00:00', 1),
(7, 'Ancien20', 'Pourcentage', 20, '2020-01-01 00:00:00', '2022-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` int(11) NOT NULL,
  `image_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banniere_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `prenom`, `nom`, `pseudo`, `adresse`, `ville`, `code_postal`, `image_profil`, `banniere_profil`, `description`) VALUES
(5, 'test@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\",\"ROLE_ADMIN\"]', '$2y$13$fbrULJxIiSeDcVZeFtXC5.hcLo9r7KZbO97YJGS7wwDeWv6O9IRUa', 'test', 'test', 'test', 'test', 'test', 78200, NULL, NULL, NULL),
(6, 'admin@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\",\"ROLE_ADMIN\"]', '$2y$13$2vysTUuiRBgbZCW5wF1pNeBE5NegDWxrHcTZ.3ve4ulosIGQzXpsq', 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 78200, 'profil-test - 61c1a8ace013f.png', 'banniere-admin - 61c1a8ace0909.png', 'Ceci est un test'),
(7, 'vendeur@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$sQA78usBNNCp0mShgk5K4OpHF.q3CSbgnfXBIGJB06/nSAjMEXzQa', 'vendeur', 'vendeur', 'vendeur', 'vendeur', 'vendeur', 78200, 'profil-test - 61c0a6f9d703b.png', 'banniere-test - 61c09a37a2f5b.png', 'J\'aime bien testé'),
(8, 'fpadmin@gmail.com', '[\"ROLE_VENDEUR\"]', '$2y$13$bN5v4ASCUgAu7BO5951dwu.ERzEFU4Hjiu8IxZhuCTb2ipkKq9BBa', 'FPNumeroUno', 'FPNumeroUno', 'FPNumeroUno', 'FPNumeroUno', 'FPNumeroUno', 78200, NULL, NULL, NULL),
(9, 'vendeur2@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$96Qd8jq6.oqOLA8PKLTvoeosBDmw/yN3rDOTxBHRWWHxHfuwwjHGm', 'vendeur2', 'vendeur2', 'vendeur2', 'vendeur2', 'vendeur2', 78200, 'kirua - 61c1a363bd98e.jpg', NULL, NULL),
(10, 'user1@gmail.com', '[]', '$2y$13$OvgRiVaNz8emSuVPbM0m5OUlIEhHWf5OVpYcD1AzXaV3iDiNrEgr2', 'User1', 'User1', 'User1', 'User1', 'User1', 78200, NULL, NULL, NULL),
(11, 'vendeur3@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$KE3rexPIGdfO6v1pAQre7eoBy3Mz5zOBC0Iy8bCQVu7QyryOwF6Fa', 'Vendeur3', 'Vendeur3', 'Vendeur3', 'Vendeur3', 'Vendeur3', 78200, NULL, 'unohana - 61d0570b2885c.png', 'Vendeur3Vendeur3Vendeur3'),
(12, 'client1@gmail.com', '[]', '$2y$13$L6J/Zk568SLp7PDgGJGYHuwTR2VUehLmsiFNlBb3Gj63d.tzC3z1S', 'client1', 'client1', 'client1', 'client1', 'client1', 78200, NULL, NULL, NULL),
(13, 'alexander.junior@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$1185LQTcOioZ0jie8t7Ju.LPE4XXyed0qFzwvS80hZxA9HxDxv.0q', 'Alexander', 'Junior', 'Alexander Jr', 'Alexander Jr', 'Alexander Jr', 92000, 'profil - 61d2b5be533e9.jpg', 'banniere - 61d2b5be53c58.png', NULL),
(14, 'amirzand@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$3D0xFHyE4stoh1RP/VI7Me9rwpe4WUnpG8VDiK0rsPMRbCBX6.Ahu', 'Amir', 'Zand', 'AmirZand', 'amirzand', 'amirzand', 13000, 'profil - 61d2b9f45d00d.jpg', 'banniere - 61d2b9f45d8a9.png', NULL),
(15, 'anatofinnstark@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$T4sdxpvPHw/mNn8zIwBilub.UqjzdnlZpNFc1cICymTX7qQH9SF5u', 'Anato', 'Finnstark', 'AnatoFinnstark', 'AnatoFinnstark', 'AnatoFinnstark', 75000, 'profil - 61d2d37701fb1.jpg', 'banniere - 61d2d3770286d.png', 'Fan of Japan Style'),
(16, 'losvastos@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$CEft/3ht0/lOkZaqxbMVj.FCB2mEes.0Ko/rSbBYeCX.ymDPKcow6', 'Bleach', 'Bleach', 'LosVastos', 'LosVastos', 'LosVastos', 78200, 'ichigo-profile - 61d4be28b4d1f.jpg', '1b8005e564fd0fb0562c10c2e913ab6e - 61d4be28b5549.jpg', 'Bleach Fan'),
(17, 'user3@gmail.com', '[]', '$2y$13$GUcvt/xSQXZcPyU8g1VrgeN0UCVBnkmJuxEGVbxwERE4Dd4MI.WN2', 'user3', 'user3', 'user3', 'user3', 'user3', 78200, NULL, NULL, NULL),
(18, 'retrowave@gmail.com', '[\"ROLE_USER\",\"ROLE_VENDEUR\"]', '$2y$13$UoH8vNt6WqM4CnwJ/caPle6OnB03hI5LwYTvzShn9Agk9TPQ6MpiS', 'Retrowave', 'Retrowave', 'Retrowave', '100 rue retro', 'RetroCity', 78000, 'ichigo-profile - 61d6b4b9047b3.jpg', '1b8005e564fd0fb0562c10c2e913ab6e - 61d6b4b904e6c.jpg', 'Fan du style Retrowave'),
(19, 'client2@gmail.com', '[]', '$2y$13$ifVy5XsrqgUdGzkkcgSb9OxzWJaY2LyMtrd.Vtafth.5Vkya9oG72', 'client2', 'client2', 'client2', '20 rue des client', 'Clientcity', 78200, NULL, NULL, NULL),
(20, 'testtest@gmail.com', '[]', '$2y$13$EpgEywYXIr2vdMMVjtMakObIdK0OZY974arrgBOj.KcuS6w.xvKuG', 'testtest', 'testtest', 'testtest', 'testtest', 'testtest', 78200, NULL, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67DA76ED395` (`user_id`),
  ADD KEY `IDX_6EEAA67DD0C07AFF` (`promo_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCF347EFB` (`produit_id`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4BCD5F682EA2E54` (`commande_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27A76ED395` (`user_id`);

--
-- Index pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  ADD PRIMARY KEY (`produit_id`,`categorie_id`),
  ADD KEY `IDX_CDEA88D8F347EFB` (`produit_id`),
  ADD KEY `IDX_CDEA88D8BCF5E72D` (`categorie_id`);

--
-- Index pour la table `produit_format`
--
ALTER TABLE `produit_format`
  ADD PRIMARY KEY (`produit_id`,`format_id`),
  ADD KEY `IDX_29E8B9E5F347EFB` (`produit_id`),
  ADD KEY `IDX_29E8B9E5D629F605` (`format_id`);

--
-- Index pour la table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `format`
--
ALTER TABLE `format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_6EEAA67DD0C07AFF` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `FK_4BCD5F682EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  ADD CONSTRAINT `FK_CDEA88D8BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CDEA88D8F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produit_format`
--
ALTER TABLE `produit_format`
  ADD CONSTRAINT `FK_29E8B9E5D629F605` FOREIGN KEY (`format_id`) REFERENCES `format` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_29E8B9E5F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
