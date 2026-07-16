MariaDB [db_praktikum]> SELECT
    ->     j.id_jadwal,
    ->     mp.kode_praktikum,
    ->     mp.nama_praktikum,
    ->     l.nama_lab,
    ->     a.nama_asisten,
    ->     j.hari,
    ->     j.jam_mulai,
    ->     j.jam_selesai,
    ->     j.kelas
    -> FROM jadwal_praktikum j
    -> JOIN mata_praktikum mp
    ->     ON j.id_praktikum = mp.id_praktikum
    -> JOIN laboratorium l
    ->     ON j.id_lab = l.id_lab
    -> JOIN asisten a
    ->     ON j.id_asisten = a.id_asisten;
+-----------+----------------+-------------------------------------+-------------------------+----------------+--------+-----------+-------------+-------+
| id_jadwal | kode_praktikum | nama_praktikum                      | nama_lab                | nama_asisten   | hari   | jam_mulai | jam_selesai | kelas |
+-----------+----------------+-------------------------------------+-------------------------+----------------+--------+-----------+-------------+-------+
|         1 | PRK001         | Praktikum Pemrograman Web           | Laboratorium Komputer 1 | Ahmad Fauzan   | Senin  | 08:00:00  | 10:00:00    | A     |
|         2 | PRK002         | Praktikum Sistem Database           | Laboratorium Komputer 2 | Nabila Putri   | Selasa | 10:00:00  | 12:00:00    | A     |
|         3 | PRK003         | Praktikum Jaringan Komputer         | Laboratorium Jaringan   | Fajar Ramadhan | Rabu   | 13:00:00  | 15:00:00    | B     |
|         4 | PRK004         | Praktikum Algoritma dan Pemrograman | Laboratorium Komputer 1 | Ahmad Fauzan   | Kamis  | 08:00:00  | 10:00:00    | B     |
+-----------+----------------+-------------------------------------+-------------------------+----------------+--------+-----------+-------------+-------+
4 rows in set (0.001 sec)

MariaDB [db_praktikum]> SELECT
    ->     p.id_pendaftaran,
    ->     pr.nim,
    ->     pr.nama_praktikan,
    ->     mp.nama_praktikum,
    ->     j.hari,
    ->     j.kelas,
    ->     p.tanggal_daftar,
    ->     p.status_pendaftaran
    -> FROM pendaftaran p
    -> JOIN praktikan pr
    ->     ON p.id_praktikan = pr.id_praktikan
    -> JOIN jadwal_praktikum j
    ->     ON p.id_jadwal = j.id_jadwal
    -> JOIN mata_praktikum mp
    ->     ON j.id_praktikum = mp.id_praktikum;
+----------------+---------+----------------+-------------------------------------+--------+-------+----------------+--------------------+
| id_pendaftaran | nim     | nama_praktikan | nama_praktikum                      | hari   | kelas | tanggal_daftar | status_pendaftaran |
+----------------+---------+----------------+-------------------------------------+--------+-------+----------------+--------------------+
|              1 | 2301001 | Andi Saputra   | Praktikum Pemrograman Web           | Senin  | A     | 2026-07-01     | Terdaftar          |
|              2 | 2301002 | Siti Aisyah    | Praktikum Pemrograman Web           | Senin  | A     | 2026-07-01     | Terdaftar          |
|              3 | 2301003 | Nurul Rahma    | Praktikum Sistem Database           | Selasa | A     | 2026-07-02     | Terdaftar          |
|              4 | 2301004 | Muhammad Rizal | Praktikum Jaringan Komputer         | Rabu   | B     | 2026-07-02     | Terdaftar          |
|              5 | 2301005 | Putri Amelia   | Praktikum Algoritma dan Pemrograman | Kamis  | B     | 2026-07-03     | Terdaftar          |
+----------------+---------+----------------+-------------------------------------+--------+-------+----------------+--------------------+
5 rows in set (0.001 sec)

MariaDB [db_praktikum]> SELECT
    ->     mp.nama_praktikum,
    ->     COUNT(p.id_pendaftaran) AS jumlah_praktikan
    -> FROM mata_praktikum mp
    -> LEFT JOIN jadwal_praktikum j
    ->     ON mp.id_praktikum = j.id_praktikum
    -> LEFT JOIN pendaftaran p
    ->     ON j.id_jadwal = p.id_jadwal
    -> GROUP BY mp.id_praktikum, mp.nama_praktikum;
+-------------------------------------+------------------+
| nama_praktikum                      | jumlah_praktikan |
+-------------------------------------+------------------+
| Praktikum Pemrograman Web           |                2 |
| Praktikum Sistem Database           |                1 |
| Praktikum Jaringan Komputer         |                1 |
| Praktikum Algoritma dan Pemrograman |                1 |
+-------------------------------------+------------------+
4 rows in set (0.001 sec)

