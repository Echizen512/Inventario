<?php
session_start();
require_once "../conexion.php";
$id_user = $_SESSION['idUser'];

// Verificar permisos
$permiso = "pagos";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);
if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
}

// Consultar pagos
$query = mysqli_query($conexion, "SELECT * FROM pagos");
$pagos = mysqli_fetch_all($query, MYSQLI_ASSOC);

// Procesar formulario
if ($_POST) {
    $alert = '';
    if (empty($_POST['descripcion']) || empty($_POST['monto']) || empty($_POST['metodo_pago']) || empty($_POST['observaciones'])) {
        $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                    Todos los campos son obligatorios
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>';
    } else {
        $descripcion = $_POST['descripcion'];
        $monto = $_POST['monto'];
        $metodo_pago = $_POST['metodo_pago'];
        $observaciones = $_POST['observaciones'];
        $id = isset($_POST['id']) ? $_POST['id'] : null;

        if ($id) {
            // Actualizar pago existente
            $update = mysqli_query($conexion, "UPDATE pagos SET descripcion = '$descripcion', monto = '$monto', metodo_pago = '$metodo_pago', observaciones = '$observaciones', usuario_id = '$id_user' WHERE pago_id = $id");
            $alert = $update
                ? '<div class="alert alert-success alert-dismissible fade show" role="alert">Pago actualizado</div>'
                : '<div class="alert alert-danger alert-dismissible fade show" role="alert">Error al actualizar el pago</div>';
        } else {
            // Insertar nuevo pago
            $insert = mysqli_query($conexion, "INSERT INTO pagos(descripcion, monto, metodo_pago, observaciones, usuario_id) VALUES ('$descripcion', '$monto', '$metodo_pago', '$observaciones', '$id_user')");
            $alert = $insert
                ? '<div class="alert alert-success alert-dismissible fade show" role="alert">Pago registrado</div>'
                : '<div class="alert alert-danger alert-dismissible fade show" role="alert">Error al registrar el pago</div>';
        }
    }
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Pagos</title>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.js"></script>

</head>

<?php include_once "includes/header.php"; ?>

<style>
    body {
        background-image: url('../background.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
</style>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-header text-center" style="background: #FF6F61;">
                        <h4 class="card-title text-white"><i class="fas fa-list"></i> Gestión de Prestamos/Pagos
                            Pendientes</h4>
                    </div>
                    <div class="card-body">
                        <?php echo isset($alert) ? $alert : ''; ?>
                        <form id="formPago" action="" method="post" class="p-3">
                            <input type="hidden" name="id" id="idPago" value="">
                            <div class="form-group">
                                <label>Descripción:</label>
                                <input type="text" name="descripcion" id="descripcion" class="form-control"
                                    placeholder="Descripción del pago" required>
                            </div>
                            <div class="form-group">
                                <label>Monto:</label>
                                <input type="number" name="monto" id="monto" class="form-control"
                                    placeholder="Monto del pago" required>
                            </div>
                            <div class="form-group">
                                <label>Método de Pago:</label>
                                <select name="metodo_pago" id="metodo_pago" class="form-control" required>
                                    <option value="">Seleccionar Método</option>
                                    <option value="1">Efectivo</option>
                                    <option value="2">Punto de Venta</option>
                                    <option value="3">Transferencia Bancaria</option>
                                    <option value="4">Divisas</option>
                                    <option value="5">Pago Móvil</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Estado:</label>
                                <select name="observaciones" id="observaciones" class="form-control" required>
                                    <option value="Pendiente">Pendiente</option>
                                    <option value="Pagado">Pagado</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" style="background: #FF6F61;">
                                    <i class="fas fa-save"></i> Guardar
                                </button>
                            </div>
                        </form>

                        <hr>
                        <h5 class="text-center">Lista de Pagos</h5>
                        <table class="table table-striped">
                            <thead class="text-white" style="background: #FF6F61;">
                                <tr>
                                    <th>#</th>
                                    <th>Descripción</th>
                                    <th>Monto</th>
                                    <th>Método de Pago</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($pagos as $index => $pago): ?>
                                    <tr>
                                        <td><?php echo $index + 1; ?></td>
                                        <td><?php echo $pago['descripcion']; ?></td>
                                        <td><?php echo $pago['monto'] . ' $'; ?></td>
                                        <td><?php echo $pago['metodo_pago']; ?></td>
                                        <td><?php echo $pago['observaciones']; ?></td>
                                        <td>
                                            <button class="btn btn-success btn-sm"
                                                onclick="editarPago(<?php echo $pago['pago_id']; ?>, '<?php echo $pago['descripcion']; ?>', '<?php echo $pago['monto']; ?>')">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Función para editar un pago
        function editarPago(id, descripcion, monto) {
            document.getElementById('idPago').value = id;
            document.getElementById('descripcion').value = descripcion;
            document.getElementById('monto').value = monto;
        }

        // Agregar confirmación con SweetAlert2 al enviar el formulario
        document.getElementById('formPago').addEventListener('submit', function (event) {
            event.preventDefault(); // Prevenir envío inmediato

            const descripcion = document.getElementById('descripcion').value;
            const monto = document.getElementById('monto').value;
            const metodo_pago = document.getElementById('metodo_pago').value;
            const observaciones = document.getElementById('observaciones').value;

            if (descripcion && monto && metodo_pago && observaciones) {
                Swal.fire({
                    title: '¿Estás seguro?',
                    text: "¿Deseas guardar este pago?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Sí, guardar',
                    cancelButtonText: 'Cancelar',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Enviar formulario si el usuario confirma
                        document.getElementById('formPago').submit();
                    }
                });
            } else {
                Swal.fire({
                    title: 'Campos incompletos',
                    text: 'Por favor completa todos los campos obligatorios.',
                    icon: 'error'
                });
            }
        });

        // Redirección automática después de 3 segundos si el alerta tiene éxito
        <?php if (isset($alert) && strpos($alert, 'alert-success') !== false): ?>
            setTimeout(function () {
                window.location.href = "prestamos.php"; // Redirigir a la misma página para actualizar
            }, 3000);
        <?php endif; ?>
    </script>
</body>

</html>