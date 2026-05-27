-- =========================================================
-- DATABASE KEPEGAWAIAN FINAL
-- FULL LATIHAN UAS BASIS DATA
-- =========================================================

DROP DATABASE IF EXISTS db_kepegawaian_final;
CREATE DATABASE db_kepegawaian_final;
USE db_kepegawaian_final;

-- =========================================================
-- 1. TABEL DEPARTEMEN
-- =========================================================

CREATE TABLE departemen (
    id_departemen INT AUTO_INCREMENT PRIMARY KEY,
    nama_departemen VARCHAR(100) NOT NULL,
    lokasi_kantor VARCHAR(100) NOT NULL,
    telepon_departemen VARCHAR(20)
);

INSERT INTO departemen
(nama_departemen, lokasi_kantor, telepon_departemen)
VALUES
('Human Resource', 'Samarinda', '0541-111111'),
('Information Technology', 'Samarinda', '0541-222222'),
('Keuangan', 'Balikpapan', '0542-333333'),
('Marketing', 'Bontang', '0548-444444'),
('Operasional', 'Samarinda', '0541-555555'),
('Legal', 'Balikpapan', '0542-666666'),
('Research and Development', 'Jakarta', '021-777777'),
('Customer Service', 'Samarinda', '0541-888888');

-- =========================================================
-- 2. TABEL JABATAN
-- =========================================================

CREATE TABLE jabatan (
    id_jabatan INT AUTO_INCREMENT PRIMARY KEY,
    nama_jabatan VARCHAR(100) NOT NULL,
    gaji_pokok DECIMAL(15,2) NOT NULL,
    tunjangan_jabatan DECIMAL(15,2) DEFAULT 0
);

INSERT INTO jabatan
(nama_jabatan, gaji_pokok, tunjangan_jabatan)
VALUES
('Staff', 4500000, 500000),
('Senior Staff', 6000000, 1000000),
('Supervisor', 8500000, 2000000),
('Assistant Manager', 12000000, 3500000),
('Manager', 15000000, 5000000),
('Direktur', 30000000, 10000000);

-- =========================================================
-- 3. TABEL STATUS PEGAWAI
-- =========================================================

CREATE TABLE status_pegawai (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    nama_status VARCHAR(50)
);

INSERT INTO status_pegawai (nama_status)
VALUES
('Tetap'),
('Kontrak'),
('Magang'),
('Freelance');

-- =========================================================
-- 4. TABEL PEGAWAI
-- =========================================================

CREATE TABLE pegawai (
    id_pegawai INT AUTO_INCREMENT PRIMARY KEY,
    nik VARCHAR(20) UNIQUE NOT NULL,
    nama_pegawai VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('L', 'P') NOT NULL,
    tempat_lahir VARCHAR(100),
    tanggal_lahir DATE,
    alamat TEXT,
    email VARCHAR(100) UNIQUE,
    no_hp VARCHAR(20),
    agama VARCHAR(20),
    pendidikan_terakhir VARCHAR(50),
    tanggal_masuk DATE,
    id_departemen INT,
    id_jabatan INT,
    id_status INT,

    FOREIGN KEY (id_departemen)
    REFERENCES departemen(id_departemen),

    FOREIGN KEY (id_jabatan)
    REFERENCES jabatan(id_jabatan),

    FOREIGN KEY (id_status)
    REFERENCES status_pegawai(id_status)
);

INSERT INTO pegawai
(nik, nama_pegawai, jenis_kelamin, tempat_lahir,
tanggal_lahir, alamat, email, no_hp, agama,
pendidikan_terakhir, tanggal_masuk,
id_departemen, id_jabatan, id_status)
VALUES

('647201001', 'Andi Saputra', 'L', 'Samarinda',
'1999-01-15', 'Jl. Ahmad Yani', 'andi@gmail.com',
'081111111111', 'Islam', 'S1 Informatika',
'2022-01-10', 2, 1, 1),

('647201002', 'Budi Santoso', 'L', 'Balikpapan',
'1995-04-22', 'Jl. Juanda', 'budi@gmail.com',
'081111111112', 'Islam', 'S1 Sistem Informasi',
'2020-03-15', 2, 3, 1),

('647201003', 'Citra Lestari', 'P', 'Samarinda',
'2000-07-11', 'Jl. PM Noor', 'citra@gmail.com',
'081111111113', 'Islam', 'S1 Akuntansi',
'2023-02-01', 3, 1, 2),

('647201004', 'Dewi Ananda', 'P', 'Bontang',
'1994-02-19', 'Jl. Diponegoro', 'dewi@gmail.com',
'081111111114', 'Kristen', 'S2 Manajemen',
'2018-06-10', 4, 5, 1),

