<?php
require_once "../conexion.php";
session_start();

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
    return null;
}

if (isset($_GET['q'])) {
    $datos = array();
    $nombre = $_GET['q'];
    $cliente = mysqli_query($conexion, "SELECT * FROM cliente WHERE nombre LIKE '%$nombre%'");
    while ($row = mysqli_fetch_assoc($cliente)) {
        $data['id'] = $row['idcliente'];
        $data['label'] = $row['nombre'];
        $data['direccion'] = $row['direccion'];
        $data['telefono'] = $row['telefono'];
        array_push($datos, $data);
    }
    echo json_encode($datos);
    die();
} else if (isset($_GET['pro'])) {
    $datos = array();
    $nombre = $_GET['pro'];
    $producto = mysqli_query($conexion, "SELECT * FROM producto WHERE codigo LIKE '%" . $nombre . "%' OR descripcion LIKE '%" . $nombre . "%'");
    while ($row = mysqli_fetch_assoc($producto)) {
        $data['id'] = $row['codproducto'];
        $data['label'] = $row['codigo'] . ' - ' .$row['descripcion'];
        $data['value'] = $row['descripcion'];
        $data['precio'] = $row['precio'];
        $data['existencia'] = $row['existencia'];
        array_push($datos, $data);
    }
    echo json_encode($datos);
    die();
} else if (isset($_GET['detalle'])) {
    $id = $_SESSION['idUser'];
    $datos = array();
    $detalle = mysqli_query($conexion, "SELECT d.*, p.codproducto, p.descripcion FROM detalle_temp d INNER JOIN producto p ON d.id_producto = p.codproducto WHERE d.id_usuario = $id");
    while ($row = mysqli_fetch_assoc($detalle)) {
        $data['id'] = $row['id'];
        $data['descripcion'] = $row['descripcion'];
        $data['cantidad'] = $row['cantidad'];
        $data['descuento'] = $row['descuento'];
        $data['precio_venta'] = $row['precio_venta'];
        $data['sub_total'] = $row['total'];
        array_push($datos, $data);
    }
    echo json_encode($datos);
    die();
} else if (isset($_GET['delete_detalle'])) {
    $id_detalle = $_GET['id'];
    $query = mysqli_query($conexion, "DELETE FROM detalle_temp WHERE id = $id_detalle");
    if ($query) {
        $msg = "ok";
    } else {
        $msg = "Error";
    }
    echo $msg;
    die();
} else if (isset($_GET['procesarVenta'])) {
    $id_cliente = $_GET['id'];
    $id_user = $_SESSION['idUser'];
    $metodo_pago = $_GET['metodoPago'];  
    $tipo_pago = $_GET['tipo_pago'];

    // Obtener el total de la venta
    $consulta = mysqli_query($conexion, "SELECT SUM(total) AS total_pagar FROM detalle_temp WHERE id_usuario = $id_user");
    if (!$consulta) {
        echo json_encode(array('mensaje' => 'error', 'detalle' => 'Error al consultar el total de la venta'));
        die();
    }
    $result = mysqli_fetch_assoc($consulta);
    $total = $result['total_pagar'];

    // Obtener el promedio del dólar
    $promedioDolar = obtenerPromedioDolar();
    if ($promedioDolar !== null) {
        $totalBolivares = $total * $promedioDolar;
    } else {
        echo json_encode(array('mensaje' => 'error_dolar'));
        die();
    }

    // Multiplicar el total por 1.16 para agregar el 16% de IVA
    $totalBolivaresConIVA = $totalBolivares * 1.16;

    // Inserción de la venta con método de pago
    $insertar = mysqli_query($conexion, "INSERT INTO ventas(id_cliente, total, id_usuario, metodo_pago, tipo_pago) VALUES ($id_cliente, '$totalBolivaresConIVA', $id_user, '$metodo_pago', '$tipo_pago')");
    if (!$insertar) {
        echo json_encode(array('mensaje' => 'error', 'detalle' => 'Error al insertar la venta'));
        die();
    }

    $id_maximo = mysqli_query($conexion, "SELECT MAX(id) AS total FROM ventas");
    if (!$id_maximo) {
        echo json_encode(array('mensaje' => 'error', 'detalle' => 'Error al obtener el ID de la venta'));
        die();
    }
    $resultId = mysqli_fetch_assoc($id_maximo);
    $ultimoId = $resultId['total'];

    // Procesar los detalles de la venta
    $consultaDetalle = mysqli_query($conexion, "SELECT * FROM detalle_temp WHERE id_usuario = $id_user");
    while ($row = mysqli_fetch_assoc($consultaDetalle)) {
        $id_producto = $row['id_producto'];
        $cantidad = $row['cantidad'];
        $desc = $row['descuento'];
        $precio = $row['precio_venta'];
        $total = $row['total'];

        // Multiplicar el precio por 1.16 para agregar el IVA a cada producto
        $precioConIVA = $precio * 1.16;
        $totalConIVA = $total * 1.16;  // Aplicar IVA al total de cada producto

        // Insertar el detalle con el precio y total con IVA
        $insertarDet = mysqli_query($conexion, "INSERT INTO detalle_venta (id_producto, id_venta, cantidad, precio, descuento, total) VALUES ($id_producto, $ultimoId, $cantidad, '$precioConIVA', '$desc', '$totalConIVA')");
        if (!$insertarDet) {
            echo json_encode(array('mensaje' => 'error', 'detalle' => 'Error al insertar el detalle de la venta'));
            die();
        }

        // Actualizar el stock
        $stockActual = mysqli_query($conexion, "SELECT existencia FROM producto WHERE codproducto = $id_producto");
        $stockNuevo = mysqli_fetch_assoc($stockActual);
        $stockTotal = $stockNuevo['existencia'] - $cantidad;

        $stock = mysqli_query($conexion, "UPDATE producto SET existencia = $stockTotal WHERE codproducto = $id_producto");
        if (!$stock) {
            echo json_encode(array('mensaje' => 'error', 'detalle' => 'Error al actualizar el stock'));
            die();
        }
    }

    // Eliminar los detalles temporales de la venta
    $eliminar = mysqli_query($conexion, "DELETE FROM detalle_temp WHERE id_usuario = $id_user");
    if (!$eliminar) {
        echo json_encode(array('mensaje' => 'error', 'detalle' => 'Error al eliminar detalles temporales'));
        die();
    }

    $msg = array('id_cliente' => $id_cliente, 'id_venta' => $ultimoId);
    echo json_encode($msg);
    die();
}

