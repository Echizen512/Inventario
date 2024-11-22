<?php
session_start();
if (!empty($_SESSION['active'])) {
    header('location: src/');
} else {
    if (!empty($_POST)) {
        $alert = '';
        if (empty($_POST['usuario']) || empty($_POST['clave'])) {
            $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
                        Ingrese usuario y contraseña
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
        } else {
            require_once "conexion.php";
            $user = mysqli_real_escape_string($conexion, $_POST['usuario']);
            $clave = md5(mysqli_real_escape_string($conexion, $_POST['clave']));
            $query = mysqli_query($conexion, "SELECT * FROM usuario WHERE usuario = '$user' AND clave = '$clave'");
            mysqli_close($conexion);
            $resultado = mysqli_num_rows($query);
            if ($resultado > 0) {
                $dato = mysqli_fetch_array($query);
                $_SESSION['active'] = true;
                $_SESSION['idUser'] = $dato['idusuario'];
                $_SESSION['nombre'] = $dato['nombre'];
                $_SESSION['user'] = $dato['usuario'];
                header('Location: src/');
            } else {
                $alert = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Contraseña incorrecta
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>';
                session_destroy();
            }
        }
    }
}
?>
<!doctype html>
<html lang="en">
<head>
  <title>Katha Collection - Iniciar Sesión</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./assets/css/style.css">
</head>

<style>
body {
  background-image: url('./background.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
}
</style>

<body>
  <div class="section">
    <div class="container">
      <div class="row full-height justify-content-center">
        <div class="col-12 text-center align-self-center py-5">
          <div class="section pb-5 pt-5 pt-sm-2 text-center">
            <h4 class="mb-4 pb-3">Inicio de Sesión</h4>
            <?php echo (isset($alert)) ? $alert : ''; ?>
            <div class="card-3d-wrap mx-auto">
              <div class="card-3d-wrapper">
                <div class="card-front">
                  <div class="center-wrap">
                    <div class="section text-center">
                      <form method="post" action="" class="clearfix">
                        <div class="text-left">
                          <label>Nombre de Usuario</label>
                        </div>
                        <div class="form-group">
                          <input type="text" class="form-style" name="usuario" placeholder="Usuario" required>
                          <i class="input-icon uil uil-user"></i>
                        </div>
                        <br>
                        <div class="text-left">
                          <label>Contraseña</label>
                        </div>
                        <div class="form-group password-container">
                          <input type="password" class="form-style" name="clave" placeholder="Contraseña" required>
                          <i class="input-icon uil uil-lock-alt"></i>
                        </div>
                        <div class="text-center mt-3">
                          <button type="submit" class="btn mt-4">Ingresar</button>
                        </div>
                      </form>
                      <p class="mb-0 mt-4 text-center"><a href="" class="link">¿Olvidaste tu Contraseña?</a></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <input type="checkbox" id="toggle" onclick="changeMode();" style="display: none;">
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    var rootProp = document.documentElement.style;
    var mode = true;

    function changeMode() {
        if (mode) {
            darkMode();
        } else {
            lightMode();
        }
        mode = !mode;
    }

    function lightMode() {
        rootProp.setProperty("--background1", "rgba(230, 230, 230)");
        rootProp.setProperty("--shadow1", "rgba(119, 119, 119, 0.5)");
        rootProp.setProperty("--shadow2", "rgba(255, 255, 255, 0.85)");
        rootProp.setProperty("--labelColor", "black");
    }

    function darkMode() {
        rootProp.setProperty("--background1", "rgb(9 25 33)");
        rootProp.setProperty("--shadow1", "rgb(0 0 0 / 45%)");
        rootProp.setProperty("--shadow2", "rgb(255 255 255 / 12%)");
        rootProp.setProperty("--labelColor", "rgb(255 255 255 / 59%)");
    }
  </script>
</body>
</html>
