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

$sql = "SELECT * FROM vw_materias";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID Matéria: " . $row["id_materia"] . " - Nome: " . $row["nome"] . " - ID Cadastro: " . $row["id_cadastro"] . " - ID Professor: " . $row["id_professor"] . "<br>";
    }
} else {
    echo "Nenhuma matéria encontrada.";
}

$conn->close();
?>