<?php
    $host = "localhost";
    $user = "root";
    $port = "";

    try{
        $conn = new PDO("mysql:host=$host;port=$port ");
    }catch (PDOException $error){
        echo ("Erro: a conexão com o banco de dados falhou. Error: " . $error -> getMessage());
    }



?>