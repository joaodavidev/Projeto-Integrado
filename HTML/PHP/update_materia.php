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
    $id_materia = $_POST['id_materia'];
    $nome = $_POST['nome'];
    $id_cadastro = $_POST['id_cadastro'];


    $sql = "CALL sp_update_materias(?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isi", $id_materia, $nome, $id_cadastro);

    if ($stmt->execute()) {
        echo "Matéria atualizada com sucesso!";
    } else {
        echo "Erro ao atualizar matéria: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>