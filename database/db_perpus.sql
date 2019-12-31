-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 14, 2019 at 09:35 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `anggota_id` int(10) UNSIGNED NOT NULL,
  `anggota_nama` varchar(50) NOT NULL,
  `anggota_alamat` text NOT NULL,
  `anggota_jk` enum('L','P') NOT NULL,
  `anggota_telp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`anggota_id`, `anggota_nama`, `anggota_alamat`, `anggota_jk`, `anggota_telp`) VALUES
(4, 'Abdul Djalil Djayali', 'Koloncucu', 'L', '082192668858');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `buku_id` int(10) UNSIGNED NOT NULL,
  `buku_judul` varchar(50) NOT NULL,
  `kategori_id` int(11) UNSIGNED NOT NULL,
  `buku_deskripsi` text,
  `buku_jumlah` int(11) UNSIGNED NOT NULL,
  `buku_cover` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`buku_id`, `buku_judul`, `kategori_id`, `buku_deskripsi`, `buku_jumlah`, `buku_cover`) VALUES
(8, 'Buku Pemrograman Web Dasar', 10, 'Buku Pemrograman Web Dasar |\r\nPemrograman web diambil dari 2 kata yaitu pemrograman dan web. Pemrograman yang dalam bahasa English adalah programming dan diartikan proses, cara, perbuatan program. Sedangkan definisi web adalah jaringan komputer yang terdiri dari kumpulan situs internet yang menawarkan teks dan grafik dan suara dan sumber daya animasi melalui hypertext transfer protokol. Halaman Web merupakan file teks murni (plain text) yang berisi sintaks-sintaks HTML yang dapat dibuka/ dilihat/ diterjemahkan dengan Internet Browser. Kini internet identik dengan web, karena kepopuleran web sebagai standar interface pada lanyanan-layanan yang ada di internet, dari awalnya sebagai penyedia informasi, ini digunakan juga untuk komunikasi dari email sampai dengan chatting, sampai dengan melakukan transaksi bisnis (commerce) (Sidik, 2005).\r\n\r\nBanyak keuntungan yang diberikan oleh Aplikasi berbasis web dari pada aplikasi berbasis desktop, sehingga aplikasi berbasis web telah diadopsi oleh perusahaan sebagai bagian dari strategi teknologi informasinya, karena beberapa alasan:\r\n\r\nAkses informasi mudah\r\nSetup server lebih mudah\r\nInformasi mudah didistribusikan\r\nBebas platform, informasi dapat di sajikan oleh browser web pada sistem operasi mana saja karena adanya standar dokumen berbagai tipe data dapat disajikan.\r\nBuku Pemrograman Web Dasar ini diterbitkan oleh Penerbit Buku Pendidikan Deepublish. ', 10, 'bukunya1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(10) UNSIGNED NOT NULL,
  `kategori_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(10, 'Pemrograman'),
(12, 'Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `kembali`
--

CREATE TABLE `kembali` (
  `kembali_id` int(11) UNSIGNED NOT NULL,
  `pinjam_id` int(11) UNSIGNED NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` double UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `petugas_id` int(10) UNSIGNED NOT NULL,
  `petugas_nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`petugas_id`, `petugas_nama`, `username`, `password`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'Abdul Djalil Djayali', 'admin_perpus', 'e5a53b6746cfda090ec5ad426f47d668');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `pinjam_id` int(10) UNSIGNED NOT NULL,
  `buku_id` int(11) UNSIGNED NOT NULL,
  `anggota_id` int(11) UNSIGNED NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_jatuh_tempo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`pinjam_id`, `buku_id`, `anggota_id`, `tgl_pinjam`, `tgl_jatuh_tempo`) VALUES
(14, 8, 4, '2019-01-15', '2019-01-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`anggota_id`) USING BTREE;

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`buku_id`) USING BTREE,
  ADD KEY `kategori_id` (`kategori_id`) USING BTREE;

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`) USING BTREE;

--
-- Indexes for table `kembali`
--
ALTER TABLE `kembali`
  ADD PRIMARY KEY (`kembali_id`) USING BTREE,
  ADD KEY `pinjam_id` (`pinjam_id`) USING BTREE;

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`petugas_id`) USING BTREE;

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`pinjam_id`) USING BTREE,
  ADD KEY `anggota_id` (`anggota_id`) USING BTREE,
  ADD KEY `buku_id` (`buku_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `anggota_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `buku_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kembali`
--
ALTER TABLE `kembali`
  MODIFY `kembali_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `petugas_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `pinjam_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`);

--
-- Constraints for table `kembali`
--
ALTER TABLE `kembali`
  ADD CONSTRAINT `kembali_ibfk_1` FOREIGN KEY (`pinjam_id`) REFERENCES `pinjam` (`pinjam_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`buku_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`anggota_id`) REFERENCES `anggota` (`anggota_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
