<!DOCTYPE html>
<html>
<head>
  <title>Admin Panel</title>
</head>
<body>

<h2>İş Kategorisi Ekle</h2>
<form method="post" action="save_category.php">
  <input type="text" name="category_name" placeholder="Kategori Adı" required>
  <input type="submit" value="Ekle">
</form>

<h2>İş Kalemi Ekle</h2>
<form method="post" action="save_item.php">
  <input type="text" name="item_name" placeholder="İş Kalemi Adı" required><br>
  <select name="category_id" required>
    <?php
    $conn = new mysqli("localhost", "root", "", "scope_db");
    $res = $conn->query("SELECT * FROM categories");
    while ($row = $res->fetch_assoc()) {
      echo "<option value='{$row['id']}'>{$row['name']}</option>";
    }
    ?>
  </select><br>
  <textarea name="description" placeholder="Açıklama" required></textarea><br>
  <input type="submit" value="Ekle">
</form>

</body>
</html>