('647201005', 'Eko Pratama', 'L', 'Samarinda',
'1998-09-30', 'Jl. Pahlawan', 'eko@gmail.com',
'081111111115', 'Islam', 'D3 Teknik Komputer',
'2021-09-01', 5, 2, 1),

('647201006', 'Farah Putri', 'P', 'Balikpapan',
'2001-12-01', 'Jl. Mulawarman', 'farah@gmail.com',
'081111111116', 'Islam', 'S1 Hukum',
'2024-01-12', 6, 1, 2),

('647201007', 'Gilang Ramadhan', 'L', 'Samarinda',
'1997-05-05', 'Jl. Antasari', 'gilang@gmail.com',
'081111111117', 'Islam', 'S1 Teknik Industri',
'2019-08-20', 5, 3, 1),

('647201008', 'Hana Permata', 'P', 'Bontang',
'1996-03-17', 'Jl. Bhayangkara', 'hana@gmail.com',
'081111111118', 'Kristen', 'S1 Manajemen',
'2019-11-10', 1, 2, 1),

('647201009', 'Ivan Mahendra', 'L', 'Samarinda',
'2002-02-02', 'Jl. Merdeka', 'ivan@gmail.com',
'081111111119', 'Islam', 'S1 Informatika',
'2025-01-10', 2, 1, 3),

('647201010', 'Jessica Tan', 'P', 'Balikpapan',
'1993-09-12', 'Jl. Sudirman', 'jessica@gmail.com',
'081111111120', 'Kristen', 'S2 Bisnis',
'2017-03-01', 4, 5, 1),

('647201011', 'Kevin Wijaya', 'L', 'Bontang',
'1990-11-30', 'Jl. Cendrawasih', 'kevin@gmail.com',
'081111111121', 'Islam', 'S1 Teknik Industri',
'2015-08-12', 5, 6, 1),

('647201012', 'Lina Marlina', 'P', 'Samarinda',
'2001-01-21', 'Jl. Lambung', 'lina@gmail.com',
'081111111122', 'Islam', 'D3 Akuntansi',
'2024-02-15', 3, 1, 2),

('647201013', 'M Rizky', 'L', 'Samarinda',
'1998-06-06', 'Jl. Jakarta', 'rizky@gmail.com',
'081111111123', 'Islam', 'S1 Informatika',
'2020-12-01', 2, 2, 1),

('647201014', 'Nadia Putri', 'P', 'Jakarta',
'1997-08-18', 'Jl. Kemang', 'nadia@gmail.com',
'081111111124', 'Islam', 'S2 Data Science',
'2021-03-10', 7, 4, 1),

('647201015', 'Oscar Fernando', 'L', 'Surabaya',
'1992-05-27', 'Jl. Veteran', 'oscar@gmail.com',
'081111111125', 'Kristen', 'S1 Teknik Sipil',
'2016-09-09', 8, 3, 1);

-- =========================================================
-- 5. TABEL ABSENSI
-- =========================================================

CREATE TABLE absensi (
    id_absensi INT AUTO_INCREMENT PRIMARY KEY,
    id_pegawai INT,
    tanggal DATE,
    jam_masuk TIME,
    jam_keluar TIME,
    status_kehadiran ENUM('Hadir','Izin','Sakit','Alpha'),

    FOREIGN KEY (id_pegawai)
    REFERENCES pegawai(id_pegawai)
);

INSERT INTO absensi
(id_pegawai, tanggal, jam_masuk, jam_keluar, status_kehadiran)
VALUES

(1, '2026-05-20', '08:00:00', '17:00:00', 'Hadir'),
(2, '2026-05-20', '08:10:00', '17:00:00', 'Hadir'),
(3, '2026-05-20', NULL, NULL, 'Izin'),
(4, '2026-05-20', '07:55:00', '17:10:00', 'Hadir'),
(5, '2026-05-20', NULL, NULL, 'Sakit'),
(6, '2026-05-20', '08:05:00', '17:00:00', 'Hadir'),
(7, '2026-05-20', '08:00:00', '17:00:00', 'Hadir'),
(8, '2026-05-20', NULL, NULL, 'Alpha'),
(9, '2026-05-20', '08:00:00', '17:00:00', 'Hadir'),
(10, '2026-05-20', '07:45:00', '17:15:00', 'Hadir'),

