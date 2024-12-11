<?php
require '../vendor/autoload.php'; // PhpSpreadsheet

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

include "../conexion.php";

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'ID');
$sheet->setCellValue('B1', 'Código');
$sheet->setCellValue('C1', 'Producto');
$sheet->setCellValue('D1', 'Precio');
$sheet->setCellValue('E1', 'Stock');

$query = mysqli_query($conexion, "SELECT * FROM producto");
$row = 2; // Inicia en la segunda fila para los datos.

while ($data = mysqli_fetch_assoc($query)) {
    $sheet->setCellValue("A$row", $data['codproducto']);
    $sheet->setCellValue("B$row", $data['codigo']);
    $sheet->setCellValue("C$row", $data['descripcion']);
    $sheet->setCellValue("D$row", $data['precio']);
    $sheet->setCellValue("E$row", $data['existencia']);
    $row++;
}

$writer = new Xlsx($spreadsheet);
$fileName = 'Productos.xlsx';
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="' . $fileName . '"');
$writer->save('php://output');
exit;
?>
