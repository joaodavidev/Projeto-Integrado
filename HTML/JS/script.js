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

