<?php
    include('conexao.php');  



if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    $nome = $_POST['nome'];
    $data_nasc = $_POST['data_nasc'];
    $sexo = $_POST['sexo'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];


   
    $prcd = "UPDATE cadastro SET 
                nome = ?, 
                data_nasc = ?, 
                sexo = ?, 
                email = ?, 
                senha = ? 
            WHERE id_cadastro = ?";

    $prcd = $conn->prepare($prcd);
    $prcd->bind_param("sssssi", $nome, $data_nasc, $sexo, $email, $senha, $id_cadastro);

    if ($stmt->execute()) {
        echo "Cadastro atualizado com sucesso!";
    } else {
        echo "Erro ao atualizar cadastro: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();



?>