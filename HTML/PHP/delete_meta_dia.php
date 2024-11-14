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
    $id_meta_dia = $_POST['id_meta_dia'];

    $sql = "CALL sp_delete_meta_dia(?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_meta_dia);

    if ($stmt->execute()) {
        echo "Meta do dia excluída com sucesso!";
    } else {
        echo "Erro ao excluir meta do dia: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>