(1, '2026-05-21', '08:03:00', '17:00:00', 'Hadir'),
(2, '2026-05-21', NULL, NULL, 'Izin'),
(3, '2026-05-21', '08:20:00', '17:05:00', 'Hadir'),
(4, '2026-05-21', '07:58:00', '17:15:00', 'Hadir'),
(5, '2026-05-21', NULL, NULL, 'Alpha'),

(6, '2026-05-22', '08:10:00', '17:00:00', 'Hadir'),
(7, '2026-05-22', NULL, NULL, 'Sakit'),
(8, '2026-05-22', '08:01:00', '17:00:00', 'Hadir'),
(11, '2026-05-22', NULL, NULL, 'Izin'),
(12, '2026-05-22', '08:15:00', '17:00:00', 'Hadir'),

(13, '2026-05-23', NULL, NULL, 'Alpha'),
(14, '2026-05-23', '08:00:00', '17:00:00', 'Hadir'),
(15, '2026-05-23', '08:05:00', '17:05:00', 'Hadir');

-- =========================================================
-- 6. TABEL CUTI
-- =========================================================

CREATE TABLE cuti (
    id_cuti INT AUTO_INCREMENT PRIMARY KEY,
    id_pegawai INT,
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    jenis_cuti VARCHAR(50),
    alasan TEXT,
    status_persetujuan ENUM('Menunggu','Disetujui','Ditolak'),

    FOREIGN KEY (id_pegawai)
    REFERENCES pegawai(id_pegawai)
);

INSERT INTO cuti
(id_pegawai, tanggal_mulai, tanggal_selesai,
jenis_cuti, alasan, status_persetujuan)
VALUES

(1, '2026-06-01', '2026-06-03',
'Tahunan', 'Liburan keluarga', 'Disetujui'),

(2, '2026-09-01', '2026-09-03',
'Tahunan', 'Acara keluarga', 'Disetujui'),

(3, '2026-07-10', '2026-07-12',
'Sakit', 'Rawat inap', 'Disetujui'),

(4, '2026-10-10', '2026-10-15',
'Melahirkan', 'Persalinan', 'Disetujui'),

(5, '2026-08-01', '2026-08-05',
'Tahunan', 'Pulang kampung', 'Menunggu'),

(6, '2026-06-15', '2026-06-17',
'Sakit', 'Demam tinggi', 'Ditolak'),

(7, '2026-11-01', '2026-11-07',
'Tahunan', 'Liburan', 'Menunggu'),

(8, '2026-12-20', '2026-12-25',
'Keagamaan', 'Hari raya', 'Disetujui'),

(10, '2026-07-01', '2026-07-10',
'Tahunan', 'Liburan luar negeri', 'Disetujui');

-- =========================================================
-- 7. TABEL PENGGAJIAN
-- =========================================================

CREATE TABLE penggajian (
    id_penggajian INT AUTO_INCREMENT PRIMARY KEY,
    id_pegawai INT,
    bulan VARCHAR(20),
    tahun YEAR,
    bonus DECIMAL(15,2),
    potongan DECIMAL(15,2),
    total_gaji DECIMAL(15,2),

    FOREIGN KEY (id_pegawai)
    REFERENCES pegawai(id_pegawai)
);

INSERT INTO penggajian
(id_pegawai, bulan, tahun, bonus, potongan, total_gaji)
VALUES

(1, 'April', 2026, 250000, 0, 5250000),
(2, 'April', 2026, 750000, 100000, 11000000),
(3, 'April', 2026, 0, 50000, 4950000),
(4, 'April', 2026, 5000000, 0, 25000000),
(5, 'April', 2026, 100000, 0, 7100000),

(1, 'Mei', 2026, 500000, 0, 5500000),
(2, 'Mei', 2026, 1000000, 200000, 11300000),
(3, 'Mei', 2026, 0, 100000, 4900000),
(4, 'Mei', 2026, 3000000, 0, 23000000),
(5, 'Mei', 2026, 250000, 50000, 7200000),
(6, 'Mei', 2026, 0, 0, 5000000),
(7, 'Mei', 2026, 1500000, 100000, 11900000),
(8, 'Mei', 2026, 500000, 0, 7500000),

(6, 'Juni', 2026, 500000, 0, 5500000),
(7, 'Juni', 2026, 2000000, 250000, 12250000),
(8, 'Juni', 2026, 0, 0, 7000000),

(9, 'Mei', 2026, 0, 0, 4500000),
(10, 'Mei', 2026, 3500000, 0, 23500000),
(11, 'Mei', 2026, 7000000, 500000, 46500000),
(12, 'Mei', 2026, 0, 100000, 4900000),
(13, 'Mei', 2026, 1000000, 0, 8000000);

-- =========================================================
-- 8. TABEL PROYEK
-- =========================================================

