<?php

include "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    header("Location: index.php");
    exit;
}

$id = (int) (
    $_POST['id_praktikan'] ?? 0
);

$nim = trim(
    $_POST['nim'] ?? ''
);

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


$query = mysqli_prepare(
    $koneksi,
    "UPDATE praktikan
     SET
        nim = ?,
        nama_praktikan = ?,
        jenis_kelamin = ?,
        program_studi = ?,
        semester = ?,
        no_hp = ?,
        email = ?
     WHERE id_praktikan = ?"
);


mysqli_stmt_bind_param(
    $query,
    "ssssissi",
    $nim,
    $nama,
    $jenis_kelamin,
    $program_studi,
    $semester,
    $no_hp,
    $email,
    $id
);


if (mysqli_stmt_execute($query)) {

    header(
        "Location: index.php?pesan=update"
    );

} else {

    header(
        "Location: index.php?pesan=gagal"
    );
}

exit;
?>