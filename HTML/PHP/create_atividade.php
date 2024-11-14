<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "seu_banco_de_dados";

// Cria conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_cadastro = $_POST['id_cadastro'];
    $nome_atividade = $_POST['nome_atividade'];
    $num_exercicios = $_POST['num_exercicios'];
    $nome_materia = $_POST['nome_materia'];

    $sql = "CALL sp_create_atividades(?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isii", $id_cadastro, $nome_atividade, $num_exercicios, $nome_materia);

    if ($stmt->execute()) {
        echo "Atividade inserida com sucesso!";
    } else {
        echo "Erro ao inserir atividade: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>