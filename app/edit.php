<?php

include "koneksi.php";

$id = isset($_GET['id'])
    ? (int) $_GET['id']
    : 0;

if ($id <= 0) {
    header("Location: index.php");
    exit;
}


$query = mysqli_prepare(
    $koneksi,
    "SELECT *
     FROM praktikan
     WHERE id_praktikan = ?"
);

mysqli_stmt_bind_param(
    $query,
    "i",
    $id
);

mysqli_stmt_execute($query);

$result = mysqli_stmt_get_result($query);

$data = mysqli_fetch_assoc($result);


if (!$data) {

    echo "
        <script>
            alert('Data tidak ditemukan.');
            window.location='index.php';
        </script>
    ";

    exit;
}
?>

<!DOCTYPE html>
<html lang="id">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>Edit Praktikan</title>

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
            <p>Edit Data Praktikan</p>
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

    <a href="laporan.php">
        Laporan
    </a>

</nav>


<main class="container">

    <section class="panel form-panel">

        <div class="panel-header">

            <h2>Form Edit Praktikan</h2>

            <a
                href="index.php"
                class="btn btn-secondary"
            >
                Kembali
            </a>

        </div>


        <form
            action="update.php"
            method="POST"
        >

            <input
                type="hidden"
                name="id_praktikan"
                value="<?php
                    echo $data[
                        'id_praktikan'
                    ];
                ?>"
            >


            <div class="form-group">

                <label>NIM</label>

                <input
                    type="text"
                    name="nim"
                    class="form-control"
                    value="<?php
                        echo htmlspecialchars(
                            $data['nim']
                        );
                    ?>"
                    required
                >

            </div>


            <div class="form-group">

                <label>Nama Praktikan</label>

                <input
                    type="text"
                    name="nama_praktikan"
                    class="form-control"
                    value="<?php
                        echo htmlspecialchars(
                            $data[
                                'nama_praktikan'
                            ]
                        );
                    ?>"
                    required
                >

            </div>


            <div class="form-group">

                <label>Jenis Kelamin</label>

                <select
                    name="jenis_kelamin"
                    class="form-control"
                    required
                >

                    <option
                        value="Laki-laki"
                        <?php
                        if (
                            $data[
                                'jenis_kelamin'
                            ] == "Laki-laki"
                        ) {
                            echo "selected";
                        }
                        ?>
                    >
                        Laki-laki
                    </option>

                    <option
                        value="Perempuan"
                        <?php
                        if (
                            $data[
                                'jenis_kelamin'
                            ] == "Perempuan"
                        ) {
                            echo "selected";
                        }
                        ?>
                    >
                        Perempuan
                    </option>

                </select>

            </div>


            <div class="form-group">

                <label>Program Studi</label>

                <input
                    type="text"
                    name="program_studi"
                    class="form-control"
                    value="<?php
                        echo htmlspecialchars(
                            $data[
                                'program_studi'
                            ]
                        );
                    ?>"
                    required
                >

            </div>


            <div class="form-group">

                <label>Semester</label>

                <input
                    type="number"
                    name="semester"
                    class="form-control"
                    min="1"
                    max="14"
                    value="<?php
                        echo $data['semester'];
                    ?>"
                    required
                >

            </div>


            <div class="form-group">

                <label>Nomor HP</label>

                <input
                    type="text"
                    name="no_hp"
                    class="form-control"
                    value="<?php
                        echo htmlspecialchars(
                            $data['no_hp']
                        );
                    ?>"
                >

            </div>


            <div class="form-group">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    class="form-control"
                    value="<?php
                        echo htmlspecialchars(
                            $data['email']
                        );
                    ?>"
                >

            </div>


            <button
                type="submit"
                class="btn btn-primary"
            >
                Update Data
            </button>

        </form>

    </section>

</main>

</body>
</html>