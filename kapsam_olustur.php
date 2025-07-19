<?php
include 'db.php';
$title = 'Yeni Kapsam Oluştur';
include 'header.php';
?>
<div class="row">
    <div class="col-md-2 bg-light min-vh-100">
        <?php include 'sidebar.php'; ?>
    </div>
    <div class="col-md-10 pt-3">
        <?php
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $scopeName = $_POST['scope_name'];
            $includedItems = $_POST['included_items'] ?? [];
            $descriptions = $_POST['descriptions'] ?? [];
            try {
                $stmt = $pdo->prepare('INSERT INTO scopes (name) VALUES (:name)');
                $stmt->execute(['name' => $scopeName]);
                $scopeId = $pdo->lastInsertId();
                foreach ($includedItems as $itemId) {
                    $stmt = $pdo->prepare('INSERT INTO scope_selections (scope_id, item_id) VALUES (:scope_id, :item_id)');
                    $stmt->execute(['scope_id' => $scopeId, 'item_id' => $itemId]);
                }
                echo "<script>alert('Kapsam başarıyla kaydedildi.'); window.location.href='index.php';</script>";
                exit;
            } catch (PDOException $e) {
                echo 'Hata: ' . $e->getMessage();
            }
        }
        ?>
        <h2>Yeni Kapsam Oluştur</h2>
        <form method="POST" action="" class="mb-3">
            <div class="mb-3">
                <label for="scope_name" class="form-label">Kapsam Adı:</label>
                <input type="text" name="scope_name" id="scope_name" class="form-control" required>
            </div>
            <table class="table table-striped datatable" id="scope-items">
                <thead>
                    <tr>
                        <th>Kategori</th>
                        <th>İş Kalemi</th>
                        <th>Açıklama</th>
                        <th>Dahil Et</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                $stmt = $pdo->query("SELECT items.id, items.name AS item_name, items.description AS default_description, categories.name AS category_name FROM items JOIN categories ON items.category_id = categories.id ORDER BY categories.name, items.name");
                $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
                foreach ($items as $item):
                ?>
                    <tr>
                        <td><?= htmlspecialchars($item['category_name']) ?></td>
                        <td><input type="text" value="<?= htmlspecialchars($item['item_name']) ?>" readonly class="form-control-plaintext"></td>
                        <td>
                            <textarea name="descriptions[<?= $item['id'] ?>]" rows="2" cols="40" class="form-control"><?= htmlspecialchars($item['default_description']) ?></textarea>
                        </td>
                        <td class="text-center"><input type="checkbox" name="included_items[]" value="<?= $item['id'] ?>"></td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
            <button type="submit" class="btn btn-success">Kaydet</button>
        </form>
    </div>
</div>
<?php include 'footer.php'; ?>
