<?php
// kapsamlar.php - kapsam listeleme, ekleme, silme
include 'db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['kapsam_adi'])) {
        $stmt = $pdo->prepare('INSERT INTO scopes (name) VALUES (?)');
        $stmt->execute([$_POST['kapsam_adi']]);
    }
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
        <tr><th>Kapsam Adı</th><th>Sil</th></tr>
    </thead>
    <tbody>
    <?php foreach ($kapsamlar as $kapsam): ?>
        <tr>
            <td><?= htmlspecialchars($kapsam['name']) ?></td>
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
<form method="post" class="row g-2 mb-3">
    <div class="col-auto">
        <input class="form-control" name="kapsam_adi" required>
    </div>
    <div class="col-auto">
        <button class="btn btn-primary">Ekle</button>
    </div>
</form>
