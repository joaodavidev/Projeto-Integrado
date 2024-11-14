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
    $id_perfil = $_POST['id_perfil'];

    $sql = "CALL sp_delete_perfil(?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_perfil);

    if ($stmt->execute()) {
        echo "Perfil excluído com sucesso!";
    } else {
        echo "Erro ao excluir perfil: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>