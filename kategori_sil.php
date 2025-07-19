<?php
require_once 'db.php';

if (isset($_GET['id'])) {
    $kategori_id = intval($_GET['id']);

    // Önce bu kategoriye ait iş kalemleri varsa kontrol edebilirsin (örnek güvenlik önlemi)
    // Ancak burada direkt silme işlemi yapılıyor
    $stmt = $conn->prepare("DELETE FROM kategoriler WHERE id = ?");
    $stmt->bind_param("i", $kategori_id);
    $stmt->execute();
    $stmt->close();
}

header("Location: index.php?sayfa=kategoriler");
exit;
