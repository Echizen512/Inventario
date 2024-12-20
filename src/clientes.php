<?php
session_start();
include "../conexion.php";
$id_user = $_SESSION['idUser'];
$permiso = "clientes";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);

if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
}
if (!empty($_POST)) {
    $alert = "";
    if (empty($_POST['nombre']) || empty($_POST['telefono']) || empty($_POST['direccion']) || empty($_POST['cedula'])) {
        $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        Todos los campos son obligatorios, excepto el Email
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
    } else {
        $id = $_POST['id'];
        $nombre = $_POST['nombre'];
        $telefono = $_POST['telefono'];
        $direccion = $_POST['direccion'];
        $email = $_POST['email'];
        $cedula = $_POST['cedula'];
        $result = 0;

        if (empty($id)) {
            $query = mysqli_query($conexion, "SELECT * FROM cliente WHERE nombre = '$nombre'");
            $result = mysqli_fetch_array($query);
            if ($result > 0) {
                $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        El cliente ya existe
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            } else {
                $query_insert = mysqli_query($conexion, "INSERT INTO cliente(nombre, telefono, direccion, email, cedula, idUser) values ('$nombre', '$telefono', '$direccion', '$email', '$cedula', '$id_user')");
                if ($query_insert) {
                    $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Cliente registrado
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
                } else {
                    $alert = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Error al registrar
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
                }
            }
        } else {
            $sql_update = mysqli_query($conexion, "UPDATE cliente SET nombre = '$nombre', telefono = '$telefono', direccion = '$direccion', email = '$email', cedula = '$cedula', idUser = '$id_user' WHERE idcliente = $id");
            if ($sql_update) {
                $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Cliente Modificado
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            } else {
                $alert = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Error al modificar
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            }
        }
    }
    mysqli_close($conexion);
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
<div class="card-header text-white text-center" style="background: #FF6F61;">
        Clientes
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <?php echo (isset($alert)) ? $alert : ''; ?>
                <form action="" method="post" autocomplete="off" id="formulario">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="nombre" class="text-dark font-weight-bold">Nombre</label>
                                </div>
                                <input type="text" placeholder="Nombre" name="nombre" id="nombre" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="telefono" class="text-dark font-weight-bold">Teléfono</label>
                                </div>
                                <input type="number" placeholder="Teléfono" name="telefono" id="telefono"
                                    class="form-control">
                                <input type="hidden" name="id" id="id">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="direccion" class="text-dark font-weight-bold">Dirección</label>
                                </div>
                                <input type="text" placeholder="Dirección" name="direccion" id="direccion"
                                    class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="email" class="text-dark font-weight-bold">Email</label>
                                </div>
                                <input type="email" placeholder="Email" name="email" id="email" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="cedula" class="text-dark font-weight-bold">Cédula</label>
                                </div>
                                <input type="text" placeholder="Cédula" name="cedula" id="cedula" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-5 offset-md-2">
                            <div class="d-flex justify-content-end">
                                <input type="submit" value="Registrar" class="btn mr-2" style="background: #148aef"
                                    id="btnAccion">
                                <input type="button" value="Nuevo" class="btn btn-success" id="btnNuevo"
                                    onclick="limpiar()">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="card">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-striped table-bordered" id="tbl">
                <thead style="background: #FF6F61; color: white;">
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Teléfono</th>
                        <th class="text-center">Dirección</th>
                        <th class="text-center">Email</th>
                        <th class="text-center">Cédula</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    include "../conexion.php";
                    $query = mysqli_query($conexion, "SELECT * FROM cliente");
                    $result = mysqli_num_rows($query);
                    if ($result > 0) {
                        while ($data = mysqli_fetch_assoc($query)) { ?>
                            <tr>
                                <td class="text-center"><?php echo $data['idcliente']; ?></td>
                                <td class="text-center"><?php echo $data['nombre']; ?></td>
                                <td class="text-center"><?php echo $data['telefono']; ?></td>
                                <td class="text-center"><?php echo $data['direccion']; ?></td>
                                <td class="text-center"><?php echo $data['email']; ?></td>
                                <td class="text-center"><?php echo $data['cedula']; ?></td>
                                <td class="text-center">
                                    <a href="#" onclick="editarCliente(<?php echo $data['idcliente']; ?>)"
                                        class="btn btn-success"><i class='fas fa-edit'></i></a>
                                    <form action="eliminar_cliente.php?id=<?php echo $data['idcliente']; ?>" method="post"
                                        class="confirmar d-inline">
                                        <button class="btn btn-danger" type="submit"><i class='fas fa-trash-alt'></i> </button>
                                    </form>
                                </td>
                            </tr>
                        <?php }
                    } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
<?php include_once "includes/footer.php"; ?>