CREATE TABLE proyek (
    id_proyek INT AUTO_INCREMENT PRIMARY KEY,
    nama_proyek VARCHAR(100),
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    budget DECIMAL(15,2)
);

INSERT INTO proyek
(nama_proyek, tanggal_mulai, tanggal_selesai, budget)
VALUES

('Sistem HR Digital', '2026-01-01', '2026-06-30', 150000000),
('Website Perusahaan', '2026-02-01', '2026-05-31', 50000000),
('Aplikasi Mobile Internal', '2026-03-15', '2026-09-15', 200000000),
('Migrasi Server Cloud', '2026-04-01', '2026-10-01', 350000000),
('Sistem Absensi QR', '2026-05-01', '2026-08-01', 80000000),
('Dashboard Keuangan', '2026-06-01', '2026-12-01', 120000000),
('AI Chatbot Internal', '2026-07-01', '2027-01-01', 500000000),
('Upgrade Infrastruktur Jaringan', '2026-08-01', '2026-11-30', 175000000);

-- =========================================================
-- 9. TABEL DETAIL PROYEK
-- =========================================================

CREATE TABLE detail_proyek (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_pegawai INT,
    id_proyek INT,
    posisi_dalam_proyek VARCHAR(100),

    FOREIGN KEY (id_pegawai)
    REFERENCES pegawai(id_pegawai),

    FOREIGN KEY (id_proyek)
    REFERENCES proyek(id_proyek)
);

INSERT INTO detail_proyek
(id_pegawai, id_proyek, posisi_dalam_proyek)
VALUES

(1, 1, 'Backend Developer'),
(2, 1, 'Project Supervisor'),
(1, 2, 'Frontend Developer'),
(5, 2, 'UI Designer'),
(7, 3, 'Project Manager'),
(2, 3, 'System Analyst'),
(3, 4, 'QA Tester'),
(4, 4, 'Project Manager'),
(5, 5, 'Frontend Developer'),
(6, 5, 'Documentation'),
(7, 6, 'Backend Developer'),
(8, 6, 'UI UX Designer'),
(1, 7, 'Database Engineer'),
(2, 7, 'System Analyst'),
(3, 8, 'Data Entry'),
(4, 8, 'AI Engineer'),
(5, 8, 'Support Engineer'),
(6, 4, 'Legal Consultant'),
(7, 5, 'Team Lead'),
(10, 7, 'AI Researcher'),
(11, 4, 'Infrastructure Engineer');

-- =========================================================
-- 10. TABEL USER LOGIN
-- =========================================================

CREATE TABLE user_login (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    role_user ENUM('Admin','HRD','Manager','Pegawai'),
    id_pegawai INT,

    FOREIGN KEY (id_pegawai)
    REFERENCES pegawai(id_pegawai)
);

INSERT INTO user_login
(username, password, role_user, id_pegawai)
VALUES

('admin', 'admin123', 'Admin', NULL),
('andi', 'andi123', 'Pegawai', 1),
('budi', 'budi123', 'Manager', 2),
('dewi', 'dewi123', 'HRD', 4),
('citra', 'citra123', 'Pegawai', 3),
('eko', 'eko123', 'Pegawai', 5),
('farah', 'farah123', 'Pegawai', 6),
('gilang', 'gilang123', 'Manager', 7),
('hana', 'hana123', 'Pegawai', 8),
('jessica', 'jessica123', 'Manager', 10),
('kevin', 'kevin123', 'Admin', 11);

-- =========================================================
-- 11. TABEL LEMBUR
-- =========================================================

CREATE TABLE lembur (
    id_lembur INT AUTO_INCREMENT PRIMARY KEY,
    id_pegawai INT,
    tanggal DATE,
    jumlah_jam INT,
    upah_lembur DECIMAL(15,2),

    FOREIGN KEY (id_pegawai)
    REFERENCES pegawai(id_pegawai)
);

INSERT INTO lembur
(id_pegawai, tanggal, jumlah_jam, upah_lembur)
VALUES

(1, '2026-05-20', 2, 150000),
(2, '2026-05-20', 3, 250000),
(4, '2026-05-21', 4, 500000),
(7, '2026-05-22', 1, 100000),
(10, '2026-05-22', 5, 750000),
(11, '2026-05-23', 6, 1000000);

-- =========================================================
-- LATIHAN SOAL SUBQUERY
-- 40 SOAL - FULL COMMENT + OUTPUT YANG BENAR
-- =========================================================

