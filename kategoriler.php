<?php
require 'db.php';

// Yeni kategori ekleme
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['category_name'])) {
    $name = trim($_POST['category_name']);
    if ($name !== '') {
        $stmt = $pdo->prepare("INSERT INTO categories (name) VALUES (?)");
        $stmt->execute([$name]);
    }
}

// Kategori silme
if (isset($_GET['delete']) && is_numeric($_GET['delete'])) {
    $id = intval($_GET['delete']);
    $stmt = $pdo->prepare("DELETE FROM categories WHERE id = ?");
    $stmt->execute([$id]);
    header("Location: kategoriler.php");
    exit;
}

// Kategori güncelleme
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_id'], $_POST['update_name'])) {
    $id = intval($_POST['update_id']);
    $name = trim($_POST['update_name']);
    if ($name !== '') {
        $stmt = $pdo->prepare("UPDATE categories SET name = ? WHERE id = ?");
        $stmt->execute([$name, $id]);
    }
    header("Location: kategoriler.php");
    exit;
}

// Kategori listesini çek
$categories = $pdo->query("SELECT * FROM categories ORDER BY id DESC")->fetchAll();
?>

<h2>Kategoriler</h2>

<form method="POST" style="margin-bottom: 20px;">
    <label>Yeni Kategori Adı:</label>
    <input type="text" name="category_name" required>
    <button type="submit">Ekle</button>
</form>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Kategori Adı</th>
        <th>Aksiyonlar</th>
    </tr>
    <?php foreach ($categories as $cat): ?>
        <tr>
            <td><?= $cat['id'] ?></td>
            <td>
                <form method="POST" style="display:inline;">
                    <input type="hidden" name="update_id" value="<?= $cat['id'] ?>">
                    <input type="text" name="update_name" value="<?= htmlspecialchars($cat['name']) ?>">
                    <button type="submit">Güncelle</button>
                </form>
            </td>
            <td>
                <a href="kategoriler.php?delete=<?= $cat['id'] ?>" onclick="return confirm('Silmek istediğinize emin misiniz?')">Sil</a>
            </td>
        </tr>
    <?php endforeach; ?>
</table>
