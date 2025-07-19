<?php
// kategoriler.php - tek dosyada kategori listeleme, ekleme, silme işlemleri
include "db.php";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["kategori_adi"])) {
        $stmt = $pdo->prepare("INSERT INTO kategoriler (kategori_adi) VALUES (?)");
        $stmt->execute([$_POST["kategori_adi"]]);
    }
    if (isset($_POST["sil_id"])) {
        $stmt = $pdo->prepare("DELETE FROM kategoriler WHERE id = ?");
        $stmt->execute([$_POST["sil_id"]]);
    }
}
$kategoriler = $pdo->query("SELECT * FROM kategoriler")->fetchAll();
?>
<!DOCTYPE html>
<html>
<head><title>Kategoriler</title></head>
<body>
<h2>Kategori Listesi</h2>
<ul>
<?php foreach ($kategoriler as $kategori): ?>
<li><?= htmlspecialchars($kategori['kategori_adi']) ?>
<form method="post" style="display:inline;"><input type="hidden" name="sil_id" value="<?= $kategori['id'] ?>"><button>Sil</button></form>
</li>
<?php endforeach; ?>
</ul>
<h3>Yeni Kategori Ekle</h3>
<form method="post"><input name="kategori_adi"><button>Ekle</button></form>
</body>
</html>