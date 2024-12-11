<?php
require '../vendor/autoload.php'; // PhpSpreadsheet

use PhpOffice\PhpSpreadsheet\IOFactory;

include "../conexion.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_FILES['archivo_excel']) && $_FILES['archivo_excel']['error'] === UPLOAD_ERR_OK) {
        $archivoTmp = $_FILES['archivo_excel']['tmp_name'];

        try {
            // Cargar archivo Excel
            $spreadsheet = IOFactory::load($archivoTmp);
            $sheet = $spreadsheet->getActiveSheet();
            $rows = $sheet->toArray();

            // Iterar sobre las filas (empezando en la segunda fila para ignorar el encabezado)
            foreach ($rows as $index => $row) {
                if ($index === 0) continue; // Saltar la fila de encabezado

                $id = $row[0]; // Columna A: ID
                $codigo = $row[1]; // Columna B: Código
                $producto = $row[2]; // Columna C: Producto
                $precio = $row[3]; // Columna D: Precio
                $cantidad = $row[4]; // Columna E: Stock

                // Verificar si el producto ya existe por su código
                $query = mysqli_query($conexion, "SELECT codproducto FROM producto WHERE codigo = '$codigo'");
                $exists = mysqli_fetch_assoc($query);

                if ($exists) {
                    // Actualizar producto existente
                    $query_update = mysqli_query($conexion, "
                        UPDATE producto 
                        SET descripcion = '$producto', precio = $precio, existencia = $cantidad 
                        WHERE codigo = '$codigo'
                    ");
                } else {
                    // Insertar nuevo producto
                    $query_insert = mysqli_query($conexion, "
                        INSERT INTO producto (codigo, descripcion, precio, existencia) 
                        VALUES ('$codigo', '$producto', $precio, $cantidad)
                    ");
                }
            }

            // Redirigir a productos.php después de procesar el archivo Excel
            header("Location: productos.php");
            exit(); // Importante para detener la ejecución del script después de la redirección

        } catch (Exception $e) {
            // Si ocurre un error, puedes redirigir a productos.php con un parámetro de error si lo deseas
            header("Location: productos.php?error=" . urlencode($e->getMessage()));
            exit();
        }
    } else {
        // Si no se sube un archivo válido, también se puede redirigir
        header("Location: productos.php?error=Por%20favor,%20sube%20un%20archivo%20válido.");
        exit();
    }
} else {
    header("Location: productos.php?error=Método%20no%20permitido.");
    exit();
}
?>
