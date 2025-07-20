<?php
include 'db.php';
$scopeName = isset($_GET['c']) ? trim($_GET['c']) : '';
$stmt = $pdo->prepare('SELECT id, name FROM scopes WHERE name = ?');
$stmt->execute([$scopeName]);
$scope = $stmt->fetch();
if (!$scope) {
    echo 'Kapsam bulunamadı';
    exit;
}
$scopeId = $scope['id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $rows = $_POST['rows'] ?? [];
    try {
        $pdo->beginTransaction();
        $insert = $pdo->prepare('INSERT INTO client_scope_entries (scope_id, selection_id, included, quantity) VALUES (?, ?, ?, ?)');
        foreach ($rows as $row) {
            $selId = intval($row['selection_id']);
            $included = isset($row['included']) ? (int)$row['included'] : 0;
            $qty = isset($row['quantity']) ? max(0, intval($row['quantity'])) : 0;
            $insert->execute([$scopeId, $selId, $included, $qty]);
        }
        $pdo->commit();
        header('Location: kapsam_link.php?c=' . urlencode($scopeName) . '&saved=1');
        exit;
    } catch (PDOException $e) {
        $pdo->rollBack();
        $error = $e->getMessage();
    }
}

$stmt = $pdo->prepare('SELECT id AS selection_id, category_name, item_name, description, included, quantity FROM scope_selections WHERE scope_id = ? ORDER BY category_name, item_name');
$stmt->execute([$scopeId]);
$items = $stmt->fetchAll();

$includedItems = [];
$excludedItems = [];
foreach ($items as $it) {
    if ($it['included']) {
        $includedItems[] = $it;
    } else {
        $excludedItems[] = $it;
    }
}
?>
<?php $title = 'Kapsam: ' . htmlspecialchars($scope['name']); include 'header.php'; ?>
<h2><?= htmlspecialchars($scope['name']) ?></h2>
<?php if (!empty($error)): ?>
<div class="alert alert-danger">Hata: <?= htmlspecialchars($error) ?></div>
<?php elseif (isset($_GET['saved'])): ?>
<div class="alert alert-success">Kaydedildi</div>
<?php endif; ?>
<form method="post">
    <h3>Kapsama Dahil Olanlar</h3>
    <table class="table" id="included-table">
        <thead>
            <tr>
                <th>Kategori</th>
                <th>İş Kalemi</th>
                <th>Açıklama</th>
                <th>Adet / Yıl</th>
                <th>Dahil</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($includedItems as $i => $item): ?>
            <tr data-index="<?= $i ?>">
                <td>
                    <?= htmlspecialchars($item['category_name']) ?>
                    <input type="hidden" name="rows[<?= $i ?>][category_name]" value="<?= htmlspecialchars($item['category_name']) ?>">
                </td>
                <td>
                    <?= htmlspecialchars($item['item_name']) ?>
                    <input type="hidden" name="rows[<?= $i ?>][item_name]" value="<?= htmlspecialchars($item['item_name']) ?>">
                </td>
                <td>
                    <?= htmlspecialchars($item['description']) ?>
                    <input type="hidden" name="rows[<?= $i ?>][description]" value="<?= htmlspecialchars($item['description']) ?>">
                </td>
                <td><input type="number" class="form-control" name="rows[<?= $i ?>][quantity]" value="<?= $item['quantity'] ?>"></td>
                <td class="text-center">
                    <input type="hidden" name="rows[<?= $i ?>][included]" value="0">
                    <input type="checkbox" class="include-checkbox" name="rows[<?= $i ?>][included]" value="1" checked>
                </td>
                <input type="hidden" name="rows[<?= $i ?>][selection_id]" value="<?= $item['selection_id'] ?>">
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <h3>Kapsama Dahil Olmayanlar</h3>
    <table class="table" id="excluded-table">
        <thead>
            <tr>
                <th>Kategori</th>
                <th>İş Kalemi</th>
                <th>Açıklama</th>
                <th>Adet / Yıl</th>
                <th>Dahil</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($excludedItems as $i => $item): $index = $i + count($includedItems); ?>
            <tr data-index="<?= $index ?>">
                <td>
                    <?= htmlspecialchars($item['category_name']) ?>
                    <input type="hidden" name="rows[<?= $index ?>][category_name]" value="<?= htmlspecialchars($item['category_name']) ?>">
                </td>
                <td>
                    <?= htmlspecialchars($item['item_name']) ?>
                    <input type="hidden" name="rows[<?= $index ?>][item_name]" value="<?= htmlspecialchars($item['item_name']) ?>">
                </td>
                <td>
                    <?= htmlspecialchars($item['description']) ?>
                    <input type="hidden" name="rows[<?= $index ?>][description]" value="<?= htmlspecialchars($item['description']) ?>">
                </td>
                <td><input type="number" class="form-control" name="rows[<?= $index ?>][quantity]" value="<?= $item['quantity'] ?>"></td>
                <td class="text-center">
                    <input type="hidden" name="rows[<?= $index ?>][included]" value="0">
                    <input type="checkbox" class="include-checkbox" name="rows[<?= $index ?>][included]" value="1">
                </td>
                <input type="hidden" name="rows[<?= $index ?>][selection_id]" value="<?= $item['selection_id'] ?>">
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <button type="submit" class="btn btn-success">Kaydet</button>
</form>
<script>
$(document).on('change', '.include-checkbox', function(){
    var row = $(this).closest('tr');
    if (this.checked) {
        $('#included-table tbody').append(row);
    } else {
        $('#excluded-table tbody').append(row);
    }
});
</script>
<?php include 'footer.php'; ?>
