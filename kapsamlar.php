<?php
include 'db.php';
include 'sidebar.php';
?>

<h2>Kapsamlar</h2>

<a href="kapsam_olustur.php">+ Yeni Kapsam Oluştur</a>

<?php
// Tüm kapsamları al
$stmt = $pdo->query("SELECT * FROM scopes ORDER BY id DESC");
$scopes = $stmt->fetchAll();

foreach ($scopes as $scope) {
    echo "<hr>";
    echo "<h3>" . htmlspecialchars($scope['name']) . "</h3>";

    // Bu kapsama ait iş kalemlerini al
    $stmt_items = $pdo->prepare("
        SELECT s.item_name, s.description
        FROM scope_selections s
        WHERE s.scope_id = :scope_id
    ");
    $stmt_items->execute(['scope_id' => $scope['id']]);
    $items = $stmt_items->fetchAll();

    if ($items) {
        echo "<ul>";
        foreach ($items as $item) {
            echo "<li><strong>" . htmlspecialchars($item['item_name']) . ":</strong> " . htmlspecialchars($item['description']) . "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p><em>Bu kapsamda henüz iş kalemi seçilmemiş.</em></p>";
    }
}
?>
