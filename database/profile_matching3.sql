-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2024 pada 16.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profile_matching3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `nama_alternatif` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `nama_alternatif`) VALUES
(6, 'DB-I  PT.JAPFA'),
(7, 'CP511B PT.CPI'),
(8, 'PB-1 PT.JAPFA'),
(9, 'BR1-7 RT PT.MULTI PAKAN'),
(10, '8202-GIANT PT.MALINDO'),
(11, 'BR1-1 PT.JAPFA '),
(12, 'BR1-1 PT.Wonokoyo '),
(13, 'BR1-1 PT.CPI '),
(14, 'BR1-2 PT.JAPFA '),
(15, 'BR1-2 PT.Wonokoyo '),
(16, 'BR1-2 PT.CPI'),
(17, 'BR1 PT.MALINDO'),
(18, 'BR2  PT.MALINDO'),
(19, 'KP3 PT.CPI'),
(20, 'ABS1 PT.JAPFA'),
(21, 'ABS-pellet PT.JAPFA'),
(22, 'CP-594 PT.CPI'),
(23, 'ABS2 PT.CPI'),
(24, 'ABS2 PT.JAPFA'),
(25, 'AD I Crumble PT.JAPFA'),
(26, '591 PT.CPI'),
(27, 'KP2 PT.JAPFA'),
(28, 'KP2 PT.CPI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `nilai` float NOT NULL,
  `Keterangan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_alternatif`, `nilai`, `Keterangan`) VALUES
(6, 7, 4.43636, 'Rekomendasi'),
(7, 8, 4.16667, 'Rekomendasi'),
(8, 9, 4.27273, 'Rekomendasi'),
(9, 10, 5, 'Rekomendasi'),
(10, 11, 4.62121, 'Rekomendasi'),
(11, 12, 4.16667, 'Rekomendasi'),
(12, 13, 4.54242, 'Rekomendasi'),
(13, 14, 4.62121, 'Rekomendasi'),
(14, 15, 4.16667, 'Rekomendasi'),
(15, 16, 4.54242, 'Rekomendasi'),
(16, 17, 4.5697, 'Rekomendasi'),
(17, 18, 4.35152, 'Rekomendasi'),
(18, 19, 3.59091, 'Tidak Rekomendasi'),
(19, 20, 3.91818, 'Tidak Rekomendasi'),
(20, 21, 3.70303, 'Tidak Rekomendasi'),
(21, 22, 3.81212, 'Tidak Rekomendasi'),
(22, 23, 4.2697, 'Rekomendasi'),
(23, 24, 3.89091, 'Tidak Rekomendasi'),
(24, 25, 3.92121, 'Tidak Rekomendasi'),
(25, 26, 3.86667, 'Tidak Rekomendasi'),
(26, 27, 3.97879, 'Tidak Rekomendasi'),
(27, 28, 3.97879, 'Tidak Rekomendasi'),
(28, 6, 4.11212, 'Rekomendasi');

--
-- Trigger `hasil`
--
DELIMITER $$
CREATE TRIGGER `sample_trigger` BEFORE UPDATE ON `hasil` FOR EACH ROW BEGIN
IF NEW.nilai < 4.00 THEN SET NEW.Keterangan = 'Tidak Rekomendasi';
ELSE SET NEW.Keterangan = 'Rekomendasi';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(50) NOT NULL,
  `nilai` double(11,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`, `nilai`) VALUES
(1, 'Core Factor (CF)', 0.6),
(2, 'Secondary Factor (SF)', 0.4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` varchar(50) NOT NULL,
  `id_jenis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`, `id_jenis`) VALUES
