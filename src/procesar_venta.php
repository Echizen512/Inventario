<?php
session_start();
require("../conexion.php");

// Recibir datos
$id_cliente = $_POST['id_cliente'];
$id_user = $_POST['id_user'];
$monto_recibido = $_POST['monto_recibido'];
$total_bolivares = $_POST['total_bolivares']; 
$metodo_pago = $_POST['metodo_pago']; 
$tipo_pago = $_POST['tipo_pago'];

// Validar datos
if (empty($id_cliente) || empty($id_user) || empty($total_bolivares) || empty($metodo_pago) || empty($tipo_pago)) {
    echo json_encode(['mensaje' => 'error', 'detalle' => 'Datos incompletos']);
    exit;
}

// Multiplicar el total en bolívares por 0.16
$total_bolivares = $total_bolivares * 0.16;

try {
    // Iniciar transacción
    mysqli_begin_transaction($conexion);

    // Insertar la venta con método de pago
    $stmt = mysqli_prepare($conexion, "INSERT INTO ventas (id_cliente, id_user, total_bolivares, fecha, metodo_pago, tipo_pago) VALUES (?, ?, ?, CURRENT_DATE, ?, ?)");
    if (!$stmt) {
        throw new Exception("Error en preparación de consulta: " . mysqli_error($conexion));
    }

    mysqli_stmt_bind_param($stmt, 'iids', $id_cliente, $id_user, $total_bolivares, $metodo_pago, $tipo_pago);

    if (!mysqli_stmt_execute($stmt)) {
        throw new Exception("Error al ejecutar la consulta: " . mysqli_error($conexion));
    }

    $id_venta = mysqli_insert_id($conexion);

    // Insertar los detalles de la venta
    if (isset($_SESSION['carrito']) && is_array($_SESSION['carrito'])) {
        $stmt_detalle = mysqli_prepare($conexion, "INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio) VALUES (?, ?, ?, ?)");
        if (!$stmt_detalle) {
            throw new Exception("Error en preparación de consulta de detalles: " . mysqli_error($conexion));
        }

        foreach ($_SESSION['carrito'] as $producto) {
            $id_producto = $producto['id'];
            $cantidad = $producto['cantidad'];
            $precio = $producto['precio'];

            mysqli_stmt_bind_param($stmt_detalle, 'iiid', $id_venta, $id_producto, $cantidad, $precio);
            if (!mysqli_stmt_execute($stmt_detalle)) {
                throw new Exception("Error al insertar detalle: " . mysqli_error($conexion));
            }
        }
    }

    // Confirmar transacción
    mysqli_commit($conexion);

    echo json_encode(['mensaje' => 'ok']);
} catch (Exception $e) {
    // Revertir transacción en caso de error
    mysqli_rollback($conexion);
    echo json_encode(['mensaje' => 'error', 'detalle' => $e->getMessage()]);
}
?>
