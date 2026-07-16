<?php
include "koneksi.php";

$query = mysqli_query(
    $koneksi,
    "SELECT * FROM praktikan
     ORDER BY id_praktikan DESC"
);

$totalPraktikan = mysqli_num_rows($query);

$queryPraktikum = mysqli_query(
    $koneksi,
    "SELECT COUNT(*) AS total
     FROM mata_praktikum"
);

$dataPraktikum = mysqli_fetch_assoc(
    $queryPraktikum
);

$totalPraktikum = $dataPraktikum['total'];

$queryJadwal = mysqli_query(
    $koneksi,
    "SELECT COUNT(*) AS total
     FROM jadwal_praktikum"
);

$dataJadwal = mysqli_fetch_assoc(
    $queryJadwal
);

$totalJadwal = $dataJadwal['total'];

$queryPendaftaran = mysqli_query(
    $koneksi,
    "SELECT COUNT(*) AS total
     FROM pendaftaran"
);

$dataPendaftaran = mysqli_fetch_assoc(
    $queryPendaftaran
);

$totalPendaftaran = $dataPendaftaran['total'];
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>
        Sistem Informasi Pengelolaan Praktikum
    </title>

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
            alt="Logo"
            class="logo"
        >

        <div>
            <h1>SIM Praktikum</h1>
            <p>
                Sistem Informasi Pengelolaan Praktikum
            </p>
        </div>

    </div>

</header>


<nav class="navbar">

    <a
        href="index.php"
        class="active"
    >
        Dashboard
    </a>

    <a href="tambah.php">
        Tambah Data
    </a>

    <a href="laporan.php">
        Laporan
    </a>

</nav>


<main class="container">

    <section class="welcome">

        <h2>
            Dashboard Pengelolaan Praktikum
        </h2>

        <p>
            Selamat datang di Sistem Informasi
            Pengelolaan Praktikum.
        </p>

    </section>


    <section class="card-container">

        <div class="card">

            <h3>Total Praktikan</h3>

            <span>
                <?php echo $totalPraktikan; ?>
            </span>

        </div>


        <div class="card">

            <h3>Mata Praktikum</h3>

            <span>
                <?php echo $totalPraktikum; ?>
            </span>

        </div>


        <div class="card">

            <h3>Jadwal Praktikum</h3>

            <span>
                <?php echo $totalJadwal; ?>
            </span>

        </div>


        <div class="card">

            <h3>Pendaftaran</h3>

            <span>
                <?php echo $totalPendaftaran; ?>
            </span>

        </div>

    </section>


    <?php if (isset($_GET['pesan'])) { ?>

        <?php if ($_GET['pesan'] == "tambah") { ?>

            <div class="alert success">
                Data berhasil ditambahkan.
            </div>

        <?php } elseif ($_GET['pesan'] == "update") { ?>

            <div class="alert success">
                Data berhasil diperbarui.
            </div>

        <?php } elseif ($_GET['pesan'] == "hapus") { ?>

            <div class="alert success">
                Data berhasil dihapus.
            </div>

        <?php } elseif ($_GET['pesan'] == "gagal") { ?>

            <div class="alert danger">
                Proses data gagal.
            </div>

        <?php } ?>

    <?php } ?>


    <section class="panel">

        <div class="panel-header">

            <h2>Data Praktikan</h2>

            <a
                href="tambah.php"
                class="btn btn-primary"
            >
                + Tambah Data
            </a>

        </div>


        <div class="table-responsive">

            <table>

                <thead>

                    <tr>
                        <th>No</th>
                        <th>NIM</th>
                        <th>Nama</th>
                        <th>Jenis Kelamin</th>
                        <th>Program Studi</th>
                        <th>Semester</th>
                        <th>No. HP</th>
                        <th>Email</th>
                        <th>Aksi</th>
                    </tr>

                </thead>

                <tbody>

                <?php
                $no = 1;

                if (mysqli_num_rows($query) > 0) {

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
                                    'jenis_kelamin'
                                ]
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data[
                                    'program_studi'
                                ]
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo $data['semester'];
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data['no_hp']
                            );
                            ?>
                        </td>

                        <td>
                            <?php
                            echo htmlspecialchars(
                                $data['email']
                            );
                            ?>
                        </td>

                        <td class="aksi">

                            <a
                                href="edit.php?id=<?php
                                    echo $data[
                                        'id_praktikan'
                                    ];
                                ?>"
                                class="btn btn-warning"
                            >
                                Edit
                            </a>

                            <a
                                href="hapus.php?id=<?php
                                    echo $data[
                                        'id_praktikan'
                                    ];
                                ?>"
                                class="btn btn-danger"
                                onclick="
                                    return konfirmasiHapus();
                                "
                            >
                                Hapus
                            </a>

                        </td>

                    </tr>

                <?php
                    }

                } else {
                ?>

                    <tr>

                        <td
                            colspan="9"
                            class="text-center"
                        >
                            Belum ada data praktikan.
                        </td>

                    </tr>

                <?php } ?>

                </tbody>

            </table>

        </div>

    </section>

</main>


<footer>

    <p>
        &copy; <?php echo date("Y"); ?>
        Sistem Informasi Pengelolaan Praktikum
    </p>

</footer>


<script src="assets/script.js"></script>

</body>
</html>