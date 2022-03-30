-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 30 mrt 2022 om 16:57
-- Serverversie: 10.4.21-MariaDB
-- PHP-versie: 8.0.12

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
-- Tabelstructuur voor tabel `allergie`
--

CREATE TABLE `allergie` (
  `id` int(11) NOT NULL,
  `allergie_id` int(11) NOT NULL,
  `allergie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `allergien`
--

CREATE TABLE `allergien` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `allergien` int(11) NOT NULL,
  `info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `clienten`
--

CREATE TABLE `clienten` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(30) NOT NULL,
  `achternaam` varchar(30) NOT NULL,
  `behandelplan` int(11) NOT NULL,
  `aandoeningen` int(11) NOT NULL,
  `allergien` int(11) NOT NULL,
  `medicatie` int(11) NOT NULL,
  `hulpmiddelen` int(11) NOT NULL,
  `contactpersonen` int(11) NOT NULL,
  `afspraken` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`, `admin`) VALUES
(1, 'Hessel', 'test@test.nl', 'Test123', NULL, 1);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `allergie`
--
ALTER TABLE `allergie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `allergie` (`allergie`),
  ADD KEY `allergie on allergien` (`allergie_id`);

--
-- Indexen voor tabel `allergien`
--
ALTER TABLE `allergien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexen voor tabel `clienten`
--
ALTER TABLE `clienten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `behandelplan` (`behandelplan`,`aandoeningen`,`allergien`,`medicatie`,`hulpmiddelen`,`contactpersonen`,`afspraken`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

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
-- AUTO_INCREMENT voor een tabel `clienten`
--
ALTER TABLE `clienten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
