<?php
require("../conexion.php");

if (isset($_POST['id']) && isset($_POST['cantidad'])) {
    $idProducto = intval($_POST['id']);
    $cantidad = intval($_POST['cantidad']);

    $query = mysqli_query($conexion, "SELECT stock FROM productos WHERE id = $idProducto");
    $resultado = mysqli_fetch_assoc($query);

    if ($resultado) {
        $stockDisponible = $resultado['stock'];
        if ($cantidad > $stockDisponible) {
            echo json_encode([
                'valido' => false,
                'stock_disponible' => $stockDisponible,
            ]);
        } else {
            echo json_encode(['valido' => true]);
        }
    } else {
        echo json_encode(['valido' => false, 'stock_disponible' => 0]);
    }
} else {
    echo json_encode(['valido' => false]);
}
?>
