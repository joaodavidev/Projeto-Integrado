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

    $sql = "CALL sp_delete_cadastro(?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_cadastro);

    if ($stmt->execute()) {
        echo "Cadastro excluído com sucesso!";
    } else {
        echo "Erro ao excluir cadastro: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>