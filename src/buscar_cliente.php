<?php
require("../conexion.php");

if (!empty($_POST['cedula'])) {
    $cedula = $_POST['cedula'];
    $query = mysqli_query($conexion, "SELECT * FROM cliente WHERE cedula = '$cedula'");
    $result = mysqli_fetch_array($query);

    if ($result) {
        echo json_encode($result);
    } else {
        echo 'No existe';
    }
    mysqli_close($conexion);
} else {
    echo 'No existe';
}
?>
