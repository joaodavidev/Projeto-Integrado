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
    $nome_atividade = $_POST['nome_atividade'];
    $id_cadastro = $_POST['id_cadastro'];
    $num_exercicios = $_POST['num_exercicios'];
    $nome_materia = $_POST['nome_materia'];

    $sql = "CALL sp_update_atividades(?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("siii", $nome_atividade, $id_cadastro, $num_exercicios, $nome_materia);

    if ($stmt->execute()) {
        echo "Atividade atualizada com sucesso!";
    } else {
        echo "Erro ao atualizar atividade: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>