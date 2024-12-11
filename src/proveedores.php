<?php
session_start();
include "../conexion.php";
$id_user = $_SESSION['idUser'];
$permiso = "proveedores";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);

if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
}
if (!empty($_POST)) {
    $alert = "";
    if (empty($_POST['nombre']) || empty($_POST['telefono']) || empty($_POST['direccion']) || empty($_POST['rif'])) {
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
        $rif = $_POST['rif'];
        $result = 0;

        if (empty($id)) {
            $query = mysqli_query($conexion, "SELECT * FROM proveedor WHERE nombre = '$nombre'");
            $result = mysqli_fetch_array($query);
            if ($result > 0) {
                $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        El proveedor ya existe
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            } else {
                $query_insert = mysqli_query($conexion, "INSERT INTO proveedor(nombre, telefono, direccion, email, rif, idUser) values ('$nombre', '$telefono', '$direccion', '$email', '$rif', '$id_user')");
                if ($query_insert) {
                    $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Proveedor registrado
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
            $sql_update = mysqli_query($conexion, "UPDATE proveedor SET nombre = '$nombre', telefono = '$telefono', direccion = '$direccion', email = '$email', rif = '$rif', idUser = '$id_user' WHERE idproveedor = $id");
            if ($sql_update) {
                $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Proveedor Modificado
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
        Proveedores
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
                                    <label for="rif" class="text-dark font-weight-bold">RIF</label>
                                </div>
                                <input type="text" placeholder="RIF" name="rif" id="rif" class="form-control">
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
                    $query = mysqli_query($conexion, "SELECT * FROM proveedor");
                    $result = mysqli_num_rows($query);
                    if ($result > 0) {
                        while ($data = mysqli_fetch_assoc($query)) { ?>
                            <tr>
                                <td class="text-center"><?php echo $data['idproveedor']; ?></td>
                                <td class="text-center"><?php echo $data['nombre']; ?></td>
                                <td class="text-center"><?php echo $data['telefono']; ?></td>
                                <td class="text-center"><?php echo $data['direccion']; ?></td>
                                <td class="text-center"><?php echo $data['email']; ?></td>
                                <td class="text-center"><?php echo $data['rif']; ?></td>
                                <td class="text-center">
                                <a href="#" onclick="editarProveedor(<?php echo $data['idproveedor']; ?>)" class="btn btn-success"><i class='fas fa-edit'></i></a>

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

<script>
function editarProveedor(id) {
    $.ajax({
        url: './ajax.php',
        type: 'GET',
        data: { editarProveedor: id }, // Esto debe coincidir con lo que espera el servidor
        success: function (response) {
            try {
                let data = JSON.parse(response); // Verifica si `response` está en formato JSON
                if (data) {
                    $('#id').val(data.idproveedor);
                    $('#nombre').val(data.nombre);
                    $('#telefono').val(data.telefono);
                    $('#direccion').val(data.direccion);
                    $('#email').val(data.email);
                    $('#rif').val(data.rif);
                    $('#btnAccion').val('Actualizar');
                } else {
                    alert('Datos no encontrados');
                }
            } catch (error) {
                alert('Error al procesar la respuesta.');
                console.error(error);
            }
        },
        error: function () {
            alert('Error al obtener los datos del proveedor.');
        }
    });
}

</script>

<?php include_once "includes/footer.php"; ?>