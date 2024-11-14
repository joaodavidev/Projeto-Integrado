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

$sql = "SELECT * FROM vw_meta_dia";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID Meta Dia: " . $row["id_meta_dia"] . " - ID Cadastro: " . $row["id_cadastro"] . " - Meta: " . $row["meta"] . " - Data: " . $row["data_meta"] . "<br>";
    }
} else {
    echo "Nenhuma meta do dia encontrada.";
}

$conn->close();
?>