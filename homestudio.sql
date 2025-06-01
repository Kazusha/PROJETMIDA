-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 02 juin 2025 à 01:27
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `homestudio`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `email`, `mot_de_passe`) VALUES
(1, 'liman', 'midjie@gmail.com', '12347'),
(3, 'blue', 'blue@gmail.com', 'blue'),
(4, 'rei', 'rei@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `email`, `mot_de_passe`, `role`) VALUES
(1, 'Jean Dupont', 'jean@example.com', '123456', 'client'),
(2, 'liman', 'liman@gmail.com', 'clientEastwood', 'client'),
(3, 'grace', 'grace@gmail.com', 'grace22', 'client');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `id_tmdb` int(11) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duree` int(11) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `affiche_url` varchar(255) DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `note_moyenne` float DEFAULT NULL,
  `popularite` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `id_tmdb`, `titre`, `description`, `duree`, `genre`, `affiche_url`, `date_sortie`, `note_moyenne`, `popularite`) VALUES
(1, 550, 'Fight Club', 'Le narrateur, sans identité précise, vit seul, travaille seul, dort seul, mange seul ses plateaux‐repas pour une personne comme beaucoup d’autres personnes seules qui connaissent la misère humaine, morale et sexuelle. C’est pourquoi il va devenir membre du Fight club, un lieu clandestin où il va pouvoir retrouver sa virilité, l’échange et la communication. Ce club est dirigé par Tyler Durden, une sorte d’anarchiste entre gourou et philosophe qui prêche l’amour de son prochain.', 139, NULL, 'https://image.tmdb.org/t/p/w500/t1i10ptOivG4hV7erkX3tmKpiqm.jpg', '1999-10-15', 8.438, NULL),
(4, 10565, 'Kanak Attack', '', 86, NULL, 'https://image.tmdb.org/t/p/w500/idu7JFgt3nXHBwSAiSfWN0p2C00.jpg', '2000-11-16', 6.5, NULL),
(6, 603, 'Matrix', 'Programmeur anonyme dans un service administratif le jour, Thomas Anderson devient Neo la nuit venue. Sous ce pseudonyme, il est l\'un des pirates les plus recherchés du cyber‐espace. À cheval entre deux mondes, Neo est assailli par d\'étranges songes et des messages cryptés provenant d\'un certain Morpheus. Celui‐ci l\'exhorte à aller au‐delà des apparences et à trouver la réponse à la question qui hante constamment ses pensées : qu\'est‐ce que la Matrice ? Nul ne le sait, et aucun homme n\'est encore parvenu à en percer les défenses. Mais Morpheus est persuadé que Neo est l\'Élu, le libérateur mythique de l\'humanité annoncé selon la prophétie. Ensemble, ils se lancent dans une lutte sans retour contre la Matrice et ses terribles agents…', 135, NULL, 'https://image.tmdb.org/t/p/w500/pEoqbqtLc4CcwDUDqxmEDSWpWTZ.jpg', '1999-03-31', 8.226, NULL),
(7, 2, 'Ariel', 'Salla, petite ville minière de la Laponie. Taisto Kasurinen, mineur, hérite d’une « belle américaine » après le suicide de son propriétaire. Il retire toute ses économies de la banque et part à Helsinki. La capitale l’accueille froidement : il se fait voler son argent et se retrouve en prison. Cependant il a eu le temps de rencontrer Irmeli, jeune femme débordée, et son petit garçon.', 72, NULL, 'https://image.tmdb.org/t/p/w500/4HTJHLPLvhDG4D0m8IcUMh7i9h4.jpg', '1988-10-21', 7.114, NULL),
(8, 500, 'Reservoir Dogs', 'Après un hold‐up manqué, des cambrioleurs de haut vol font leurs comptes dans une confrontation violente, pour découvrir lequel d’entre eux les a trahis.', 95, NULL, 'https://image.tmdb.org/t/p/w500/p61wwD0jWfgbhg9Ja9uoDZdS8YE.jpg', '1992-09-02', 8.121, NULL),
(10, 575265, 'Mission: Impossible - The Final Reckoning', 'Ethan Hunt se rend à Londres avec son équipe dans l\'espoir de remonter la piste du mystérieux Gabriel, qu\'il a affronté deux mois auparavant à bort de l\'Orient-Express et qui détient la clé contrôlant l’intelligence artificielle toute puissante surnommée l\'Entité. Adulée par les uns, redoutée par les autres, l’Entité se distingue par sa capacité à prédire toutes les éventualités possibles. Elle connaît parfaitement les forces et faiblesses d’Ethan et de son équipe. Gabriel compte l\'utiliser pour mettre en œuvre son plan ultime : annihiler Ethan et son équipe, s’emparer de tous les systèmes de défense planétaires et déclencher la Troisième Guerre mondiale.', 163, NULL, 'https://image.tmdb.org/t/p/w500/cBIDJTJg4g0lSY79OcDMKamOJMk.jpg', '2025-05-17', 7.002, NULL),
(11, 35004, 'Order of Chaos', '', 90, NULL, 'https://image.tmdb.org/t/p/w500/eUh4IW873MWd3MeeoQhYPfwbf55.jpg', '2010-02-12', 4.62, NULL),
(13, 569094, 'Spider-Man : Across the Spider-Verse', 'Après avoir retrouvé Gwen Stacy, Spider-Man, le sympathique héros originaire de Brooklyn, est catapulté à travers le Multivers, où il rencontre une équipe de Spider-Héros chargée d\'en protéger l\'existence. Mais lorsque les héros s\'opposent sur la façon de gérer une nouvelle menace, Miles se retrouve confronté à eux et doit redéfinir ce que signifie être un héros afin de sauver les personnes qu\'il aime le plus.', 140, NULL, 'https://image.tmdb.org/t/p/w500/hvfwCeSTgsExmz9l31dKkfR83DH.jpg', '2023-05-31', 8.344, NULL),
(14, 900, 'L\'Impossible monsieur Bébé', 'David Huxley, un paléontologue, est fiancé à sa secrétaire Alice. Susan, rencontrée lors d\'une partie de golf, est également sensible au charme félin de David. Hélas, M. Bébé ne quitte pas la jeune femme d\'une semelle. Enfin, d\'une patte, car M. Bébé est un léopard...', 102, NULL, 'https://image.tmdb.org/t/p/w500/bIqLibVWopRn1RqRSyS3EvNDTtu.jpg', '1938-02-18', 7.528, NULL),
(15, 696, 'Manhattan', 'Isaac Davis est un auteur de sketches comiques new-yorkais de 42 ans que son épouse Jil vient de quitter. Celle-ci vit maintenant avec une autre femme, Connie, et écrit un livre sur son ancienne vie conjugale. Isaac, quant à lui, entretient avec une collégienne de 17 ans, Tracy, une liaison dont il lui rappelle le caractère éphémère. Il l\'abandonne bientôt pour se mettre en ménage avec Mary Wilke, la maîtresse de Yale Pollack, son meilleur ami.', 96, NULL, 'https://image.tmdb.org/t/p/w500/As4g0bORr4HmcKrv09SHtNYVH6l.jpg', '1979-04-25', 7.722, NULL),
(16, 552524, 'Lilo & Stitch', 'L’histoire touchante et drôle d’une petite fille hawaïenne solitaire et d’un extra-terrestre fugitif qui l’aide à renouer le lien avec sa famille.', 108, NULL, 'https://image.tmdb.org/t/p/w500/71IjwRa88OJMYJBntId7nn0eFHy.jpg', '2025-05-17', 7.029, NULL),
(17, 45896, 'Şara', '', 0, NULL, 'https://image.tmdb.org/t/p/w500/cGATlH5NYk2j5Glz7ub6j18PDT.jpg', '1999-01-01', 0, NULL),
(18, 58621, 'Léto s kovbojem', '', 89, NULL, 'https://image.tmdb.org/t/p/w500/a4qyVhrjvSTzSywqeMNqxkpAy5l.jpg', '1976-10-15', 5.5, NULL),
(28, 1233413, 'Sinners', 'Alors qu’ils cherchent à s’affranchir d’un lourd passé, deux frères jumeaux reviennent dans leur ville natale pour repartir à zéro. Mais ils comprennent qu’une puissance maléfique bien plus redoutable guette leur retour avec impatience.', 138, NULL, 'https://image.tmdb.org/t/p/w500/9ZmdDOIbiFCZOvRXBQ7muWUu32l.jpg', '2025-04-16', 7.516, NULL),
(29, 85295, 'Lesbian Truth or Dare', '', 132, NULL, 'https://image.tmdb.org/t/p/w500/2l5QehqPShBcdWOKVacvjeizApQ.jpg', '2008-10-08', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Type de notification (reservation, paiement, etc.)',
  `message` text NOT NULL COMMENT 'Contenu de la notification',
  `date_creation` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Date de création de la notification',
  `lue` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Indique si la notification a été lue',
  `client_id` int(11) NOT NULL COMMENT 'ID du client concerné',
  `reservation_id` int(11) DEFAULT NULL COMMENT 'ID de la réservation associée (peut être NULL)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `type`, `message`, `date_creation`, `lue`, `client_id`, `reservation_id`) VALUES
(1, 'reservation', 'Nouvelle réservation pour Spider-Man : Across the Spider-Verse (1 place)', '2025-05-30 23:18:39', 1, 1, 12),
(2, 'reservation', 'Nouvelle réservation pour Matrix (1 place)', '2025-05-30 23:19:00', 1, 1, 13),
(3, 'paiement', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-30 23:20:04', 1, 1, 12),
(4, 'reservation', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-30 23:20:04', 1, 1, 12),
(5, 'reservation', 'Nouvelle réservation pour Mission: Impossible - The Final Reckoning (1 place)', '2025-05-30 23:23:24', 1, 1, 14),
(6, 'paiement', 'Votre réservation pour Matrix a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-30 23:23:54', 1, 1, 13),
(7, 'reservation', 'Votre réservation pour Matrix a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-30 23:23:54', 1, 1, 13),
(8, 'paiement', 'Votre réservation pour Mission: Impossible - The Final Reckoning a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 00:31:46', 1, 1, 14),
(9, 'reservation', 'Votre réservation pour Mission: Impossible - The Final Reckoning a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 00:31:46', 1, 1, 14),
(10, 'paiement', 'Paiement validé pour votre réservation de Mission: Impossible - The Final Reckoning. Votre billet électronique est disponible.', '2025-05-31 00:32:27', 1, 1, 14),
(11, 'paiement', 'Paiement validé pour votre réservation de Mission: Impossible - The Final Reckoning. Votre billet électronique est disponible.', '2025-05-31 00:32:28', 1, 1, 14),
(12, 'paiement', 'Paiement validé pour votre réservation de Matrix. Votre billet électronique est disponible.', '2025-05-31 12:42:18', 1, 1, 13),
(13, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:18:52', 1, 1, 12),
(14, 'paiement', 'Paiement validé pour votre réservation de Mission: Impossible - The Final Reckoning. Votre billet électronique est disponible.', '2025-05-31 13:18:57', 1, 1, 11),
(15, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:18:57', 1, 1, 12),
(16, 'paiement', 'Paiement validé pour votre réservation de Mission: Impossible - The Final Reckoning. Votre billet électronique est disponible.', '2025-05-31 13:18:57', 1, 1, 11),
(17, 'paiement', 'Paiement validé pour votre réservation de Mission: Impossible - The Final Reckoning. Votre billet électronique est disponible.', '2025-05-31 13:18:57', 1, 1, 11),
(18, 'paiement', 'Paiement validé pour votre réservation de Mission: Impossible - The Final Reckoning. Votre billet électronique est disponible.', '2025-05-31 13:18:57', 1, 1, 11),
(19, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:18:58', 1, 1, 12),
(20, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:02', 1, 1, 12),
(21, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:03', 1, 3, 8),
(22, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:03', 1, 3, 8),
(23, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:04', 1, 3, 8),
(24, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:07', 1, 1, 12),
(25, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:20', 1, 3, 8),
(26, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:21', 1, 3, 10),
(27, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:19:30', 1, 3, 8),
(28, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 13:20:00', 1, 1, 12),
(29, 'reservation', 'Nouvelle réservation pour Spider-Man : Across the Spider-Verse (1 place)', '2025-05-31 16:24:59', 0, 1, 15),
(30, 'paiement', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 16:25:10', 0, 1, 15),
(31, 'reservation', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 16:25:10', 0, 1, 15),
(32, 'reservation', 'Nouvelle réservation pour Matrix (1 place)', '2025-05-31 16:34:52', 0, 1, 16),
(33, 'paiement', 'Votre réservation pour Matrix a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 16:35:04', 0, 1, 16),
(34, 'reservation', 'Votre réservation pour Matrix a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 16:35:04', 0, 1, 16),
(35, 'reservation', 'Nouvelle réservation pour Spider-Man : Across the Spider-Verse (5 places)', '2025-05-31 16:52:47', 0, 2, 17),
(36, 'paiement', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 16:52:55', 0, 2, 17),
(37, 'reservation', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-05-31 16:52:55', 0, 2, 17),
(38, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-05-31 16:53:41', 0, 2, 17),
(39, 'paiement', 'Paiement validé pour votre réservation de Matrix. Votre billet électronique est disponible.', '2025-06-01 19:41:24', 0, 1, 16),
(40, 'reservation', 'Nouvelle réservation pour Spider-Man : Across the Spider-Verse (1 place)', '2025-06-01 19:58:51', 1, 3, 18),
(41, 'paiement', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-06-01 22:20:45', 1, 3, 18),
(42, 'reservation', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-06-01 22:20:45', 1, 3, 18),
(43, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-06-01 22:20:50', 1, 3, 18),
(44, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-06-01 22:27:25', 0, 1, 15),
(45, 'reservation', 'Nouvelle réservation pour Spider-Man : Across the Spider-Verse (1 place)', '2025-06-01 22:27:57', 1, 3, 19),
(46, 'reservation', 'Nouvelle réservation pour Spider-Man : Across the Spider-Verse (1 place)', '2025-06-01 22:45:35', 1, 3, 20),
(47, 'paiement', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-06-01 22:45:44', 1, 3, 19),
(48, 'reservation', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-06-01 22:45:44', 1, 3, 19),
(49, 'paiement', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-06-01 22:45:48', 1, 3, 20),
(50, 'reservation', 'Votre réservation pour Spider-Man : Across the Spider-Verse a été confirmée. Vous pouvez maintenant procéder au paiement.', '2025-06-01 22:45:48', 0, 3, 20),
(51, 'paiement', 'Paiement validé pour votre réservation de Spider-Man : Across the Spider-Verse. Votre billet électronique est disponible.', '2025-06-01 22:46:30', 1, 3, 19);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `montant` float NOT NULL,
  `statut` enum('en attente','paye','echoue') DEFAULT 'en attente',
  `transaction_id` varchar(255) DEFAULT NULL,
  `mode` enum('carte','mobile_money','paypal','crypto') NOT NULL,
  `date_paiement` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `seance_id` int(11) NOT NULL,
  `nombre_places` int(11) NOT NULL,
  `montant_total` float NOT NULL,
  `statut` enum('en attente','confirme','paye','annule') DEFAULT 'en attente',
  `qr_code_path` varchar(100) NOT NULL,
  `qr_scanned` tinyint(1) DEFAULT 0,
  `transaction_id` varchar(255) DEFAULT NULL,
  `mode_paiement` enum('carte','mobile_money','paypal') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `client_id`, `seance_id`, `nombre_places`, `montant_total`, `statut`, `qr_code_path`, `qr_scanned`, `transaction_id`, `mode_paiement`) VALUES
(1, 1, 2, 2, 30, 'paye', 'static/qrcodes/reservation_1.png', 1, NULL, NULL),
(2, 1, 2, 2, 30, 'paye', 'static/qrcodes/reservation_2.png', 0, NULL, NULL),
(3, 1, 2, 2, 30, 'paye', 'static/qrcodes/reservation_3.png', 0, 'pi_3RTUjuQ5mo3mNeO72AbLgmSr', 'carte'),
(4, 1, 2, 2, 30, 'paye', '', 1, 'pi_3RPv4NQ5mo3mNeO707s7L1aE', 'carte'),
(5, 1, 2, 2, 30, 'paye', 'static/qrcodes/reservation_5.png', 1, 'pi_3RPvAKQ5mo3mNeO70Clq6RuJ', 'carte'),
(6, 2, 6, 8, 40000, 'paye', 'static/qrcodes/reservation_6.png', 0, 'pi_3RTUlQQ5mo3mNeO72kTsf2Sl', 'carte'),
(7, 3, 5, 2, 6000, 'paye', 'static/qrcodes/reservation_7.png', 0, 'pi_3RUG2pQ5mo3mNeO71itIEv1D', 'carte'),
(8, 3, 5, 1, 3000, 'paye', 'static/qrcodes/reservation_8.png', 0, 'pi_3RUpJuQ5mo3mNeO70jvHY17l', 'carte'),
(9, 3, 5, 1, 3000, 'paye', 'static/qrcodes/reservation_9.png', 0, 'pi_3RUc8QQ5mo3mNeO72tPRij7h', 'carte'),
(10, 3, 5, 1, 3000, 'paye', 'static/qrcodes/reservation_10.png', 0, 'pi_3RUpJmQ5mo3mNeO70ODWWrXy', 'carte'),
(11, 1, 4, 1, 2000, 'paye', 'static/qrcodes/reservation_11.png', 0, 'pi_3RUpJMQ5mo3mNeO72n9JUiOP', 'carte'),
(12, 1, 5, 1, 3000, 'paye', 'static/qrcodes/reservation_12.png', 0, 'pi_3RUpKPQ5mo3mNeO70dKMlcxe', 'carte'),
(13, 1, 3, 1, 5000, 'paye', 'static/qrcodes/reservation_13.png', 0, 'pi_3RUojvQ5mo3mNeO70movi3ti', 'carte'),
(14, 1, 4, 1, 2000, 'paye', 'static/qrcodes/reservation_14.png', 0, 'pi_3RUdLcQ5mo3mNeO726APHzL7', 'carte'),
(15, 1, 5, 1, 3000, 'paye', 'static/qrcodes/reservation_15.png', 0, 'pi_3RVKLhQ5mo3mNeO72UQmJmxL', 'carte'),
(16, 1, 7, 1, 2500, 'paye', 'static/qrcodes/reservation_16.png', 0, 'pi_3RVHl2Q5mo3mNeO72CuHn3k8', 'carte'),
(17, 2, 5, 5, 15000, 'paye', 'static/qrcodes/reservation_17.png', 0, 'pi_3RUsfCQ5mo3mNeO70oFXPiEP', 'carte'),
(18, 3, 5, 1, 3000, 'paye', 'static/qrcodes/reservation_18.png', 0, 'pi_3RVKFKQ5mo3mNeO71RKXAcKg', 'carte'),
(19, 3, 5, 1, 3000, 'paye', 'static/qrcodes/reservation_19.png', 0, 'pi_3RVKeAQ5mo3mNeO703tDOEqO', 'carte'),
(20, 3, 5, 1, 3000, 'confirme', 'placeholder.png', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `nom_salle` varchar(50) NOT NULL,
  `capacite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `nom_salle`, `capacite`) VALUES
(2, 'Salle Premium', 152),
(3, 'Salle Cosmos', 200),
(4, 'Salle Satelite', 90);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `date_heure` datetime NOT NULL,
  `salle_id` int(11) NOT NULL,
  `prix` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id`, `film_id`, `date_heure`, `salle_id`, `prix`) VALUES
(2, 1, '2025-05-25 23:20:00', 2, 2000),
(3, 6, '2025-05-26 21:00:00', 3, 5000),
(4, 10, '2025-05-28 15:00:00', 3, 2000),
(5, 13, '2025-05-27 21:00:00', 3, 3000),
(6, 16, '2025-06-02 21:00:00', 3, 5000),
(7, 6, '2025-06-02 19:00:00', 3, 2500),
(9, 28, '2025-06-02 23:00:00', 4, 1500);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_tmdb` (`id_tmdb`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `idx_client` (`client_id`),
  ADD KEY `idx_date` (`date_creation`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `seance_id` (`seance_id`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_salle` (`nom_salle`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `fk_salle` (`salle_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `paiement_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`seance_id`) REFERENCES `seance` (`id`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `fk_salle` FOREIGN KEY (`salle_id`) REFERENCES `salle` (`id`),
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
