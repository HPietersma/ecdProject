-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 19 jun 2022 om 19:55
-- Serverversie: 10.4.17-MariaDB
-- PHP-versie: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecd`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `aandoeningen`
--

CREATE TABLE `aandoeningen` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `aandoening` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `aandoeningen`
--

INSERT INTO `aandoeningen` (`id`, `client_id`, `aandoening`) VALUES
(10, 1, 'testaandoening');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `afspraken`
--

CREATE TABLE `afspraken` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `datum` varchar(20) NOT NULL,
  `tijd` varchar(20) NOT NULL,
  `notitie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergien`
--

CREATE TABLE `allergien` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `allergie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `allergien`
--

INSERT INTO `allergien` (`id`, `client_id`, `allergie`) VALUES
(3, 1, 'testallergie');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `casus_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `answers`
--

INSERT INTO `answers` (`id`, `casus_id`, `answer`) VALUES
(13, 28, 'test');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `behandelplan`
--

CREATE TABLE `behandelplan` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `behandelplan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `behandelplan`
--

INSERT INTO `behandelplan` (`id`, `client_id`, `behandelplan`) VALUES
(2, 109, 'as fsdaf asdf sadf dsfas fd asdf sadfas df'),
(3, 1, 'Meneer wil graag leren over wat hij zelf kan doen om zijn zelfredzaamheid te vergroten. Hij heeft gehoord over een online cursus en wil deze graag volgen. ');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `casus`
--

CREATE TABLE `casus` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `casus`
--

