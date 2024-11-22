<?php
session_start();
include "../conexion.php";

// Verificar permisos
$id_user = $_SESSION['idUser'];
$permiso = "compras";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);
if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
    exit;
}

// Manejo de formulario
$alert = "";
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (empty($_POST['proveedor']) || empty($_POST['concepto']) || empty($_POST['monto']) || empty($_POST['fecha'])) {
        $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                    Todos los campos son obligatorios.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>';
    } else {
        $proveedor = mysqli_real_escape_string($conexion, $_POST['proveedor']);
        $concepto = mysqli_real_escape_string($conexion, $_POST['concepto']);
        $monto = mysqli_real_escape_string($conexion, $_POST['monto']);
        $fecha = mysqli_real_escape_string($conexion, $_POST['fecha']);

        $query_insert = mysqli_query($conexion, "INSERT INTO compras (proveedor_id, concepto, monto, fecha) 
                                                 VALUES ('$proveedor', '$concepto', '$monto', '$fecha')");
        if ($query_insert) {
            $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Compra registrada correctamente.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
        } else {
            $alert = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Error al registrar la compra.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
        }
    }
}
?>

<?php include_once "includes/header.php"; ?>

<style>
    body {
        background-image: url('../background.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
</style>

<div class="card">
    <div class="card-body">
        <?php echo $alert; ?>
        <form action="" method="post" autocomplete="off">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="proveedor">Proveedor</label>
                        <select name="proveedor" id="proveedor" class="form-control">
                            <option value="">Seleccionar Proveedor</option>
                            <?php
                            $query_proveedor = mysqli_query($conexion, "SELECT idproveedor, nombre FROM proveedor");
                            while ($data = mysqli_fetch_assoc($query_proveedor)) {
                                echo "<option value='{$data['idproveedor']}'>{$data['nombre']}</option>";
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="concepto">Concepto</label>
                        <input type="text" name="concepto" id="concepto" class="form-control" placeholder="Concepto de la Compra">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="monto">Monto</label>
                        <input type="number" step="0.01" name="monto" id="monto" class="form-control" placeholder="Monto de la Compra">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="fecha">Fecha</label>
                        <input type="date" name="fecha" id="fecha" class="form-control">
                    </div>
                </div>
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-success">Registrar Compra</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="card">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="tbl">
                <thead class="thead-dark">
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Proveedor</th>
                        <th class="text-center">Concepto</th>
                        <th class="text-center">Monto</th>
                        <th class="text-center">Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = mysqli_query($conexion, "SELECT DISTINCT c.idcompra, p.nombre AS proveedor, c.concepto, c.monto, c.fecha 
                                                      FROM compras c 
                                                      INNER JOIN proveedor p ON c.proveedor_id = p.idproveedor");
                    $rows = mysqli_num_rows($query);

                    if ($rows > 0) {
                        while ($data = mysqli_fetch_assoc($query)) {
                            $formatted_date = date("d/m/Y", strtotime($data['fecha']));
                            echo "<tr>
                                    <td class='text-center'>{$data['idcompra']}</td>
                                    <td class='text-center'>{$data['proveedor']}</td>
                                    <td class='text-center'>{$data['concepto']}</td>
                                    <td class='text-center'>{$data['monto']}</td>
                                    <td class='text-center'>{$formatted_date}</td>
                                  </tr>";
                        }
                    } else {
                        echo "<tr>
                                <td colspan='5' class='text-center'>No hay registros de compras</td>
                              </tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<?php include_once "includes/footer.php"; ?>
