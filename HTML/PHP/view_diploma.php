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

$sql = "SELECT * FROM vw_diplomas";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID Diploma: " . $row["nome_diploma"] . " - ID Cadastro: " . $row["id_cadastro"] . " - Descrição: " . $row["descricao_diploma"] . " - Data: " . $row["data_diploma"] . "<br>";
    }
} else {
    echo "Nenhum diploma encontrado.";
}

$conn->close();
?>