<?php
    include('conexao.php');  



if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    $nome = $_POST['nome'];
    $data_nasc = $_POST['data_nasc'];


    $prcd = $conn->prepare("CALL update_cadastro(?, ?)");
    $prcd->bind_param("ssi", $nome, $data_nasc, $id_cadastro);

    if ($prcd->execute()) {
        echo "Cadastro atualizado com sucesso!";
    } else {
        echo "Erro ao atualizar cadastro: " . $prcd->error;
    }

    $prcd->close();
}

$conn->close();



?>