SISTEM INFORMASI PENGELOLAAN PRAKTIKUM

Deskripsi :
Sistem Informasi Pengelolaan Praktikum adalah aplikasi web berbasis database yang dibuat untuk membantu proses pengelolaan kegiatan praktikum secara terstruktur.

Aplikasi ini mengelola data praktikan dan informasi kegiatan praktikum yang saling terhubung, meliputi data praktikan, mata praktikum, laboratorium, asisten, jadwal praktikum, pendaftaran, dan nilai.

Proyek ini dibuat sebagai Proyek Ujian Akhir Semester (UAS) terintegrasi untuk mata kuliah Sistem Database dan Pemrograman Web dengan menggunakan PHP dan MySQL/MariaDB.

Tujuan Proyek :
1. Membangun aplikasi web yang terhubung dengan database.
2. Mengelola data kegiatan praktikum secara terstruktur.
3. Menerapkan konsep Entity Relationship Diagram (ERD).
4. Menerapkan normalisasi database hingga Third Normal Form (3NF).
5. Menerapkan Primary Key dan Foreign Key.
6. Menerapkan operasi CRUD (Create, Read, Update, Delete).
7. Menerapkan query JOIN dan aggregate.
8. Menerapkan View, Index, DCL, dan Transaction.
9. Menyediakan halaman laporan data praktikum.
10. Menerapkan validasi input pada aplikasi web.

Anggota Kelompok :
1. Nama: [RUSMIANI]
   NIM: [IK2511003]
   Tugas: [Buat ERD]

2. Nama: [AQILAH NADYAFALISA]
   NIM: [IK2511013]
   Tugas: [Buat PHP, Laporan]

3. Nama: [NAURA NAYZILA]
   NIM: [IK2511049]
   Tugas: [Buat README]

4. Nama: [ZAHRA ICHMA TABBIALLO]
   NIM: [IK2511061]
   Tugas: [Buat Database, Laporan]

Fitur Aplikasi :
- Dashboard atau halaman utama.
- Menampilkan data praktikan.
- Menambah data praktikan.
- Menyimpan data praktikan ke database.
- Mengedit data praktikan.
- Memperbarui data praktikan.
- Menghapus data praktikan.
- Validasi input form.
- Konfirmasi sebelum menghapus data.
- Navigasi antarhalaman.
- Menampilkan statistik data.
- Menampilkan laporan praktikum.
- Menampilkan data hasil relasi beberapa tabel.
- Cetak laporan.

Fitur Database :
Database proyek menerapkan:
- CREATE DATABASE.
- CREATE TABLE.
- Primary Key.
- Foreign Key.
- INSERT.
- SELECT.
- UPDATE.
- DELETE.
- INNER JOIN.
- LEFT JOIN.
- JOIN lebih dari tiga tabel.
- Subquery.
- GROUP BY.
- HAVING.
- Aggregate Function seperti COUNT dan AVG.
- View.
- Index.
- DCL dengan GRANT.
- Transaction dengan COMMIT dan ROLLBACK.

Teknologi yang Digunakan :
- PHP
- MySQL / MariaDB
- HTML
- CSS
- JavaScript
- XAMPP
- phpMyAdmin
- Visual Studio Code
- GitHub

Struktur Database :
Nama database:
db_praktikum

Database terdiri dari 7 tabel:
1. praktikan
2. mata_praktikum
3. laboratorium
4. asisten
5. jadwal_praktikum
6. pendaftaran
7. nilai

Relasi Database :
Relasi antar tabel:
- Mata Praktikum 1 : N Jadwal Praktikum.
- Laboratorium 1 : N Jadwal Praktikum.
- Asisten 1 : N Jadwal Praktikum.
- Praktikan 1 : N Pendaftaran.
- Jadwal Praktikum 1 : N Pendaftaran.
- Pendaftaran 1 : 1 Nilai.

Database telah dinormalisasi hingga Third Normal Form (3NF).

Struktur Folder Proyek :
Sistem_Informasi_Pengelolaan_Praktikum/
│
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_data.sql
│   ├── 04_query_lanjutan.sql
│   ├── 05_view_index.sql
│   ├── 06_dcl.sql
│   └── 07_transaction.sql
│
├── app/
│   ├── index.php
│   ├── koneksi.php
│   ├── tambah.php
│   ├── simpan.php
│   ├── edit.php
│   ├── update.php
│   ├── hapus.php
│   ├── laporan.php
│   │
│   └── assets/
│       ├── css/
│       │   └── style.css
│       ├── js/
│       │   └── script.js
│       └── img/
│           └── logo.png
│
├── docs/
│   ├── laporan_uas.pdf
│   ├── erd.png
│   └── normalisasi.pdf
│
├── screenshots/
│   ├── dashboard.png
│   ├── tambah_data.png
│   ├── tampil_data.png
│   ├── edit_data.png
│   ├── laporan.png
│   └── hasil_query.png
│
└── README.md

