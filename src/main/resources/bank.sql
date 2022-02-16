-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 16 fév. 2022 à 20:32
-- Version du serveur :  10.4.18-MariaDB-log
-- Version de PHP : 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bank`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `code` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`code`, `email`, `nom`) VALUES
(1, 'Khalil@gmail.com', 'KHALIL'),
(2, 'Oussa@gmail.com', 'OUSSAMA'),
(3, 'abdo@gmail.com', 'NIYA');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `type_cpte` varchar(2) NOT NULL,
  `code_compte` varchar(255) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `solde` double NOT NULL,
  `decouvert` double DEFAULT NULL,
  `taux` double DEFAULT NULL,
  `code_cli` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`type_cpte`, `code_compte`, `date_creation`, `solde`, `decouvert`, `taux`, `code_cli`) VALUES
('CC', 'code1', '2022-02-16 20:13:16', 9000, 6000, NULL, 1),
('CC', 'code2', '2022-02-16 20:13:16', 8000, 6000, NULL, 2),
('CC', 'code3', '2022-02-16 20:13:16', 7000, 6000, NULL, 3),
('CE', 'code4', '2022-02-16 20:13:16', 5000, NULL, 5, 1),
('CE', 'code5', '2022-02-16 20:13:16', 4000, NULL, 6, 2),
('CE', 'code6', '2022-02-16 20:13:16', 3000, NULL, 7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(13);

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation` (
  `type_op` varchar(1) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `date_operation` datetime DEFAULT NULL,
  `montant` double NOT NULL,
  `code_cpte` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `operation`
--

INSERT INTO `operation` (`type_op`, `numero`, `date_operation`, `montant`, `code_cpte`) VALUES
('V', 1, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 2, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 3, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 4, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 5, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 6, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 7, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 8, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 9, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 10, '2022-02-16 20:13:16', 3000, 'code1'),
('V', 11, '2022-02-16 20:13:16', 2000, 'code2'),
('R', 12, '2022-02-16 20:13:16', 1000, 'code3');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`username`, `password`, `active`) VALUES
('a', '123', 1),
('admin', 'admin', 1),
('b', '123', 0),
('hassan', 'admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_roles`
--

CREATE TABLE `users_roles` (
  `username` varchar(25) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users_roles`
--

INSERT INTO `users_roles` (`username`, `role`) VALUES
('a', 'ADMIN'),
('admin', 'ADMIN'),
('b', 'USER'),
('hassan', 'USER');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`code_compte`),
  ADD KEY `FK2hw4shqsxc782lychpkr52lmv` (`code_cli`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `FKkr9nfjf0ipqrw5xwcf9jqq6gv` (`code_cpte`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`username`,`role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `code` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `FK2hw4shqsxc782lychpkr52lmv` FOREIGN KEY (`code_cli`) REFERENCES `client` (`code`);

--
-- Contraintes pour la table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `FKkr9nfjf0ipqrw5xwcf9jqq6gv` FOREIGN KEY (`code_cpte`) REFERENCES `compte` (`code_compte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
