<?php
include 'db.php';
include 'sidebar.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $scopeName = $_POST['scope_name'];
    $includedItems = $_POST['included_items'] ?? [];
    $descriptions = $_POST['descriptions'] ?? [];

    try {
        // Yeni kapsamı ekle
        $stmt = $conn->prepare("INSERT INTO scopes (name) VALUES (:name)");
        $stmt->execute(['name' => $scopeName]);
        $scopeId = $conn->lastInsertId();

        // Dahil edilen iş kalemlerini ekle
        foreach ($includedItems as $itemId) {
            $description = $descriptions[$itemId] ?? '';
            $stmt = $conn->prepare("INSERT INTO scope_items (scope_id, item_id, description) VALUES (:scope_id, :item_id, :description)");
            $stmt->execute([
                'scope_id' => $scopeId,
                'item_id' => $itemId,
                'description' => $description
            ]);
        }

        echo "<script>alert('Kapsam başarıyla kaydedildi.'); window.location.href='kapsamlar.php';</script>";
        exit;

    } catch (PDOException $e) {
        echo "Hata: " . $e->getMessage();
    }
}
?>

<h2>Yeni Kapsam Oluştur</h2>

<form method="POST" action="">
    <label for="scope_name">Kapsam Adı:</label>
    <input type="text" name="scope_name" required><br><br>

    <table border="1">
        <tr>
            <th>Kategori</th>
            <th>İş Kalemi</th>
            <th>Açıklama</th>
            <th>Dahil Et</th>
        </tr>

        <?php
        $stmt = $conn->query("SELECT items.id, items.name AS item_name, items.default_description, categories.name AS category_name
                              FROM items
                              JOIN categories ON items.category_id = categories.id
                              ORDER BY categories.name, items.name");
        $items = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($items as $item):
        ?>
            <tr>
                <td><?= htmlspecialchars($item['category_name']) ?></td>
                <td><input type="text" value="<?= htmlspecialchars($item['item_name']) ?>" readonly></td>
                <td>
                    <textarea name="descriptions[<?= $item['id'] ?>]" rows="2" cols="40"><?= htmlspecialchars($item['default_description']) ?></textarea>
                </td>
                <td><input type="checkbox" name="included_items[]" value="<?= $item['id'] ?>"></td>
            </tr>
        <?php endforeach; ?>
    </table>

    <br><button type="submit">Kaydet</button>
</form>
