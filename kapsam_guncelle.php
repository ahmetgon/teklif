<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $scope_id = intval($_POST['scope_id']);
    $scope_name = trim($_POST['scope_name']);

    // 1. Kapsam adını güncelle
    $stmt = $pdo->prepare("UPDATE scopes SET name = ?, updated_at = NOW() WHERE id = ?");
    $stmt->execute([$scope_name, $scope_id]);

    // 2. Seçilen satırları güncelle
    $category_ids = $_POST['category_id'] ?? [];
    $item_ids = $_POST['item_id'] ?? [];
    $descriptions = $_POST['description'] ?? [];
    $quantities = $_POST['quantity'] ?? [];

    foreach ($category_ids as $selection_id => $category_id) {
        $item_id = $item_ids[$selection_id] ?? null;
        $description = $descriptions[$selection_id] ?? '';
        $quantity = $quantities[$selection_id] ?? 0;

        $update_stmt = $pdo->prepare("
            UPDATE scope_selections
            SET category_id = ?, item_id = ?, description = ?, quantity = ?
            WHERE id = ? AND scope_id = ?
        ");
        $update_stmt->execute([
            $category_id,
            $item_id,
            $description,
            $quantity,
            $selection_id,
            $scope_id
        ]);
    }

    // 3. Geri yönlendirme
    header("Location: index.php");
    exit;
}
?>
