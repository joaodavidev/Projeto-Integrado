<?php
$servername = "localhost";
$username = "root";
$password = "123";
$dbname = "learnhub";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

$sql = "SELECT * FROM vw_materias";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID Matéria: " . $row["id_materia"] . " - Nome: " . $row["nome"] . " - ID Cadastro: " . $row["id_cadastro"] ."<br>";
    }
} else {
    echo "Nenhuma matéria encontrada.";
}

$conn->close();
?>