<?php
require 'db.php';

$scope_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Kapsam adı
$scope_stmt = $pdo->prepare("SELECT name FROM scopes WHERE id = ?");
$scope_stmt->execute([$scope_id]);
$scope = $scope_stmt->fetch();

// Scope ID’ye ait seçimleri çek
$selections_stmt = $pdo->prepare("
    SELECT ss.id, ss.quantity, ss.category_id, ss.item_id, ss.description,
           c.name AS category_name, i.name AS item_name
    FROM scope_selections ss
    JOIN categories c ON ss.category_id = c.id
    JOIN items i ON ss.item_id = i.id
    WHERE ss.scope_id = ?
");
$selections_stmt->execute([$scope_id]);
$selections = $selections_stmt->fetchAll(PDO::FETCH_ASSOC);

// Tüm kategoriler ve iş kalemleri (güncelleme için formda lazım)
$categories = $pdo->query("SELECT * FROM categories")->fetchAll();
$items = $pdo->query("SELECT * FROM items")->fetchAll();
?>

<?php include 'sidebar.php'; ?>

<div class="container mt-4">
    <h4>Kapsam Düzenle</h4>

    <form method="POST" action="kapsam_guncelle.php">
        <input type="hidden" name="scope_id" value="<?= $scope_id ?>">
        <div class="mb-3">
            <label for="scope_name" class="form-label">Kapsam Adı</label>
            <input type="text" name="scope_name" id="scope_name" class="form-control" value="<?= htmlspecialchars($scope['name']) ?>" required>
        </div>

        <table class="table table-bordered align-middle">
            <thead class="table-light text-center">
                <tr>
                    <th>Kategori</th>
                    <th>İş Kalemi</th>
                    <th>Açıklama</th>
                    <th>Adet / Yıl</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($selections as $selection): ?>
                    <tr>
                        <td>
                            <select name="category_id[<?= $selection['id'] ?>]" class="form-select">
                                <?php foreach ($categories as $cat): ?>
                                    <option value="<?= $cat['id'] ?>" <?= $cat['id'] == $selection['category_id'] ? 'selected' : '' ?>>
                                        <?= htmlspecialchars($cat['name']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                        <td>
                            <select name="item_id[<?= $selection['id'] ?>]" class="form-select">
                                <?php foreach ($items as $item): ?>
                                    <option value="<?= $item['id'] ?>" <?= $item['id'] == $selection['item_id'] ? 'selected' : '' ?>>
                                        <?= htmlspecialchars($item['name']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </td>
                        <td>
                            <input type="text" name="description[<?= $selection['id'] ?>]" class="form-control" value="<?= htmlspecialchars($selection['description']) ?>">
                        </td>
                        <td>
                            <input type="number" name="quantity[<?= $selection['id'] ?>]" class="form-control text-center" value="<?= $selection['quantity'] ?>" min="0">
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <div class="text-end">
            <button type="submit" class="btn btn-primary">Kaydet</button>
        </div>
    </form>
</div>
