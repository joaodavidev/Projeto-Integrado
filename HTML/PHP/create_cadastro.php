<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "seu_banco_de_dados";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['nome'];
    $data_nasc = $_POST['data_nasc'];
    $sexo = $_POST['sexo'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $sql = "CALL sp_create_cadastro(?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $nome, $data_nasc, $sexo, $email, $senha);

    if ($stmt->execute()) {
        echo "Cadastro inserido com sucesso!";
    } else {
        echo "Erro ao inserir cadastro: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>