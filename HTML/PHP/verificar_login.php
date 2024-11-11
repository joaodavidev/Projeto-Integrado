<?php
    include('conexao.php');

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST['email'];
        $senha = $_POST['senha'];

        $view = $conn->prepare("SELECT senha FROM verificar_login WHERE email = ?");
        $view->bind_param("s", $email);
        $view->execute();
        $view->store_result();

        if ($view->num_rows > 0) {
            $view->bind_result($hash);
            $view->fetch();
            
            if (password_verify($senha, $hash)) {
                //Sucesso
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