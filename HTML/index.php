<?php include 'PHP/autenticacao.php' ?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LearnHub</title>
  <link rel="stylesheet" href="CSS/styles.css">
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

      <section class="eventos">
        <h2>Eventos agendados para hoje</h2>
        <p>Você não possui eventos hoje.</p>
      </section>
    </div>
  </div>

  <script src="JS/script.js"></script>
</body>
</html>
