<?php

include "koneksi.php";

$query = mysqli_query(
    $koneksi,
    "SELECT
        p.nim,
        p.nama_praktikan,
        mp.nama_praktikum,
        j.hari,
        j.jam_mulai,
        j.jam_selesai,
        l.nama_lab,
        a.nama_asisten,
        pd.status_pendaftaran,
        n.nilai_akhir
    FROM pendaftaran pd

    INNER JOIN praktikan p
        ON pd.id_praktikan =
        p.id_praktikan

    INNER JOIN jadwal_praktikum j
        ON pd.id_jadwal =
        j.id_jadwal

    INNER JOIN mata_praktikum mp
        ON j.id_praktikum =
        mp.id_praktikum

    INNER JOIN laboratorium l
        ON j.id_lab =
        l.id_lab

    INNER JOIN asisten a
        ON j.id_asisten =
        a.id_asisten

    LEFT JOIN nilai n
        ON pd.id_pendaftaran =
        n.id_pendaftaran

    ORDER BY
        p.nama_praktikan ASC"
);
?>

<!DOCTYPE html>
<html lang="id">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>Laporan Praktikum</title>

    <link
        rel="stylesheet"
        href="assets/style.css"
    >

</head>

<body>

<header class="header">

    <div class="brand">

        <img
            src="assets/logo_umb.PNG"
            class="logo"
            alt="Logo"
        >

        <div>
            <h1>SIM Praktikum</h1>
            <p>Laporan Pengelolaan Praktikum</p>
        </div>

    </div>

</header>


<nav class="navbar">

    <a href="index.php">
        Dashboard
    </a>

    <a href="tambah.php">
        Tambah Data
    </a>

    <a
        href="laporan.php"
        class="active"
    >
        Laporan
    </a>

</nav>


<main class="container">

    <section class="panel">

        <div class="panel-header">

            <h2>Laporan Praktikum</h2>

            <button
                onclick="window.print()"
                class="btn btn-primary"
            >
                Cetak Laporan
            </button>

        </div>


        <div class="table-responsive">

            <table>

                <thead>

                    <tr>
                        <th>No</th>
                        <th>NIM</th>
                        <th>Praktikan</th>
                        <th>Mata Praktikum</th>
                        <th>Hari</th>
                        <th>Waktu</th>
                        <th>Laboratorium</th>
                        <th>Asisten</th>
                        <th>Status</th>
                        <th>Nilai</th>
                    </tr>

                </thead>

                <tbody>

                <?php
                $no = 1;

                while (
                    $data =
                    mysqli_fetch_assoc($query)
                ) {
                ?>

                    <tr>

                        <td>
                            <?php echo $no++; ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data['nim']
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data[
                                    'nama_praktikan'
                                ]
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data[
                                    'nama_praktikum'
                                ]
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data['hari']
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo substr(
                                $data['jam_mulai'],
                                0,
                                5
                            );

                            echo " - ";

                            echo substr(
                                $data['jam_selesai'],
                                0,
                                5
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data['nama_lab']
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data['nama_asisten']
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data[
                                    'status_pendaftaran'
                                ]
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo $data['nilai_akhir']
                                ?? '-';
                            ?>
                        </td>

                    </tr>

                <?php } ?>

                </tbody>

            </table>

        </div>

    </section>

</main>


<script src="assets/script.js"></script>

</body>
</html>