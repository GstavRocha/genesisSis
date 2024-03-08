<?php
require_once ('config.php');

header('Content-type: application/json');
function getUsers() {
    require_once ('config.php');

    $method = $_SERVER['REQUEST_METHOD'];
    switch ($method){
        case 'GET':
            try {
                $users = $pdo->query('SELECT nome FROM tb_user');
                $result = $users->fetchAll(PDO::FETCH_ASSOC);
                return $result;
            } catch (PDOException $e) {
                echo "Erro ao executar a consulta: " . $e->getMessage();
                return false;
            }
            break;
        default:
            echo 'deu erro';
            return false;
    }
}

// Exemplo de uso da função
$usersData = getUsers();
if ($usersData !== false) {
    echo json_encode($usersData);
} else {
    echo "Houve um problema ao obter os usuários.";
}
?>