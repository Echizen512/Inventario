<?php
session_start();
include "../conexion.php";
$id_user = $_SESSION['idUser'];
$permiso = "productos";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);
if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
}
if (!empty($_POST)) {
    $alert = "";
    $id = $_POST['id'];
    $codigo = $_POST['codigo'];
    $producto = $_POST['producto'];
    $precio = $_POST['precio'];
    $cantidad = $_POST['cantidad'];
    if (empty($codigo) || empty($producto) || empty($precio) || $precio <  0 || empty($cantidad) || $cantidad <  0) {
        $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        Todo los campos son obligatorios
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
    } else {
        if (empty($id)) {
            $query = mysqli_query($conexion, "SELECT * FROM producto WHERE codigo = '$codigo'");
            $result = mysqli_fetch_array($query);
            if ($result > 0) {
                $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        El codigo ya existe
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            } else {
                $query_insert = mysqli_query($conexion, "INSERT INTO producto(codigo, descripcion, precio, existencia, idUser) VALUES ('$codigo', '$producto', '$precio', '$cantidad', '$id_user')");
                if ($query_insert) {
                    $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Producto registrado
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
                } else {
                    $alert = '<div class="alert alert-danger" role="alert">
                    Error al registrar el producto
                </div>';
                }
            }
        } else {
            $query_update = mysqli_query($conexion, "UPDATE producto SET codigo = '$codigo', descripcion = '$producto', precio= $precio, existencia = $cantidad, idUser = '$id_user' WHERE codproducto = $id");
            if ($query_update) {
                $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Producto Modificado
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            } else {
                $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        Error al modificar
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            }
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

<div class="card shadow-lg">
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form action="" method="post" autocomplete="off" id="formulario">
                    <?php echo isset($alert) ? $alert : ''; ?>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                            <div class="text-center">
                                <label for="codigo" class="text-dark font-weight-bold"><i class="fas fa-barcode"></i> Código de Barras</label>
                            </div>    
                                <input type="text" placeholder="Código" name="codigo" id="codigo" class="form-control">
                                <input type="hidden" id="id" name="id">
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                            <div class="text-center">
                                <label for="producto" class="text-dark font-weight-bold">Producto</label>
                            </div>    
                                <input type="text" placeholder="Producto" name="producto" id="producto" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                            <div class="text-center">
                                <label for="precio" class="text-dark font-weight-bold">Precio</label>
                            </div>   
                                <input type="text" placeholder="Precio" class="form-control" name="precio" id="precio">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="text-center">
                                <label for="cantidad" class="text-dark font-weight-bold">Cantidad</label>
                                </div>
                                <input type="number" placeholder="Cantidad" class="form-control" name="cantidad" id="cantidad">
                            </div>
                        </div>
                        <div class="col-md-5 offset-md-3">
                            <div class="d-flex justify-content-end">
                                <input type="submit" value="Registrar" class="btn mr-2" style="background: #148aef" id="btnAccion">
                                <input type="button" value="Nuevo" onclick="limpiar()" class="btn btn-success" id="btnNuevo">
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
            <table class="table table-bordered" id="tbl" style="background-color: #FFFFFF;">

                    <thead class="thead-dark">
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Código</th>
                            <th class="text-center">Producto</th>
                            <th class="text-center">Precio</th>
                            <th class="text-center">Stock</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include "../conexion.php";

                        $query = mysqli_query($conexion, "SELECT * FROM producto");
                        $result = mysqli_num_rows($query);
                        if ($result > 0) {
                            while ($data = mysqli_fetch_assoc($query)) { ?>
                                <tr>
                                    <td class="text-center"><?php echo $data['codproducto']; ?></td>
                                    <td class="text-center"><?php echo $data['codigo']; ?></td>
                                    <td class="text-center"><?php echo $data['descripcion']; ?></td>
                                    <td class="text-center"><?php echo $data['precio'] . ' $'; ?></td>
                                    <td class="text-center"><?php echo $data['existencia']; ?></td>
                                    <td class="text-center">
                                        <a href="#" onclick="editarProducto(<?php echo $data['codproducto']; ?>)" class="btn btn-success"><i class='fas fa-edit'></i></a>
                                        <form action="eliminar_producto.php?id=<?php echo $data['codproducto']; ?>" method="post" class="confirmar d-inline">
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
