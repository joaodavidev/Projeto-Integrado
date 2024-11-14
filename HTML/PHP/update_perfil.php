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
    $id_perfil = $_POST['id_perfil'];
    $nome = $_POST['nome'];
    $descricao = $_POST['descricao'];
    $data_nasc = $_POST['data_nasc'];

    $sql = "CALL sp_update_perfil(?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isss", $id_perfil, $nome, $descricao, $data_nasc);

    if ($stmt->execute()) {
        echo "Perfil atualizado com sucesso!";
    } else {
        echo "Erro ao atualizar perfil: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>