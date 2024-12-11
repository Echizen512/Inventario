<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require '../vendor/autoload.php';
require_once '../conexion.php';
require_once './pdf/fpdf/fpdf.php';
mysqli_set_charset($conexion, "utf8");

$pdfFilePath = 'Diario.pdf';

class PDF extends FPDF
{
    function Header()
    {
        $this->Rect(10, 10, 190, 277);
        $this->SetFont('Arial', 'B', 16);
        $this->Cell(0, 10, 'CONTROL DIARIO', 0, 1, 'C');
        $this->Ln(5);
        $this->SetFont('Arial', '', 12);
        $this->Cell(0, 10, 'KATHA COLLECTION MODA SIN PARADIGMA C.A', 0, 1, 'C');
        $this->SetFont('Arial', '', 8);
        $this->Cell(0, 5, 'RIF: J121344534', 0, 1, 'C');
    }

    function AddReportDate($date)
    {
        // Convierte la fecha al formato 'd,m,Y' (día, mes, año en números)
        $formattedDate = date('d,m,Y', strtotime($date));

        $this->SetFont('Arial', '', 12);
        $this->Cell(15, 0, 'Fecha: ', 0, 0);
        $this->Cell(30, 0, $formattedDate, 0, 1);
    }


    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 15, 'Pagina ' . $this->PageNo(), 0, 0, 'C');
    }

    function AddContent($saldo_inicial, $egresos, $ventas_contado, $ventas_credito, $ventas_efectivo, $ventas_efectivo_divisas, $ventas_pts_venta, $ventas_transferencia, $ventas_pago_movil, $cuentas_por_pagar, $total_ingresos, $total_desglose, $compras, $total_dolares, $total_bolivares, $egresos_efectivo, $egresos_pts_venta, $egresos_transferencia, $egresos_efectivo_divisas, $egresos_pago_movil, $total_efectivo_divisas_dolares, $total_ingresos_dolares)
    {
        if (!is_numeric($saldo_inicial)) {
            throw new TypeError('Saldo inicial debe ser un número.');
        }
        $this->SetX(140);
        $this->Cell(25, 10, 'Saldo Inicial: ', 0, 0);
        $this->Cell(30, 10, number_format((float) $saldo_inicial, 2) . ' Bs', 0, 1);
        $this->Ln(10);

        // Ingresos / Entradas
        $this->SetLineWidth(0.2);
        $this->Rect(10, 50, 95, 110);
        $this->Rect(105, 50, 95, 110);
        $this->Rect(10, 160, 95, 110);
        $this->Rect(105, 160, 95, 110);

        $this->SetFont('Arial', 'B', 12);
        $this->SetXY(10, 50);

        $this->Cell(95, 10, 'Ingresos / Entradas', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);
        $this->SetXY(10, 60);

        $this->Cell(40, 8, 'Ventas al Contado:', 0, 0);
        $this->Cell(30, 8, number_format((float) $ventas_contado, 2) . ' Bs', 0, 1);

        $this->Cell(40, 8, 'Ventas a Credito:', 0, 0);
        $this->Cell(30, 8, number_format((float) $ventas_credito, 2) . ' Bs', 0, 1);

        // Cuentas por Pagar
        $this->Ln(5);
        $this->Cell(40, 8, 'Cuentas por Pagar:', 0, 1);

        foreach ($cuentas_por_pagar as $cuenta) {
            $this->Cell(40, 8, $cuenta['descripcion'], 0, 0);
            $this->Cell(30, 8, number_format((float) $cuenta['monto'], 2) . ' Bs', 0, 1);
        }

        $this->Ln(5);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(40, 8, 'Total Ingresos:', 0, 0);
        $this->Cell(30, 8, number_format((float) $total_ingresos, 2) . ' Bs', 0, 1);

        // Egresos / Salidas
        $this->SetFont('Arial', 'B', 12);
        $this->SetXY(105, 50);
        $this->Cell(95, 10, 'Egresos / Salidas', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);
        $this->SetXY(105, 60);

        $line_height = 8;
        $y_position = 50; // Establece la posición inicial de Y

        // Iteración sobre los egresos
        foreach ($egresos as $index => $egreso) {
            $y_position += $line_height;
            $this->SetXY(105, $y_position);
            $this->Cell(40, 8, $egreso['descripcion'], 0, 0);
            $this->Cell(20, 8, '(' . $egreso['observaciones'] . ')', 0, 0);

            // Si las observaciones son 'Mensual', se calcula el gasto diario
            if ($egreso['observaciones'] == 'Mensual') {
                $gasto_diario = $egreso['monto'] / 30;
                $this->Cell(20, 8, 'Diario:', 0, 0);
                $this->Cell(20, 8, number_format((float) $gasto_diario, 2) . ' $', 0, 1);
            } else {
                $this->Ln();
            }
        }

        // Después de imprimir los egresos, procesamos las compras
        foreach ($compras as $compra) {
            $y_position += $line_height;
            $this->SetXY(105, $y_position);
            $this->Cell(40, 8, $compra['proveedor_nombre'], 0, 0);
            $this->Cell(40, 8, $compra['concepto'], 0, 0);
            $this->Cell(20, 8, number_format((float) $compra['monto'], 2) . ' $', 0, 1);
        }

        // Imprimir totales
        $y_position += 2 * $line_height;
        $this->SetXY(105, $y_position);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(60, 8, 'Total en Dolares:', 0, 0);
        $this->Cell(35, 8, number_format((float) $total_dolares, 2) . ' $', 0, 1);
        $y_position += $line_height;
        $this->SetXY(105, $y_position);
        $this->Cell(60, 8, 'Total en Bolivares:', 0, 0);
        $this->Cell(35, 8, number_format((float) $total_bolivares, 2) . ' Bs.', 0, 1);

        // Desglose Ingresos
        $this->SetXY(10, 160);
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(95, 10, 'Desglose de los Ingresos', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);

        // Imprimir totales por cada metodo de pago
        $this->Cell(40, 8, 'Efectivo (Bolivares):', 0, 0);
        $this->Cell(30, 8, number_format((float) $ventas_efectivo, 2) . ' Bs', 0, 1);

        $this->Cell(40, 8, 'Efectivo Divisas:', 0, 0);
        $this->Cell(30, 8, number_format((float) $ventas_efectivo_divisas, 2) . ' BS', 0, 1);

        $this->Cell(40, 8, 'Puntos de Ventas:', 0, 0);
        $this->Cell(30, 8, number_format((float) $ventas_pts_venta, 2) . ' Bs', 0, 1);

        $this->Cell(40, 8, 'Transferencia Bancaria:', 0, 0);
        $this->Cell(30, 8, number_format((float) $ventas_transferencia, 2) . ' Bs', 0, 1);

        $this->Cell(40, 8, 'Pago Movil:', 0, 0);
        $this->Cell(30, 8, number_format((float) $ventas_pago_movil, 2) . ' Bs', 0, 1);

        // Total de Desglose
        $this->Ln(5);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(40, 8, 'Total  Ingresos:', 0, 0);
        $this->Cell(30, 8, number_format((float) $total_desglose, 2) . ' Bs', 0, 1);



        // Imprimir el total de efectivo en divisas en dólares
        $this->Ln(5);
        $this->Cell(45, 8, 'Total Efectivo en Divisas:', 0, 0);
        $this->Cell(30, 8, number_format((float) $total_efectivo_divisas_dolares, 2) . ' $', 0, 1);

        // Imprimir el total de ingresos en dólares
        $this->Ln(5);
        $this->Cell(30, 8, 'Total en Dolares:', 0, 0);
        $this->Cell(30, 8, number_format((float) $total_ingresos_dolares, 2) . ' $', 0, 1);


        // Desglose Egresos
        $this->SetXY(108, 160);
        $this->SetFont('Arial', 'B', 12);
        $this->Cell(95, 10, 'Desglose de los Egresos', 0, 1, 'C');
        $this->SetFont('Arial', '', 10);

        $this->SetXY(110, 170);
        $this->Cell(40, 8, 'Efectivo (Bolivares):', 0, 0);
        $this->Cell(30, 8, number_format((float) $egresos_efectivo, 2) . ' $', 0, 1);
        $this->SetXY(110, 180);
        $this->Cell(40, 8, 'Efectivo Divisas:', 0, 0);
        $this->Cell(30, 8, number_format((float) $egresos_pts_venta, 2) . ' $', 0, 1);
        $this->SetXY(110, 190);
        $this->Cell(40, 8, 'Puntos de Ventas:', 0, 0);
        $this->Cell(30, 8, number_format((float) $egresos_transferencia, 2) . ' $', 0, 1);
        $this->SetXY(110, 200);
        $this->Cell(40, 8, 'Transferencia Bancaria:', 0, 0);
        $this->Cell(30, 8, number_format((float) $egresos_efectivo_divisas, 2) . ' $', 0, 1);
        $this->SetXY(110, 210);
        $this->Cell(40, 8, 'Pago Movil:', 0, 0);
        $this->Cell(30, 8, number_format((float) $egresos_pago_movil, 2) . ' $', 0, 1);

        // Imprimir totales
        $y_position += 10 * $line_height;
        $this->SetXY(105, $y_position);
        $this->SetFont('Arial', 'B', 10);
        $this->Cell(60, 8, 'Total en Dolares:', 0, 0);
        $this->Cell(35, 8, number_format((float) $total_dolares, 2) . ' $', 0, 1);
        $y_position += $line_height;
        $this->SetXY(105, $y_position);
        $this->Cell(60, 8, 'Total en Bolivares:', 0, 0);
        $this->Cell(35, 8, number_format((float) $total_bolivares, 2) . ' Bs.', 0, 1);


    }

}

