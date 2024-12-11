<?php

require_once '../../conexion.php';
require_once 'fpdf/fpdf.php';
mysqli_set_charset($conexion, "utf8");

$pdf = new FPDF('P', 'mm', array(80, 200));
$pdf->AddPage();
$pdf->SetMargins(5, 0, 0);
$pdf->SetTitle("Ventas");
$pdf->SetFont('Arial', 'B', 12);
$id = $_GET['v'];
$idcliente = $_GET['cl'];

$config = mysqli_query($conexion, "SELECT * FROM configuracion");
$datos = mysqli_fetch_assoc($config);
$clientes = mysqli_query($conexion, "SELECT * FROM cliente WHERE idcliente = $idcliente");
$datosC = mysqli_fetch_assoc($clientes);
$ventas = mysqli_query($conexion, "SELECT d.*, p.codproducto, p.descripcion FROM detalle_venta d INNER JOIN producto p ON d.id_producto = p.codproducto WHERE d.id_venta = $id");

$ventaDatos = mysqli_query($conexion, "SELECT v.fecha FROM ventas v WHERE v.id = $id");
$datosVenta = mysqli_fetch_assoc($ventaDatos);


function obtenerPromedioDolar() {
    $url = "https://ve.dolarapi.com/v1/dolares";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Content-Type: application/json"
    ]);

    $response = curl_exec($ch);
    curl_close($ch);

    if ($response !== false) {
        $data = json_decode($response, true);
        if ($data !== null) {
            return $data[0]['promedio'];
        }
    }
    return 1;
}

$promedioBolivares = obtenerPromedioDolar();

$pdf->Cell(65, 5, ($datos['nombre']), 0, 1, 'C');
$pdf->SetFont('Arial', 'B', 7);
$pdf->Cell(15, 5, ("Telf: "), 0, 0, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(15, 5, $datos['telefono'], 0, 1, 'L');
$pdf->SetFont('Arial', 'B', 7);
$pdf->Cell(15, 5, ("Dir: "), 0, 0, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(15, 5, ($datos['direccion']), 0, 1, 'L');
$pdf->SetFont('Arial', 'B', 7);
$pdf->Cell(15, 5, "Email: ", 0, 0, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(15, 5, ($datos['email']), 0, 1, 'L');
$pdf->Cell(15, 5, "RIF: ", 0, 0, 'L');
$pdf->Cell(15, 5, 'J' . $datos['rif'], 0, 1, 'L');
$pdf->Cell(15, 5, "La Victoria, Estado Aragua. Venezuela", 0, 0, 'L');
$pdf->Ln();
$pdf->SetFont('Arial', 'B', 8);
$pdf->SetFillColor(0, 0, 0);
$pdf->SetTextColor(255, 255, 255);
$pdf->Cell(70, 5, "Datos del cliente", 1, 1, 'C', 1);
$pdf->SetTextColor(0, 0, 0);
$pdf->Cell(30, 5, ('Nombre'), 0, 0, 'L');
$pdf->Cell(20, 5, ('Telf.'), 0, 0, 'L');
$pdf->Cell(20, 5, ('Dir.'), 0, 1, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(30, 5, ($datosC['nombre']), 0, 0, 'L');
$pdf->Cell(20, 5, ($datosC['telefono']), 0, 0, 'L');
$pdf->Cell(20, 5, ($datosC['direccion']), 0, 1, 'L');
$pdf->Ln(3);

$pdf->SetFont('Arial', 'B', 8);
$pdf->SetTextColor(255, 255, 255);
$pdf->Cell(70, 5, "Detalle de Producto", 1, 1, 'C', 1);
$pdf->SetTextColor(0, 0, 0);
$pdf->Cell(30, 5, ('Producto'), 0, 0, 'L');
$pdf->Cell(10, 5, 'Cant.', 0, 0, 'L');
$pdf->Cell(15, 5, 'Precio', 0, 0, 'L');
$pdf->Cell(15, 5, 'Sub Total.', 0, 1, 'L');

$pdf->SetFont('Arial', '', 7);
$total = 0.00;
$desc = 0.00;

while ($row = mysqli_fetch_assoc($ventas)) {
    $precioBolivares = $row['precio'] * $promedioBolivares;
    $subTotalBolivares = $row['total'] * $promedioBolivares;
    
    $pdf->MultiCell(30, 5, utf8_decode($row['descripcion']), 0, 'L');
    
    $yPosition = $pdf->GetY() - 4; 
    $pdf->SetY($yPosition);
    $pdf->SetX(35);
    
    $pdf->Cell(10, 5, $row['cantidad'], 0, 0, 'L');
    $pdf->Cell(15, 5, number_format($precioBolivares, 2, '.', ','), 0, 0, 'L');
    $pdf->Cell(15, 5, number_format($subTotalBolivares, 2, '.', ','), 0, 1, 'L');
    
    $total += $subTotalBolivares;
    $desc += $row['descuento'] * $promedioBolivares;
}


$pdf->Ln();

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(65, 5, 'Descuento Total', 0, 1, 'R');
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(65, 5, number_format($desc, 2, '.', ','), 0, 1, 'R');
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(65, 5, 'Total a Pagar (con IVA)', 0, 1, 'R');
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(65, 5, number_format($total, 2, '.', ',') . " BS", 0, 1, 'R');  // Aquí se añade "BS"

$pdf->Ln(5); 
$pdf->SetFont('Arial', '', 8);

$fechaOriginal = $datosVenta['fecha']; 
$fechaFormateada = date('d/m/Y', strtotime($fechaOriginal));

$pdf->Cell(0, 5, "Fecha: " . $fechaFormateada, 0, 1, 'C'); 

$pdf->Ln(8);

$pdf->SetFont('Arial', '', 6);  
$pdf->Cell(15, 5, "SIN DERECHO A CREDITO FISCAL", 0, 0, 'L');

$pdf->Output("ventas.pdf", "I");

?>
