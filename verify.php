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
     $hash=$_GET['hash'];


     $stmt = $conn->prepare("SELECT email, hash FROM users WHERE email='$email' AND hash='$hash' AND activa=0");
     $stmt -> execute();
     $stmt->setFetchMode(PDO::FETCH_OBJ);

     $link = mysqli_connect("db731112263.db.1and1.com", "dbo731112263", "sergio140", "db731112263");

     if($stmt->rowcount()==1){

       $sql = "UPDATE users SET activa = 1 WHERE email='$email' AND hash='$hash' AND activa=0";

       if(mysqli_query($link, $sql)){};

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




 // Close connection
 mysqli_close($link);

 ?>

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
          setTimeout(function(){ window.location.href = "bitzone/principal.html"; }, 3000);
       });
     </script>
 </head>
 <body>
    <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
       <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h3>Tu cuenta se ha activado corretamente.</h3>
            </div>
            <div class="modal-body">
               <h4>Gracias por registrarte en nuestra web!. En unos segundos le redirigiremos automaticamente.</h4>
        </div>
            <div class="modal-footer">
           <a href="#" data-dismiss="modal" class="btn btn-danger">Cerrar</a>
            </div>
       </div>
    </div>
 </div>
 </body>
 </html>
