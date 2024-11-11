<?php
    $servername = "localhost";
    $username = "root"; 
    $password = "";
    $dbname = "schema"; 
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    if ($conn->connect_error) {
        die("Conexão falhou: " . $conn->connect_error);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST['email'];
        $senha = $_POST['senha'];
        
    }
?>