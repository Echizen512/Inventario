<?php
session_start();
require_once "../conexion.php";
$id_user = $_SESSION['idUser'];
$permiso = "configuracion";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);
if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
}
$query = mysqli_query($conexion, "SELECT * FROM configuracion");
$data = mysqli_fetch_assoc($query);
if ($_POST) {
    $alert = '';
    if (empty($_POST['nombre']) || empty($_POST['telefono']) || empty($_POST['email']) || empty($_POST['direccion']) || empty($_POST['rif'])) {
        $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                    Todos los campos son obligatorios
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>';
    } else {
        $nombre = $_POST['nombre'];
        $telefono = $_POST['telefono'];
        $email = $_POST['email'];
        $direccion = $_POST['direccion'];
        $rif = $_POST['rif'];
        $id = $_POST['id'];
        $update = mysqli_query($conexion, "UPDATE configuracion SET nombre = '$nombre', telefono = '$telefono', email = '$email', direccion = '$direccion', rif = '$rif', idUser = '$id_user' WHERE id = $id");
        if ($update) {
            $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Datos Actualizados
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            echo '<meta http-equiv="refresh" content="3;url=config.php">';
        }
    }    
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

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Katha Collection</title>
</head>

<body>

    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-header card-header-primary text-center" style="background: #FF6F61;">
                    <h4 class="card-title">Datos de la Empresa</h4>
                </div>
                <div class="card-body">
                    <?php echo isset($alert) ? $alert : ''; ?>
                    <form action="" method="post" class="p-3">
                        <div class="form-group">
                            <label>Nombre:</label>
                            <input type="hidden" name="id" value="<?php echo $data['id'] ?>">
                            <input type="text" name="nombre" class="form-control" value="<?php echo $data['nombre']; ?>"
                                id="txtNombre" placeholder="Nombre de la Empresa" required class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Teléfono:</label>
                            <input type="number" name="telefono" class="form-control"
                                value="<?php echo $data['telefono']; ?>" id="txtTelEmpresa"
                                placeholder="Teléfono de la Empresa" required>
                        </div>
                        <div class="form-group">
                            <label>Correo Electrónico:</label>
                            <input type="email" name="email" class="form-control" value="<?php echo $data['email']; ?>"
                                id="txtEmailEmpresa" placeholder="Correo de la Empresa" required>
                        </div>
                        <div class="form-group">
                            <label>Dirección:</label>
                            <input type="text" name="direccion" class="form-control"
                                value="<?php echo $data['direccion']; ?>" id="txtDirEmpresa"
                                placeholder="Dirección de la Empresa" required>
                        </div>
                        <div class="form-group">
                            <label>RIF:</label>
                            <input type="text" name="rif" class="form-control"
                                value="<?php echo isset($data['rif']) ? $data['rif'] : ''; ?>" id="txtRifEmpresa"
                                placeholder="RIF de la Empresa" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" style="background: #FF6F61;"><i
                                    class="fas fa-save"></i> Modificar Datos</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>

</html>

<?php include_once "includes/footer.php"; ?>