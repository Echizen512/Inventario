<?php
session_start();
require("../conexion.php");

if (isset($_SESSION['carrito'])) {
    unset($_SESSION['carrito']);
}

if (!isset($_SESSION['carrito'])) {
    $_SESSION['carrito'] = [];
}

$id_user = $_SESSION['idUser'];
$permiso = "nueva_venta";
$sql = mysqli_query($conexion, "SELECT p.*, d.* FROM permisos p INNER JOIN detalle_permisos d ON p.id = d.id_permiso WHERE d.id_usuario = $id_user AND p.nombre = '$permiso'");
$existe = mysqli_fetch_all($sql);
if (empty($existe) && $id_user != 1) {
    header('Location: permisos.php');
}
include_once "includes/header.php";

$url = "https://ve.dolarapi.com/v1/dolares/oficial";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Content-Type: application/json"
]);

$response = curl_exec($ch);
curl_close($ch);

$precioDolar = 0;
if ($response !== false) {
    $data = json_decode($response, true);
    if ($data !== null && isset($data['promedio'])) {
        $precioDolar = $data['promedio'];
    }
}



?>



<script>
    const precioDolar = <?php echo $precioDolar; ?>;
    function calcularPrecioEnBolivares() {
        const totalPagarElement = document.getElementById('total_pagar');
        const totalPagar = parseFloat(totalPagarElement.textContent) || 0;
        const iva = totalPagar * 0.16; // Calcula el IVA
        const totalConIva = totalPagar + iva; // Agrega el IVA al total
        const totalBolivares = totalConIva * precioDolar;
        document.getElementById('total_bolivares').textContent = totalBolivares.toFixed(2) + " Bs";
        document.getElementById('total_bolivares_input').value = totalBolivares.toFixed(2);
        document.getElementById('iva').textContent = iva.toFixed(2);
        document.getElementById('total_pagar_con_iva').textContent = totalConIva.toFixed(2);
    }

    document.addEventListener("DOMContentLoaded", function () {
        calcularPrecioEnBolivares();
        const observer = new MutationObserver(calcularPrecioEnBolivares);
        const totalPagarElement = document.getElementById('total_pagar');
        observer.observe(totalPagarElement, { childList: true, subtree: true });
    });


    function calcularVuelto() {
        const montoRecibido = parseFloat(document.getElementById('monto_recibido').value) || 0;
        const totalPagarConIva = parseFloat(document.getElementById('total_pagar_con_iva').textContent) || 0;
        const vuelto = montoRecibido - totalPagarConIva;

        document.getElementById('vuelto').value = vuelto.toFixed(2);
    }

    function calcularVueltoEnBolivares() {
        const montoRecibido = parseFloat(document.getElementById('monto_recibido2').value) || 0;
        const totalBolivares = parseFloat(document.getElementById('total_bolivares_input').value) || 0;
        const vueltoBolivares = montoRecibido - totalBolivares;

        document.getElementById('vuelto_bolivares').value = vueltoBolivares.toFixed(2) + " Bs";
    }

    function generarVenta() {
        var id_cliente = document.getElementById('idcliente').value;
        var id_user = <?php echo $_SESSION['idUser']; ?>;
        var totalBolivares = document.getElementById('total_bolivares_input').value;
        var metodoPago = document.getElementById('metodo_pago').value;
        var tipoPago = document.getElementById('tipo_pago').value;

        if (!metodoPago || !tipoPago) {
            alert('Seleccione un método y tipo de pago.');
            return;
        }

        $.ajax({
            url: 'procesar_venta.php',
            type: 'POST',
            data: {
                id_cliente: id_cliente,
                id_user: id_user,
                total_bolivares: totalBolivares,
                metodo_pago: metodoPago,
                tipo_pago: tipoPago,
            },
            success: function (response) {
                var data = JSON.parse(response);
                if (data.mensaje === 'ok') {
                    alert('Venta generada con éxito');
                    document.getElementById('detalle_venta').innerHTML = '';
                    calcularPrecioEnBolivares();
                } else {
                    alert('Error al generar la venta: ' + data.detalle);
                }
            },
            error: function (xhr, status, error) {
                alert('Error al procesar la solicitud: ' + error);
            }
        });
    }

    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById('detalle_venta').innerHTML = '';
    });

</script>


