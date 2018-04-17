<?php

// Definimos Handler personalizdo de errores
function myErrorHandler($errLevel, $errstr, $errfile, $errline) {

    switch ($errLevel) {
        case E_USER_WARNING:
            echo "<b>Error :</b> [$errLevel] $errstr<br>";
            echo " Error on line $errline in $errfile<br>";
            break;
    }
}

// Configuramos nuetro handler de errores
set_error_handler("myErrorHandler");
?>