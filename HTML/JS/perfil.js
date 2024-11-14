function fecharmenu() {
  const menu = document.getElementById('menuaberto');
  menu.classList.toggle('fechado');
};

function modoescuro() {
const body = document.body;
const icon = document.querySelector('.icone i');

body.classList.toggle('escuro');
  
if (body.classList.contains('escuro')) {
  icon.classList.replace('bx-sun', 'bx-moon');
} else {
  icon.classList.replace('bx-moon', 'bx-sun');
}
}


document.addEventListener("DOMContentLoaded", function() {
  const input1Salvo = localStorage.getItem("nome");
  const input2Salvo = localStorage.getItem("data_nasc");
  const input3Salvo = localStorage.getItem("doc");


  if (input1Salvo) document.getElementById("nome").value = input1Salvo;
  if (input2Salvo) document.getElementById("data_nasc").value = input2Salvo;
  if (input3Salvo) document.getElementById("doc").value = input3Salvo;
  
});

function salvar_dados() {
  const input1 = document.getElementById("nome").value;
  const input2 = document.getElementById("data_nasc").value;

  localStorage.setItem("nome", input1);
  localStorage.setItem("data_nasc", input2);
}



function salvar_dado(){
  const documento = document.getElementById("doc").value;
  localStorage.setItem("doc", documento);
}