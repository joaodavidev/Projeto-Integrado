function fecharmenu() {
    const menu = document.getElementById('menuaberto');
    menu.classList.toggle('fechado');
  }

function cadastro(nome, data_nasc, sexo, email, senha, confirmador_senha) {
    var nome = document.getElementById("nome").value;
    var data_nasc = document.getElementById("data_nasc").value;
    var sexo = document.getElementById("sexo").value;
    var email = document.getElementById("email").value;
    var senha = document.getElementById("senha").value;
    var confirmador_senha = document.getElementById("confirmador_senha").value;

    alert("email: " + email + "senha: " + senha);
    window.location.href = "login.html";
}

function login(email, senha){
    var email = getElementById("email").value;
    var senha = getElementById("senha").value;

    alert("email: " + email + "senha: " + senha);
    window.location.href = "index.html";
}