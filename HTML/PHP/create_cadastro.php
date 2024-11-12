<?php
    include('conexao.php');  

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['nome'];
    $data_nasc = $_POST['data_nasc'];
    $sexo = $_POST['sexo'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];
    

    $prcd = $conn->prepare("CALL insert_cadastro(?, ?, ?, ?, ?)");
    $prcd->bind_param("ppppp", $nome, $data_nasc, $sexo, $email, $senha);
    $prcd->execute();


        if ($prcd->execute() == TRUE) {
            echo ("Cadastro criado com sucesso!");
        } else {
            echo ("Erro: ". $prcd->error);
        }
    }
    
    $prcd->close();


?>