else if (isset($_GET['descuento'])) {
    $id = $_GET['id'];
    $desc = $_GET['desc'];
    $consulta = mysqli_query($conexion, "SELECT * FROM detalle_temp WHERE id = $id");
    $result = mysqli_fetch_assoc($consulta);
    $total_desc = $desc + $result['descuento'];
    $total = $result['total'] - $desc;
    $insertar = mysqli_query($conexion, "UPDATE detalle_temp SET descuento = $total_desc, total = '$total'  WHERE id = $id");
    if ($insertar) {
        $msg = array('mensaje' => 'descontado');
    } else {
        $msg = array('mensaje' => 'error');
    }
    echo json_encode($msg);
    die();
} else if (isset($_GET['editarCliente'])) {
    $idcliente = $_GET['id'];
    $sql = mysqli_query($conexion, "SELECT * FROM cliente WHERE idcliente = $idcliente");
    $data = mysqli_fetch_array($sql);
    echo json_encode($data);
    exit;
} else if (isset($_GET['editarProveedor'])) {
    $idproveedor = $_GET['editarProveedor']; // Asegúrate de usar el índice correcto
    $sql = mysqli_query($conexion, "SELECT * FROM proveedor WHERE idproveedor = $idproveedor");
    $data = mysqli_fetch_assoc($sql); // Usar fetch_assoc para un mejor manejo del array asociativo
    echo json_encode($data);
    exit;
}  
else if (isset($_GET['editarUsuario'])) {
    $idusuario = $_GET['id'];
    $sql = mysqli_query($conexion, "SELECT * FROM usuario WHERE idusuario = $idusuario");
    $data = mysqli_fetch_array($sql);
    echo json_encode($data);
    exit;
} else if (isset($_GET['editarProducto'])) {
    $id = $_GET['id'];
    $sql = mysqli_query($conexion, "SELECT * FROM producto WHERE codproducto = $id");
    $data = mysqli_fetch_array($sql);
    echo json_encode($data);
    exit;
}
if (isset($_POST['regDetalle'])) {
    $id = $_POST['id'];
    $cant = $_POST['cant'];
    $precio = $_POST['precio'];
    $id_user = $_SESSION['idUser'];
    $total = $precio * $cant;
    $verificar = mysqli_query($conexion, "SELECT * FROM detalle_temp WHERE id_producto = $id AND id_usuario = $id_user");
    $result = mysqli_num_rows($verificar);
    $datos = mysqli_fetch_assoc($verificar);
    if ($result > 0) {
        $cantidad = $datos['cantidad'] + $cant;
        $total_precio = ($cantidad * $total);
        $query = mysqli_query($conexion, "UPDATE detalle_temp SET cantidad = $cantidad, total = '$total_precio' WHERE id_producto = $id AND id_usuario = $id_user");
        if ($query) {
            $msg = "actualizado";
        } else {
            $msg = "Error al ingresar";
        }
    } else {
        $query = mysqli_query($conexion, "INSERT INTO detalle_temp(id_usuario, id_producto, cantidad ,precio_venta, total) VALUES ($id_user, $id, $cant,'$precio', '$total')");
        if ($query) {
            $msg = "registrado";
        } else {
            $msg = "Error al ingresar";
        }
    }
    echo json_encode($msg);
    die();
} else if (isset($_POST['cambio'])) {
    if (empty($_POST['actual']) || empty($_POST['nueva'])) {
        $msg = 'Los campos estan vacios';
    } else {
        $id = $_SESSION['idUser'];
        $actual = md5($_POST['actual']);
        $nueva = md5($_POST['nueva']);
        $consulta = mysqli_query($conexion, "SELECT * FROM usuario WHERE clave = '$actual' AND idusuario = $id");
        $result = mysqli_num_rows($consulta);
        if ($result == 1) {
            $query = mysqli_query($conexion, "UPDATE usuario SET clave = '$nueva' WHERE idusuario = $id");
            if ($query) {
                $msg = 'ok';
            } else {
                $msg = 'error';
            }
        } else {
            $msg = 'dif';
        }
    }
    echo $msg;
    die();
}
?>