Penjelasan File Database :
#01_create_database.sql
Digunakan untuk membuat database db_praktikum.

#02_create_tables.sql
Digunakan untuk membuat seluruh tabel beserta Primary Key, Foreign Key, dan constraint.

#03_insert_data.sql
Digunakan untuk memasukkan data awal atau data sampel.

#04_query_lanjutan.sql
Berisi query lanjutan seperti JOIN, subquery, GROUP BY, HAVING, COUNT, dan AVG.

#05_view_index.sql
Berisi pembuatan View dan Index.

#06_dcl.sql
Berisi penerapan Data Control Language (DCL) untuk membuat user dan memberikan hak akses menggunakan GRANT.

#07_transaction.sql
Berisi contoh transaksi database menggunakan START TRANSACTION, COMMIT, dan ROLLBACK.

Penjelasan File Aplikasi :
#index.php
Halaman utama atau dashboard aplikasi serta menampilkan data praktikan.

#koneksi.php
Menghubungkan aplikasi PHP dengan database db_praktikum.

#tambah.php
Menampilkan form untuk menambahkan data praktikan.

#simpan.php
Memproses dan menyimpan data baru ke database.

#edit.php
Menampilkan data yang akan diedit.

#update.php
Memproses perubahan data dan memperbarui data di database.

#hapus.php
Memproses penghapusan data.

#laporan.php
Menampilkan laporan data praktikum dari hasil relasi beberapa tabel.

#style.css
Mengatur tampilan dan desain antarmuka aplikasi.

#script.js
Mengatur interaksi JavaScript, validasi, dan konfirmasi pada aplikasi.

Cara Menjalankan Aplikasi :
1. Install XAMPP.
2. Jalankan XAMPP Control Panel.
3. Aktifkan Apache dan MySQL.
4. Letakkan folder Sistem_Informasi_Pengelolaan_Praktikum di dalam folder htdocs.
5. Buka phpMyAdmin.
6. Jalankan atau import file SQL pada folder database secara berurutan:

   01_create_database.sql
   02_create_tables.sql
   03_insert_data.sql
   04_query_lanjutan.sql
   05_view_index.sql
   06_dcl.sql
   07_transaction.sql

7. Pastikan database db_praktikum berhasil dibuat.
8. Buka browser.
9. Jalankan aplikasi melalui:

   http://localhost/Sistem_Informasi_Pengelolaan_Praktikum/app/

Alur CRUD :
CREATE:
tambah.php → simpan.php

READ:
index.php

UPDATE:
edit.php → update.php

DELETE:
hapus.php

REPORT:
laporan.php

Dokumentasi :
Folder docs berisi:

- laporan_uas.pdf
- erd.png
- normalisasi.pdf

Folder screenshots berisi bukti tampilan dan pengujian aplikasi, seperti:

- Dashboard.
- Tambah data.
- Tampil data.
- Edit data.
- Laporan.
- Hasil query SQL.

Status Fitur :
- Database dibuat.
- Tabel database dibuat.
- Primary Key diterapkan.
- Foreign Key diterapkan.
- Normalisasi sampai 3NF.
- Data sampel dimasukkan.
- Query JOIN dibuat.
- Query aggregate dibuat.
- View dibuat.
- Index dibuat.
- DCL dibuat.
- Transaction dibuat.
- Koneksi PHP dan MySQL.
- Fitur tambah data.
- Fitur tampil data.
- Fitur edit data.
- Fitur update data.
- Fitur hapus data.
- Validasi input.
- Halaman laporan.
- CSS dan JavaScript.
- Dokumentasi ERD dan normalisasi.

Pembagian Tugas Kelompok :
| No | Nama Anggota | NIM | Tugas Utama |
|----|--------------|-----|-------------|
| 1 | [RUSMIANI] | [IK2511003] | Buat ERD |
| 2 | [AQILAH NADYAFALISA] | [IK2511013] | Buat PHP, Laporan |
| 3 | [NAURA NAYZILA] | [IK2511049] | Buat README |
| 4 | [ZAHRA ICHMA TABBIALLO] | [IK2511061] | Buat Database, Laporan |

Kesimpulan :
Sistem Informasi Pengelolaan Praktikum berhasil dibangun sebagai aplikasi web berbasis PHP dan MySQL/MariaDB. Sistem telah menerapkan perancangan database, ERD, normalisasi hingga 3NF, Primary Key, Foreign Key, SQL DDL, DML, query JOIN, aggregate, View, Index, DCL, Transaction, serta aplikasi web dengan fitur CRUD, validasi input, navigasi, dan laporan.

Proyek ini mengintegrasikan konsep Sistem Database dan Pemrograman Web dalam satu aplikasi yang saling terhubung.