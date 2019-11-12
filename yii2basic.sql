-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Nov 2019 pada 15.16
-- Versi server: 10.1.35-MariaDB
-- Versi PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2basic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `appoval_rules_node`
--

CREATE TABLE `appoval_rules_node` (
  `id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `bisa_menandatangani` tinyint(1) DEFAULT NULL,
  `bisa_atas_nama` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `approval_rules_edge`
--

CREATE TABLE `approval_rules_edge` (
  `id` int(11) NOT NULL,
  `parent_rules_node_id` int(11) NOT NULL,
  `child_rules_node_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `approval_surat_keluar`
--

CREATE TABLE `approval_surat_keluar` (
  `id` int(11) NOT NULL,
  `surat_keluar_id` int(11) NOT NULL,
  `jabatan_users_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `keterangan` text,
  `dari_jabatan_users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `disposisi_rules_edge`
--

CREATE TABLE `disposisi_rules_edge` (
  `id` int(11) NOT NULL,
  `parent_node_id` int(11) NOT NULL,
  `child_node_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `disposisi_rules_node`
--

CREATE TABLE `disposisi_rules_node` (
  `id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `penerima_surat` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `disposisi_surat_masuk`
--

CREATE TABLE `disposisi_surat_masuk` (
  `id` int(11) NOT NULL,
  `surat_masuk_id` int(11) NOT NULL,
  `jabatan_users_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `dari_jabatan_users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `golongan`
--

CREATE TABLE `golongan` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `instansi`
--

CREATE TABLE `instansi` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` text,
  `no_telepon` varchar(20) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `instansi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan_users`
--

CREATE TABLE `jabatan_users` (
  `id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `golongan_id` int(11) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_surat`
--

CREATE TABLE `kategori_surat` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_surat_keluar`
--

CREATE TABLE `kategori_surat_keluar` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sifat`
--

CREATE TABLE `sifat` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id` int(11) NOT NULL,
  `nomor_klasifikasi` varchar(45) DEFAULT NULL,
  `file_lampiran` varchar(45) DEFAULT NULL,
  `perihal` text,
  `jabatan_id` int(11) NOT NULL,
  `sifat_id` int(11) NOT NULL,
  `kategori_surat_id` int(11) NOT NULL,
  `isi_surat` text,
  `isi_lampiran_surat` text,
  `no_agenda` varchar(45) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `instansi_id` int(11) NOT NULL,
  `approval_surat_keluar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL,
  `nomor_agenda` varchar(45) DEFAULT NULL,
  `no_surat` varchar(45) DEFAULT NULL,
  `surat_dari` varchar(45) DEFAULT NULL,
  `instansi_id` int(11) NOT NULL,
  `is_antar_dinas` tinyint(1) DEFAULT NULL,
  `kategori_surat_id` int(11) NOT NULL,
  `sifat_id` int(11) NOT NULL,
  `no_tindak_lanjut` varchar(45) DEFAULT NULL,
  `perihal` text,
  `tanggal` date DEFAULT NULL,
  `lampiran` varchar(45) DEFAULT NULL,
  `file_surat` varchar(45) DEFAULT NULL,
  `file_lampiran` varchar(45) DEFAULT NULL,
  `jumlah_lampiran` int(11) DEFAULT NULL,
  `jabatan_users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `appoval_rules_node`
--
ALTER TABLE `appoval_rules_node`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `approval_rules_edge`
--
ALTER TABLE `approval_rules_edge`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `approval_surat_keluar`
--
ALTER TABLE `approval_surat_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `disposisi_rules_edge`
--
ALTER TABLE `disposisi_rules_edge`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `disposisi_rules_node`
--
ALTER TABLE `disposisi_rules_node`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `disposisi_surat_masuk`
--
ALTER TABLE `disposisi_surat_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan_users`
--
ALTER TABLE `jabatan_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_surat`
--
ALTER TABLE `kategori_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_surat_keluar`
--
ALTER TABLE `kategori_surat_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sifat`
--
ALTER TABLE `sifat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `appoval_rules_node`
--
ALTER TABLE `appoval_rules_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `approval_rules_edge`
--
ALTER TABLE `approval_rules_edge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `approval_surat_keluar`
--
ALTER TABLE `approval_surat_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `disposisi_rules_edge`
--
ALTER TABLE `disposisi_rules_edge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `disposisi_rules_node`
--
ALTER TABLE `disposisi_rules_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `disposisi_surat_masuk`
--
ALTER TABLE `disposisi_surat_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `golongan`
--
ALTER TABLE `golongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jabatan_users`
--
ALTER TABLE `jabatan_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sifat`
--
ALTER TABLE `sifat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