MariaDB [db_praktikum]> SELECT
    ->     mp.nama_praktikum,
    ->     AVG(n.nilai_akhir) AS rata_rata_nilai
    -> FROM nilai n
    -> JOIN pendaftaran p
    ->     ON n.id_pendaftaran = p.id_pendaftaran
    -> JOIN jadwal_praktikum j
    ->     ON p.id_jadwal = j.id_jadwal
    -> JOIN mata_praktikum mp
    ->     ON j.id_praktikum = mp.id_praktikum
    -> GROUP BY mp.id_praktikum, mp.nama_praktikum;
+-------------------------------------+-----------------+
| nama_praktikum                      | rata_rata_nilai |
+-------------------------------------+-----------------+
| Praktikum Pemrograman Web           |       83.500000 |
| Praktikum Sistem Database           |       79.400000 |
| Praktikum Jaringan Komputer         |       87.800000 |
| Praktikum Algoritma dan Pemrograman |       75.500000 |
+-------------------------------------+-----------------+
4 rows in set (0.001 sec)

MariaDB [db_praktikum]> CREATE OR REPLACE VIEW view_laporan_praktikum AS
    -> SELECT
    ->     p.id_pendaftaran,
    ->     pr.nim,
    ->     pr.nama_praktikan,
    ->     pr.program_studi,
    ->     mp.kode_praktikum,
    ->     mp.nama_praktikum,
    ->     j.hari,
    ->     j.jam_mulai,
    ->     j.jam_selesai,
    ->     j.kelas,
    ->     l.nama_lab,
    ->     a.nama_asisten,
    ->     p.tanggal_daftar,
    ->     p.status_pendaftaran,
    ->     n.nilai_akhir,
    ->     n.grade
    -> FROM pendaftaran p
    -> JOIN praktikan pr
    ->     ON p.id_praktikan = pr.id_praktikan
    -> JOIN jadwal_praktikum j
    ->     ON p.id_jadwal = j.id_jadwal
    -> JOIN mata_praktikum mp
    ->     ON j.id_praktikum = mp.id_praktikum
    -> JOIN laboratorium l
    ->     ON j.id_lab = l.id_lab
    -> JOIN asisten a
    ->     ON j.id_asisten = a.id_asisten
    -> LEFT JOIN nilai n
    ->     ON p.id_pendaftaran = n.id_pendaftaran;
Query OK, 0 rows affected (0.011 sec)

MariaDB [db_praktikum]> SELECT * FROM view_laporan_praktikum;
+----------------+---------+----------------+---------------+----------------+-------------------------------------+--------+-----------+-------------+-------+-------------------------+----------------+----------------+--------------------+-------------+-------+
| id_pendaftaran | nim     | nama_praktikan | program_studi | kode_praktikum | nama_praktikum                      | hari   | jam_mulai | jam_selesai | kelas | nama_lab                | nama_asisten   | tanggal_daftar | status_pendaftaran | nilai_akhir | grade |
+----------------+---------+----------------+---------------+----------------+-------------------------------------+--------+-----------+-------------+-------+-------------------------+----------------+----------------+--------------------+-------------+-------+
|              1 | 2301001 | Andi Saputra   | Informatika   | PRK001         | Praktikum Pemrograman Web           | Senin  | 08:00:00  | 10:00:00    | A     | Laboratorium Komputer 1 | Ahmad Fauzan   | 2026-07-01     | Terdaftar          |       85.50 | A     |
|              2 | 2301002 | Siti Aisyah    | Informatika   | PRK001         | Praktikum Pemrograman Web           | Senin  | 08:00:00  | 10:00:00    | A     | Laboratorium Komputer 1 | Ahmad Fauzan   | 2026-07-01     | Terdaftar          |       81.50 | A     |
|              5 | 2301005 | Putri Amelia   | Informatika   | PRK004         | Praktikum Algoritma dan Pemrograman | Kamis  | 08:00:00  | 10:00:00    | B     | Laboratorium Komputer 1 | Ahmad Fauzan   | 2026-07-03     | Terdaftar          |       75.50 | B     |
|              3 | 2301003 | Nurul Rahma    | Informatika   | PRK002         | Praktikum Sistem Database           | Selasa | 10:00:00  | 12:00:00    | A     | Laboratorium Komputer 2 | Nabila Putri   | 2026-07-02     | Terdaftar          |       79.40 | B     |
|              4 | 2301004 | Muhammad Rizal | Informatika   | PRK003         | Praktikum Jaringan Komputer         | Rabu   | 13:00:00  | 15:00:00    | B     | Laboratorium Jaringan   | Fajar Ramadhan | 2026-07-02     | Terdaftar          |       87.80 | A     |
+----------------+---------+----------------+---------------+----------------+-------------------------------------+--------+-----------+-------------+-------+-------------------------+----------------+----------------+--------------------+-------------+-------+
5 rows in set (0.003 sec)