<?php
/**
 * Clase singleton para conexión a base de datos.
 */
require_once 'Config.php';

class DB {

    private static $instance;
    private $conn;

    private function __construct() {
        $cfg = Config::getInstance();

        $dbserver = $cfg->get(ConfigKeys::DB_SERVER);
        $dbdriver = $cfg->get(ConfigKeys::DB_DRIVER);
        $dbname = $cfg->get(ConfigKeys::DB_NAME);
        $dbuser = $cfg->get(ConfigKeys::DB_USER);
        $dbpass = $cfg->get(ConfigKeys::DB_PASS);
        try {
            $this->conn = new PDO("$dbdriver:host=$dbserver;dbname=$dbname;charset=utf8", $dbuser, $dbpass);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            trigger_error($e->getMessage(), E_USER_WARNING);
            die();
        }
    }

    public static function getInstance() {
        if (!isset(self::$instance)) {
            self::$instance = new DB();
        }
        return self::$instance;
    }

    public function getConn() {
        return $this->conn;
    }

    public static function getDbConn() {
        return self::getInstance()->getConn();
    }

}
?>

