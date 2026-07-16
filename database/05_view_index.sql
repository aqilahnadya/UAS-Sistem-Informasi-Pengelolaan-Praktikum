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

MariaDB [db_praktikum]> CREATE INDEX idx_nama_praktikan
    -> ON praktikan(nama_praktikan);
Query OK, 0 rows affected (0.036 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [db_praktikum]> CREATE INDEX idx_nama_praktikum
    -> ON mata_praktikum(nama_praktikum);
Query OK, 0 rows affected (0.030 sec)
Records: 0  Duplicates: 0  Warnings: 0