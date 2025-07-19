<?php
// is_kalemleri.php - tek dosyada iş kalemi listeleme, ekleme, silme işlemleri
include "db.php";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["baslik"])) {
        $stmt = $pdo->prepare("INSERT INTO items (category_id, name, description) VALUES (?, ?, ?)");
        $stmt->execute([$_POST["kategori_id"], $_POST["baslik"], $_POST["aciklama"]]);
    }
    if (isset($_POST["sil_id"])) {
        $stmt = $pdo->prepare("DELETE FROM items WHERE id = ?");
        $stmt->execute([$_POST["sil_id"]]);
    }
}
$is_kalemleri = $pdo->query("SELECT i.*, c.name AS kategori_adi FROM items i JOIN categories c ON i.category_id = c.id")->fetchAll();
?>
<!DOCTYPE html>
<html>
<head><title>İş Kalemleri</title></head>
<body>
<h2>İş Kalemleri Listesi</h2>
<ul>
<?php foreach ($is_kalemleri as $kalem): ?>
<li>[<?= $kalem['kategori_adi'] ?>] <?= htmlspecialchars($kalem['name']) ?> - <?= htmlspecialchars($kalem['description']) ?>
<form method="post" style="display:inline;"><input type="hidden" name="sil_id" value="<?= $kalem['id'] ?>"><button>Sil</button></form>
</li>
<?php endforeach; ?>
</ul>
<h3>Yeni İş Kalemi Ekle</h3>
<form method="post">
Kategori ID: <input name="kategori_id"><br>
Başlık: <input name="baslik"><br>
Açıklama: <input name="aciklama"><br>
<button>Ekle</button>
</form>
</body>
</html>