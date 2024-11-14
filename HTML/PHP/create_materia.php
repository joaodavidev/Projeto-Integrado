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
    $nome = $_POST['nome'];
    $id_cadastro = $_POST['id_cadastro'];

    $sql = "CALL sp_create_materias(?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $nome, $id_cadastro);

    if ($stmt->execute()) {
        echo "Matéria inserida com sucesso!";
    } else {
        echo "Erro ao inserir matéria: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>