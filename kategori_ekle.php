<?php
require_once 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kategori_adi = trim($_POST['kategori_adi']);

    if (!empty($kategori_adi)) {
        $stmt = $conn->prepare("INSERT INTO kategoriler (kategori_adi) VALUES (?)");
        $stmt->bind_param("s", $kategori_adi);
        $stmt->execute();
        $stmt->close();
    }
}

header("Location: index.php?sayfa=kategoriler");
exit;
