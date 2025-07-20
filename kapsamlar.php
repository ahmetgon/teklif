<?php
// kapsamlar.php - kapsam listeleme, ekleme, silme
include 'db.php';
// POST işlemleri: ekle, güncelle, sil
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['kapsam_adi'])) {
        if (!empty($_POST['edit_id'])) {
            $stmt = $pdo->prepare('UPDATE scopes SET name = ? WHERE id = ?');
            $stmt->execute([$_POST['kapsam_adi'], $_POST['edit_id']]);
        } else {
            $stmt = $pdo->prepare('INSERT INTO scopes (name) VALUES (?)');
            $stmt->execute([$_POST['kapsam_adi']]);
        }
    }
    if (isset($_POST['sil_id'])) {
        $stmt = $pdo->prepare('DELETE FROM scopes WHERE id = ?');
        $stmt->execute([$_POST['sil_id']]);
    }
}

$duzenleKapsam = null;
if (isset($_GET['edit_id'])) {
    $stmt = $pdo->prepare('SELECT * FROM scopes WHERE id = ?');
    $stmt->execute([$_GET['edit_id']]);
    $duzenleKapsam = $stmt->fetch();
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
                <a href="?page=kapsamlar&edit_id=<?= $kapsam['id'] ?>" class="btn btn-sm btn-secondary">Düzenle</a>
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
<?php if ($duzenleKapsam): ?>
<h3>Kapsamı Düzenle</h3>
<form method="post" class="row g-2 mb-3">
    <div class="col-auto">
        <input class="form-control" name="kapsam_adi" value="<?= htmlspecialchars($duzenleKapsam['name']) ?>" required>
        <input type="hidden" name="edit_id" value="<?= $duzenleKapsam['id'] ?>">
    </div>
    <div class="col-auto">
        <button class="btn btn-success">Güncelle</button>
        <a href="?page=kapsamlar" class="btn btn-secondary">İptal</a>
    </div>
</form>
<?php else: ?>
<h3>Yeni Kapsam Ekle</h3>
<a href="?page=kapsam_olustur" class="btn btn-primary mb-3">Kapsam Oluştur</a>
<?php endif; ?>
