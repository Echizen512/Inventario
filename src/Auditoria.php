<?php
session_start();
require_once "../conexion.php";
$id_user = $_SESSION['idUser'];

// Verificar permisos
$permiso = "auditoria";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);
if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
    exit();
}

// Consulta a la tabla "auditoria"
$query = mysqli_query($conexion, "SELECT * FROM auditoria");

if (!$query) {
    die('Error en la consulta: ' . mysqli_error($conexion));
}

include_once "includes/header.php";
?>

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
        <div class="table-responsive">
            <table class="table table-light" id="tbl">
                <thead style="background: #FF6F61; color: white;">
                    <tr>
                        <th class="text-center">Tabla Afectada</th>
                        <th class="text-center">Acción Realizada</th>
                        <th class="text-center">Registro Afectado ID</th>
                        <th class="text-center">Fecha y Hora</th>
                        <th class="text-center">Usuario ID</th>
                        <th class="text-center">Cambios Realizados</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_assoc($query)) { ?>
                        <tr>
                            <td class="text-center"><?php echo $row['tabla_afectada']; ?></td>
                            <td class="text-center"><?php echo $row['accion_realizada']; ?></td>
                            <td class="text-center"><?php echo $row['registro_afectado_id']; ?></td>
                            <td class="text-center"><?php echo date('d, m, Y H:i:s', strtotime($row['fecha_hora'])); ?></td>
                            <td class="text-center"><?php echo $row['usuario_id']; ?></td>
                            <td class="text-center"><?php echo $row['cambios_realizados']; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php include_once "includes/footer.php"; ?>
