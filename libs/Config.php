<?php
/**
 * Clase de configuración Singleton.
 */
class Config {

    private static $instance;
    private $vars = array();

    public static function getInstance() {
        if (!isset(self::$instance)) {
            self::$instance = new Config();
        }
        return self::$instance;
    }

    private function __construct() {
        
    }

    private function __clone() {
        
    }

    //Función para guardar valores
    public function set($name, $value) {
        $this->vars[$name] = $value;
    }

    //Función para leer valores
    public function get($name) {
        return $this->vars[$name];
    }

}

?>
