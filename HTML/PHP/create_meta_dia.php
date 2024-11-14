<?php
$servername = "localhost";
$username = "root";
$password = "123";
$dbname = "learnhub";

// Cria conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_meta_dia = $_POST['id_meta_dia'];
    $id_cadastro = $_POST['id_cadastro'];
    $meta = $_POST['meta'];
    $data_meta = $_POST['data_meta'];

    $sql = "CALL sp_create_meta_dia(?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iiis", $id_meta_dia, $id_cadastro, $meta, $data_meta);

    if ($stmt->execute()) {
        echo "Meta do dia inserida com sucesso!";
    } else {
        echo "Erro ao inserir meta do dia: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>