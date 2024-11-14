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

$sql = "SELECT * FROM vw_atividades";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID Cadastro: " . $row["id_cadastro"] . " - Nome Atividade: " . $row["nome_atividade"] . " - Número de Exercícios: " . $row["num_exercicios"] . " - Nome Matéria: " . $row["nome_materia"] . "<br>";
    }
} else {
    echo "Nenhuma atividade encontrada.";
}

$conn->close();
?>