$saldo_inicial = floatval($_POST['saldo_inicial']);
$date = $_POST['date'];

// Inicializa las variables de ventas
$ventas_contado = 0;
$ventas_credito = 0;
$ventas_efectivo = 0;
$ventas_efectivo_divisas = 0;
$ventas_pts_venta = 0;
$ventas_transferencia = 0;
$ventas_pago_movil = 0;
$egresos_efectivo = 0;
$egresos_pts_venta = 0;
$egresos_transferencia = 0;
$egresos_efectivo_divisas = 0;
$egresos_pago_movil = 0;

// Obtén las ventas
$query_ventas = "SELECT total, tipo_pago FROM ventas WHERE DATE(fecha) = '$date'";
$result_ventas = mysqli_query($conexion, $query_ventas);
if (mysqli_num_rows($result_ventas) === 0) {
    die('No hay datos para generar el reporte.');
}
while ($row = mysqli_fetch_assoc($result_ventas)) {
    if ($row['tipo_pago'] == 1) {
        $ventas_contado += $row['total'];
    } else if ($row['tipo_pago'] == 2) {
        $ventas_credito += $row['total'];
    }
}

// Obtén las ventas
$query_ventas = "SELECT total, metodo_pago FROM ventas WHERE DATE(fecha) = '$date'";
$result_ventas = mysqli_query($conexion, $query_ventas);
while ($row = mysqli_fetch_assoc($result_ventas)) {
    if ($row['metodo_pago'] == 1) {
        $ventas_efectivo += $row['total'];
    } else if ($row['metodo_pago'] == 2) {
        $ventas_pts_venta += $row['total'];
    } else if ($row['metodo_pago'] == 3) {
        $ventas_transferencia += $row['total'];
    } else if ($row['metodo_pago'] == 4) {
        $ventas_efectivo_divisas += $row['total'];
    } else if ($row['metodo_pago'] == 5) {
        $ventas_pago_movil += $row['total'];
    }
}

