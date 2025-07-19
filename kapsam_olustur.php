<?php
include 'db.php';
?>

<div style="display: flex;">
  <div style="width: 200px;">
    <?php include 'sidebar.php'; ?>
  </div>

  <div style="flex: 1; padding: 10px;">
    <h2>Yeni Kapsam Oluştur</h2>
    <form method="post" action="kapsam_kaydet.php">
      <label for="scope_name">Kapsam Adı:</label>
      <input type="text" name="scope_name" id="scope_name" required><br><br>

      <table border="1" cellpadding="5" cellspacing="0">
        <tr>
          <th>Kategori</th>
          <th>İş Kalemi</th>
          <th>Açıklama</th>
          <th>Dahil Et</th>
        </tr>

        <?php
        $stmt = $pdo->query("SELECT items.id AS item_id, items.name AS item_name, items.description, categories.name AS category_name
                             FROM items
                             JOIN categories ON items.category_id = categories.id");

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
          echo "<tr>";
          echo "<td>{$row['category_name']}</td>";

          echo "<td><input type='text' name='item_name[{$row['item_id']}]' value=\"" . htmlspecialchars($row['item_name']) . "\" style='width: 200px;'></td>";

          echo "<td><textarea name='description[{$row['item_id']}]' rows='2' style='width: 300px;'>" . htmlspecialchars($row['description']) . "</textarea></td>";

          echo "<td style='text-align: center;'><input type='checkbox' name='include[{$row['item_id']}]'></td>";

          echo "</tr>";
        }
        ?>
      </table>

      <br>
      <button type="submit">Kaydet</button>
    </form>
  </div>
</div>
