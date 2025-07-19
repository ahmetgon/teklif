<?php
require_once 'db.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $is_kalemi_adi = trim($_POST['is_kalemi_adi']);
    $kategori_id = intval($_POST['kategori_id']);
    $aciklama = trim($_POST['aciklama']);

    if (!empty($is_kalemi_adi) && $kategori_id > 0) {
        $stmt = $conn->prepare("INSERT INTO is_kalemleri (is_kalemi_adi, kategori_id, aciklama) VALUES (?, ?, ?)");
        $stmt->bind_param("sis", $is_kalemi_adi, $kategori_id, $aciklama);

        if ($stmt->execute()) {
            header("Location: is_kalemleri.php?status=success");
            exit;
        } else {
            echo "Veritabanı hatası: " . $stmt->error;
        }
    } else {
        echo "İş kalemi adı ve kategori zorunludur.";
    }
} else {
    echo "Geçersiz istek.";
}
