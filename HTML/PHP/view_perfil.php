<?php
$servername = "localhost";
$username = "root";
$password = "123";
$dbname = "learnhub";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

$sql = "SELECT * FROM vw_perfis";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID Perfil: " . $row["id_perfil"] . " - Nome: " . $row["nome"] . " - Descrição: " . $row["descricao"] . " - Data de Nascimento: " . $row["data_nasc"] . "<br>";
    }
} else {
    echo "Nenhum perfil encontrado.";
}

$conn->close();
?>