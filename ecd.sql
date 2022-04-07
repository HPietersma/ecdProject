-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 07 apr 2022 om 13:53
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
-- Tabelstructuur voor tabel `allergie`
--

CREATE TABLE `allergie` (
  `id` int(11) NOT NULL,
  `allergie_id` int(11) NOT NULL,
  `allergie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergien`
--

CREATE TABLE `allergien` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `notitie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `behandelplan`
--

CREATE TABLE `behandelplan` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `behandelplan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Jack', 'Sparrow', '01-01-1900', '0611223344', 'jack@sparrow.nl', 'pakjesboot 12', 'zee'),
(2, 'Davy', 'Jones', '10-10-1500', '', '', '', '');

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
(1, 1, 'Hessel Pietersma', '0611111111', 'abra@kadabra.nl', 'straat 10', 'plekje');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `hulpmiddelen`
--

CREATE TABLE `hulpmiddelen` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hulpmiddel` varchar(255) NOT NULL,
  `notitie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, 'Behandelend arts'),
(3, 'Mantelzorger'),
(4, 'Supervisor'),
(1, 'Zorgverlener');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `token` varchar(30) DEFAULT NULL,
  `role` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`, `role`) VALUES
(1, 'Hessel', 'test@test.nl', 'Test123', NULL, 4);

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
-- Indexen voor tabel `allergie`
--
ALTER TABLE `allergie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `allergie_id` (`allergie_id`);

--
-- Indexen voor tabel `allergien`
--
ALTER TABLE `allergien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id_2` (`client_id`);

--
-- Indexen voor tabel `behandelplan`
--
ALTER TABLE `behandelplan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

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
-- Indexen voor tabel `medicatie`
--
ALTER TABLE `medicatie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

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
  ADD KEY `users to roles` (`role`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `aandoeningen`
--
ALTER TABLE `aandoeningen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `afspraken`
--
ALTER TABLE `afspraken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `allergie`
--
ALTER TABLE `allergie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `allergien`
--
ALTER TABLE `allergien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `behandelplan`
--
ALTER TABLE `behandelplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `clienten`
--
ALTER TABLE `clienten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `contactpersonen`
--
ALTER TABLE `contactpersonen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `hulpmiddelen`
--
ALTER TABLE `hulpmiddelen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `medicatie`
--
ALTER TABLE `medicatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `aandoeningen`
--
ALTER TABLE `aandoeningen`
  ADD CONSTRAINT `aandoeningen on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `afspraken`
--
ALTER TABLE `afspraken`
  ADD CONSTRAINT `afspraken on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `allergie`
--
ALTER TABLE `allergie`
  ADD CONSTRAINT `allergie on allergien` FOREIGN KEY (`allergie_id`) REFERENCES `allergien` (`id`);

--
-- Beperkingen voor tabel `allergien`
--
ALTER TABLE `allergien`
  ADD CONSTRAINT `allergien on client` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `behandelplan`
--
ALTER TABLE `behandelplan`
  ADD CONSTRAINT `behandelplan on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `contactpersonen`
--
ALTER TABLE `contactpersonen`
  ADD CONSTRAINT `contactpersonen on client` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `hulpmiddelen`
--
ALTER TABLE `hulpmiddelen`
  ADD CONSTRAINT `hulpmiddelen on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `medicatie`
--
ALTER TABLE `medicatie`
  ADD CONSTRAINT `medicatie on clienten` FOREIGN KEY (`client_id`) REFERENCES `clienten` (`id`);

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users to roles` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
