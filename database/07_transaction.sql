MariaDB [db_praktikum]> START TRANSACTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [db_praktikum]>
MariaDB [db_praktikum]> INSERT INTO pendaftaran
    -> (
    ->     id_praktikan,
    ->     id_jadwal,
    ->     tanggal_daftar,
    ->     status_pendaftaran
    -> )
    -> VALUES
    -> (
    ->     1,
    ->     2,
    ->     CURDATE(),
    ->     'Terdaftar'
    -> );
Query OK, 1 row affected (0.001 sec)

MariaDB [db_praktikum]>
MariaDB [db_praktikum]> COMMIT;
Query OK, 0 rows affected (0.007 sec)

MariaDB [db_praktikum]> START TRANSACTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [db_praktikum]>
MariaDB [db_praktikum]> UPDATE pendaftaran
    -> SET status_pendaftaran = 'Dibatalkan'
    -> WHERE id_pendaftaran = 1;
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [db_praktikum]>
MariaDB [db_praktikum]> ROLLBACK;
Query OK, 0 rows affected (0.007 sec)