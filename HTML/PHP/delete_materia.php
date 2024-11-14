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

    $sql = "CALL sp_delete_materias(?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id_materia);

    if ($stmt->execute()) {
        echo "Matéria excluída com sucesso!";
    } else {
        echo "Erro ao excluir matéria: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>