-- =========================================================
-- TEMA 1 : SUBQUERY DASAR
-- SOAL 1 - 5
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 1
-- Tampilkan pegawai yang memiliki total gaji lebih besar
-- dari rata-rata seluruh total gaji pegawai.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+--------+------------+
| nama_pegawai     | bulan  | total_gaji |
+------------------+--------+------------+
| Dewi Ananda      | April  | 25000000   |
| Dewi Ananda      | Mei    | 23000000   |
| Gilang Ramadhan  | Mei    | 11900000   |
| Gilang Ramadhan  | Juni   | 12250000   |
| Jessica Tan      | Mei    | 23500000   |
| Kevin Wijaya     | Mei    | 46500000   |
+------------------+--------+------------+
*/

/* 
CODE :
*/

SELECT
	p.nama_pegawai as nama_pegawai,
	

-- ---------------------------------------------------------
-- SOAL 2
-- Tampilkan pegawai yang bekerja di departemen
-- Information Technology.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+---------------------------+
| nama_pegawai     | nama_departemen           |
+------------------+---------------------------+
| Andi Saputra     | Information Technology    |
| Budi Santoso     | Information Technology    |
| Ivan Mahendra    | Information Technology    |
| M Rizky          | Information Technology    |
+------------------+---------------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 3
-- Tampilkan pegawai yang memiliki jabatan Manager.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+----------------+
| nama_pegawai     | nama_jabatan   |
+------------------+----------------+
| Dewi Ananda      | Manager        |
| Jessica Tan      | Manager        |
+------------------+----------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 4
-- Tampilkan pegawai yang memiliki tanggal masuk paling awal.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+--------------+
| nama_pegawai     | tanggal_masuk|
+------------------+--------------+
| Kevin Wijaya     | 2015-08-12   |
+------------------+--------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 5
-- Tampilkan pegawai yang memiliki total gaji paling tinggi.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+------------+
| nama_pegawai     | total_gaji |
+------------------+------------+
| Kevin Wijaya     | 46500000   |
+------------------+------------+
*/

/* 
CODE :
*/



-- =========================================================
-- TEMA 2 : SUBQUERY DENGAN IN
-- SOAL 6 - 10
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 6
-- Tampilkan pegawai yang memiliki jabatan Supervisor
-- atau Manager.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+----------------+
| nama_pegawai     | nama_jabatan   |
+------------------+----------------+
| Budi Santoso     | Supervisor     |
| Dewi Ananda      | Manager        |
| Gilang Ramadhan  | Supervisor     |
| Jessica Tan      | Manager        |
| Oscar Fernando   | Supervisor     |
+------------------+----------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 7
-- Tampilkan pegawai yang pernah hadir pada tanggal
-- 2026-05-20.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-------------------+
| nama_pegawai     | status_kehadiran  |
+------------------+-------------------+
| Andi Saputra     | Hadir             |
| Budi Santoso     | Hadir             |
| Dewi Ananda      | Hadir             |
| Farah Putri      | Hadir             |
| Gilang Ramadhan  | Hadir             |
| Ivan Mahendra    | Hadir             |
| Jessica Tan      | Hadir             |
+------------------+-------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 8
-- Tampilkan proyek yang memiliki anggota lebih dari 2 orang.
-- ---------------------------------------------------------

/*
OUTPUT:

+-------------------------------+----------------+
| nama_proyek                   | jumlah_anggota |
+-------------------------------+----------------+
| Migrasi Server Cloud          | 4              |
| Sistem Absensi QR             | 3              |
| AI Chatbot Internal           | 3              |
| Upgrade Infrastruktur Jaringan| 3              |
+-------------------------------+----------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 9
-- Tampilkan departemen yang memiliki pegawai.
-- ---------------------------------------------------------

/*
OUTPUT:

+---------------------------+
| nama_departemen           |
+---------------------------+
| Human Resource            |
| Information Technology    |
| Keuangan                  |
| Marketing                 |
| Operasional               |
| Legal                     |
| Research and Development  |
| Customer Service          |
+---------------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 10
-- Tampilkan pegawai yang memiliki status Tetap atau Kontrak.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+---------------+
| nama_pegawai     | nama_status   |
+------------------+---------------+
| Andi Saputra     | Tetap         |
| Budi Santoso     | Tetap         |
| Citra Lestari    | Kontrak       |
| Dewi Ananda      | Tetap         |
| Eko Pratama      | Tetap         |
| Farah Putri      | Kontrak       |
| Gilang Ramadhan  | Tetap         |
| Hana Permata     | Tetap         |
| Jessica Tan      | Tetap         |
| Kevin Wijaya     | Tetap         |
| Lina Marlina     | Kontrak       |
| M Rizky          | Tetap         |
| Oscar Fernando   | Tetap         |
+------------------+---------------+
*/

