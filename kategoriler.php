<?php
// kategoriler.php - kategori listeleme, ekleme, silme
include 'db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['kategori_adi'])) {
        $stmt = $pdo->prepare('INSERT INTO categories (name) VALUES (?)');
        $stmt->execute([$_POST['kategori_adi']]);
    }
    if (isset($_POST['sil_id'])) {
        $stmt = $pdo->prepare('DELETE FROM categories WHERE id = ?');
        $stmt->execute([$_POST['sil_id']]);
    }
}
$kategoriler = $pdo->query('SELECT * FROM categories')->fetchAll();
?>
<h2>Kategori Listesi</h2>
<table class="table datatable" id="kategoriler-table">
    <thead>
        <tr><th>Kategori</th><th>Sil</th></tr>
    </thead>
    <tbody>
    <?php foreach ($kategoriler as $kategori): ?>
        <tr>
            <td><?= htmlspecialchars($kategori['name']) ?></td>
            <td>
                <form method="post" onsubmit="return confirm('Silinsin mi?');" class="d-inline">
                    <input type="hidden" name="sil_id" value="<?= $kategori['id'] ?>">
                    <button class="btn btn-sm btn-danger">Sil</button>
                </form>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
<h3>Yeni Kategori Ekle</h3>
<form method="post" class="row g-2 mb-3">
    <div class="col-auto">
        <input class="form-control" name="kategori_adi" required>
    </div>
    <div class="col-auto">
        <button class="btn btn-primary">Ekle</button>
    </div>
</form>
