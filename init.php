<?php

require_once $_SERVER["DOCUMENT_ROOT"]. "dbdate.php";

class DbConnect{
    private $username = dbuse;
    private $host = dbhost;
    private $database = dbname;
    private $password = dbpass;
    private $port = dbport;
    private $conn;
    public function __construct(){
        $this->conn = this->connect();
    }
    public function connect()
    {
        $conn = new mysqli($this->host, $this->username, $this->password, $this->database, $this->port);
        if($conn->connect_error){
            die("conexão falhou". $conn->connect_error);
        }
        return $conn;
    }
    public function getConnection(){
        return $this->conn;
    }

}
$teste = new DbConnect();
