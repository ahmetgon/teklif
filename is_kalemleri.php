<?php
// is_kalemleri.php - iş kalemi listeleme, ekleme, silme
include 'db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['baslik'])) {
        $stmt = $pdo->prepare('INSERT INTO items (category_id, name, description) VALUES (?, ?, ?)');
        $stmt->execute([$_POST['kategori_id'], $_POST['baslik'], $_POST['aciklama']]);
    }
    if (isset($_POST['sil_id'])) {
        $stmt = $pdo->prepare('DELETE FROM items WHERE id = ?');
        $stmt->execute([$_POST['sil_id']]);
    }
}
$is_kalemleri = $pdo->query('SELECT i.*, c.name AS kategori_adi FROM items i JOIN categories c ON i.category_id = c.id')->fetchAll();
$kategoriler = $pdo->query('SELECT id, name FROM categories')->fetchAll();
?>
<h2>İş Kalemleri Listesi</h2>
<table class="table datatable" id="is-kalemleri-table">
    <thead>
        <tr><th>Kategori</th><th>İş Kalemi</th><th>Açıklama</th><th>Sil</th></tr>
    </thead>
    <tbody>
    <?php foreach ($is_kalemleri as $kalem): ?>
        <tr>
            <td><?= htmlspecialchars($kalem['kategori_adi']) ?></td>
            <td><?= htmlspecialchars($kalem['name']) ?></td>
            <td><?= htmlspecialchars($kalem['description']) ?></td>
            <td>
                <form method="post" onsubmit="return confirm('Silinsin mi?');" class="d-inline">
                    <input type="hidden" name="sil_id" value="<?= $kalem['id'] ?>">
                    <button class="btn btn-sm btn-danger">Sil</button>
                </form>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
<h3>Yeni İş Kalemi Ekle</h3>
<form method="post" class="row g-2 mb-3">
    <div class="col-auto">
        <select name="kategori_id" class="form-select" required>
            <option value="">Kategori Seçin</option>
            <?php foreach ($kategoriler as $kat): ?>
                <option value="<?= $kat['id'] ?>"><?= htmlspecialchars($kat['name']) ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="col-auto">
        <input name="baslik" class="form-control" placeholder="Başlık" required>
    </div>
    <div class="col-auto">
        <input name="aciklama" class="form-control" placeholder="Açıklama" required>
    </div>
    <div class="col-auto">
        <button class="btn btn-primary">Ekle</button>
    </div>
</form>