INSERT INTO `casus` (`id`, `naam`, `status`, `user_id`, `client_id`) VALUES
(17, 'test', 1, 2, 1),
(18, 'test', 1, 3, 1),
(19, 'test2', 1, 2, 2),
(20, 'test2', 1, 3, 2),
(21, 'test3', 1, 2, 2),
(22, 'test4', 2, 1, 1),
(23, 'test4', 1, 2, 1),
(24, 'test4', 1, 3, 1),
(25, 'test5', 2, 1, 1),
(26, 'test5', 1, 2, 1),
(27, 'test5', 1, 3, 1),
(28, 'test6', 2, 1, 1),
(29, 'test6', 1, 2, 1),
(30, 'test6', 1, 3, 1),
(31, 'test1', 1, 4, 1),
(32, 'test2', 1, 4, 1),
(33, 'test8', 1, 1, 1),
(34, 'test8', 1, 2, 1),
(35, 'test8', 1, 3, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `clienten`
--

CREATE TABLE `clienten` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(30) NOT NULL,
  `achternaam` varchar(30) NOT NULL,
  `geboortedatum` varchar(30) NOT NULL,
  `telefoon` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `plaats` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `clienten`
--

INSERT INTO `clienten` (`id`, `voornaam`, `achternaam`, `geboortedatum`, `telefoon`, `email`, `adres`, `plaats`) VALUES
(1, 'Piet', 'Piet', '01-01-1990', '0611223344', 'piet@piet.nl', 'Stationstraat 12', 'Steenwijk'),
(2, 'Jan', 'Jan', '10-10-1980', '', '', '', ''),
(109, 'test', 'test', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `contactpersonen`
--

CREATE TABLE `contactpersonen` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `contactpersoon` varchar(30) NOT NULL,
  `telefoon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `plaats` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `contactpersonen`
--

INSERT INTO `contactpersonen` (`id`, `client_id`, `contactpersoon`, `telefoon`, `email`, `adres`, `plaats`) VALUES
(1, 1, 'Hessel Pietersma', '0611111111', 'abra@kadabra.nl', 'straat 10', 'plekje'),
(8, 109, 'asdf', 'asdf', 'asdf', 'sadf', 'asdf');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `hulpmiddelen`
--

CREATE TABLE `hulpmiddelen` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hulpmiddel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `hulpmiddelen`
--

INSERT INTO `hulpmiddelen` (`id`, `client_id`, `hulpmiddel`) VALUES
(4, 1, 'testhulpmiddel');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klassen`
--

CREATE TABLE `klassen` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `klassen`
--

INSERT INTO `klassen` (`id`, `naam`) VALUES
(1, 'SD2A'),
(2, 'AA1D');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medicatie`
--

CREATE TABLE `medicatie` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `medicatie` varchar(255) NOT NULL,
  `notitie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `medicatie`
--

INSERT INTO `medicatie` (`id`, `client_id`, `medicatie`, `notitie`) VALUES
(1, 1, 'testmedicatie', NULL),
(2, 1, 'test2', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `opdracht`
--

CREATE TABLE `opdracht` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `opdracht` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `opdracht`
--

INSERT INTO `opdracht` (`id`, `client_id`, `opdracht`) VALUES
(1, 1, 'Jij bent stagiaire in de thuiszorg en in het kader van jouw stage ga je samen met meneer de online cursus volgen.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reanimeren`
--

CREATE TABLE `reanimeren` (
  `id` int(10) NOT NULL,
  `client_id` int(10) NOT NULL,
  `reanimeren` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `reanimeren`
--

INSERT INTO `reanimeren` (`id`, `client_id`, `reanimeren`) VALUES
(89, 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(2) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(2, 'Behandelend_arts'),
(3, 'Mantelzorger'),
(4, 'Supervisor'),
(1, 'Zorgverlener');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(50) NOT NULL,
  `achternaam` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `token` varchar(30) DEFAULT NULL,
  `role` int(2) NOT NULL DEFAULT 0,
  `klas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `voornaam`, `achternaam`, `email`, `password`, `token`, `role`, `klas_id`) VALUES
(1, 'Hessel', 'Pietersma', 'test@test.nl', 'Test123', NULL, 4, 1),
(2, 'arts', 'arts', 'arts@arts.nl', 'arts', NULL, 2, 1),
(3, 'sdf', 'asdf', '', '', NULL, 2, 1),
(4, 'test', 'test', '', '', NULL, 2, 2);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `aandoeningen`
--
ALTER TABLE `aandoeningen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `afspraken`
--
ALTER TABLE `afspraken`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `allergien`
--
ALTER TABLE `allergien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id_2` (`client_id`);

--
-- Indexen voor tabel `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `behandelplan`
--
ALTER TABLE `behandelplan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `casus`
--
ALTER TABLE `casus`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `clienten`
--
ALTER TABLE `clienten`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `contactpersonen`
--
ALTER TABLE `contactpersonen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `hulpmiddelen`
--
ALTER TABLE `hulpmiddelen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `klassen`
--
ALTER TABLE `klassen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `medicatie`
--
ALTER TABLE `medicatie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `opdracht`
--
ALTER TABLE `opdracht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `reanimeren`
--
ALTER TABLE `reanimeren`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reanimeren on clienten` (`client_id`);

--
-- Indexen voor tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users to roles` (`role`),
  ADD KEY `klas_id` (`klas_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `aandoeningen`
--
ALTER TABLE `aandoeningen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `afspraken`
--
ALTER TABLE `afspraken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `allergien`
--
ALTER TABLE `allergien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `behandelplan`
--
ALTER TABLE `behandelplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `casus`
--
ALTER TABLE `casus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT voor een tabel `clienten`
--
ALTER TABLE `clienten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT voor een tabel `contactpersonen`
--
ALTER TABLE `contactpersonen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `hulpmiddelen`
--
ALTER TABLE `hulpmiddelen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `klassen`
--
ALTER TABLE `klassen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `medicatie`
--
ALTER TABLE `medicatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `opdracht`
--
ALTER TABLE `opdracht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `reanimeren`
--
ALTER TABLE `reanimeren`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT voor een tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `aandoeningen`
--
ALTER TABLE `aandoeningen`
  ADD CONSTRAINT `aandoeningen on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `afspraken`
--
ALTER TABLE `afspraken`
  ADD CONSTRAINT `afspraken on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `allergien`
--
ALTER TABLE `allergien`
  ADD CONSTRAINT `allergien on client` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `behandelplan`
--
ALTER TABLE `behandelplan`
  ADD CONSTRAINT `behandelplan on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `contactpersonen`
--
ALTER TABLE `contactpersonen`
  ADD CONSTRAINT `contactpersonen on client` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `hulpmiddelen`
--
ALTER TABLE `hulpmiddelen`
  ADD CONSTRAINT `hulpmiddelen on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `medicatie`
--
ALTER TABLE `medicatie`
  ADD CONSTRAINT `medicatie on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `opdracht`
--
ALTER TABLE `opdracht`
  ADD CONSTRAINT `rol on client` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `reanimeren`
--
ALTER TABLE `reanimeren`
  ADD CONSTRAINT `reanimeren on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users to roles` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
