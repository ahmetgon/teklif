<?php include 'db.php'; ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Teklif Yönetimi</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }
    .sidebar {
      width: 200px;
      height: 100vh;
      background-color: #f5f5f5;
      padding-top: 20px;
      position: fixed;
    }
    .sidebar a {
      display: block;
      padding: 10px 20px;
      color: #333;
      text-decoration: none;
    }
    .sidebar a:hover {
      background-color: #ddd;
    }
    .content {
      margin-left: 200px;
      padding: 20px;
    }
  </style>
</head>
<body>
  <div class="sidebar">
    <a href="?page=kapsamlar">Kapsamlar</a>
    <a href="?page=kategoriler">Kategoriler</a>
    <a href="?page=is_kalemleri">İş Kalemleri</a>
  </div>

  <div class="content">
    <?php
    if (isset($_GET['page'])) {
      $page = $_GET['page'];
      $allowed = ['kapsamlar', 'kategoriler', 'is_kalemleri', 'kapsam_olustur']; // güvenlik için filtreleme
      if (in_array($page, $allowed)) {
        include $page . '.php';
      } else {
        echo "<p>Geçersiz sayfa.</p>";
      }
    } else {
      include 'kapsamlar.php'; // varsayılan sayfa
    }
    ?>
  </div>
</body>
</html>
