-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 28-Nov-2024 às 13:08
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `jogos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabuleiro`
--

DROP TABLE IF EXISTS `tabuleiro`;
CREATE TABLE IF NOT EXISTS `tabuleiro` (
  `id_tabuleiro` int NOT NULL AUTO_INCREMENT,
  `nome_do_jogo` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `numero_de_jogadores` int NOT NULL,
  `duracao` int NOT NULL,
  PRIMARY KEY (`id_tabuleiro`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tabuleiro`
--

INSERT INTO `tabuleiro` (`id_tabuleiro`, `nome_do_jogo`, `categoria`, `numero_de_jogadores`, `duracao`) VALUES
(4, 'Dixit', 'Party', 6, 30),
(3, 'Ticket to Ride', 'Estratégia', 5, 60),
(2, 'Monopoly', 'Família', 6, 120),
(11, 'Betrayal at House on the Hill', 'Horror', 6, 60),
(1, 'Catan', 'Estratégia', 4, 90),
(6, 'Carcassonne', 'Estratégia', 5, 35),
(7, 'Chess', 'Clássico', 2, 60),
(8, 'Risk', 'Estratégia', 6, 120),
(9, 'Uno', 'Família', 10, 20),
(10, 'Scrabble', 'Palavras', 4, 50),
(12, 'Splendor', 'Estratégia', 4, 30),
(13, 'Azul', 'Abstrato', 4, 45),
(14, '7 Wonders', 'Civilização', 7, 30),
(15, 'Clue', 'Mistério', 6, 45),
(16, 'Agricola', 'Estratégia', 5, 120),
(17, 'Scythe', 'Estratégia', 7, 115),
(18, 'Codenames', 'Party', 8, 15),
(19, 'Terraforming Mars', 'Estratégia', 5, 120),
(20, 'The Resistance', 'Bluffing', 10, 30),
(21, 'Love Letter', 'Estratégia', 4, 20),
(22, 'King of Tokyo', 'Party', 6, 30),
(23, 'Dominion', 'Deck-building', 4, 45),
(24, 'Bang!', 'Party', 8, 20),
(25, 'Takenoko', 'Família', 4, 45),
(26, 'Mage Knight', 'Aventura', 4, 240),
(29, 'Small World', 'Estratégia', 5, 80),
(30, 'Kingdomino', 'Família', 4, 20),
(31, 'Santorini', 'Abstrato', 2, 20),
(32, 'Blood Rage', 'Estratégia', 4, 90),
(33, 'Eldritch Horror', 'Cooperativo', 8, 240),
(34, 'Sheriff of Nottingham', 'Party', 5, 60),
(36, 'Concept', 'Party', 12, 40),
(37, 'Puerto Rico', 'Estratégia', 5, 90),
(38, 'Go', 'Clássico', 2, 60),
(39, 'Gloomhaven', 'Aventura', 4, 180),
(40, 'Spirit Island', 'Cooperativo', 4, 120),
(41, 'T.I.M.E Stories', 'Aventura', 4, 120),
(42, 'Power Grid', 'Econômico', 6, 120),
(43, 'Patchwork', 'Abstrato', 2, 30),
(44, 'Mystic Vale', 'Deck-building', 4, 45),
(45, 'Galaxy Trucker', 'Espaço', 4, 60),
(46, 'Forbidden Island', 'Cooperativo', 4, 30),
(47, 'Forbidden Desert', 'Cooperativo', 5, 45),
(48, 'Arkham Horror', 'Cooperativo', 8, 180),
(49, 'The Castles of Burgundy', 'Estratégia', 4, 90),
(50, 'Grand Austria Hotel', 'Econômico', 4, 120),
(51, 'Viticulture', 'Econômico', 6, 90),
(52, 'Ra', 'Leilão', 5, 60),
(53, 'Cyclades', 'Estratégia', 5, 90),
(54, 'The Crew', 'Cooperativo', 5, 20),
(55, 'Race for the Galaxy', 'Espaço', 5, 60),
(56, 'Robinson Crusoe', 'Cooperativo', 4, 120),
(57, 'Tzolk\'in: The Mayan Calendar', 'Estratégia', 4, 90),
(58, 'Concordia', 'Estratégia', 5, 120),
(59, 'Mysterium', 'Cooperativo', 7, 40),
(60, 'Architects of the West Kingdom', 'Estratégia', 5, 80),
(61, 'Jaipur', 'Cartas', 2, 30),
(62, 'Alhambra', 'Construção', 6, 60),
(63, 'Terraforming Mars: Ares Expedition', 'Estratégia', 4, 60),
(64, 'The Quacks of Quedlinburg', 'Família', 5, 45),
(65, 'Cartographers', 'Desenho', 8, 30),
(66, 'Hanabi', 'Cooperativo', 5, 25),
(67, 'Wingspan', 'Estratégia', 5, 70),
(68, 'Gizmos', 'Família', 4, 45),
(69, 'Targi', 'Estratégia', 2, 60),
(70, 'Clank!', 'Aventura', 4, 90),
(71, 'Azul: Summer Pavilion', 'Abstrato', 4, 40),
(72, 'Dice Forge', 'Família', 4, 45),
(73, 'Machi Koro', 'Família', 4, 30),
(74, 'Splendor Marvel', 'Estratégia', 4, 30),
(75, 'Onitama', 'Abstrato', 2, 15),
(76, 'Root', 'Estratégia', 4, 90),
(77, 'Century: Spice Road', 'Econômico', 5, 45),
(78, 'Lords of Waterdeep', 'Estratégia', 5, 120),
(79, 'The Mind', 'Cooperativo', 4, 15),
(80, 'Telestrations', 'Party', 12, 30),
(81, 'Colt Express', 'Aventura', 6, 40),
(82, 'Escape: The Curse of the Temple', 'Cooperativo', 5, 10),
(83, 'Space Alert', 'Cooperativo', 5, 30),
(84, 'Nemesis', 'Horror', 5, 180),
(85, 'Isle of Skye', 'Estratégia', 5, 60),
(86, 'Raiders of the North Sea', 'Estratégia', 4, 80),
(87, 'Hansa Teutonica', 'Estratégia', 5, 90),
(88, 'The Game', 'Cooperativo', 5, 20),
(89, 'Red7', 'Cartas', 4, 10),
(90, 'Love Letter: Batman', 'Estratégia', 4, 20),
(91, 'Quest for El Dorado', 'Estratégia', 4, 45),
(92, 'Escape Plan', 'Estratégia', 5, 120),
(93, 'Bang! The Dice Game', 'Party', 8, 15),
(94, 'Adventure Island', 'Cooperativo', 5, 90),
(95, 'Expedition', 'Exploração', 4, 60),
(96, 'Food Chain Magnate', 'Econômico', 5, 240),
(97, 'Fury of Dracula', 'Horror', 5, 180),
(98, 'Star Realms', 'Deck-building', 2, 20),
(99, 'Decrypto', 'Party', 8, 30),
(100, 'Newton', 'Estratégia', 4, 90),
(101, 'Fort', 'Família', 4, 45),
(102, 'Harry Potter: Hogwarts Battle', 'Cooperativo', 4, 60),
(103, 'Cryptid', 'Mistério', 5, 60),
(104, 'Medici', 'Leilão', 6, 60),
(105, 'Saboteur', 'Party', 10, 30),
(106, 'Ark Nova', 'Construção', 4, 150),
(107, 'Potion Explosion', 'Família', 4, 30),
(108, 'Seasons', 'Estratégia', 4, 60),
(109, 'Detective: A Modern Crime Board Game', 'Mistério', 5, 120),
(110, 'Dune', 'Estratégia', 6, 180),
(111, 'Aeon\'s End', 'Cooperativo', 4, 60),
(112, 'Ora et Labora', 'Construção', 4, 180),
(113, 'Keyflower', 'Estratégia', 6, 120),
(114, 'Roll for the Galaxy', 'Espaço', 5, 45),
(115, 'Imperial Settlers', 'Estratégia', 4, 90),
(116, 'The Gallerist', 'Econômico', 4, 120),
(117, 'Pandemic: Iberia', 'Cooperativo', 5, 45),
(118, 'Escape from the Aliens in Outer Space', 'Mistério', 8, 45),
(119, 'Rising Sun', 'Estratégia', 5, 120),
(120, 'Terraforming Mars: Prelude', 'Expansão', 5, 20);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
