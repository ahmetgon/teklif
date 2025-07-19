<?php
require 'vendor/autoload.php';
require 'db.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Alignment;

$scope_id = isset($_GET['scope_id']) ? intval($_GET['scope_id']) : 0;

$stmt = $pdo->prepare("SELECT ss.*, c.name AS category_name, i.name AS item_name
                       FROM scope_selections ss
                       JOIN categories c ON ss.category_id = c.id
                       JOIN items i ON ss.item_id = i.id
                       WHERE ss.scope_id = :scope_id");
$stmt->execute(['scope_id' => $scope_id]);
$data = $stmt->fetchAll();

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Başlıklar
$headers = ['Kategori', 'İş Kalemi', 'Açıklama', 'Adet / Yıl'];
$sheet->fromArray($headers, null, 'A1');

// Veriler
$row = 2;
foreach ($data as $d) {
    $sheet->setCellValue("A{$row}", $d['category_name']);
    $sheet->setCellValue("B{$row}", $d['item_name']);
    $sheet->setCellValue("C{$row}", $d['description']);
    $sheet->setCellValue("D{$row}", $d['quantity']);
    $row++;
}

// Stil ayarları
$styleArray = [
    'borders' => [
        'allBorders' => ['borderStyle' => Border::BORDER_THIN],
    ],
    'alignment' => [
        'vertical' => Alignment::VERTICAL_CENTER,
        'wrapText' => true,
    ]
];

// Aralık belirle
$lastRow = $row - 1;
$sheet->getStyle("A1:D{$lastRow}")->applyFromArray($styleArray);

// "Adet / Yıl" sütununu ortala
$sheet->getStyle("D2:D{$lastRow}")
    ->getAlignment()
    ->setHorizontal(Alignment::HORIZONTAL_CENTER);

// Sütun genişlikleri
$sheet->getColumnDimension('A')->setWidth(25);
$sheet->getColumnDimension('B')->setWidth(25);
$sheet->getColumnDimension('C')->setWidth(45);
$sheet->getColumnDimension('D')->setWidth(15);

// İndir
$filename = "kapsam_{$scope_id}.xlsx";
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header("Content-Disposition: attachment;filename=\"$filename\"");
header('Cache-Control: max-age=0');

$writer = new Xlsx($spreadsheet);
$writer->save('php://output');
exit;
