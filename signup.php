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

    $user=$_POST['usr'];
    $email=$_POST['email'];
    $pass=md5($_POST['pass']);
    $hash = md5(rand(0,1000));

    // $passHash = password_hash($pass, PASSWORD_BCRYPT);

    $stmt = $conn->prepare("SELECT * FROM users WHERE username = '$user';");
    $stmt -> execute();
    $stmt->setFetchMode(PDO::FETCH_OBJ);

    $stmtp = $conn->prepare("SELECT * FROM users WHERE email = '$email';");
    $stmtp -> execute();
    $stmtp->setFetchMode(PDO::FETCH_OBJ);

    $link = mysqli_connect("db731112263.db.1and1.com", "dbo731112263", "sergio140", "db731112263");


    if($stmt->rowcount()==1 || $stmtp->rowcount()==1){
      echo json_encode('false');
    }else{
      $sql = "INSERT INTO users (username, password, email, hash) VALUES
                  ('$user', '$pass', '$email', '$hash')";

      if(mysqli_query($link, $sql)){};

        // // CORREO DE VERIFICACIÓN

        $to      = $email; // Send email to our user
        $subject = 'Verificación de email'; // Give the email a subject
        $message = '
        Gracias por registrarte!
        Tu cuenta ha sido creada, puedes iniciar sesión con las siguientes crednciales depues de activar tu cuenta pulsado la url de que te mostramos a continuación.

        Username: '.$user.'
        Password: '.$pass.'

        Por favor pulse este link para activar tu cuenta:
        http://jgaray.es/Proyectosergiog/Proyecto/verify.php?email='.$email.'&hash='.$hash.'
        '; // Our message above including the link

        $headers = 'From:bitzone@support.com' . "\r\n"; // Set from headers
        mail($to, $subject, $message, $headers); // Send our email


      echo json_encode('true');
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
