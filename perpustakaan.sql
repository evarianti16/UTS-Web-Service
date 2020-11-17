-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2020 at 03:54 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `id_peminjam` int(8) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `No_HP` varchar(15) NOT NULL,
  `Id_petugas` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjam`
--

INSERT INTO `peminjam` (`id_peminjam`, `nama`, `Alamat`, `No_HP`, `Id_petugas`) VALUES
(11112222, 'Qodri', 'Kalimantan', '085643847653', 11201716),
(11112223, 'Rizky', 'Jepara', '087739187373', 12342189),
(11112224, 'Delfian', 'Jakarta', '0876543876', 12874321),
(11112225, 'Delfina', 'Banten', '09834176239', 11864329),
(11112226, 'Rizka', 'Cirebon', '08453218954', 13768230);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_nama` int(8) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `No_HP` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_nama`, `nama`, `Alamat`, `No_HP`) VALUES
(11864329, 'Nurul I', 'Bandung', '087659328745'),
(12176543, 'Eva R', 'Kulon Progo', '0856476542');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`id_peminjam`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_nama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_nama` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12176544;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