/* 
CODE :
*/



-- =========================================================
-- TEMA 3 : EXISTS DAN NOT EXISTS
-- SOAL 11 - 15
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 11
-- Tampilkan pegawai yang memiliki absensi hadir
-- pada tanggal 2026-05-23.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-------------------+
| nama_pegawai     | status_kehadiran  |
+------------------+-------------------+
| Nadia Putri      | Hadir             |
| Oscar Fernando   | Hadir             |
+------------------+-------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 12
-- Tampilkan pegawai yang tidak memiliki akun login.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+
| nama_pegawai     |
+------------------+
| Ivan Mahendra    |
| Lina Marlina     |
| M Rizky          |
| Nadia Putri      |
| Oscar Fernando   |
+------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 13
-- Tampilkan pegawai yang pernah Alpha.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-------------------+
| nama_pegawai     | status_kehadiran  |
+------------------+-------------------+
| Eko Pratama      | Alpha             |
| Hana Permata     | Alpha             |
| M Rizky          | Alpha             |
+------------------+-------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 14
-- Tampilkan proyek yang memiliki anggota dari departemen
-- Information Technology.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------------------+
| nama_proyek                  |
+------------------------------+
| Sistem HR Digital            |
| Website Perusahaan           |
| Aplikasi Mobile Internal     |
| AI Chatbot Internal          |
+------------------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 15
-- Tampilkan pegawai yang belum pernah mengikuti proyek.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+
| nama_pegawai     |
+------------------+
| Ivan Mahendra    |
| Lina Marlina     |
| M Rizky          |
| Nadia Putri      |
| Oscar Fernando   |
+------------------+
*/

/* 
CODE :
*/



-- =========================================================
-- TEMA 4 : SUBQUERY AGREGASI
-- SOAL 16 - 20
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 16
-- Tampilkan pegawai yang total bonusnya di atas
-- rata-rata total bonus pegawai.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-------------+
| nama_pegawai     | total_bonus |
+------------------+-------------+
| Dewi Ananda      | 8000000     |
| Kevin Wijaya     | 7000000     |
| Gilang Ramadhan  | 3500000     |
| Jessica Tan      | 3500000     |
+------------------+-------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 17
-- Tampilkan proyek yang budgetnya di atas rata-rata
-- budget seluruh proyek.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------------------+--------------+
| nama_proyek                  | budget       |
+------------------------------+--------------+
| Migrasi Server Cloud         | 350000000    |
| AI Chatbot Internal          | 500000000    |
+------------------------------+--------------+
*/

/* 
CODE :
*\



-- ---------------------------------------------------------
-- SOAL 18
-- Tampilkan pegawai dengan jumlah lembur tertinggi.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-----------+
| nama_pegawai     | jumlah_jam|
+------------------+-----------+
| Kevin Wijaya     | 6         |
+------------------+-----------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 19
-- Tampilkan departemen yang memiliki jumlah pegawai terbanyak.
-- ---------------------------------------------------------

/*
OUTPUT:

+---------------------------+----------------+
| nama_departemen           | jumlah_pegawai |
+---------------------------+----------------+
| Information Technology    | 4              |
+---------------------------+----------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 20
-- Tampilkan pegawai yang memiliki total bonus terbesar.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-------------+
| nama_pegawai     | total_bonus |
+------------------+-------------+
| Dewi Ananda      | 8000000     |
+------------------+-------------+
*/

/* 
CODE :
*/