<style>
    body {
        background-image: url('../background.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
</style>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header text-white text-center" style="background: #FF6F61;">
                Datos del Cliente
            </div>
            <div class="card-body">
                <form method="post" id="formCliente">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="hidden" id="idcliente" name="idcliente">
                                <div class="text-center">
                                    <label>Cédula</label>
                                </div>
                                <input type="text" name="ced_cliente" id="ced_cliente" class="form-control"
                                    placeholder="Ingrese cédula del cliente" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="text-center">
                                    <label>Nombre</label>
                                </div>
                                <input type="text" name="nom_cliente" id="nom_cliente" class="form-control"
                                    placeholder="Nombre del cliente" readonly>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="text-center">
                                    <label>Teléfono</label>
                                </div>
                                <input type="number" name="tel_cliente" id="tel_cliente" class="form-control"
                                    placeholder="Teléfono" readonly>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="text-center">
                                    <label>Dirección</label>
                                </div>
                                <input type="text" name="dir_cliente" id="dir_cliente" class="form-control"
                                    placeholder="Dirección" readonly>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="text-center">
                                    <label>Email</label>
                                </div>
                                <input type="email" name="email_cliente" id="email_cliente" class="form-control"
                                    placeholder="Email" readonly>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <button type="button" class="btn btn-primary mt-2" style="background: #148aef"
                                onclick="buscarCliente()">
                                <i class="fa fa-search"></i> Buscar Cliente
                            </button>
                            <button type="button" id="btnNuevoCliente" class="btn btn-success mt-2"
                                style="display:none;" onclick="window.location.href='clientes.php'">
                                <i class="fa fa-user-plus"></i> Nuevo Cliente
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="card">
            <div class="card-header text-white text-center" style="background: #FF6F61;">
                Método de Pago
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="metodo_pago">Método de Pago</label>
                    <select name="metodo_pago" id="metodo_pago" class="form-control" required>
                        <option value="" disabled selected>Seleccionar Método de Pago</option>
                        <option value="1">Efectivo</option>
                        <option value="2">Punto de Venta</option>
                        <option value="3">Transferencia Bancaria</option>
                        <option value="4">Divisas</option>
                        <option value="5">Pago Móvil</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="tipo_pago">Tipo de Pago</label>
                    <select name="tipo_pago" id="tipo_pago" class="form-control" required>
                        <option value="" disabled selected>Seleccionar Tipo de Pago</option>
                        <option value="1">Contado</option>
                        <option value="2">Crédito</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header text-white text-center" style="background: #FF6F61;">
                Buscar Productos
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="form-group">
                            <div class="text-center">
                                <label for="producto">Código o Nombre</label>
                            </div>
                            <input id="producto" class="form-control" type="text" name="producto"
                                placeholder="Ingresa el código o nombre">
                            <input id="id" type="hidden" name="id">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <div class="text-center">
                                <label for="cantidad">Cantidad</label>
                            </div>
                            <input id="cantidad" class="form-control" type="text" name="cantidad" placeholder="Cantidad"
                                onkeyup="calcularPrecio(event)">
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <div class="text-center">
                                <label for="precio">Precio</label>
                            </div>
                            <input id="precio" class="form-control" type="text" name="precio" placeholder="Precio"
                                disabled>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <div class="text-center">
                                <label for="sub_total">Sub Total</label>
                            </div>
                            <input id="sub_total" class="form-control" type="text" name="sub_total"
                                placeholder="Sub Total" disabled>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="table-responsive">
                <table class="table table-hover" id="tblDetalle">
                    <thead style="background: #FF6F61; color: white;">
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Descripción</th>
                            <th class="text-center">Cantidad</th>
                            <th class="text-center">Aplicar</th>
                            <th class="text-center">Desc</th>
                            <th class="text-center">Precio</th>
                            <th class="text-center">Precio Total</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="detalle_venta">
                    </tbody>
                    <tfoot>
                        <tr class="font-weight-bold text-right">
                            <td>Total a Pagar</td>
                            <td id="total_pagar"></td>
                        </tr>
                        <tr class="font-weight-bold text-right">
                            <td>IVA (16%)</td>
                            <td id="iva"></td>
                        </tr>
                        <tr class="font-weight-bold text-right">
                            <td>Total con IVA</td>
                            <td id="total_pagar_con_iva"></td>
                        </tr>
                        <input type="hidden" id="total_bolivares_input" name="total_bolivares">
                        <tr class="font-weight-bold text-right">
                            <td>Total en Bolívares</td>
                            <td id="total_bolivares"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
</div>

<div class="col-md-12 mt-4">
    <div class="card">
        <div class="card-header text-white text-center" style="background: #FF6F61;">
            Calculadora Administrativa (Divisas)
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4 text-center">
                    <div class="form-group">
                        <label for="monto_recibido">Monto Recibido</label>
                        <input type="number" id="monto_recibido" class="form-control"
                            placeholder="Ingrese el monto recibido" oninput="calcularVuelto()">
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="form-group">
                        <label for="vuelto">Cambio</label>
                        <input type="text" id="vuelto" class="form-control" placeholder="Cambio" readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-md-12 mt-4">
    <div class="card">
        <div class="card-header text-white text-center" style="background: #FF6F61;">
            Calculadora Administrativa (Divisas)
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4 text-center">
                    <div class="form-group">
                        <label for="monto_recibido">Monto Recibido en Bolívares</label>
                        <input type="number" id="monto_recibido2" class="form-control" placeholder="Monto recibido"
                            oninput="calcularVueltoEnBolivares()">
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="form-group">
                        <label for="vuelto_bolivares">Vuelto en Bolívares</label>
                        <input type="text" id="vuelto_bolivares" class="form-control" placeholder="Vuelto en Bolívares"
                            readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-md-5 offset-md-2">
    <div class="d-flex justify-content-end">
        <a href="#" class="btn" style="background: #FF6F61;" id="btn_generar" onclick="generarVenta()"><i
                class="fas fa-save"></i> Generar Venta</a>
    </div>

    <script>
        function buscarCliente() {
            var cedula = document.getElementById('ced_cliente').value;
            if (cedula) {
                $.ajax({
                    url: 'buscar_cliente.php',
                    type: 'POST',
                    data: { cedula: cedula },
                    success: function (response) {
                        if (response != 'No existe') {
                            var data = JSON.parse(response);
                            document.getElementById('idcliente').value = data.idcliente;
                            document.getElementById('nom_cliente').value = data.nombre;
                            document.getElementById('tel_cliente').value = data.telefono;
                            document.getElementById('dir_cliente').value = data.direccion;
                            document.getElementById('email_cliente').value = data.email;
                            document.getElementById('btnNuevoCliente').style.display = 'none';
                        } else {
                            document.getElementById('nom_cliente').value = '';
                            document.getElementById('tel_cliente').value = '';
                            document.getElementById('dir_cliente').value = '';
                            document.getElementById('email_cliente').value = '';
                            document.getElementById('btnNuevoCliente').style.display = 'block';
                        }
                    }
                });
            }
        }
    </script>

    <?php include_once "includes/footer.php"; ?>