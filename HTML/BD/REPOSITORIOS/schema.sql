CREATE DATABASE learnhub;
USE learnhub;

CREATE TABLE cadastro (
    id_cadastro INT PRIMARY KEY auto_increment,
    nome VARCHAR(20),
    datanasc DATE,
    sexo ENUM('selecione','masculino', 'feminino', 'outro'),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(32),
    confirmador_senha VARCHAR(32)
);

CREATE TABLE login (
    email VARCHAR(100) UNIQUE PRIMARY KEY,
    senha VARCHAR(32),
    FOREIGN KEY (email) REFERENCES cadastro(email),
    FOREIGN KEY (senha) REFERENCES cadastro(senha)
);

CREATE TABLE estudante (
    id_estudante INT PRIMARY KEY auto_increment,
    nome, 
    email,
    datanasc,


);

CREATE TABLE professor (

);

CREATE TABLE adm (

);

CREATE TABLE materia (
    id_materia INT PRIMARY KEY auto_increment,
    id_login 
);


--Coisas de SELECT 

INSERT INTO cadastro (email, senha, usuario, datanasc)
VALUES
('teste@gmail.com', '123', 'teste','17-10-2006');


INSERT INTO login(email, senha) 
VALUES ('teste@gmail.com', '123');

