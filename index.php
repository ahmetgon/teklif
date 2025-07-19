<?php
include 'db.php';
$title = 'Teklif Yönetimi';
include 'header.php';
?>
<div class="row">
    <div class="col-md-2 bg-light min-vh-100">
        <?php include 'sidebar.php'; ?>
    </div>
    <div class="col-md-10 pt-3">
        <?php
        if (isset($_GET['page'])) {
            $page = $_GET['page'];
            $allowed = ['kapsamlar', 'kategoriler', 'is_kalemleri', 'kapsam_olustur'];
            if (in_array($page, $allowed)) {
                include $page . '.php';
            } else {
                echo '<p>Geçersiz sayfa.</p>';
            }
        } else {
            include 'kapsamlar.php';
        }
        ?>
    </div>
</div>
<?php include 'footer.php'; ?>
