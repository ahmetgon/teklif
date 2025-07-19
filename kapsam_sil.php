<?php
require 'db.php';

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $scope_id = intval($_GET['id']);

    // Kapsamı sil (ilgili scope_selections satırları foreign key ile otomatik silinir)
    $stmt = $pdo->prepare("DELETE FROM scopes WHERE id = ?");
    $stmt->execute([$scope_id]);
}

header("Location: index.php");
exit;
?>
