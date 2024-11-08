<?php
session_start();
require("../conexion.php");

$id_cliente = $_POST['id_cliente'];
$id_user = $_POST['id_user'];
$monto_recibido = $_POST['monto_recibido'];
$total_bolivares = $_POST['total_bolivares']; 

if (empty($id_cliente) || empty($id_user) || empty($total_bolivares)) {
    echo json_encode(['mensaje' => 'error', 'detalle' => 'Datos incompletos']);
    exit;
}

try {
    mysqli_begin_transaction($conexion);

    // Insertar la venta en la tabla de ventas
    $stmt = mysqli_prepare($conexion, "INSERT INTO ventas (id_cliente, id_user, total_bolivares, monto_recibido) VALUES (?, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt, 'iidd', $id_cliente, $id_user, $total_bolivares, $monto_recibido);
    mysqli_stmt_execute($stmt);

    $id_venta = mysqli_insert_id($conexion);

    // Insertar los detalles de la venta
    if (isset($_SESSION['carrito']) && is_array($_SESSION['carrito'])) {
        foreach ($_SESSION['carrito'] as $producto) {
            $id_producto = $producto['id'];
            $cantidad = $producto['cantidad'];
            $precio = $producto['precio'];

            $stmt_detalle = mysqli_prepare($conexion, "INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio) VALUES (?, ?, ?, ?)");
            mysqli_stmt_bind_param($stmt_detalle, 'iiid', $id_venta, $id_producto, $cantidad, $precio);
            mysqli_stmt_execute($stmt_detalle);
        }
    }

    mysqli_commit($conexion);

    echo json_encode(['mensaje' => 'ok']);
} catch (Exception $e) {
    mysqli_rollback($conexion);
    echo json_encode(['mensaje' => 'error', 'detalle' => $e->getMessage()]);
}
?>
