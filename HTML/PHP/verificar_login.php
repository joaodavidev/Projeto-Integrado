<?php
    include('conexao.php');

    session_start();
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST['email'];
        $senha = $_POST['senha'];

        $view = $conn->prepare("SELECT senha, id_cadastro FROM verificar_login WHERE email = ?");
        $view->bind_param("s", $id_cadastro, $email);
        $view->execute();
        $view->store_result();

        if ($view->num_rows > 0) {
            $view->bind_result($hash);
            $view->fetch();
            
            if (password_verify($senha, $hash)) {
                $_SESSION['loggedin'] = true; 
                $_SESSION['id_cadastro'] = $id_cadastro;
                header("Location: index.php");
            } else {
                //senha incorreta
            } 
        } else {
            //email não cadastrado
        }
        $view->close();
    }

    $conn->close()
?>