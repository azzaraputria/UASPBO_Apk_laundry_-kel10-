-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 06:58 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cucian`
--

CREATE TABLE `jenis_cucian` (
  `kd_jenis` int(11) NOT NULL,
  `jenis_cucian` varchar(30) NOT NULL,
  `harga` int(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_cucian`
--

INSERT INTO `jenis_cucian` (`kd_jenis`, `jenis_cucian`, `harga`) VALUES
(2, 'Cuci Kering + Cuci Basah', 8000),
(3, 'Cuci Basah + Parfum', 7500),
(4, 'Jenis kering', 2000),
(5, 'basah', 9000),
(8, 'basah', 9000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(30) NOT NULL,
  `nama_pelanggan` varchar(40) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `telp`) VALUES
(1, 'Sultan', 'Cisarua', '0887632213'),
(6, 'NC.A', 'Seoul', '81752675672'),
(8, 'Fair Xing', 'Hulunbuir,Republik Rakyat Tiongkok', '16923874235'),
(9, 'zahra', 'jatiluhur', '081293406034'),
(11, 'habibi', 'ciheuleut', '081220503994'),
(12, 'putri', 'cilegong', '081293406034');

-- --------------------------------------------------------

--
-- Table structure for table `penerimaan`
--

CREATE TABLE `penerimaan` (
  `no_order` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(40) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `t_bayar` int(20) NOT NULL,
  `bayar` int(20) NOT NULL,
  `sisa` int(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `kd_jenis` int(11) NOT NULL,
  `jenis_cucian` varchar(40) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `pengerjaan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerimaan`
--

INSERT INTO `penerimaan` (`no_order`, `id_pelanggan`, `nama_pelanggan`, `tgl_masuk`, `tgl_keluar`, `t_bayar`, `bayar`, `sisa`, `status`, `kd_jenis`, `jenis_cucian`, `harga`, `berat`, `keterangan`, `pengerjaan`) VALUES
(2, 1, 'Sultan', '2019-04-08', '2019-04-10', 40000, 50000, 10000, 'Lunas', 2, 'Cuci Kering + Cuci Basah', 8000, 5, 'Tets keterangan', 'Diambil'),
(3, 6, 'Park Min Young', '2019-04-10', '2019-04-19', 37500, 30000, -7500, 'Belum Lunas', 3, 'Cuci Basah + Parfum', 7500, 5, 'Baju,Celana', 'Diambil'),
(4, 6, 'Kim', '2019-04-10', '2019-04-18', 40000, 40000, 0, 'Lunas', 2, 'Cuci Kering + Cuci Basah', 8000, 5, 'Jaket', 'Diberikan'),
(5, 6, 'KimSul', '2019-04-25', '2019-04-27', 120000, 100000, -20000, 'Lunas', 2, 'Cuci Kering + Cuci Basah', 8000, 15, 'Selimut,Baju', 'Diambil'),
(6, 8, 'Ryujin', '2024-07-11', '2024-07-05', 7200000, 8000, -7192000, 'Lunas', 2, 'Cuci Kering + Cuci Basah', 8000, 900, 'bau', 'Diambil'),
(7, 11, 'zahra', '2024-07-19', '2024-07-10', 184000, 184000, 0, 'Lunas', 2, 'Cuci Kering + Cuci Basah', 8000, 23, 'basah', 'Diambil'),
(8, 12, 'putri', '2024-07-19', '2024-07-04', 150000, 100000, -50000, 'Belum Lunas', 3, 'Cuci Basah + Parfum', 7500, 20, 'baju dan celana di pisah', 'Diambil');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `hakakses` enum('admin','user','','') NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `hakakses`, `nama_pengguna`) VALUES
(5, 'admin', 'admin', 'admin', 'Ini Admin'),
(8, 'habibi', 'user', 'user', 'Ini User');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `no_order` int(11) NOT NULL,
  `dibayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `tgl_transaksi`, `no_order`, `dibayar`, `kembalian`) VALUES
(1, '2019-04-22', 4, 0, 0),
(2, '2019-04-22', 3, 10000, 2500),
(3, '2019-04-22', 2, 0, 0),
(4, '2019-04-22', 3, 0, 0),
(5, '2019-04-22', 3, 777, -6723),
(6, '2019-04-25', 5, 20000, 0),
(7, '2024-07-18', 6, 0, 0),
(8, '2024-07-19', 2, 12000, 22000),
(9, '2024-07-19', 6, 0, 0),
(10, '2024-07-19', 6, 7192000, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_cucian`
--
ALTER TABLE `jenis_cucian`
  ADD PRIMARY KEY (`kd_jenis`),
  ADD KEY `kd_jenis` (`kd_jenis`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD PRIMARY KEY (`no_order`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `kd_jenis` (`kd_jenis`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `no_order` (`no_order`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_cucian`
--
ALTER TABLE `jenis_cucian`
  MODIFY `kd_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `penerimaan`
--
ALTER TABLE `penerimaan`
  MODIFY `no_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD CONSTRAINT `penerimaan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `penerimaan_ibfk_2` FOREIGN KEY (`kd_jenis`) REFERENCES `jenis_cucian` (`kd_jenis`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`no_order`) REFERENCES `penerimaan` (`no_order`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
