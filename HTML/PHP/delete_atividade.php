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
    $nome_atividade = $_POST['nome_atividade'];

    $sql = "CALL sp_delete_atividades(?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $nome_atividade);

    if ($stmt->execute()) {
        echo "Atividade excluída com sucesso!";
    } else {
        echo "Erro ao excluir atividade: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
