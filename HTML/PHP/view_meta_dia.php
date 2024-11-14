<?php
$servername = "localhost";
$username = "root";
$password = "123";
$dbname = "learnhub";

$conn = new mysqli($servername, $username, $password, $dbname);

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