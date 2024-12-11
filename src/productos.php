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

    // Verificar si se sube una imagen
    $imagePath = null;  // Iniciar con la variable como nula
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $imageTmp = $_FILES['imagen']['tmp_name'];
        $imageName = $_FILES['imagen']['name'];
        $imageType = $_FILES['imagen']['type'];

        // Validar que el archivo es una imagen
        if (in_array($imageType, ['image/jpeg', 'image/png', 'image/gif'])) {
            $imagePath = 'uploads/' . uniqid() . '.' . pathinfo($imageName, PATHINFO_EXTENSION);
            move_uploaded_file($imageTmp, $imagePath);
        } else {
            $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        El archivo no es una imagen válida
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
        }
    }

    if (empty($codigo) || empty($producto) || empty($precio) || $precio < 0 || empty($cantidad) || $cantidad < 0) {
        $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        Todos los campos son obligatorios
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
                        El código ya existe
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
            } else {
                // Insertar nuevo producto
                if ($imagePath) {
                    // Insertar producto con imagen
                    $query_insert = mysqli_query($conexion, "INSERT INTO producto(codigo, descripcion, precio, existencia, idUser, imagen) 
                        VALUES ('$codigo', '$producto', '$precio', '$cantidad', '$id_user', '$imagePath')");
                } else {
                    // Insertar producto sin imagen
                    $query_insert = mysqli_query($conexion, "INSERT INTO producto(codigo, descripcion, precio, existencia, idUser) 
                        VALUES ('$codigo', '$producto', '$precio', '$cantidad', '$id_user')");
                }

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
            // Actualizar producto
            if ($imagePath) {
                // Actualizar producto con imagen
                $query_update = mysqli_query($conexion, "UPDATE producto 
                    SET codigo = '$codigo', descripcion = '$producto', precio = $precio, existencia = $cantidad, idUser = '$id_user', imagen = '$imagePath' 
                    WHERE codproducto = $id");
            } else {
                // Actualizar producto sin imagen
                $query_update = mysqli_query($conexion, "UPDATE producto 
                    SET codigo = '$codigo', descripcion = '$producto', precio = $precio, existencia = $cantidad, idUser = '$id_user' 
                    WHERE codproducto = $id");
            }

            if ($query_update) {
                $alert = '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        Producto modificado
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
    <div class="card-header text-white text-center" style="background: #FF6F61;">
        Productos
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form action="" method="post" enctype="multipart/form-data" autocomplete="off" id="formulario">
                    <?php echo isset($alert) ? $alert : ''; ?>
                    <div class="row">
                        <!-- Código de Barras -->
                        <div class="col-md-3">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="codigo" class="text-dark font-weight-bold">
                                        <i class="fas fa-barcode"></i> Código de Barras
                                    </label>
                                </div>
                                <input type="text" placeholder="Código" name="codigo" id="codigo" class="form-control">
                                <input type="hidden" id="id" name="id">
                            </div>
                        </div>

                        <!-- Producto -->
                        <div class="col-md-5">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="producto" class="text-dark font-weight-bold">Producto</label>
                                </div>
                                <input type="text" placeholder="Producto" name="producto" id="producto"
                                    class="form-control">
                            </div>
                        </div>

                        <!-- Precio -->
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="precio" class="text-dark font-weight-bold">Precio</label>
                                </div>
                                <input type="text" placeholder="Precio" class="form-control" name="precio" id="precio">
                            </div>
                        </div>

                        <!-- Cantidad -->
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="text-center">
                                    <label for="cantidad" class="text-dark font-weight-bold">Cantidad</label>
                                </div>
                                <input type="number" placeholder="Cantidad" class="form-control" name="cantidad"
                                    id="cantidad">
                            </div>
                        </div>

                        <!-- Imagen del Producto -->
                        <div class="col-md-5 offset">
                            <div class="form-group">
                                <div class="text-left">
                                    <label for="imagen" class="text-dark font-weight-bold">Imagen del Producto</label>
                                </div>
                                <input type="file" class="form-control" name="imagen" id="imagen">
                            </div>
                        </div>

                        <!-- Botones de Acción -->
                        <div class="col-md-5 offset-md-3">
                            <div class="d-flex justify-content-end">
                                <input type="submit" value="Registrar" class="btn mr-2" style="background: #148aef"
                                    id="btnAccion">
                                <input type="button" value="Nuevo" onclick="limpiar()" class="btn btn-success"
                                    id="btnNuevo">
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
                <thead style="background: #FF6F61; color: white;">
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Código</th>
                        <th class="text-center">Producto</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Stock</th>
                        <th>Imagen</th>
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
                                    <img src="<?php echo $data['imagen'] ? $data['imagen'] : 'default.jpg'; ?>" width="50"
                                        height="50" />
                                </td>

                                <td class="text-center">
                                    <a href="#" onclick="editarProducto(<?php echo $data['codproducto']; ?>)"
                                        class="btn btn-success">
                                        <i class='fas fa-edit'></i>
                                    </a>
                                    <form action="eliminar_producto.php?id=<?php echo $data['codproducto']; ?>" method="post"
                                        class="confirmar d-inline">
                                        <button class="btn btn-danger" type="submit"><i class='fas fa-trash-alt'></i></button>
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
<div class="card shadow-lg">
    <div class="card-header text-white text-center" style="background: #FF6F61;">
        Importar Productos por Excel
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form action="importar_excel.php" method="post" enctype="multipart/form-data" id="form-importar">
                    <div class="row">
                        <div class="col-md-6 offset">
                            <div class="form-group">
                                <div>
                                    <label for="archivo_excel" class="text-dark font-weight-bold">Subir archivo
                                        Excel</label>
                                </div>
                                <!-- Input de archivo estilizado -->
                                <div class="custom-file">
                                    <input type="file" name="archivo_excel" id="archivo_excel" class="custom-file-input"
                                        accept=".xlsx, .xls" required>
                                    <label class="custom-file-label" for="archivo_excel">Seleccionar archivo...</label>
                                </div>
                                <!-- Elemento para mostrar el nombre del archivo seleccionado -->
                                <small id="file-name" class="form-text text-muted"></small>
                            </div>
                        </div>
                        <div class="col-md-12 text-center">
                            <!-- Botón con icono -->
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-upload"></i> Importar Excel
                            </button>
                            <button class="btn btn-primary" onclick="generarReporte()">
                                <i class='fas fa-file-excel'></i> Exportar Excel
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Script para cambiar el nombre del archivo seleccionado -->
<script>
    document.getElementById('archivo_excel').addEventListener('change', function () {
        var fileName = this.files[0] ? this.files[0].name : '';
        document.getElementById('file-name').textContent = fileName ? 'Archivo seleccionado: ' + fileName : '';
        // Actualiza la etiqueta del input de archivo
        var label = document.querySelector('.custom-file-label');
        label.textContent = fileName ? fileName : 'Seleccionar archivo...';
    });
</script>

</div>






<script>
    function verDetalles(idProducto) {
        alert('Mostrar detalles del producto con ID: ' + idProducto);
        // Implementa lógica adicional aquí, como una llamada AJAX para obtener más detalles.
    }

    function generarReporte() {
        // Crea un archivo PHP que genere el Excel y redirígete a él.
        window.location.href = "generar_reporte.php";
    }

</script>

<?php include_once "includes/footer.php"; ?>