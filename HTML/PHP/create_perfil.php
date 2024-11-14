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
    $descricao = $_POST['descricao'];
    $data_nasc = $_POST['data_nasc'];

    $sql = "CALL sp_create_perfil(?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $nome, $descricao, $data_nasc);

    if ($stmt->execute()) {
        echo "Perfil inserido com sucesso!";
    } else {
        echo "Erro ao inserir perfil: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>