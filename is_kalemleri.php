<?php
require 'db.php';

// Yeni iş kalemi ekleme
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['item_name'])) {
    $name = trim($_POST['item_name']);
    if ($name !== '') {
        $stmt = $pdo->prepare("INSERT INTO work_items (name) VALUES (?)");
        $stmt->execute([$name]);
    }
}

// İş kalemi silme
if (isset($_GET['delete']) && is_numeric($_GET['delete'])) {
    $id = intval($_GET['delete']);
    $stmt = $pdo->prepare("DELETE FROM work_items WHERE id = ?");
    $stmt->execute([$id]);
    header("Location: is_kalemleri.php");
    exit;
}

// İş kalemi güncelleme
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_id'], $_POST['update_name'])) {
    $id = intval($_POST['update_id']);
    $name = trim($_POST['update_name']);
    if ($name !== '') {
        $stmt = $pdo->prepare("UPDATE work_items SET name = ? WHERE id = ?");
        $stmt->execute([$name, $id]);
    }
    header("Location: is_kalemleri.php");
    exit;
}

// İş kalemi listesini çek
$items = $pdo->query("SELECT * FROM work_items ORDER BY id DESC")->fetchAll();
?>

<h2>İş Kalemleri</h2>

<form method="POST" style="margin-bottom: 20px;">
    <label>Yeni İş Kalemi:</label>
    <input type="text" name="item_name" required>
    <button type="submit">Ekle</button>
</form>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>İş Kalemi Adı</th>
        <th>Aksiyonlar</th>
    </tr>
    <?php foreach ($items as $item): ?>
        <tr>
            <td><?= $item['id'] ?></td>
            <td>
                <form method="POST" style="display:inline;">
                    <input type="hidden" name="update_id" value="<?= $item['id'] ?>">
                    <input type="text" name="update_name" value="<?= htmlspecialchars($item['name']) ?>">
                    <button type="submit">Güncelle</button>
                </form>
            </td>
            <td>
                <a href="is_kalemleri.php?delete=<?= $item['id'] ?>" onclick="return confirm('Silmek istediğinize emin misiniz?')">Sil</a>
            </td>
        </tr>
    <?php endforeach; ?>
</table>
