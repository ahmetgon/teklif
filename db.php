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
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}
