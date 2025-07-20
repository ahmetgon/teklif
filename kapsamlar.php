<?php
// kapsamlar.php - kapsam listeleme, ekleme, silme
include 'db.php';
// POST işlemleri: sadece silme
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['sil_id'])) {
        $stmt = $pdo->prepare('DELETE FROM scopes WHERE id = ?');
        $stmt->execute([$_POST['sil_id']]);
    }
}

$kapsamlar = $pdo->query('SELECT * FROM scopes')->fetchAll();
?>
<h2>Kapsam Listesi</h2>
<table class="table datatable" id="kapsamlar-table">
    <thead>
        <tr><th>Kapsam Adı</th><th>Düzenle</th><th>Sil</th></tr>
    </thead>
    <tbody>
    <?php foreach ($kapsamlar as $kapsam): ?>
        <tr>
            <td><?= htmlspecialchars($kapsam['name']) ?></td>
            <td>
                <a href="?page=kapsam_olustur&id=<?= $kapsam['id'] ?>" class="btn btn-sm btn-secondary">Düzenle</a>
            </td>
            <td>
                <form method="post" onsubmit="return confirm('Silinsin mi?');" class="d-inline">
                    <input type="hidden" name="sil_id" value="<?= $kapsam['id'] ?>">
                    <button class="btn btn-sm btn-danger">Sil</button>
                </form>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
<h3>Yeni Kapsam Ekle</h3>
<a href="?page=kapsam_olustur" class="btn btn-primary mb-3">Kapsam Oluştur</a>