// Obtén las cuentas por pagar
$query_pagos = "SELECT descripcion, monto, metodo_pago FROM pagos WHERE fecha = '$date'";
$result_pagos = mysqli_query($conexion, $query_pagos);
if (mysqli_num_rows($result_pagos) === 0) {
    die('No hay datos para generar el reporte.');
}
while ($row = mysqli_fetch_assoc($result_pagos)) {
    $cuentas_por_pagar[] = ['descripcion' => $row['descripcion'], 'monto' => $row['monto'], 'metodo_pago' => $row['metodo_pago']];

    // Sumar a los ingresos según el metodo de pago
    if ($row['metodo_pago'] == 1) {
        $ventas_efectivo += $row['monto'];
    } else if ($row['metodo_pago'] == 2) {
        $ventas_pts_venta += $row['monto'];
    } else if ($row['metodo_pago'] == 3) {
        $ventas_transferencia += $row['monto'];
    } else if ($row['metodo_pago'] == 4) {
        $ventas_efectivo_divisas += $row['monto'];
    } else if ($row['metodo_pago'] == 5) {
        $ventas_pago_movil += $row['monto'];
    }
}


// Inicializa las variables para las sumas


// Obtén los egresos
$egresos = [];
$query_egresos = "SELECT descripcion, monto, metodo_pago, observaciones FROM egresos";
$result_egresos = mysqli_query($conexion, $query_egresos);
while ($row = mysqli_fetch_assoc($result_egresos)) {
    $egresos[] = [
        'descripcion' => $row['descripcion'],
        'monto' => $row['monto'],
        'observaciones' => $row['observaciones']
    ];

    // Verifica si la observación es 'Mensual' y divide el monto entre 30
    if ($row['observaciones'] == 'Mensual') {
        $monto = $row['monto'] / 30;
    } else {
        $monto = $row['monto'];
    }

    // Acumulando los egresos por método de pago
    if ($row['metodo_pago'] == 1) {
        $egresos_efectivo += $monto;
    } else if ($row['metodo_pago'] == 2) {
        $egresos_pts_venta += $monto;
    } else if ($row['metodo_pago'] == 3) {
        $egresos_transferencia += $monto;
    } else if ($row['metodo_pago'] == 4) {
        $egresos_efectivo_divisas += $monto;
    } else if ($row['metodo_pago'] == 5) {
        $egresos_pago_movil += $monto;
    }
}