(13, 'Jenis Ras Ayam', 1),
(14, 'Fase Pemeliharaan', 1),
(15, 'Air', 1),
(16, 'Abu', 1),
(17, 'Protein Kasar', 1),
(18, 'Lemak Kasar', 1),
(19, 'Serat Kasar', 1),
(20, 'Kalsium', 1),
(21, 'Phospor', 1),
(22, 'Lisin', 1),
(23, 'Metionin', 1),
(24, 'Metionin+sistin', 2),
(25, 'Triptofan', 2),
(26, 'Treonin', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `opt_alternatif`
--

CREATE TABLE `opt_alternatif` (
  `id_opt` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `id_subkriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `opt_alternatif`
--

INSERT INTO `opt_alternatif` (`id_opt`, `id_alternatif`, `id_kriteria`, `id_subkriteria`) VALUES
(42, 6, 13, 46),
(43, 6, 14, 49),
(44, 6, 15, 55),
(45, 6, 16, 60),
(46, 6, 17, 65),
(47, 6, 18, 71),
(48, 6, 19, 75),
(49, 6, 20, 112),
(50, 6, 21, 110),
(51, 9, 13, 46),
(52, 9, 14, 49),
(53, 9, 15, 55),
(54, 9, 16, 60),
(55, 9, 17, 67),
(56, 9, 18, 70),
(57, 9, 19, 75),
(58, 9, 20, 112),
(59, 9, 21, 110),
(60, 7, 13, 46),
(61, 7, 14, 49),
(62, 7, 15, 54),
(63, 7, 16, 59),
(64, 7, 17, 65),
(65, 7, 18, 70),
(66, 7, 19, 75),
(67, 7, 20, 112),
(68, 7, 21, 110),
(69, 8, 13, 46),
(70, 8, 14, 49),
(71, 8, 15, 55),
(72, 8, 16, 60),
(73, 8, 17, 65),
(74, 8, 18, 70),
(75, 8, 19, 75),
(76, 8, 20, 112),
(77, 8, 21, 110),
(78, 10, 13, 46),
(79, 10, 14, 49),
(80, 10, 15, 55),
(81, 10, 16, 59),
(82, 10, 17, 66),
(83, 10, 18, 69),
(84, 10, 19, 75),
(85, 10, 20, 112),
(86, 10, 21, 110),
(87, 11, 13, 46),
(88, 11, 14, 49),
(89, 11, 15, 55),
(90, 11, 16, 60),
(91, 11, 17, 65),
(92, 11, 18, 71),
(93, 11, 19, 75),
(94, 11, 20, 112),
(95, 11, 21, 110),
(96, 12, 13, 46),
(97, 12, 14, 49),
(98, 12, 15, 55),
(99, 12, 16, 60),
(100, 12, 17, 66),
(101, 12, 18, 70),
(102, 12, 19, 74),
(103, 12, 20, 112),
(104, 12, 21, 110),
(105, 13, 13, 46),
(106, 13, 14, 49),
(107, 13, 15, 55),
(108, 13, 16, 59),
(109, 13, 17, 65),
(110, 13, 18, 71),
(111, 13, 19, 75),
(112, 13, 20, 112),
(113, 13, 21, 110),
(114, 14, 13, 46),
(115, 14, 14, 49),
(116, 14, 15, 55),
(117, 14, 16, 60),
(118, 14, 17, 65),
(119, 14, 18, 71),
(120, 14, 19, 75),
(121, 14, 20, 112),
(122, 14, 21, 110),
(123, 15, 13, 46),
(124, 15, 14, 49),
(125, 15, 15, 55),
(126, 15, 16, 60),
(127, 15, 17, 66),
(128, 15, 18, 70),
(129, 15, 19, 74),
(130, 15, 20, 112),
(131, 15, 21, 110),
(132, 16, 13, 46),
(133, 16, 14, 49),
(134, 16, 15, 55),
(135, 16, 16, 59),
(136, 16, 17, 65),
(137, 16, 18, 71),
(138, 16, 19, 75),
(139, 16, 20, 112),
(140, 16, 21, 110),
(141, 17, 13, 46),
(142, 17, 14, 49),
(143, 17, 15, 55),
(144, 17, 16, 60),
(145, 17, 17, 66),
(146, 17, 18, 71),
(147, 17, 19, 75),
(148, 17, 20, 112),
(149, 17, 21, 110),
(150, 18, 13, 46),
(151, 18, 14, 52),
(152, 18, 15, 56),
(153, 18, 16, 60),
(154, 18, 17, 67),
(155, 18, 18, 70),
(156, 18, 19, 75),
(157, 18, 20, 112),
(158, 18, 21, 110),
(159, 19, 13, 47),
(161, 19, 15, 55),
(162, 19, 16, 58),
(163, 19, 17, 63),
(164, 19, 18, 72),
(165, 19, 19, 74),
(166, 19, 20, 78),
(167, 19, 21, 82),
(168, 20, 13, 48),
(169, 20, 14, 50),
(170, 20, 15, 55),
(171, 20, 16, 58),
(172, 20, 17, 67),
(173, 20, 18, 71),
(174, 20, 19, 73),
(175, 20, 20, 80),
(176, 20, 21, 110),
(177, 21, 13, 48),
(178, 21, 14, 50),
(179, 21, 15, 54),
(180, 21, 16, 58),
(181, 21, 17, 67),
(182, 21, 18, 71),
(183, 21, 19, 73),
(184, 21, 20, 80),
(185, 21, 21, 110),
(186, 22, 13, 48),
(187, 22, 14, 50),
(188, 22, 15, 55),
(189, 22, 16, 59),
(190, 22, 17, 67),
(191, 22, 18, 70),
(192, 22, 19, 73),
(193, 22, 20, 80),
(194, 22, 21, 110),
(195, 23, 13, 48),
(196, 23, 14, 50),
(197, 23, 15, 55),
(198, 23, 16, 58),
(199, 23, 17, 66),
(200, 23, 18, 70),
(201, 23, 19, 74),
(202, 23, 20, 80),
(203, 23, 21, 110),
(204, 24, 13, 48),
(205, 24, 14, 51),
(206, 24, 15, 55),
(207, 24, 16, 59),
(208, 24, 17, 67),
(209, 24, 18, 71),
(210, 24, 19, 73),
(211, 24, 20, 80),
(212, 24, 21, 110),
(213, 25, 13, 48),
(214, 25, 14, 49),
(215, 25, 15, 55),
(216, 25, 16, 59),
(217, 25, 17, 66),
(218, 25, 18, 71),
(219, 25, 19, 74),
(220, 25, 20, 80),
(221, 25, 21, 110),
(222, 26, 13, 48),
(223, 26, 14, 49),
(224, 26, 15, 55),
(225, 26, 16, 58),
(226, 26, 17, 65),
(227, 26, 18, 70),
(228, 26, 19, 74),
(229, 26, 20, 79),
(230, 26, 21, 110),
(231, 27, 13, 47),
(233, 27, 15, 57),
(234, 27, 16, 58),
(235, 27, 17, 63),
(236, 27, 18, 72),
(237, 27, 19, 75),
(238, 27, 20, 78),
(239, 27, 21, 110),
(240, 28, 13, 47),
(242, 28, 15, 57),
(243, 28, 16, 58),
(244, 28, 17, 63),
(245, 28, 18, 72),
(246, 28, 19, 75),
(247, 28, 20, 78),
(248, 28, 21, 110),
(258, 6, 22, 89),
(259, 6, 23, 94),
(260, 6, 24, 99),
(261, 6, 25, 104),
(262, 6, 26, 109),
(263, 7, 22, 88),
(264, 7, 23, 93),
(265, 7, 24, 99),
(266, 7, 25, 103),
(267, 7, 26, 108),
(268, 8, 22, 89),
(269, 8, 23, 94),
(270, 8, 24, 99),
(271, 8, 25, 104),
(272, 8, 26, 109),
(273, 9, 22, 89),
(274, 9, 23, 94),
(275, 9, 24, 99),
(276, 9, 25, 104),
(277, 9, 26, 108),
(278, 10, 22, 87),
(279, 10, 23, 93),
(280, 10, 24, 98),
(281, 10, 25, 103),
(282, 10, 26, 107),
(283, 11, 22, 88),
(284, 11, 23, 93),
(285, 11, 24, 98),
(286, 11, 25, 103),
(287, 11, 26, 108),
(288, 12, 22, 89),
(289, 12, 23, 94),
(290, 12, 24, 99),
(291, 12, 25, 104),
(292, 12, 26, 109),
(293, 13, 22, 88),
(294, 13, 23, 93),
(295, 13, 24, 98),
(296, 13, 25, 104),
(297, 13, 26, 108),
(298, 14, 22, 88),
(299, 14, 23, 93),
(300, 14, 24, 98),
(301, 14, 25, 103),
(302, 14, 26, 108),
(303, 15, 22, 89),
(304, 15, 23, 94),
(305, 15, 24, 99),
(306, 15, 25, 104),
(307, 15, 26, 109),
(308, 16, 22, 88),
(309, 16, 23, 93),
(310, 16, 24, 98),
(311, 16, 25, 104),
(312, 16, 26, 108),
(313, 17, 22, 87),
(314, 17, 23, 93),
(315, 17, 24, 98),
(316, 17, 25, 104),
(317, 17, 26, 108),
(318, 18, 22, 87),
(319, 18, 23, 93),
(320, 18, 24, 98),
(321, 18, 25, 104),
(322, 18, 26, 108),
(323, 19, 22, 86),
(324, 19, 23, 91),
(325, 19, 24, 96),
(326, 19, 25, 104),
(327, 19, 26, 106),
(328, 20, 22, 89),
(329, 20, 23, 93),
(330, 20, 24, 99),
(331, 20, 25, 104),
(332, 20, 26, 108),
(333, 21, 22, 89),
(334, 21, 23, 94),
(335, 21, 24, 99),
(336, 21, 25, 104),
(337, 21, 26, 109),
(338, 22, 22, 89),
(339, 22, 23, 94),
(340, 22, 24, 99),
(341, 22, 25, 104),
(342, 22, 26, 109),
(343, 23, 22, 88),
(344, 23, 23, 93),
(345, 23, 24, 98),
(346, 23, 25, 104),
(347, 23, 26, 108),
(348, 24, 22, 89),
(349, 24, 23, 93),
(350, 24, 24, 99),
(351, 24, 25, 104),
(352, 24, 26, 108),
(353, 25, 22, 89),
(354, 25, 23, 94),
(355, 25, 24, 99),
(356, 25, 25, 104),
(357, 25, 26, 109),
(358, 26, 22, 89),
(359, 26, 23, 94),
(360, 26, 24, 99),
(361, 26, 25, 104),
(362, 26, 26, 109),
(363, 27, 22, 86),
(364, 27, 23, 92),
(365, 27, 24, 97),
(366, 27, 25, 103),
(367, 27, 26, 107),
(368, 28, 22, 86),
(369, 28, 23, 92),
(370, 28, 24, 97),
(371, 28, 25, 103),
(372, 28, 26, 107),
(373, 19, 14, 51),
(374, 27, 14, 51),
(375, 28, 14, 51);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` enum('Admin','User') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_lengkap`, `email`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'admin', 'Admin'),
(4, 'admin2', 'admin2@gmail.com', 'admin2', 'admin2', 'Admin'),
(6, 'user', 'user@gmail.com', 'user', 'user', 'User'),
(57, 'fahmi al furqan', 'fahmialfurqanzf@gmail.com', 'fahmi', 'admin', 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `selisih`
--

CREATE TABLE `selisih` (
  `id_selisih` int(11) NOT NULL,
  `nilai_selisih` int(11) NOT NULL,
  `bobot` double(11,1) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `selisih`
--

INSERT INTO `selisih` (`id_selisih`, `nilai_selisih`, `bobot`, `keterangan`) VALUES
(1, 0, 5.0, 'Tidak ada selisih (kompetensi sesuai dengan yang dibutuhkan)'),
(2, 1, 4.5, 'Kompetensi individu kelebihan 1 tingkat'),
(3, -1, 4.0, 'Kompetensi individu kekurangan 1 tingkat'),
(4, 2, 3.5, 'Kompetensi individu kelebihan 2 tingkat'),
(5, -2, 3.0, 'Kompetensi individu kekurangan 2 tingkat'),
(6, 3, 2.5, 'Kompetensi individu kelebihan 3 tingkat'),
(7, -3, 2.0, 'Kompetensi individu kekurangan 3 tingkat'),
(8, 4, 1.5, 'Kompetensi individu kelebihan 4 tingkat'),
(9, -4, 1.0, 'Kompetensi individu kekurangan 4 tingkat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subkriteria`
--

CREATE TABLE `subkriteria` (
  `id_subkriteria` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nama_subkriteria` varchar(100) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `subkriteria`
--

INSERT INTO `subkriteria` (`id_subkriteria`, `id_kriteria`, `nama_subkriteria`, `nilai`) VALUES
(46, 13, 'Boiler', 5),
(47, 13, 'Layer/Petelur', 3),
(48, 13, 'Buras/Ayam Kampung', 1),
(49, 14, 'Fase Stater', 5),
(50, 14, 'Fase Grower', 4),
(51, 14, 'Fase Layer', 3),
(52, 14, 'Fase Finisher', 2),
(53, 15, 'Diatas 14%', 5),
(54, 15, 'Antara 12% - 14%', 4),
(55, 15, 'Antara 10% - 12% kebawah', 3),
(56, 15, 'Antara 8% - 10% kebawah', 2),
(57, 15, 'Dibawah 8%', 1),
(58, 16, 'Diatas 8%', 5),
(59, 16, 'Antara 6% - 8%', 4),
(60, 16, 'Antara 4% - 6% kebawah', 3),
(61, 16, 'Antara 2% - 4% kebawah', 2),
(62, 16, 'Dibawah 2%', 1),
(63, 17, 'Diatas 24%', 5),
(64, 17, 'Antara 22% - 24%', 4),
(65, 17, 'Antara 20% - 22% kebawah', 3),
(66, 17, 'Antara 18% - 20% kebawah', 2),
(67, 17, 'Dibawah 18%', 1),
(68, 18, 'Diatas 9%', 5),
(69, 18, 'Antara 7% - 9%', 4),
(70, 18, 'Antara 5% - 7% kebawah', 3),
(71, 18, 'Antara 3% - 5% kebawah', 2),
(72, 18, 'Dibawah 3%', 1),
(73, 19, 'Diatas 7%', 5),
(74, 19, 'Antara 5% - 7%', 4),
(75, 19, 'Antara 3% - 5% kebawah', 3),
(76, 19, 'Antara 1% - 3% kebawah', 2),
(77, 19, 'Dibawah 1%', 1),
(78, 20, 'Diatas 2%', 5),
(79, 20, 'Antara 1,50% - 2% ', 4),
(80, 20, 'Antara 1% - 1,50%', 3),
(81, 21, 'Diatas 2%', 5),
(82, 21, 'Antara 1,50% - 2%', 4),
(83, 21, 'Antara 1% - 1,50%', 3),
(85, 22, 'Diatas 2%', 5),
(86, 22, 'Antara 1,50% - 2% kebawah', 4),
(87, 22, 'Antara 1% - 1,50% kebawah', 3),
(88, 22, 'Antara 0,70% - 1% kebawah', 2),
(89, 22, 'Dibawah 0,70%', 1),
(90, 23, 'Diatas 1,50%', 5),
(91, 23, 'Antara 1% - 1,50% kebawah', 4),
(92, 23, 'Antara 0,50% - 1% kebawah', 3),
(93, 23, 'Antara 0,20% - 0,50% kebawah', 2),
(94, 23, 'Dibawah 0,20%', 1),
(95, 24, 'Diatas 2%', 5),
(96, 24, 'Antara 1,50% - 2% kebawah', 4),
(97, 24, 'Antara 1% - 1,50% kebawah', 3),
(98, 24, 'Antara 0,50% - 1% kebawah', 2),
(99, 24, 'Dibawah 0,50%', 1),
(100, 25, 'Diatas 1,50%', 5),
(101, 25, 'Antara 1% - 1,50% kebawah', 4),
(102, 25, 'Antara 0,50% - 1% kebawah', 3),
(103, 25, 'Antara 0,15% - 0,50% kebawah', 2),
(104, 25, 'Dibawah 0,15%', 1),
(105, 26, 'Diatas 2%', 5),
(106, 26, 'Antara 1,50% - 2% kebawah', 4),
(107, 26, 'Antara 1% - 1,50% kebawah', 3),
(108, 26, 'Antara 0,50% - 1% kebawah', 2),
(109, 26, 'Dibawah 0,50%', 1),
(110, 21, 'Antara 0,50% - 1% ', 2),
(111, 21, 'Dibawah 0,50%', 1),
(112, 20, 'Antara 0,50% - 1%', 2),
(113, 20, 'Dibawah 0,50%', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_alternatif` (`id_alternatif`);

--
-- Indeks untuk tabel `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`),
  ADD KEY `id_jenis` (`id_jenis`);

--
-- Indeks untuk tabel `opt_alternatif`
--
ALTER TABLE `opt_alternatif`
  ADD PRIMARY KEY (`id_opt`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_subkriteria` (`id_subkriteria`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`) USING BTREE;

--
-- Indeks untuk tabel `selisih`
--
ALTER TABLE `selisih`
  ADD PRIMARY KEY (`id_selisih`);

--
-- Indeks untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`id_subkriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `opt_alternatif`
--
ALTER TABLE `opt_alternatif`
  MODIFY `id_opt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `selisih`
--
ALTER TABLE `selisih`
  MODIFY `id_selisih` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `id_subkriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `kriteria_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `jenis` (`id_jenis`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `opt_alternatif`
--
ALTER TABLE `opt_alternatif`
  ADD CONSTRAINT `opt_alternatif_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `opt_alternatif_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `opt_alternatif_ibfk_3` FOREIGN KEY (`id_subkriteria`) REFERENCES `subkriteria` (`id_subkriteria`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD CONSTRAINT `subkriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
