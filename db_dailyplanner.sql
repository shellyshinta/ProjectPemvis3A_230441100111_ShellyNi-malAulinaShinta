-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2024 at 04:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dailyplanner`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `nama`, `username`, `password`) VALUES
(1, 'ShellyShinta', 'Shellyyy', 'Shiifa42');

-- --------------------------------------------------------

--
-- Table structure for table `sub_tugas`
--

CREATE TABLE `sub_tugas` (
  `id_sub_tugas` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `nama_sub_tugas` text NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `status` enum('Selesai','Belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_tugas`
--

INSERT INTO `sub_tugas` (`id_sub_tugas`, `id_tugas`, `nama_sub_tugas`, `deskripsi`, `status`) VALUES
(1, 1, 'Membuat GUI', 'Merancang antarmuka menggunakan Java Swing', 'Belum'),
(3, 2, 'Membuat agenda', 'Menyiapkan poin-poin pembahasan rapat', 'Selesai'),
(4, 3, 'Query Latihan', 'Menulis dan menguji query SQL', 'Belum'),
(5, 3, 'Membuat ERD', 'Merancang ERD untuk database latihan', 'Belum'),
(6, 5, 'java swing + database', 'to do list', 'Belum'),
(7, 4, 'baca novel', 'lovely runner', 'Belum'),
(8, 4, 'membac jurnal', 'internasional', 'Belum');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_tugas` int(11) NOT NULL,
  `nama_tugas` text NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_deadline` date NOT NULL,
  `prioritas` enum('Tinggi','Sedang','Rendah') NOT NULL,
  `status` enum('Selesai','Belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tugas`
--

INSERT INTO `tugas` (`id_tugas`, `nama_tugas`, `deskripsi`, `tanggal_deadline`, `prioritas`, `status`) VALUES
(1, 'Belajar Java', 'Mengerjakan project Java Swing', '2024-11-25', 'Tinggi', 'Belum'),
(2, 'Rapat Proyek', 'Diskusi dengan tim', '2024-11-22', 'Sedang', 'Selesai'),
(3, 'Latihan SQL', 'Menyelesaikan soal database', '2024-11-23', 'Tinggi', 'Belum'),
(4, 'Membaca Buku', 'Membaca buku desain pattern', '2024-11-30', 'Rendah', 'Selesai'),
(5, 'Pemvis', 'membuat projek ', '2024-11-23', 'Tinggi', 'Selesai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sub_tugas`
--
ALTER TABLE `sub_tugas`
  ADD PRIMARY KEY (`id_sub_tugas`),
  ADD KEY `id_tugas` (`id_tugas`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_tugas`
--
ALTER TABLE `sub_tugas`
  MODIFY `id_sub_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sub_tugas`
--
ALTER TABLE `sub_tugas`
  ADD CONSTRAINT `sub_tugas_ibfk_1` FOREIGN KEY (`id_tugas`) REFERENCES `tugas` (`id_tugas`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
