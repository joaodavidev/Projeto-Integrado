<?php
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    echo ("Sessão logada!");
    $_SESSION['id_cadastro'] = $id_cadastro;
    exit();
}
?>