-- =========================================================
-- TEMA 5 : NESTED SUBQUERY
-- SOAL 21 - 25
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 21
-- Tampilkan pegawai yang bekerja di departemen
-- yang lokasinya Samarinda.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+---------------------------+
| nama_pegawai     | nama_departemen           |
+------------------+---------------------------+
| Andi Saputra     | Information Technology    |
| Budi Santoso     | Information Technology    |
| Eko Pratama      | Operasional               |
| Gilang Ramadhan  | Operasional               |
| Hana Permata     | Human Resource            |
| Ivan Mahendra    | Information Technology    |
| Kevin Wijaya     | Operasional               |
| M Rizky          | Information Technology    |
| Oscar Fernando   | Customer Service          |
+------------------+---------------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 22
-- Tampilkan pegawai yang ikut proyek AI Chatbot Internal.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+
| nama_pegawai     |
+------------------+
| Andi Saputra     |
| Budi Santoso     |
| Jessica Tan      |
+------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 23
-- Tampilkan pegawai yang memiliki jabatan dengan
-- gaji pokok lebih dari 10000000.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+---------------------+------------+
| nama_pegawai     | nama_jabatan        | gaji_pokok |
+------------------+---------------------+------------+
| Kevin Wijaya     | Direktur            | 30000000   |
| Dewi Ananda      | Manager             | 15000000   |
| Jessica Tan      | Manager             | 15000000   |
| Nadia Putri      | Assistant Manager    | 12000000  |
+------------------+---------------------+------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 24
-- Tampilkan pegawai yang pernah mengambil cuti
-- dengan status Disetujui.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+---------------+
| nama_pegawai     | jenis_cuti    |
+------------------+---------------+
| Andi Saputra     | Tahunan       |
| Budi Santoso     | Tahunan       |
| Citra Lestari    | Sakit         |
| Dewi Ananda      | Melahirkan    |
| Hana Permata     | Keagamaan     |
| Jessica Tan      | Tahunan       |
+------------------+---------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 25
-- Tampilkan pegawai yang bekerja pada proyek dengan budget
-- lebih dari 300000000.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+------------------------------+
| nama_pegawai     | nama_proyek                  |
+------------------+------------------------------+
| Andi Saputra     | AI Chatbot Internal          |
| Budi Santoso     | AI Chatbot Internal          |
| Jessica Tan      | AI Chatbot Internal          |
| Citra Lestari    | Migrasi Server Cloud         |
| Dewi Ananda      | Migrasi Server Cloud         |
| Farah Putri      | Migrasi Server Cloud         |
| Kevin Wijaya     | Migrasi Server Cloud         |
+------------------+------------------------------+
*/

/* 
CODE :
*/



-- =========================================================
-- TEMA 6 : ANY DAN ALL
-- SOAL 26 - 30
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 26
-- Tampilkan pegawai yang memiliki total gaji lebih besar
-- dari semua total gaji pegawai Staff.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+--------+------------+
| nama_pegawai     | bulan  | total_gaji |
+------------------+--------+------------+
| Kevin Wijaya     | Mei    | 46500000   |
| Dewi Ananda      | April  | 25000000   |
| Jessica Tan      | Mei    | 23500000   |
| Dewi Ananda      | Mei    | 23000000   |
| Gilang Ramadhan  | Juni   | 12250000   |
| Gilang Ramadhan  | Mei    | 11900000   |
| Budi Santoso     | Mei    | 11300000   |
| Budi Santoso     | April  | 11000000   |
| M Rizky          | Mei    | 8000000    |
| Hana Permata     | Mei    | 7500000    |
| Eko Pratama      | Mei    | 7200000    |
| Eko Pratama      | April  | 7100000    |
| Hana Permata     | Juni   | 7000000    |
+------------------+--------+------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 27
-- Tampilkan pegawai yang total bonusnya lebih besar
-- dari salah satu total bonus pegawai Manager.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-------------+
| nama_pegawai     | total_bonus |
+------------------+-------------+
| Dewi Ananda      | 8000000     |
| Kevin Wijaya     | 7000000     |
+------------------+-------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 28
-- Tampilkan pegawai yang memiliki total gaji lebih besar
-- dari semua total gaji pegawai Senior Staff.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+--------+------------+
| nama_pegawai     | bulan  | total_gaji |
+------------------+--------+------------+
| Kevin Wijaya     | Mei    | 46500000   |
| Dewi Ananda      | April  | 25000000   |
| Jessica Tan      | Mei    | 23500000   |
| Dewi Ananda      | Mei    | 23000000   |
| Gilang Ramadhan  | Juni   | 12250000   |
| Gilang Ramadhan  | Mei    | 11900000   |
| Budi Santoso     | Mei    | 11300000   |
| Budi Santoso     | April  | 11000000   |
+------------------+--------+------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 29
-- Tampilkan proyek yang budgetnya lebih besar
-- dari semua proyek dengan budget di bawah 200000000.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------------------+--------------+
| nama_proyek                  | budget       |
+------------------------------+--------------+
| Aplikasi Mobile Internal     | 200000000    |
| Migrasi Server Cloud         | 350000000    |
| AI Chatbot Internal          | 500000000    |
+------------------------------+--------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 30
-- Tampilkan pegawai yang jumlah lemburnya lebih besar
-- dari semua pegawai yang hanya pernah lembur 1 jam.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-----------+
| nama_pegawai     | jumlah_jam|
+------------------+-----------+
| Andi Saputra     | 2         |
| Budi Santoso     | 3         |
| Dewi Ananda      | 4         |
| Jessica Tan      | 5         |
| Kevin Wijaya     | 6         |
+------------------+-----------+
*/

