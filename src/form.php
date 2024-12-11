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

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Reporte</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
        background-image: url('../background.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #FF6F61;
            border: none;
        }

        .btn-primary:hover {
            background-color: #e55b50;
        }

        .form-label {
            font-weight: bold;
        }

        h1 {
            color: #FF6F61;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<?php include_once "includes/header.php"; ?>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4">
                    <h1 class="text-center" style="font-size: 24px;"><i class="fas fa-calendar-alt"></i> Generar Reporte Diario</h1>
                    <form method="POST" action="generar.php">
                        <div class="mb-3">
                            <label for="date" class="form-label">Fecha del Reporte:</label>
                            <input type="date" id="date" name="date" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="saldo_inicial" class="form-label">Saldo Inicial del Día:</label>
                            <input type="number" step="0.01" id="saldo_inicial" name="saldo_inicial" class="form-control" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-file-alt"></i> Generar Reporte
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