// Obtén las compras y proveedores
$compras = [];
$query_compras = "
    SELECT c.concepto, c.monto, c.tipo_pago, p.nombre AS proveedor_nombre
    FROM compras c
    INNER JOIN proveedor p ON c.proveedor_id = p.idproveedor";
$result_compras = mysqli_query($conexion, $query_compras);
while ($row = mysqli_fetch_assoc($result_compras)) {
    $compras[] = [
        'concepto' => $row['concepto'],
        'monto' => $row['monto'],
        'proveedor_nombre' => $row['proveedor_nombre']
    ];

    // Acumulando las compras por tipo de pago
    if ($row['tipo_pago'] == 1) {
        $egresos_efectivo += $row['monto'];
    } else if ($row['tipo_pago'] == 2) {
        $egresos_pts_venta += $row['monto'];
    } else if ($row['tipo_pago'] == 3) {
        $egresos_transferencia += $row['monto'];
    } else if ($row['tipo_pago'] == 4) {
        $egresos_efectivo_divisas += $row['monto'];
    } else if ($row['tipo_pago'] == 5) {
        $egresos_pago_movil += $row['monto'];
    }
}





$total_cuentas_por_pagar = array_reduce($cuentas_por_pagar, function ($carry, $cuenta) {
    return $carry + $cuenta['monto'];
}, 0);

$total_ingresos = $ventas_contado + $ventas_credito + $total_cuentas_por_pagar;

$total_desglose = $ventas_efectivo + $ventas_efectivo_divisas + $ventas_pts_venta + $ventas_transferencia + $ventas_pago_movil;

function obtenerPromedioDolar()
{
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

// Calcular totales

$total_egresos_diarios = 0;
foreach ($egresos as $egreso) {
    if ($egreso['observaciones'] == 'Mensual') {
        $total_egresos_diarios += $egreso['monto'] / 30;
    }
}
$total_compras = array_sum(array_column($compras, 'monto'));
$total_dolares = $total_egresos_diarios + $total_compras;
$total_bolivares = $total_dolares * $promedioBolivares;

$total_efectivo_divisas_dolares = $ventas_efectivo_divisas / $promedioBolivares;

$total_ingresos_dolares = $total_ingresos / $promedioBolivares;




$pdf = new PDF();
$pdf->AddPage();
$pdf->AddReportDate($date);
$pdf->AddContent(
    $saldo_inicial,
    $egresos,
    $ventas_contado,
    $ventas_credito,
    $ventas_efectivo,
    $ventas_efectivo_divisas,
    $ventas_pts_venta,
    $ventas_transferencia,
    $ventas_pago_movil,
    $cuentas_por_pagar,
    $total_ingresos,  // Total Ingresos
    $total_desglose, // Total Desglose
    $compras, // Agrega las compras aquí
    $total_dolares,
    $total_bolivares,
    $egresos_efectivo,
    $egresos_pts_venta,
    $egresos_transferencia,
    $egresos_efectivo_divisas,
    $egresos_pago_movil,
    $total_efectivo_divisas_dolares,
    $total_ingresos_dolares
);


$pdf->Output('F', $pdfFilePath);

$mail = new PHPMailer(true);

try {
    // Configuración del servidor SMTP de Gmail
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'colletionkatha@gmail.com'; // Tu dirección de Gmail
    $mail->Password = 'hmbs lhyj wtpb fogr'; // Tu contraseña de aplicación
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    // Remitente y destinatarios
    $mail->setFrom('colletionkatha@gmail.com', 'Katha Collection');
    $mail->addAddress('jmrm19722@gmail.com', 'Miguel Rodríguez');

    // Contenido del correo
    $mail->isHTML(true);
    $mail->Subject = 'PHPMailer Test';
    $mail->Body = 'Hello! This is a test email with a PDF attachment.';
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    // Adjuntar PDF
    $mail->addAttachment($pdfFilePath, 'Diario.pdf');

    // Enviar el correo
    $mail->send();

} catch (Exception $e) {

}

// Adjuntar PDF 
$mail->addAttachment($pdfFilePath, 'Diario.pdf');

// Redirigir al PDF para mostrarlo en el navegador
header('Content-Type: application/pdf');
header('Content-Disposition: inline; filename="' . $pdfFilePath . '"');
readfile($pdfFilePath);


?>