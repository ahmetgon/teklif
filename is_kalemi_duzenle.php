<?php
require_once 'db.php';

// ID kontrolü
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("Geçersiz ID.");
}
$id = (int)$_GET['id'];

// Kategorileri al
$kategori_sorgu = $conn->query("SELECT * FROM kategoriler");
$kategoriler = [];
while ($row = $kategori_sorgu->fetch_assoc()) {
    $kategoriler[$row['id']] = $row['kategori_adi'];
}

// Güncelleme işlemi
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kategori_id = $_POST['kategori_id'];
    $kalem_adi = trim($_POST['kalem_adi']);
    $aciklama = trim($_POST['aciklama']);

    if (!empty($kategori_id) && !empty($kalem_adi)) {
        $stmt = $conn->prepare("UPDATE is_kalemleri SET kategori_id = ?, kalem_adi = ?, aciklama = ? WHERE id = ?");
        $stmt->bind_param("issi", $kategori_id, $kalem_adi, $aciklama, $id);
        $stmt->execute();
        $stmt->close();
        header("Location: index.php?sayfa=is_kalemleri");
        exit;
    }
}

// İş kalemini getir
$stmt = $conn->prepare("SELECT * FROM is_kalemleri WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$is_kalemi = $result->fetch_assoc();
$stmt->close();

if (!$is_kalemi) {
    die("İş kalemi bulunamadı.");
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>İş Kalemi Düzenle</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php include 'sidebar.php'; ?>

<div class="main-content">
    <h2>İş Kalemi Düzenle</h2>

    <form method="POST">
        <label for="kategori_id">Kategori:</label><br>
        <select name="kategori_id" id="kategori_id" required>
            <?php foreach ($kategoriler as $kat_id => $kat_adi): ?>
                <option value="<?= $kat_id ?>" <?= $kat_id == $is_kalemi['kategori_id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($kat_adi) ?>
                </option>
            <?php endforeach; ?>
        </select><br><br>

        <label for="kalem_adi">İş Kalemi Adı:</label><br>
        <input type="text" name="kalem_adi" id="kalem_adi" value="<?= htmlspecialchars($is_kalemi['kalem_adi']) ?>" required><br><br>

        <label for="aciklama">Açıklama:</label><br>
        <textarea name="aciklama" id="aciklama" rows="3"><?= htmlspecialchars($is_kalemi['aciklama']) ?></textarea><br><br>

        <button type="submit">Kaydet</button>
    </form>
</div>
</body>
</html>
