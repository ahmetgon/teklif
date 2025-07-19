<?php
include 'db.php';

$scope_name = $_POST['scope_name'] ?? '';

if (!$scope_name) {
  die("Kapsam adı boş olamaz.");
}

// 1. Yeni kapsam kaydı
$stmt = $pdo->prepare("INSERT INTO scopes (name) VALUES (:name)");
$stmt->execute(['name' => $scope_name]);
$scope_id = $pdo->lastInsertId();

// 2. Seçilen iş kalemlerini işle
$included_items = $_POST['include'] ?? [];
$item_names = $_POST['item_name'] ?? [];
$descriptions = $_POST['description'] ?? [];

foreach ($included_items as $item_id => $checked) {
    $item_name = $item_names[$item_id] ?? '';
    $description = $descriptions[$item_id] ?? '';

    $stmt = $pdo->prepare("INSERT INTO scope_selections (scope_id, item_id, item_name, description)
                           VALUES (:scope_id, :item_id, :item_name, :description)");
    $stmt->execute([
        'scope_id'    => $scope_id,
        'item_id'     => $item_id,
        'item_name'   => $item_name,
        'description' => $description
    ]);
}

// 3. Yönlendirme
header("Location: kapsamlar.php");
exit;
