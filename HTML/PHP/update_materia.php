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
    $id_materia = $_POST['id_materia'];
    $nome = $_POST['nome'];
    $id_cadastro = $_POST['id_cadastro'];
    $id_professor = $_POST['id_professor'];

    $sql = "CALL sp_update_materias(?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isii", $id_materia, $nome, $id_cadastro, $id_professor);

    if ($stmt->execute()) {
        echo "Matéria atualizada com sucesso!";
    } else {
        echo "Erro ao atualizar matéria: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>