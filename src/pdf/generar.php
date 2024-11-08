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

// Obtener el promedio en bolívares usando la API
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
            return $data[0]['promedio'];  // Regresa el valor promedio en bolívares
        }
    }
    return 1;  // Si no se obtiene el promedio, por defecto multiplicamos por 1
}

$promedioBolivares = obtenerPromedioDolar();  // Obtener el promedio actual del dólar

$pdf->Cell(65, 5, utf8_decode($datos['nombre']), 0, 1, 'C');
$pdf->SetFont('Arial', 'B', 7);
$pdf->Cell(15, 5, utf8_decode("Teléfono: "), 0, 0, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(15, 5, $datos['telefono'], 0, 1, 'L');
$pdf->SetFont('Arial', 'B', 7);
$pdf->Cell(15, 5, utf8_decode("Dirección: "), 0, 0, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(15, 5, utf8_decode($datos['direccion']), 0, 1, 'L');
$pdf->SetFont('Arial', 'B', 7);
$pdf->Cell(15, 5, "Correo: ", 0, 0, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(15, 5, utf8_decode($datos['email']), 0, 1, 'L');
$pdf->Ln();
$pdf->SetFont('Arial', 'B', 8);
$pdf->SetFillColor(0, 0, 0);
$pdf->SetTextColor(255, 255, 255);
$pdf->Cell(70, 5, "Datos del cliente", 1, 1, 'C', 1);
$pdf->SetTextColor(0, 0, 0);
$pdf->Cell(30, 5, utf8_decode('Nombre'), 0, 0, 'L');
$pdf->Cell(20, 5, utf8_decode('Teléfono'), 0, 0, 'L');
$pdf->Cell(20, 5, utf8_decode('Dirección'), 0, 1, 'L');
$pdf->SetFont('Arial', '', 7);
$pdf->Cell(30, 5, utf8_decode($datosC['nombre']), 0, 0, 'L');
$pdf->Cell(20, 5, utf8_decode($datosC['telefono']), 0, 0, 'L');
$pdf->Cell(20, 5, utf8_decode($datosC['direccion']), 0, 1, 'L');
$pdf->Ln(3);
$pdf->SetFont('Arial', 'B', 8);
$pdf->SetTextColor(255, 255, 255);
$pdf->Cell(70, 5, "Detalle de Producto", 1, 1, 'C', 1);
$pdf->SetTextColor(0, 0, 0);
$pdf->Cell(30, 5, utf8_decode('Descripción'), 0, 0, 'L');
$pdf->Cell(10, 5, 'Cant.', 0, 0, 'L');
$pdf->Cell(15, 5, 'Precio', 0, 0, 'L');
$pdf->Cell(15, 5, 'Sub Total.', 0, 1, 'L');
$pdf->SetFont('Arial', '', 7);
$total = 0.00;
$desc = 0.00;

while ($row = mysqli_fetch_assoc($ventas)) {
    // Multiplicar los valores por el promedio en bolívares
    $precioBolivares = $row['precio'] * $promedioBolivares;
    $subTotalBolivares = $row['total'] * $promedioBolivares;

    $pdf->Cell(30, 5, $row['descripcion'], 0, 0, 'L');
    $pdf->Cell(10, 5, $row['cantidad'], 0, 0, 'L');
    $pdf->Cell(15, 5, number_format($precioBolivares, 2, '.', ','), 0, 0, 'L');
    $pdf->Cell(15, 5, number_format($subTotalBolivares, 2, '.', ','), 0, 1, 'L');

    // Acumulando el total y el descuento
    $total += $subTotalBolivares;
    $desc += $row['descuento'] * $promedioBolivares;
}

$pdf->Ln();
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(65, 5, 'Descuento Total', 0, 1, 'R');
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(65, 5, number_format($desc, 2, '.', ','), 0, 1, 'R');
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(65, 5, 'Total a Pagar', 0, 1, 'R');
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(65, 5, number_format($total, 2, '.', ',') . " BS", 0, 1, 'R');  // Aquí se añade "BS"

$pdf->Output("ventas.pdf", "I");

?>
