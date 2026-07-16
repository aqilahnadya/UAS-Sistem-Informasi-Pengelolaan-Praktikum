<!DOCTYPE html>
<html lang="id">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0"
    >

    <title>Tambah Praktikan</title>

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
            <p>Tambah Data Praktikan</p>
        </div>

    </div>

</header>


<nav class="navbar">

    <a href="index.php">
        Dashboard
    </a>

    <a
        href="tambah.php"
        class="active"
    >
        Tambah Data
    </a>

    <a href="laporan.php">
        Laporan
    </a>

</nav>


<main class="container">

    <section class="panel form-panel">

        <div class="panel-header">

            <h2>Form Tambah Praktikan</h2>

            <a
                href="index.php"
                class="btn btn-secondary"
            >
                Kembali
            </a>

        </div>


        <form
            id="formPraktikan"
            action="simpan.php"
            method="POST"
        >

            <div class="form-group">

                <label>NIM</label>

                <input
                    type="text"
                    name="nim"
                    class="form-control"
                    maxlength="20"
                    required
                >

            </div>


            <div class="form-group">

                <label>Nama Praktikan</label>

                <input
                    type="text"
                    name="nama_praktikan"
                    class="form-control"
                    maxlength="100"
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

                    <option value="">
                        -- Pilih --
                    </option>

                    <option value="Laki-laki">
                        Laki-laki
                    </option>

                    <option value="Perempuan">
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
                    required
                >

            </div>


            <div class="form-group">

                <label>Nomor HP</label>

                <input
                    type="text"
                    name="no_hp"
                    class="form-control"
                    maxlength="20"
                >

            </div>


            <div class="form-group">

                <label>Email</label>

                <input
                    type="email"
                    name="email"
                    class="form-control"
                >

            </div>


            <button
                type="submit"
                class="btn btn-primary"
            >
                Simpan Data
            </button>

            <a
                href="index.php"
                class="btn btn-secondary"
            >
                Batal
            </a>

        </form>

    </section>

</main>


<script src="assets/script.js"></script>

</body>
</html>