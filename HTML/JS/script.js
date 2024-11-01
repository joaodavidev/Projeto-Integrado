function fecharmenu() {
    const menu = document.getElementById('menuaberto');
    menu.classList.toggle('fechado');
  }

function cadastro(nome, data_nasc, sexo, email, senha, confirmador_senha) {
    nome = document.getElementById("nome").value;
    data_nasc = document.getElementById("data_nasc").value;
    sexo = document.getElementById("sexo").value;
    email = document.getElementById("email").value;
    senha = document.getElementById("senha").value;
    confirmador_senha = document.getElementById("confirmador_senha").value;

    alert("email: " + email + "senha: " + senha);
    window.location.href = "login.html";
}

function login(email, senha){
    email = getElementById("email").value;
    senha = getElementById("senha").value;

    alert("email: " + email + "senha: " + senha);
    window.location.href = "index.html";
}