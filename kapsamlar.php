<?php
// kapsamlar.php - tek dosyada kapsam listeleme, ekleme, silme işlemleri
include "db.php";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["kapsam_adi"])) {
        $stmt = $pdo->prepare("INSERT INTO kapsamlar (kapsam_adi) VALUES (?)");
        $stmt->execute([$_POST["kapsam_adi"]]);
    }
    if (isset($_POST["sil_id"])) {
        $stmt = $pdo->prepare("DELETE FROM kapsamlar WHERE id = ?");
        $stmt->execute([$_POST["sil_id"]]);
    }
}
$kapsamlar = $pdo->query("SELECT * FROM kapsamlar")->fetchAll();
?>
<!DOCTYPE html>
<html>
<head><title>Kapsamlar</title></head>
<body>
<h2>Kapsam Listesi</h2>
<ul>
<?php foreach ($kapsamlar as $kapsam): ?>
<li><?= htmlspecialchars($kapsam['kapsam_adi']) ?>
<form method="post" style="display:inline;"><input type="hidden" name="sil_id" value="<?= $kapsam['id'] ?>"><button>Sil</button></form>
</li>
<?php endforeach; ?>
</ul>
<h3>Yeni Kapsam Ekle</h3>
<form method="post"><input name="kapsam_adi"><button>Ekle</button></form>
</body>
</html>