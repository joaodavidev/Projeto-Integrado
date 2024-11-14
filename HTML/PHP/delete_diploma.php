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

    $sql = "CALL sp_delete_diploma(?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $nome_diploma);

    if ($stmt->execute()) {
        echo "Diploma excluído com sucesso!";
    } else {
        echo "Erro ao excluir diploma: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>