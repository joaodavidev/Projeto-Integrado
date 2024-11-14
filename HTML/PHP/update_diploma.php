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
    $nome_diploma = $_POST['nome_diploma'];
    $id_cadastro = $_POST['id_cadastro'];
    $descricao_diploma = $_POST['descricao_diploma'];
    $data_diploma = $_POST['data_diploma'];

    $sql = "CALL sp_update_diploma(?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iiss", $nome_diploma, $id_cadastro, $descricao_diploma, $data_diploma);

    if ($stmt->execute()) {
        echo "Diploma atualizado com sucesso!";
    } else {
        echo "Erro ao atualizar diploma: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>