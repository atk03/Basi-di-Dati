-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Set 11, 2017 alle 16:38
-- Versione del server: 10.0.31-MariaDB-0ubuntu0.16.04.2
-- Versione PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpatan-PR`
--

DELIMITER $$
--
-- Funzioni
--
CREATE DEFINER=`rpatan`@`localhost` FUNCTION `NumeroAscolti` (`numTessera` INTEGER) RETURNS INT(11) BEGIN

    DECLARE Ascolti INT;

    SELECT COUNT(utente)
    FROM Ascolto
    WHERE utente=numTessera INTO Ascolti;

    RETURN Ascolti;
END$$

CREATE DEFINER=`rpatan`@`localhost` FUNCTION `NumeroAscoltiAlbum` (`AlbumID` INT) RETURNS INT(11) BEGIN

DECLARE Ascolti INT;

SELECT COUNT(Ascolto.traccia) 
FROM Ascolto JOIN Canzone ON Ascolto.traccia=Canzone.id_canzone
JOIN Album ON Canzone.Album=Album.id_album
WHERE id_album=AlbumID INTO Ascolti ;

RETURN Ascolti;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Album`
--

CREATE TABLE `Album` (
  `id_album` int(11) NOT NULL,
  `artista` varchar(50) DEFAULT NULL,
  `titolo` varchar(50) DEFAULT NULL,
  `numero_tracce` int(11) DEFAULT NULL,
  `anno` int(11) DEFAULT NULL,
  `genere` varchar(50) DEFAULT NULL,
  `etichetta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Album`
--

INSERT INTO `Album` (`id_album`, `artista`, `titolo`, `numero_tracce`, `anno`, `genere`, `etichetta`) VALUES
(110, 'Joy Division', 'Love Will Tear Us Apart', 1, 1980, 'Post-Punk', 'Factory'),
(111, 'Nick Cave', 'Skeleton Tree', 8, 2016, 'Alternative', 'Bad Seed Ltd'),
(112, 'Nick Cave', 'From Her to Eternity', 7, 1984, 'Post-Punk', 'Mute Records'),
(113, 'Bon Iver', 'Bon Iver', 5, 2011, 'Folk', 'Jagjaguwar'),
(114, 'Bon Iver', '33 GOD', 1, 2016, 'Alternative', 'Jagjaguwar'),
(115, 'Grouper', 'Ruins', 4, 2014, 'Ambient', 'Kranky'),
(116, 'Coil', 'Love Secret Domain', 4, 1991, 'Noise', 'Vax Trax'),
(117, 'Zu', 'Bromio', 3, 1999, 'Noise', 'Wide Records');

-- --------------------------------------------------------

--
-- Struttura della tabella `Artista`
--

CREATE TABLE `Artista` (
  `nome_d_arte` varchar(50) NOT NULL,
  `anno_inizio` int(4) DEFAULT NULL,
  `anno_fine` int(4) DEFAULT NULL,
  `numero_componenti` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Artista`
--

INSERT INTO `Artista` (`nome_d_arte`, `anno_inizio`, `anno_fine`, `numero_componenti`) VALUES
('Bon Iver', 2007, NULL, 1),
('Coil', 1984, 2004, 1),
('Grouper', 2005, NULL, 1),
('Joy Division', 1977, 1980, 4),
('Nick Cave', 1973, NULL, 1),
('Zu', 1997, NULL, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `Artista_Strumento`
--

CREATE TABLE `Artista_Strumento` (
  `nome_band` varchar(50) NOT NULL DEFAULT '',
  `nome_strumento` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Artista_Strumento`
--

INSERT INTO `Artista_Strumento` (`nome_band`, `nome_strumento`) VALUES
('Bon Iver', 'Basso'),
('Bon Iver', 'Chitarra'),
('Bon Iver', 'Pianoforte'),
('Bon Iver', 'Synth'),
('Coil', 'Basso'),
('Coil', 'Chitarra'),
('Grouper', 'Chitarra'),
('Grouper', 'Synth'),
('Joy Division', 'Basso'),
('Joy Division', 'Batteria'),
('Joy Division', 'Chitarra'),
('Nick Cave', 'Chitarra'),
('Nick Cave', 'Pianoforte'),
('Zu', 'Basso'),
('Zu', 'Batteria'),
('Zu', 'Chitarra');

-- --------------------------------------------------------

--
-- Struttura della tabella `Ascolto`
--

CREATE TABLE `Ascolto` (
  `utente` int(11) NOT NULL DEFAULT '0',
  `traccia` int(11) NOT NULL DEFAULT '0',
  `data_ascolto` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Ascolto`
--

INSERT INTO `Ascolto` (`utente`, `traccia`, `data_ascolto`) VALUES
(100, 211, '2017-01-01'),
(100, 221, '2017-01-01'),
(100, 222, '2017-01-01'),
(100, 222, '2017-03-15'),
(100, 242, '2017-03-15'),
(110, 211, '2017-02-05'),
(110, 221, '2017-01-05'),
(110, 242, '2017-03-15'),
(110, 245, '2017-03-11'),
(110, 245, '2017-03-15'),
(110, 245, '2017-05-14'),
(120, 215, '2017-04-25'),
(120, 219, '2017-07-18'),
(120, 227, '2017-04-24'),
(120, 229, '2017-07-18'),
(120, 238, '2017-04-24'),
(120, 239, '2017-04-25'),
(130, 233, '2017-03-08'),
(130, 237, '2017-04-25'),
(130, 238, '2017-02-18'),
(130, 238, '2017-03-08'),
(140, 219, '2017-08-15'),
(140, 222, '2017-08-15'),
(140, 227, '2017-08-19'),
(140, 239, '2017-02-18'),
(150, 221, '2017-01-05'),
(150, 227, '2017-01-05'),
(150, 233, '2017-02-25'),
(150, 234, '2017-06-12'),
(150, 238, '2017-02-25'),
(150, 245, '2017-09-01'),
(160, 232, '2017-04-09'),
(160, 237, '2017-04-09'),
(160, 240, '2017-04-12');

-- --------------------------------------------------------

--
-- Struttura della tabella `Canzone`
--

CREATE TABLE `Canzone` (
  `id_canzone` int(11) NOT NULL,
  `titolo` varchar(50) DEFAULT NULL,
  `durata` time DEFAULT NULL,
  `esplicita` tinyint(1) DEFAULT NULL,
  `numero_traccia` int(11) DEFAULT NULL,
  `album` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Canzone`
--

INSERT INTO `Canzone` (`id_canzone`, `titolo`, `durata`, `esplicita`, `numero_traccia`, `album`) VALUES
(211, 'Jesus Alone', '00:03:33', 0, 1, 111),
(212, 'Rings of Saturn', '00:02:45', 0, 2, 111),
(213, 'Girl in Amber', '00:03:59', 0, 3, 111),
(214, 'Magneto', '00:04:42', 0, 4, 111),
(215, 'Anthrocene', '00:05:21', 0, 5, 111),
(216, 'I Need You', '00:06:15', 0, 6, 111),
(217, 'Distant Sky', '00:03:47', 0, 7, 111),
(218, 'Skeleton Tree', '00:03:43', 0, 8, 111),
(219, 'Cabin Fever', '00:02:45', 0, 2, 112),
(220, 'Well of Misery', '00:03:59', 0, 3, 112),
(221, 'From Her to Eternity', '00:04:42', 0, 4, 112),
(222, 'Sint Hack', '00:05:21', 0, 5, 112),
(223, 'Wing off Files', '00:06:15', 0, 6, 112),
(224, 'A Box for Black Paul', '00:03:47', 0, 7, 112),
(225, 'Avalanche', '00:03:33', 0, 1, 112),
(226, 'Perth', '00:03:33', 0, 1, 113),
(227, 'Holocene', '00:03:59', 0, 3, 113),
(228, 'Towers', '00:04:42', 0, 4, 113),
(229, 'Michicant', '00:05:21', 0, 5, 113),
(230, 'Minnesota', '00:02:45', 0, 2, 113),
(231, '33 GOD', '00:03:33', 1, 1, 114),
(232, 'Clearing', '00:02:45', 0, 2, 115),
(233, 'Holding', '00:03:59', 0, 3, 115),
(234, 'Made of Air', '00:04:42', 0, 4, 115),
(235, 'Love Will Tear Us Apart', '00:03:37', 0, 1, 110),
(236, 'Disco Hospital', '00:03:33', 1, 1, 116),
(237, 'The Snow', '00:02:45', 1, 2, 116),
(238, 'Titan Arch', '00:03:59', 1, 3, 116),
(239, 'Dark River', '00:04:42', 1, 4, 116),
(240, 'Detonatore', '00:03:33', 0, 1, 117),
(241, 'Xenitis', '00:02:45', 0, 2, 117),
(242, 'Testa di Cane', '00:03:59', 0, 3, 117),
(245, 'Made of Metal', '00:03:33', 0, 1, 115);

--
-- Trigger `Canzone`
--
DELIMITER $$
CREATE TRIGGER `insertCanzone` AFTER INSERT ON `Canzone` FOR EACH ROW BEGIN

UPDATE Album SET numero_tracce=(SELECT COUNT(id_canzone) FROM Canzone WHERE album=id_album) ;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Cliente`
--

CREATE TABLE `Cliente` (
  `numero_carta` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `sesso` varchar(50) DEFAULT NULL,
  `anno` int(4) DEFAULT NULL,
  `nazione` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Cliente`
--

INSERT INTO `Cliente` (`numero_carta`, `nome`, `cognome`, `sesso`, `anno`, `nazione`) VALUES
(100, 'Alba', 'Gobbo', 'Femmina', 1993, 'Italia'),
(110, 'Maria', 'Boldo', 'Femmina', 1996, 'Italia'),
(120, 'Brian', 'Warner', 'Maschio', 1969, 'USA'),
(130, 'Etienne', 'Pixa', 'Maschio', 1970, 'Francia'),
(140, 'Beto', 'Rea', 'Maschio', 1976, 'Messico'),
(150, 'Stanis', 'LaRochelle', 'Maschio', 1978, 'Inghilterra'),
(160, 'Gloria', 'Delgado', 'Femmina', 1980, 'Colombia');

-- --------------------------------------------------------

--
-- Struttura della tabella `Collaborazione`
--

CREATE TABLE `Collaborazione` (
  `playlist` int(11) NOT NULL DEFAULT '0',
  `cliente` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Collaborazione`
--

INSERT INTO `Collaborazione` (`playlist`, `cliente`) VALUES
(700, 110),
(701, 150),
(703, 130);

--
-- Trigger `Collaborazione`
--
DELIMITER $$
CREATE TRIGGER `NuovaCollabo` BEFORE INSERT ON `Collaborazione` FOR EACH ROW begin
  IF(new.cliente=(SELECT creatore FROM Playlist WHERE new.playlist=id_playlist)) 
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'ERRORE il nuovo collaboratore e anche il creatore';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Composizione`
--

CREATE TABLE `Composizione` (
  `canzone` int(11) NOT NULL DEFAULT '0',
  `playlist` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Composizione`
--

INSERT INTO `Composizione` (`canzone`, `playlist`) VALUES
(211, 700),
(221, 700),
(221, 702),
(222, 700),
(227, 702),
(232, 703),
(233, 701),
(233, 703),
(234, 702),
(237, 703),
(238, 701),
(240, 703),
(245, 700),
(245, 701);

-- --------------------------------------------------------

--
-- Struttura della tabella `Genere`
--

CREATE TABLE `Genere` (
  `nome` varchar(50) NOT NULL,
  `nazione` varchar(50) DEFAULT NULL,
  `anno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Genere`
--

INSERT INTO `Genere` (`nome`, `nazione`, `anno`) VALUES
('Alternative', 'USA', 1981),
('Ambient', 'Inghilterra', 1974),
('Country', 'USA', 1930),
('Drone', 'USA', 1998),
('Grunge', 'USA', 1986),
('New Wave', 'Inghilterra', 1976),
('Noise', 'Germania', 1979),
('Pop', 'USA', 1953),
('Post-Punk', 'Inghilterra', 1980),
('Punk', 'Inghilterra', 1976),
('Rock', 'USA', 1950);

-- --------------------------------------------------------

--
-- Struttura della tabella `Playlist`
--

CREATE TABLE `Playlist` (
  `id_playlist` int(11) NOT NULL,
  `titolo` varchar(50) DEFAULT NULL,
  `creatore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Playlist`
--

INSERT INTO `Playlist` (`id_playlist`, `titolo`, `creatore`) VALUES
(700, 'Daily Mix', 100),
(701, 'Inverno 2016', 150),
(702, 'Safe', 130),
(703, 'Gennaio', 160);

-- --------------------------------------------------------

--
-- Struttura della tabella `Strumento`
--

CREATE TABLE `Strumento` (
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Strumento`
--

INSERT INTO `Strumento` (`nome`) VALUES
('Arpa'),
('Basso'),
('Batteria'),
('Chitarra'),
('Contrabbasso'),
('Organo'),
('Pianoforte'),
('Synth'),
('Violino'),
('Violoncello');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Album`
--
ALTER TABLE `Album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indici per le tabelle `Artista`
--
ALTER TABLE `Artista`
  ADD PRIMARY KEY (`nome_d_arte`);

--
-- Indici per le tabelle `Artista_Strumento`
--
ALTER TABLE `Artista_Strumento`
  ADD PRIMARY KEY (`nome_band`,`nome_strumento`),
  ADD KEY `nome_strumento` (`nome_strumento`);

--
-- Indici per le tabelle `Ascolto`
--
ALTER TABLE `Ascolto`
  ADD PRIMARY KEY (`utente`,`traccia`,`data_ascolto`),
  ADD KEY `traccia` (`traccia`);

--
-- Indici per le tabelle `Canzone`
--
ALTER TABLE `Canzone`
  ADD PRIMARY KEY (`id_canzone`);

--
-- Indici per le tabelle `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`numero_carta`);

--
-- Indici per le tabelle `Collaborazione`
--
ALTER TABLE `Collaborazione`
  ADD PRIMARY KEY (`playlist`,`cliente`),
  ADD KEY `cliente` (`cliente`);

--
-- Indici per le tabelle `Composizione`
--
ALTER TABLE `Composizione`
  ADD PRIMARY KEY (`canzone`,`playlist`),
  ADD KEY `playlist` (`playlist`);

--
-- Indici per le tabelle `Genere`
--
ALTER TABLE `Genere`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `Playlist`
--
ALTER TABLE `Playlist`
  ADD PRIMARY KEY (`id_playlist`);

--
-- Indici per le tabelle `Strumento`
--
ALTER TABLE `Strumento`
  ADD PRIMARY KEY (`nome`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Artista_Strumento`
--
ALTER TABLE `Artista_Strumento`
  ADD CONSTRAINT `Artista_Strumento_ibfk_1` FOREIGN KEY (`nome_band`) REFERENCES `Artista` (`nome_d_arte`),
  ADD CONSTRAINT `Artista_Strumento_ibfk_2` FOREIGN KEY (`nome_strumento`) REFERENCES `Strumento` (`nome`);

--
-- Limiti per la tabella `Ascolto`
--
ALTER TABLE `Ascolto`
  ADD CONSTRAINT `Ascolto_ibfk_1` FOREIGN KEY (`utente`) REFERENCES `Cliente` (`numero_carta`),
  ADD CONSTRAINT `Ascolto_ibfk_2` FOREIGN KEY (`traccia`) REFERENCES `Canzone` (`id_canzone`);

--
-- Limiti per la tabella `Collaborazione`
--
ALTER TABLE `Collaborazione`
  ADD CONSTRAINT `Collaborazione_ibfk_1` FOREIGN KEY (`playlist`) REFERENCES `Playlist` (`id_playlist`),
  ADD CONSTRAINT `Collaborazione_ibfk_2` FOREIGN KEY (`cliente`) REFERENCES `Cliente` (`numero_carta`);

--
-- Limiti per la tabella `Composizione`
--
ALTER TABLE `Composizione`
  ADD CONSTRAINT `Composizione_ibfk_1` FOREIGN KEY (`canzone`) REFERENCES `Canzone` (`id_canzone`),
  ADD CONSTRAINT `Composizione_ibfk_2` FOREIGN KEY (`playlist`) REFERENCES `Playlist` (`id_playlist`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
