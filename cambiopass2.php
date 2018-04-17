<?php

try{
  require_once 'cfg.php';
  require_once 'libs/ErrorHandler.php';
  require_once 'libs/DB.php';
  require_once 'libs/jwt_helper.php';

  $method = $_SERVER['REQUEST_METHOD'];

  switch($method){
    case 'GET':

    $conn = DB::getDbConn();

    $email=$_GET['email'];
    $random=$_GET['hash'];


    $stmt = $conn->prepare("SELECT * FROM users WHERE recu_password='$random' AND email='$email'");
    $stmt -> execute();
    $stmt->setFetchMode(PDO::FETCH_OBJ);

    $link = mysqli_connect("db731112263.db.1and1.com", "dbo731112263", "sergio140", "db731112263");

    if($stmt->rowcount()==1){?>

      <html>
      <head>
         <meta charset="utf-8">
         <title>Mostrar Ventane Modal de forma Automático</title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
         <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
         <script>
            $(document).ready(function(){
               $("#mostrarmodal").modal("show");

               var xhr = new XMLHttpRequest();

               $("#recupass").submit(function(e){
                 e.preventDefault();
                 var url = "cambiopass2.php";
                 xhr.open("POST",url,true);

                 xhr.onreadystatechange = function(){
                   if(xhr.readyState == 4 && xhr.status == 200){
                     // var respuesta = JSON.parse(xhr.responseText);
                     // console.log(respuesta);
                     // if (respuesta == 'true'){
                     //   alert("hola");
                     // }
                   }
                 }

                 var formulario = document.getElementById('recupass');
                 var objFD = new FormData(formulario);
                 xhr.send(objFD);
               });

            });
          </script>
      </head>
      <body>
         <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3>Recuperar contraseña.</h3>
                 </div>
                 <div class="modal-body">
                    <form class="" action="index.html" method="post" id="recupass">
                      <div class="form-group">
                        <input type="password" class="form-control" id="psw2" placeholder="Introduzca su nueva contraseña" name="pass">
                      </div>
                      <div class="form-group">
                        <input type="password" class="form-control" id="cpsw2" placeholder="Confirma la contraseña">
                      </div>
                      <div class="modal-footer">
                     <button type="submit" class="btn btn-default btn-warning btn-block">Enviar</button><br>
                      </div>
                    </form>
                  </div>
            </div>
         </div>
      </div>
      </body>
      </html>


<? }else{
      echo $random;
    }


    break;

    default:
      //Método no soportado
      http_response_code(405);
      header('Allow: GET');
    break;
  }

} catch (PDOException $e) {
  echo "Error: " . $e->getMessage();
}
