<?php
require_once 'db.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: index.php?sayfa=kategoriler");
    exit;
}

$id = (int)$_GET['id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kategori_adi = trim($_POST['kategori_adi']);

    if (!empty($kategori_adi)) {
        $stmt = $conn->prepare("UPDATE kategoriler SET kategori_adi = ? WHERE id = ?");
        $stmt->bind_param("si", $kategori_adi, $id);
        $stmt->execute();
        $stmt->close();
        header("Location: index.php?sayfa=kategoriler");
        exit;
    }
}

// Kategori verisi çekiliyor
$stmt = $conn->prepare("SELECT kategori_adi FROM kategoriler WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$kategori = $result->fetch_assoc();
$stmt->close();

if (!$kategori) {
    echo "Kategori bulunamadı.";
    exit;
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Kategori Düzenle</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php include 'sidebar.php'; ?>

    <div class="main-content">
        <h2>Kategori Düzenle</h2>

        <form method="POST">
            <label for="kategori_adi">Kategori Adı:</label><br>
            <input type="text" id="kategori_adi" name="kategori_adi" value="<?= htmlspecialchars($kategori['kategori_adi']) ?>" required><br><br>
            <button type="submit">Kaydet</button>
        </form>
    </div>
</body>
</html>
