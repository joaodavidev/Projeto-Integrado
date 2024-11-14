<?php include 'autenticacao.php' ?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LearnHub</title>
  <link rel="stylesheet" href="CSS/perfil.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body class="claro">

  <div class="container">
    <nav class="menuaberto" id="menuaberto">
      <div class="logo">
        <img src="IMG/logo.png" alt="Logo do LearnHub" class="logo-img">
      </div>
      <ul class="menu">
        <li><span class="icone"><i class='bx bx-home'></i></span><span class="text">Página Inicial</span></li>
        <li><span class="icone"><i class='bx bx-timer' ></i></span><span class="text">Estudo Diário</span></li>
        <li><span class="icone"><i class='bx bx-calendar' ></i></span><span class="text">Calendário</span></li>
        <li><span class="icone"><i class='bx bxs-notepad' ></i></span><span class="text">Caderno</span></li>
        <li><span class="icone"><i class='bx bxs-graduation' ></i></span><span class="text">Professores</span></li>
      </ul>
    </nav>
    
    <div class="main-content">
        <header class="header">
        <button class="botaomenu" onclick="fecharmenu()"><i class='bx bx-menu' ></i></button>
        <input type="text" class="barra" placeholder="Buscar assunto...">
        <div class="icones">
          <span class="icone"><i class='bx bx-plus-circle' ></i></span>
          <span class="icone" onclick="modoescuro()"><i class='bx bx-sun'></i></span>
          <span class="icone"><i class='bx bx-user' ></i></span>
        </div>
      </header>

      <div class="perfil">
        <form action="PHP/alterar_cadastro.php" method="post">
            <label for="nome">Nome</label>
            <input type="text" id="nome" name="nome" placeholder="Digite aqui:" required>
            
            <br>

            <label for="data_nasc">Data de nascimento</label>
            <input type="date" id="data_nasc" name="data_nasc" placeholder="Digite aqui:" required>
        
            <br>


            <label for="certificado">É professor? Adicione seu certificado</label>
            <br>
            <input type="text" id="doc" name="doc" placeholder="Digite aqui:"> <button type="button" onclick="salvar_dado()">Insira</button>
            <button type="button">Deletar</button>
            <br>
<<<<<<< HEAD:HTML/perfil.html
            <button type="button" onclick="salvar_dados()">Salvar</button>
=======

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            
            <br>

            <label for="senha">Senha</label>
            <input type="password" id="senha" name="senha" required>

            <button type="submit">Salvar</button>
>>>>>>> a0acc2bcf09d55d4127eaa2c1635c2bb5ae87887:HTML/perfil.php
        </form>
      </div>
    </div>
  </div>

  <script src="JS/perfil.js"></script>
</body>
</html>