<?php
//Init config params

require_once 'libs/Config.php';
require_once 'libs/ConfigKeys.php';

$cfg = Config::getInstance();

//Database
$cfg->set(ConfigKeys::DB_SERVER, 'db731112263.db.1and1.com');
$cfg->set(ConfigKeys::DB_DRIVER, 'mysql');
$cfg->set(ConfigKeys::DB_NAME, 'db731112263');
$cfg->set(ConfigKeys::DB_USER, 'dbo731112263');
$cfg->set(ConfigKeys::DB_PASS, 'sergio140');

// JSON token key
$cfg->set(ConfigKeys::JSON_TOKEN_KEY, 'clave_cifrado_token_servidor_super_secreta');
?>
