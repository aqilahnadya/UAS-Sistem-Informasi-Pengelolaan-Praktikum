<?php

include "koneksi.php";

$id = isset($_GET['id'])
    ? (int) $_GET['id']
    : 0;


if ($id <= 0) {

    header(
        "Location: index.php?pesan=gagal"
    );

    exit;
}


$query = mysqli_prepare(
    $koneksi,
    "DELETE FROM praktikan
     WHERE id_praktikan = ?"
);

mysqli_stmt_bind_param(
    $query,
    "i",
    $id
);


if (mysqli_stmt_execute($query)) {

    header(
        "Location: index.php?pesan=hapus"
    );

} else {

    header(
        "Location: index.php?pesan=gagal"
    );
}

exit;
?>