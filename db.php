<?php
$host = 'localhost';
$db   = 'scope_db';
$user = 'root';
$pass = ''; // Parola varsa buraya yaz
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    // Uyumlu olması için $conn değişkeni de aynı nesneye işaret etsin
    // Bazı sayfalarda PDO bağlantısı $conn adıyla kullanılıyor
    $conn = $pdo;
    // Ensure new columns exist for backward compatibility
    $check = $pdo->query("SHOW COLUMNS FROM scope_selections")->fetchAll(PDO::FETCH_COLUMN);
    $required = [
        'category_name' => 'ALTER TABLE scope_selections ADD COLUMN category_name VARCHAR(255) DEFAULT NULL',
        'item_name'     => 'ALTER TABLE scope_selections ADD COLUMN item_name VARCHAR(255) DEFAULT NULL',
        'description'   => 'ALTER TABLE scope_selections ADD COLUMN description TEXT DEFAULT NULL',
        'quantity'      => 'ALTER TABLE scope_selections ADD COLUMN quantity INT(11) DEFAULT 0'
    ];
    foreach ($required as $col => $sql) {
        if (!in_array($col, $check)) {
            $pdo->exec($sql);
        }
    }
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}
