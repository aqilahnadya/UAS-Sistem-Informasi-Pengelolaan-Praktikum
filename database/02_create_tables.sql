MariaDB [db_praktikum]> CREATE TABLE praktikan (
    ->     id_praktikan INT AUTO_INCREMENT PRIMARY KEY,
    ->     nim VARCHAR(20) NOT NULL UNIQUE,
    ->     nama_praktikan VARCHAR(100) NOT NULL,
    ->     jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    ->     program_studi VARCHAR(100) NOT NULL,
    ->     semester INT NOT NULL,
    ->     no_hp VARCHAR(20),
    ->     email VARCHAR(100)
    -> ) ENGINE=InnoDB;
Query OK, 0 rows affected (0.022 sec)

MariaDB [db_praktikum]> CREATE TABLE laboratorium (
    ->     id_lab INT AUTO_INCREMENT PRIMARY KEY,
    ->     nama_lab VARCHAR(100) NOT NULL,
    ->     lokasi VARCHAR(150) NOT NULL,
    ->     kapasitas INT NOT NULL
    -> ) ENGINE=InnoDB;
Query OK, 0 rows affected (0.022 sec)

MariaDB [db_praktikum]> CREATE TABLE mata_praktikum (
    ->     id_praktikum INT AUTO_INCREMENT PRIMARY KEY,
    ->     kode_praktikum VARCHAR(20) NOT NULL UNIQUE,
    ->     nama_praktikum VARCHAR(100) NOT NULL,
    ->     sks INT NOT NULL,
    ->     semester INT NOT NULL
    -> ) ENGINE=InnoDB;
Query OK, 0 rows affected (0.023 sec)

MariaDB [db_praktikum]> CREATE TABLE asisten (
    ->     id_asisten INT AUTO_INCREMENT PRIMARY KEY,
    ->     nim VARCHAR(20) NOT NULL UNIQUE,
    ->     nama_asisten VARCHAR(100) NOT NULL,
    ->     no_hp VARCHAR(20),
    ->     email VARCHAR(100)
    -> ) ENGINE=InnoDB;
Query OK, 0 rows affected (0.024 sec)

MariaDB [db_praktikum]> CREATE TABLE jadwal_praktikum (
    ->     id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
    ->     id_praktikum INT NOT NULL,
    ->     id_lab INT NOT NULL,
    ->     id_asisten INT NOT NULL,
    ->     hari ENUM(
    ->         'Senin',
    ->         'Selasa',
    ->         'Rabu',
    ->         'Kamis',
    ->         'Jumat',
    ->         'Sabtu'
    ->     ) NOT NULL,
    ->     jam_mulai TIME NOT NULL,
    ->     jam_selesai TIME NOT NULL,
    ->     kelas VARCHAR(20) NOT NULL,
    ->
    ->     CONSTRAINT fk_jadwal_praktikum
    ->         FOREIGN KEY (id_praktikum)
    ->         REFERENCES mata_praktikum(id_praktikum)
    ->         ON UPDATE CASCADE
    ->         ON DELETE RESTRICT,
    ->
    ->     CONSTRAINT fk_jadwal_lab
    ->         FOREIGN KEY (id_lab)
    ->         REFERENCES laboratorium(id_lab)
    ->         ON UPDATE CASCADE
    ->         ON DELETE RESTRICT,
    ->
    ->     CONSTRAINT fk_jadwal_asisten
    ->         FOREIGN KEY (id_asisten)
    ->         REFERENCES asisten(id_asisten)
    ->         ON UPDATE CASCADE
    ->         ON DELETE RESTRICT
    -> ) ENGINE=InnoDB;
Query OK, 0 rows affected (0.028 sec)

MariaDB [db_praktikum]> CREATE TABLE pendaftaran (
    ->     id_pendaftaran INT AUTO_INCREMENT PRIMARY KEY,
    ->     id_praktikan INT NOT NULL,
    ->     id_jadwal INT NOT NULL,
    ->     tanggal_daftar DATE NOT NULL,
    ->     status_pendaftaran ENUM(
    ->         'Terdaftar',
    ->         'Selesai',
    ->         'Dibatalkan'
    ->     ) DEFAULT 'Terdaftar',
    ->
    ->     CONSTRAINT fk_pendaftaran_praktikan
    ->         FOREIGN KEY (id_praktikan)
    ->         REFERENCES praktikan(id_praktikan)
    ->         ON UPDATE CASCADE
    ->         ON DELETE CASCADE,
    ->
    ->     CONSTRAINT fk_pendaftaran_jadwal
    ->         FOREIGN KEY (id_jadwal)
    ->         REFERENCES jadwal_praktikum(id_jadwal)
    ->         ON UPDATE CASCADE
    ->         ON DELETE RESTRICT,
    ->
    ->     CONSTRAINT unik_pendaftaran
    ->         UNIQUE (id_praktikan, id_jadwal)
    -> ) ENGINE=InnoDB;
Query OK, 0 rows affected (0.032 sec)

MariaDB [db_praktikum]> CREATE TABLE nilai (
    ->     id_nilai INT AUTO_INCREMENT PRIMARY KEY,
    ->     id_pendaftaran INT NOT NULL UNIQUE,
    ->     nilai_tugas DECIMAL(5,2) DEFAULT 0,
    ->     nilai_uts DECIMAL(5,2) DEFAULT 0,
    ->     nilai_uas DECIMAL(5,2) DEFAULT 0,
    ->     nilai_akhir DECIMAL(5,2) DEFAULT 0,
    ->     grade VARCHAR(2),
    ->
    ->     CONSTRAINT fk_nilai_pendaftaran
    ->         FOREIGN KEY (id_pendaftaran)
    ->         REFERENCES pendaftaran(id_pendaftaran)
    ->         ON UPDATE CASCADE
    ->         ON DELETE CASCADE
    -> ) ENGINE=InnoDB;
Query OK, 0 rows affected (0.024 sec)