/* 
CODE :
*/



-- =========================================================
-- TEMA 7 : SUBQUERY BERTINGKAT
-- SOAL 31 - 35
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 31
-- Tampilkan pegawai dengan total gaji terbesar kedua.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+--------+------------+
| nama_pegawai     | bulan  | total_gaji |
+------------------+--------+------------+
| Dewi Ananda      | April  | 25000000   |
+------------------+--------+------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 32
-- Tampilkan proyek dengan jumlah anggota terbanyak.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------------------+----------------+
| nama_proyek                  | jumlah_anggota |
+------------------------------+----------------+
| Migrasi Server Cloud         | 4              |
+------------------------------+----------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 33
-- Tampilkan pegawai yang bekerja pada minimal 2 proyek.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+----------------+
| nama_pegawai     | jumlah_proyek  |
+------------------+----------------+
| Andi Saputra     | 3              |
| Budi Santoso     | 3              |
| Citra Lestari    | 2              |
| Dewi Ananda      | 2              |
| Eko Pratama      | 3              |
| Farah Putri      | 2              |
| Gilang Ramadhan  | 3              |
+------------------+----------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 34
-- Tampilkan departemen yang seluruh pegawainya
-- pernah hadir minimal satu kali.
-- ---------------------------------------------------------

/*
OUTPUT:

+---------------------------+
| nama_departemen           |
+---------------------------+
| Human Resource            |
| Keuangan                  |
| Marketing                 |
| Legal                     |
| Research and Development  |
| Customer Service          |
+---------------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 35
-- Tampilkan pegawai dengan total gaji tertinggi di
-- masing-masing departemen.
-- ---------------------------------------------------------

/*
OUTPUT:

+---------------------------+------------------+--------+------------+
| nama_departemen           | nama_pegawai     | bulan  | total_gaji |
+---------------------------+------------------+--------+------------+
| Human Resource            | Hana Permata     | Mei    | 7500000    |
| Information Technology    | Budi Santoso     | Mei    | 11300000   |
| Keuangan                  | Citra Lestari    | April  | 4950000    |
| Legal                     | Farah Putri      | Juni   | 5500000    |
| Marketing                 | Dewi Ananda      | April  | 25000000   |
| Operasional               | Kevin Wijaya     | Mei    | 46500000   |
+---------------------------+------------------+--------+------------+
*/

/* 
CODE :
*/



-- =========================================================
-- TEMA 8 : CHALLENGE SUBQUERY
-- SOAL 36 - 40
-- =========================================================

-- ---------------------------------------------------------
-- SOAL 36
-- Tampilkan pegawai yang tidak pernah Alpha.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+
| nama_pegawai     |
+------------------+
| Andi Saputra     |
| Budi Santoso     |
| Citra Lestari    |
| Dewi Ananda      |
| Farah Putri      |
| Gilang Ramadhan  |
| Ivan Mahendra    |
| Jessica Tan      |
| Kevin Wijaya     |
| Lina Marlina     |
| Nadia Putri      |
| Oscar Fernando   |
+------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 37
-- Tampilkan pegawai yang selalu hadir
-- pada seluruh absensinya.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+
| nama_pegawai     |
+------------------+
| Andi Saputra     |
| Dewi Ananda      |
| Farah Putri      |
| Ivan Mahendra    |
| Jessica Tan      |
| Lina Marlina     |
| Nadia Putri      |
| Oscar Fernando   |
+------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 38
-- Tampilkan pegawai yang tidak pernah mengambil cuti sama sekali.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+
| nama_pegawai     |
+------------------+
| Ivan Mahendra    |
| Kevin Wijaya     |
| Lina Marlina     |
| M Rizky          |
| Nadia Putri      |
| Oscar Fernando   |
+------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 39
-- Tampilkan proyek yang tidak memiliki anggota
-- dari departemen Information Technology.
-- ---------------------------------------------------------

/*
OUTPUT:

+-------------------------------+
| nama_proyek                   |
+-------------------------------+
| Migrasi Server Cloud          |
| Sistem Absensi QR             |
| Dashboard Keuangan            |
| Upgrade Infrastruktur Jaringan|
+-------------------------------+
*/

/* 
CODE :
*/



-- ---------------------------------------------------------
-- SOAL 40
-- Tampilkan pegawai yang memiliki total bonus terbesar.
-- ---------------------------------------------------------

/*
OUTPUT:

+------------------+-------------+
| nama_pegawai     | total_bonus |
+------------------+-------------+
| Dewi Ananda      | 8000000     |
+------------------+-------------+
*/

/*
CODE  :
*/