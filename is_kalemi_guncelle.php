<?php
require_once 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = intval($_POST['id']);
    $is_kalemi_adi = trim($_POST['is_kalemi_adi']);
    $kategori_id = intval($_POST['kategori_id']);
    $aciklama = trim($_POST['aciklama']);

    if ($id && $is_kalemi_adi && $kategori_id) {
        $stmt = $conn->prepare("UPDATE is_kalemleri SET is_kalemi_adi = ?, kategori_id = ?, aciklama = ? WHERE id = ?");
        $stmt->bind_param("sisi", $is_kalemi_adi, $kategori_id, $aciklama, $id);
        $stmt->execute();
        $stmt->close();
    }
}

header("Location: is_kalemleri.php");
exit;
