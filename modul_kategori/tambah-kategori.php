<?php
session_start();

if (!isset($_SESSION['user'])) {
    header('Location: ../login.php');
    exit();
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form Kategori</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="container clearfix">
        <h1 class="h1head">SI Perpustakaan</h1>

        <?php include '../sidebar.php' ?>

        <div class="content">
            <h1>Tambah Data Kategori</h1>
            <div class="col-2">
            <form method="post" action="proses-tambah-kategori.php">
                <p>Kategori</p>
                <p><input type="text" name="kategori"></p>
                <p>
                    <input type="submit" class="btn btn-submit" value="Simpan">
                    <input type="reset" class="btn btn-submit" value="Batal" onclick="self.history.back();">
                </p>
            </form>
        </div>
        </div>

    </div>
</body>
</html>
