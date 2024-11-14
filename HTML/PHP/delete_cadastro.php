<?php
$servername = "localhost";
$username = "root";
$password = "123";
$dbname = "learnhub";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_cadastro = $_POST['id_cadastro'];

    $sql = "CALL sp_delete_cadastro(?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_cadastro);

    if ($stmt->execute()) {
        echo "Cadastro excluído com sucesso!";
    } else {
        echo "Erro ao excluir cadastro: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>