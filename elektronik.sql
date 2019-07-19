-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jul 2019 pada 08.44
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elektronik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode_barang` char(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk_barang` varchar(25) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `merk_barang`, `jumlah_stok`, `harga`) VALUES
('B001', 'Laptop', 'Asus 1', 25, 15000),
('B002', 'Kipas', 'daikin', 20, 20000),
('B003', 'Lampu', 'Philips', 10, 10000),
('B004', 'AC', 'LG', 20, 40000),
('B005', 'Kulkas', 'LG', 10, 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` char(5) NOT NULL,
  `id_pegawai` char(5) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `id_pegawai`, `username`, `password`, `level`) VALUES
('L001', 'P001', 'admin', 'admin', 'admin'),
('L002', 'P002', 'kasir', 'kasir', 'kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` char(5) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `no_hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `alamat`, `no_hp`) VALUES
('P001', 'Anin', 'Sukoharjo', '081223671234'),
('P002', 'Kiki', 'Surakarta', '081278569012'),
('P003', 'Ayu', 'Boyolali', '081278125678');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` char(5) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `alamat` varchar(25) NOT NULL,
  `no_hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_pembeli`, `alamat`, `no_hp`) VALUES
('PM001', 'Kokon', 'Boyolali', '081278561234'),
('PM002', 'Yaya', 'Surakarta', '081278561234'),
('PM003', 'Nia', 'Surakarta', '081267125621'),
('PM004', 'Nini', 'Sukoharjo', '081276321876');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` char(5) NOT NULL,
  `id_pegawai` char(5) NOT NULL,
  `id_pembeli` char(5) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `kode_barang` char(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(30) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` double NOT NULL,
  `jumlah_uang` double NOT NULL,
  `kembali` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `id_pegawai`, `id_pembeli`, `nama_pembeli`, `kode_barang`, `nama_barang`, `harga`, `jumlah`, `total`, `jumlah_uang`, `kembali`) VALUES
('001', 'P001', 'PM001', 'Kokon', 'B001', 'Laptop', 15000, 2, 30000, 35000, 5000),
('002', 'P001', 'PM002', 'Yaya', 'B002', 'Kipas', 20000, 1, 20000, 30000, 10000),
('003', 'P001', 'PM003', 'Nia', 'B003', 'Lampu', 10000, 2, 20000, 40000, 20000),
('004', 'P001', 'PM003', 'Nia', 'B002', 'Kipas', 20000, 2, 40000, 50000, 10000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_pembeli` (`id_pembeli`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
