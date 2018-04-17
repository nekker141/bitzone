<?php

try{
  require_once 'cfg.php';
  require_once 'libs/ErrorHandler.php';
  require_once 'libs/DB.php';
  require_once 'libs/jwt_helper.php';

  $method = $_SERVER['REQUEST_METHOD'];

  switch($method){
    case 'POST':

    $conn = DB::getDbConn();

    $email=$_POST['email'];


    $stmt = $conn->prepare("SELECT email FROM users WHERE email='$email'");
    $stmt -> execute();
    $stmt->setFetchMode(PDO::FETCH_OBJ);



    if($stmt->rowcount()==1){

      $link = mysqli_connect("db731112263.db.1and1.com", "dbo731112263", "sergio140", "db731112263");
      $random = rand();

      $sql = "UPDATE users SET recu_password = '$random' WHERE email = '$email'";

      if(mysqli_query($link, $sql)){};

      // // CORREO DE VERIFICACIÓN

      $to      = $email; // Send email to our user
      $subject = 'Cambio de conraseña'; // Give the email a subject
      $message = '

      Para cambiar su contraseña por favor pulsa el siguiente enlace:
      http://jgaray.es/Proyectosergiog/Proyecto/cambiopass2.php?email='.$email.'&hash='.$random.'
      '; // Our message above including the link

      $headers = 'From:bitzone@support.com' . "\r\n"; // Set from headers
      mail($to, $subject, $message, $headers); // Send our email

      echo json_encode('true');
    }else{
      echo json_encode('false');
    }


    break;

    default:
      //Método no soportado
      http_response_code(405);
      header('Allow: POST');
    break;
  }

} catch (PDOException $e) {
  echo "Error: " . $e->getMessage();
}




// Close connection
mysqli_close($link);

?>
