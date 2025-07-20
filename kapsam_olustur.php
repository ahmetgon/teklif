<?php
include 'db.php';
$editId = isset($_GET['id']) ? intval($_GET['id']) : 0;
$editing = $editId > 0;
$title = $editing ? 'Kapsamı Düzenle' : 'Yeni Kapsam Oluştur';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $scopeId   = isset($_POST['scope_id']) ? intval($_POST['scope_id']) : 0;
            $scopeName = $_POST['scope_name'];
            $rows      = $_POST['rows'] ?? [];
            try {
                $pdo->beginTransaction();
                if ($scopeId) {
                    $pdo->prepare('UPDATE scopes SET name = ? WHERE id = ?')->execute([$scopeName, $scopeId]);
                    $pdo->prepare('DELETE FROM scope_selections WHERE scope_id = ?')->execute([$scopeId]);
                } else {
                    $stmt = $pdo->prepare('INSERT INTO scopes (name) VALUES (?)');
                    $stmt->execute([$scopeName]);
                    $scopeId = $pdo->lastInsertId();
                }

                $insert = $pdo->prepare('INSERT INTO scope_selections (scope_id, item_id, category_name, item_name, description, included, quantity) VALUES (:scope_id, :item_id, :category_name, :item_name, :description, :included, 0)');
                foreach ($rows as $row) {
                    $insert->execute([
                        'scope_id' => $scopeId,
                        'item_id' => $row['item_id'] ?? 0,
                        'category_name' => $row['category'] ?? '',
                        'item_name' => $row['item_name'] ?? '',
                        'description' => $row['description'] ?? '',
                        'included' => isset($row['included']) ? (int)$row['included'] : 0
                    ]);
                }
                $pdo->commit();
                echo "<script>alert('Kapsam başarıyla kaydedildi.'); window.location.href='index.php?page=kapsamlar';</script>";
                exit;
            } catch (PDOException $e) {
                $pdo->rollBack();
                echo 'Hata: ' . $e->getMessage();
            }
        }
        ?>
        <?php
        if ($editing && $_SERVER['REQUEST_METHOD'] !== 'POST') {
            $stmt = $pdo->prepare('SELECT name FROM scopes WHERE id = ?');
            $stmt->execute([$editId]);
            $scopeName = $stmt->fetchColumn();
            $stmt = $pdo->prepare('SELECT * FROM scope_selections WHERE scope_id = ?');
            $stmt->execute([$editId]);
            $items = $stmt->fetchAll();
        } elseif (!isset($items)) {
            $scopeName = '';
            $stmt = $pdo->query("SELECT items.id, items.name AS item_name, items.description AS default_description, categories.name AS category_name FROM items JOIN categories ON items.category_id = categories.id ORDER BY categories.name, items.name");
            $defaults = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $items = [];
            foreach ($defaults as $it) {
                $items[] = [
                    'item_id' => $it['id'],
                    'category_name' => $it['category_name'],
                    'item_name' => $it['item_name'],
                    'description' => $it['default_description'],
                    'included' => 0
                ];
            }
        }
        ?>
        <h2><?= htmlspecialchars($title) ?></h2>
        <form method="POST" action="" class="mb-3">
            <?php if ($editing): ?>
            <input type="hidden" name="scope_id" value="<?= $editId ?>">
            <?php endif; ?>
            <div class="mb-3">
                <label for="scope_name" class="form-label">Kapsam Adı:</label>
                <input type="text" name="scope_name" id="scope_name" class="form-control" value="<?= htmlspecialchars($scopeName) ?>" required>
            </div>
            <table class="table table-striped" id="scope-items">
    <thead>
        <tr>
            <th>Kategori</th>
            <th>İş Kalemi</th>
            <th>Açıklama</th>
            <th>Dahil</th>
            <th>Sil</th>
        </tr>
    </thead>
    <tbody>
<?php foreach ($items as $index => $item): ?>
        <tr>
            <td><input type="text" name="rows[<?= $index ?>][category]" class="form-control" value="<?= htmlspecialchars($item['category_name']) ?>"></td>
            <td><input type="text" name="rows[<?= $index ?>][item_name]" class="form-control" value="<?= htmlspecialchars($item['item_name']) ?>"></td>
            <td>
                <textarea name="rows[<?= $index ?>][description]" rows="2" class="form-control"><?= htmlspecialchars($item['description']) ?></textarea>
                <input type="hidden" name="rows[<?= $index ?>][item_id]" value="<?= $item['item_id'] ?>">
            </td>
            <td class="text-center">
                <input type="hidden" name="rows[<?= $index ?>][included]" value="0">
                <input type="checkbox" name="rows[<?= $index ?>][included]" value="1">
            </td>
            <td><button type="button" class="btn btn-sm btn-danger delete-row">Sil</button></td>
        </tr>
<?php endforeach; ?>
    </tbody>
</table>
<div class="row g-2 mb-3" id="add-row-form">
    <div class="col-auto">
        <select id="new-category" class="form-select">
            <option value="">Kategori Seçin</option>
<?php
                        $cats = $pdo->query('SELECT name FROM categories ORDER BY name')->fetchAll(PDO::FETCH_ASSOC);
                        foreach ($cats as $cat): ?>
            <option value="<?= htmlspecialchars($cat['name']) ?>"><?= htmlspecialchars($cat['name']) ?></option>
<?php endforeach; ?>
        </select>
    </div>
    <div class="col-auto">
        <input id="new-item" class="form-control" placeholder="İş Kalemi">
    </div>
    <div class="col-auto">
        <textarea id="new-description" class="form-control" rows="2" placeholder="Açıklama"></textarea>
    </div>
    <div class="col-auto">
        <button type="button" id="add-row-btn" class="btn btn-primary">Satır Ekle</button>
    </div>
</div>

        <button type="submit" class="btn btn-success">Kaydet</button>
        </form>
<script>
window.addEventListener('load', function(){
    let rowIndex = <?php echo count($items); ?>;
    $('#add-row-btn').on('click', function(){
        const cat = $('#new-category').val();
        const item = $('#new-item').val();
        const desc = $('#new-description').val();
        if(!cat || !item) return;
        const escCat = $('<div>').text(cat).html();
        const escItem = $('<div>').text(item).html();
        const escDesc = $('<div>').text(desc).html();
        let row = `<tr>
            <td><input type="text" name="rows[${rowIndex}][category]" class="form-control" value="${escCat}"></td>
            <td><input type="text" name="rows[${rowIndex}][item_name]" class="form-control" value="${escItem}"></td>
            <td><textarea name="rows[${rowIndex}][description]" rows="2" class="form-control">${escDesc}</textarea><input type="hidden" name="rows[${rowIndex}][item_id]" value="0"></td>
            <td class="text-center"><input type="hidden" name="rows[${rowIndex}][included]" value="0"><input type="checkbox" name="rows[${rowIndex}][included]" value="1" checked></td>
            <td><button type="button" class="btn btn-sm btn-danger delete-row">Sil</button></td>
        </tr>`;
        $('#scope-items tbody').append(row);
        $('#new-category').val('');
        $('#new-item').val('');
        $('#new-description').val('');
        rowIndex++;
    });

    $(document).on('click', '.delete-row', function(){
        $(this).closest('tr').remove();
    });
});
</script>
