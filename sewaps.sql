-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2019 at 08:41 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewaps`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kode_kategori` char(5) NOT NULL,
  `tipe_ps` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kode_kategori`, `tipe_ps`) VALUES
('K001', 'PlayStation 02'),
('K002', 'PlayStation 03'),
('K003', 'PlayStation 04');

-- --------------------------------------------------------

--
-- Table structure for table `kembali`
--

CREATE TABLE `kembali` (
  `no_kembali` char(10) NOT NULL,
  `no_pinjam` char(10) NOT NULL,
  `lama_sewa` int(5) NOT NULL,
  `qty` int(5) NOT NULL,
  `jaminan` varchar(10) NOT NULL,
  `tgl_pinjam` char(12) NOT NULL,
  `tgl_kembali` char(12) NOT NULL,
  `kembali` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kembali`
--

INSERT INTO `kembali` (`no_kembali`, `no_pinjam`, `lama_sewa`, `qty`, `jaminan`, `tgl_pinjam`, `tgl_kembali`, `kembali`) VALUES
('NOP01', 'NP002', 1, 1, 'KTP', '22-02-2018', '23-02-2018', '24-02-2018');

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE `konsumen` (
  `no_konsumen` char(10) NOT NULL,
  `nama` text NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `no_ktp` varchar(19) NOT NULL,
  `no_telephone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`no_konsumen`, `nama`, `alamat`, `jenis_kelamin`, `no_ktp`, `no_telephone`) VALUES
('K.00001', 'Aziz Rohman', 'Banaran', 'Laki-Laki', '2000200102', '081212323432'),
('K.00002', 'Zaky', 'Tipes', 'Laki-Laki', '1123456535', '087987655'),
('K.00003', 'Y', 'RHN', 'Perempuan', '1234567', '1234567i');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` char(10) NOT NULL,
  `nama` varchar(15) NOT NULL,
  `user` varchar(8) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `hakakses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `nama`, `user`, `pass`, `hakakses`) VALUES
('LOG01', 'Faiz', 'pegawai', 'pegawai', 'pegawai'),
('LOG02', 'Zidan', 'pemilik', 'pemilik', 'pemilik');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kode_pegawai` char(5) NOT NULL,
  `nama` text NOT NULL,
  `alamat` text NOT NULL,
  `no_ktp` varchar(19) NOT NULL,
  `no_telephone` varchar(13) NOT NULL,
  `id_login` char(10) NOT NULL,
  `user` varchar(8) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `hakakses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`kode_pegawai`, `nama`, `alamat`, `no_ktp`, `no_telephone`, `id_login`, `user`, `pass`, `hakakses`) VALUES
('KP001', 'Faiz', 'Surakarta', '1994030202', '085213456789', 'LOG01', 'pegawai', 'pegawai', 'pegawai');

-- --------------------------------------------------------

--
-- Table structure for table `pemilik`
--

CREATE TABLE `pemilik` (
  `id_pemilik` char(5) NOT NULL,
  `nama` varchar(10) NOT NULL,
  `no_hp` int(12) NOT NULL,
  `id_login` char(10) NOT NULL,
  `user` varchar(8) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `hakakses` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemilik`
--

INSERT INTO `pemilik` (`id_pemilik`, `nama`, `no_hp`, `id_login`, `user`, `pass`, `hakakses`) VALUES
('PM01', 'Zidan', 81234567, 'LOG02', 'pemilik', 'pemilik', 'pemilik');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `no_pinjam` char(10) NOT NULL,
  `no_konsumen` char(10) NOT NULL,
  `kode_pegawai` char(5) NOT NULL,
  `kode_produk` char(5) NOT NULL,
  `harga_sewa` int(20) NOT NULL,
  `lama_sewa` int(5) NOT NULL,
  `qty` int(5) NOT NULL,
  `jaminan` varchar(10) NOT NULL,
  `tgl_pinjam` char(12) NOT NULL,
  `tgl_kembali` char(12) NOT NULL,
  `total` double NOT NULL,
  `bayar` double NOT NULL,
  `kembali` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`no_pinjam`, `no_konsumen`, `kode_pegawai`, `kode_produk`, `harga_sewa`, `lama_sewa`, `qty`, `jaminan`, `tgl_pinjam`, `tgl_kembali`, `total`, `bayar`, `kembali`) VALUES
('NP001', 'K.00001', 'KP001', 'P001', 15000, 1, 1, 'KK', '22-02-2001', '23-02-2001', 15000, 20000, 5000),
('NP002', 'K.00001', 'KP001', 'P001', 15000, 1, 1, 'KTP', '22-02-2018', '23-02-2018', 15000, 20000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode_produk` char(5) NOT NULL,
  `kode_kategori` char(5) NOT NULL,
  `tipe_ps` varchar(15) NOT NULL,
  `harga_sewa` int(20) NOT NULL,
  `stok` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode_produk`, `kode_kategori`, `tipe_ps`, `harga_sewa`, `stok`) VALUES
('P001', 'K001', 'PlayStation 02', 15000, 6),
('P002', 'K002', 'PlayStation 03', 25000, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `kembali`
--
ALTER TABLE `kembali`
  ADD PRIMARY KEY (`no_kembali`),
  ADD KEY `no_pinjam` (`no_pinjam`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`no_konsumen`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kode_pegawai`),
  ADD KEY `id_login` (`id_login`);

--
-- Indexes for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`id_pemilik`),
  ADD KEY `id_login` (`id_login`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`no_pinjam`),
  ADD KEY `no_konsumen` (`no_konsumen`),
  ADD KEY `kode_pegawai` (`kode_pegawai`),
  ADD KEY `kode_produk` (`kode_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`),
  ADD KEY `kode_kategori` (`kode_kategori`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kembali`
--
ALTER TABLE `kembali`
  ADD CONSTRAINT `kembali_ibfk_1` FOREIGN KEY (`no_pinjam`) REFERENCES `pinjam` (`no_pinjam`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`);

--
-- Constraints for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD CONSTRAINT `pemilik_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id_login`);

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`kode_pegawai`) REFERENCES `pegawai` (`kode_pegawai`),
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`kode_produk`) REFERENCES `produk` (`kode_produk`),
  ADD CONSTRAINT `pinjam_ibfk_3` FOREIGN KEY (`no_konsumen`) REFERENCES `konsumen` (`no_konsumen`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
