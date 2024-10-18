CREATE DATABASE learnhub;
USE learnhub;

CREATE TABLE cadastro (
    id_cadastro INT PRIMARY KEY auto_increment,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(32),
    usuario VARCHAR(20),
    datanasc DATE
);

CREATE TABLE login (
    id_login INT PRIMARY KEY auto_increment,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(32)
);



--Coisas de SELECT 

INSERT INTO cadastro (email, senha, usuario, datanasc)
VALUES
('teste@gmail.com', '123', 'teste','17-10-2006');


INSERT INTO login(email, senha) 
VALUES ('teste@gmail.com', '123');