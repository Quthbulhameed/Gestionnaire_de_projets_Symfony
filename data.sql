-- Adminer 4.8.1 MySQL 8.0.31 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `invite`;
CREATE TABLE `invite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projet_id` int DEFAULT NULL,
  `tache_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `projet_id` (`projet_id`),
  KEY `tache_id` (`tache_id`),
  CONSTRAINT `invite_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`),
  CONSTRAINT `invite_ibfk_2` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`),
  CONSTRAINT `invite_ibfk_3` FOREIGN KEY (`tache_id`) REFERENCES `tache` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `invite` (`id`, `email`, `projet_id`, `tache_id`) VALUES
(1,	'qhameed20@outlook.com',	4,	NULL),
(2,	'qhameed20@outlook.com',	4,	NULL),
(3,	'qhameed20@outlook.com',	4,	NULL),
(4,	'qhameed20@outlook.com',	4,	NULL),
(5,	'qhameed20@outlook.com',	4,	NULL),
(6,	'urbanisme1@urbanisme1.com',	3,	NULL),
(7,	'urbanisme1@urbanisme1.com',	3,	NULL),
(8,	'urbanisme1@urbanisme1.com',	3,	NULL),
(9,	'urbanisme1@urbanisme1.com',	3,	NULL),
(10,	'urbanisme1@urbanisme1.com',	3,	NULL),
(11,	'urbanisme1@urbanisme1.com',	3,	NULL),
(12,	'urbanisme1@urbanisme1.com',	3,	NULL),
(15,	'qhameed20@outlook.com',	3,	NULL),
(18,	'urbanisme1@urbanisme1.com',	3,	NULL),
(19,	'urbanisme1@urbanisme1.com',	3,	NULL),
(20,	'jeunesse1@jeunesse1.com',	3,	NULL),
(21,	'qhameed20@outlook.com',	3,	NULL),
(22,	'jeunesse1@jeunesse1.com',	11,	NULL),
(23,	'urbanisme1@urbanisme1.com',	26,	NULL);

DROP TABLE IF EXISTS `priorite`;
CREATE TABLE `priorite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `priorite` (`id`, `nom`) VALUES
(1,	'Basse'),
(2,	'Normale'),
(3,	'Haute');

DROP TABLE IF EXISTS `projet`;
CREATE TABLE `projet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projet_utilisateur` (`utilisateur_id`),
  CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projet` (`id`, `nom`, `description`, `date_debut`, `date_fin`, `utilisateur_id`) VALUES
(3,	'culture1',	'zz',	'2023-07-29',	'2023-07-20',	2),
(4,	'Quthbulhameed Djiavoudine',	'dddddddddddd',	'2023-07-06',	'2023-07-08',	2),
(5,	'Quthbulhameed Djiavoudine',	'zz',	'2023-07-06',	'2023-07-08',	2),
(6,	'Quthbulhameed Djiavoudine',	'zz',	'2023-07-06',	'2023-07-08',	2),
(7,	'Quthbulhameed Djiavoudine',	'zz',	'2023-07-06',	'2023-07-08',	2),
(9,	'urbanisme1',	'zz',	'2023-07-04',	'2023-07-14',	2),
(10,	'urbanisme1',	'zz',	'2023-07-04',	'2023-07-14',	2),
(11,	'bobo',	'zz',	'2023-07-07',	'2023-06-29',	2),
(12,	'bobo',	'zz',	'2023-07-07',	'2023-06-29',	2),
(17,	'sss',	'ssss',	'2023-07-06',	'2023-07-04',	2),
(18,	'Quthbulhameed Djiavoudine',	'zz',	'2023-07-07',	'2023-09-16',	2),
(20,	'culture1',	'test1',	'2023-07-03',	'2023-07-09',	1),
(21,	'Entreprise projet',	'test17',	'2023-07-06',	'2023-07-09',	1),
(24,	'gallimedia',	'gallie',	'2023-07-08',	'2023-07-16',	2),
(26,	'test1',	'test11',	'2023-07-09',	'2023-07-10',	1),
(27,	'aa',	'qqq',	'2023-07-26',	'2023-07-29',	4);

DROP TABLE IF EXISTS `statut`;
CREATE TABLE `statut` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `statut` (`id`, `nom`) VALUES
(1,	'A faire'),
(2,	'En cours'),
(3,	'Terminée'),
(4,	'Bloque');

DROP TABLE IF EXISTS `tache`;
CREATE TABLE `tache` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_echeance` date NOT NULL,
  `priorite_id` int NOT NULL,
  `statut_id` int NOT NULL,
  `projet_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tache_projet` (`projet_id`),
  KEY `fk_tache_priorite` (`priorite_id`),
  KEY `fk_tache_statut` (`statut_id`),
  CONSTRAINT `fk_tache_priorite` FOREIGN KEY (`priorite_id`) REFERENCES `priorite` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tache_projet` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tache_statut` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tache` (`id`, `nom`, `description`, `date_echeance`, `priorite_id`, `statut_id`, `projet_id`) VALUES
(2,	'jeunesse1',	'ss',	'2025-02-07',	3,	1,	20),
(3,	'Quthbulhameed Djiavoudine',	'qq',	'2023-06-28',	1,	1,	20),
(28,	'qq',	'qq\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'\'',	'2023-07-26',	2,	2,	3),
(29,	'php',	'yy',	'2023-07-31',	2,	2,	20),
(30,	'drupal2hameed',	't',	'2023-07-31',	2,	3,	20),
(33,	'test2',	'test2',	'2023-08-01',	3,	4,	26);

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `jour_date` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`) VALUES
(1,	'qhameed20@outlook.com',	'[]',	'$2y$13$0foMh01mHipD4yWE/IXQpO7mzDzAyK4pRwyYViyKb20nBDuMNa2JK',	'Quthbulhameed Djiavoudine'),
(2,	'urbanisme1@urbanisme1.com',	'[]',	'$2y$13$ORYpF4kNdaWOnP0PTU/Tzed1BieD7P.f30.gwaH1zhqpIgEfZRtgC',	'urbanisme1'),
(3,	'jeunesse1@jeunesse1.com',	'[]',	'$2y$13$qM0X7KvF/tnzZKW0IIGHpOFLui6ERD6zC7vrNeRyJi/XI.ZLmkbLu',	'ffff'),
(4,	'test@test.com',	'[]',	'$2y$13$2Qtj963RMUfXK.idr6TctuiNYYHjTwbPI6KS6QtWx0/ith8tTCLPK',	'test');

-- 2023-07-09 17:24:05
