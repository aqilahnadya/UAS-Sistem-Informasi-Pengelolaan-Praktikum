<?php

include "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    header("Location: index.php");
    exit;
}

$nim = trim($_POST['nim'] ?? '');

$nama = trim(
    $_POST['nama_praktikan'] ?? ''
);

$jenis_kelamin = trim(
    $_POST['jenis_kelamin'] ?? ''
);

$program_studi = trim(
    $_POST['program_studi'] ?? ''
);

$semester = (int) (
    $_POST['semester'] ?? 0
);

$no_hp = trim(
    $_POST['no_hp'] ?? ''
);

$email = trim(
    $_POST['email'] ?? ''
);


if (
    $nim == '' ||
    $nama == '' ||
    $jenis_kelamin == '' ||
    $program_studi == '' ||
    $semester < 1
) {

    echo "
        <script>
            alert('Data wajib harus diisi.');
            window.location='tambah.php';
        </script>
    ";

    exit;
}


$query = mysqli_prepare(
    $koneksi,
    "INSERT INTO praktikan
    (
        nim,
        nama_praktikan,
        jenis_kelamin,
        program_studi,
        semester,
        no_hp,
        email
    )
    VALUES (?, ?, ?, ?, ?, ?, ?)"
);

mysqli_stmt_bind_param(
    $query,
    "ssssiss",
    $nim,
    $nama,
    $jenis_kelamin,
    $program_studi,
    $semester,
    $no_hp,
    $email
);


if (mysqli_stmt_execute($query)) {

    header(
        "Location: index.php?pesan=tambah"
    );

} else {

    header(
        "Location: index.php?pesan=gagal"
    );
}

exit;
?>