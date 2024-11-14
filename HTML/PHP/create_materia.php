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
    $nome = $_POST['nome'];
    $id_cadastro = $_POST['id_cadastro'];
    $id_professor = $_POST['id_professor'];

    $sql = "CALL sp_create_materias(?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sii", $nome, $id_cadastro, $id_professor);

    if ($stmt->execute()) {
        echo "Matéria inserida com sucesso!";
    } else {
        echo "Erro ao inserir matéria: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>