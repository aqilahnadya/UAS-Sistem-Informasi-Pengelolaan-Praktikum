MariaDB [db_praktikum]> INSERT INTO praktikan
    -> (nim, nama_praktikan, jenis_kelamin, program_studi, semester, no_hp, email)
    -> VALUES
    -> ('2301001', 'Andi Saputra', 'Laki-laki', 'Informatika', 4, '081234567801', 'andi@gmail.com'),
    -> ('2301002', 'Siti Aisyah', 'Perempuan', 'Informatika', 4, '081234567802', 'siti@gmail.com'),
    -> ('2301003', 'Nurul Rahma', 'Perempuan', 'Informatika', 4, '081234567803', 'nurul@gmail.com'),
    -> ('2301004', 'Muhammad Rizal', 'Laki-laki', 'Informatika', 4, '081234567804', 'rizal@gmail.com'),
    -> ('2301005', 'Putri Amelia', 'Perempuan', 'Informatika', 4, '081234567805', 'putri@gmail.com');
Query OK, 5 rows affected (0.012 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [db_praktikum]> INSERT INTO laboratorium
    -> (nama_lab, lokasi, kapasitas)
    -> VALUES
    -> ('Laboratorium Komputer 1', 'Gedung A Lantai 2', 30),
    -> ('Laboratorium Komputer 2', 'Gedung A Lantai 2', 30),
    -> ('Laboratorium Jaringan', 'Gedung B Lantai 1', 25);
Query OK, 3 rows affected (0.009 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [db_praktikum]> INSERT INTO mata_praktikum
    -> (kode_praktikum, nama_praktikum, sks, semester)
    -> VALUES
    -> ('PRK001', 'Praktikum Pemrograman Web', 2, 4),
    -> ('PRK002', 'Praktikum Sistem Database', 2, 4),
    -> ('PRK003', 'Praktikum Jaringan Komputer', 2, 4),
    -> ('PRK004', 'Praktikum Algoritma dan Pemrograman', 2, 2);
Query OK, 4 rows affected (0.011 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [db_praktikum]> INSERT INTO asisten
    -> (nim, nama_asisten, no_hp, email)
    -> VALUES
    -> ('2201001', 'Ahmad Fauzan', '082111111111', 'ahmad@gmail.com'),
    -> ('2201002', 'Nabila Putri', '082222222222', 'nabila@gmail.com'),
    -> ('2201003', 'Fajar Ramadhan', '083333333333', 'fajar@gmail.com');
Query OK, 3 rows affected (0.008 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [db_praktikum]> INSERT INTO jadwal_praktikum
    -> (id_praktikum, id_lab, id_asisten, hari, jam_mulai, jam_selesai, kelas)
    -> VALUES
    -> (1, 1, 1, 'Senin', '08:00:00', '10:00:00', 'A'),
    -> (2, 2, 2, 'Selasa', '10:00:00', '12:00:00', 'A'),
    -> (3, 3, 3, 'Rabu', '13:00:00', '15:00:00', 'B'),
    -> (4, 1, 1, 'Kamis', '08:00:00', '10:00:00', 'B');
Query OK, 4 rows affected (0.011 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [db_praktikum]> INSERT INTO pendaftaran
    -> (id_praktikan, id_jadwal, tanggal_daftar, status_pendaftaran)
    -> VALUES
    -> (1, 1, '2026-07-01', 'Terdaftar'),
    -> (2, 1, '2026-07-01', 'Terdaftar'),
    -> (3, 2, '2026-07-02', 'Terdaftar'),
    -> (4, 3, '2026-07-02', 'Terdaftar'),
    -> (5, 4, '2026-07-03', 'Terdaftar');
Query OK, 5 rows affected (0.012 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [db_praktikum]> INSERT INTO nilai
    -> (id_pendaftaran, nilai_tugas, nilai_uts, nilai_uas, nilai_akhir, grade)
    -> VALUES
    -> (1, 85, 80, 90, 85.50, 'A'),
    -> (2, 80, 78, 85, 81.50, 'A'),
    -> (3, 75, 80, 82, 79.40, 'B'),
    -> (4, 88, 85, 90, 87.80, 'A'),
    -> (5, 70, 75, 80, 75.50, 'B');
Query OK, 5 rows affected (0.009 sec)
Records: 5  Duplicates: 0  Warnings: 0