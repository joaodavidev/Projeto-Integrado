<?php
    include('conexao.php');  



if ($_SERVER["REQUEST_METHOD"] == "POST") {
    session_start();
    $nome = $_POST['nome'];
    $data_nasc = $_POST['data_nasc'];
<<<<<<< HEAD
    


   
    $prcd = "UPDATE cadastro SET 
                nome = ?, 
                data_nasc = ?,  
            WHERE id_cadastro = ?";

    $stmt = $conn->prepare($prcd);
    $stmt->bind_param("sssssi", $nome, $data_nasc, $desc, $id_cadastro);

    if ($stmt->execute()) {
=======


    $prcd = $conn->prepare("CALL update_cadastro(?, ?)");
    $prcd->bind_param("ssi", $nome, $data_nasc, $id_cadastro);

    if ($prcd->execute()) {
>>>>>>> a0acc2bcf09d55d4127eaa2c1635c2bb5ae87887
        echo "Cadastro atualizado com sucesso!";
    } else {
        echo "Erro ao atualizar cadastro: " . $prcd->error;
    }

    $prcd->close();
}

$conn->close();



?>