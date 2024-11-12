CREATE DATABASE learnhub;
USE learnhub;

CREATE TABLE cadastro (
    id_cadastro INT PRIMARY KEY auto_increment,
    nome VARCHAR(20),
    data_nasc DATE,
    sexo ENUM('selecione','masculino', 'feminino', 'outro'),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(32),
);

CREATE TABLE login (
    email VARCHAR(100) UNIQUE PRIMARY KEY,
    senha VARCHAR(32),
    FOREIGN KEY (email) REFERENCES cadastro(email),
    FOREIGN KEY (senha) REFERENCES cadastro(senha)
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(50),
    data_nascimento DATE,
    sexo CHAR(1),
    telefone VARCHAR(15),
    status ENUM('Estudante', 'Aguardando Aprovação', 'Professor') DEFAULT 'Estudante'
);

CREATE TABLE diploma (
    id_diploma INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    arquivo_diploma VARCHAR(255),
    status ENUM('Pendente', 'Aprovado', 'Rejeitado') DEFAULT 'Pendente',
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);


CREATE TABLE estudante (
    id_estudante INT PRIMARY KEY auto_increment,
    nome, 
    email,
    datanasc,
);

CREATE TABLE professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE administrador (
    id_administrador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE,
    sexo CHAR(1),
    telefone VARCHAR(15),
    cargo VARCHAR(50),
    endereco VARCHAR(150)
);

CREATE TABLE checkin (
    id_checkin INT PRIMARY KEY AUTO_INCREMENT,
    id_estudante INT,
    data DATE,
    horario TIME,
    FOREIGN KEY (id_estudante) REFERENCES estudante(id_estudante)
);

CREATE TABLE checkin_metas (
    id_checkin_metas INT PRIMARY KEY AUTO_INCREMENT,
    id_estudante INT,
    data DATE,
    atividades TEXT,
    FOREIGN KEY (id_estudante) REFERENCES estudante(id_estudante)
);

CREATE TABLE login (
    id_login INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100),
    senha VARCHAR(50),
    tipo_usuario ENUM('estudante', 'professor', 'administrador'),
    usuario_id INT
);


CREATE TABLE perfil (
    id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    foto VARCHAR(255),
    nome VARCHAR(100),
    descricao TEXT,
    diploma VARCHAR(50)
);

CREATE TABLE materiais (
    id_materiais INT PRIMARY KEY AUTO_INCREMENT,
    id_estudante INT,
    id_professor INT,
    materia VARCHAR(100),
    tipo_arquivo VARCHAR(50),
    conteudo TEXT,
    FOREIGN KEY (id_estudante) REFERENCES estudante(id_estudante),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE atividades (
    id_atividades INT PRIMARY KEY AUTO_INCREMENT,
    id_estudante INT,
    id_professor INT,
    materia VARCHAR(100),
    exercicios TEXT,
    data DATE,
    FOREIGN KEY (id_estudante) REFERENCES estudante(id_estudante),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE materias (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_estudante INT,
    id_professor INT,
    FOREIGN KEY (id_estudante) REFERENCES estudante(id_estudante),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE suporte (
    id_suporte INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    nome VARCHAR(100),
    responsavel VARCHAR(100),
    email VARCHAR(100),
    assunto TEXT
);


CREATE TABLE rel_estudante_professor (
    id_estudante INT,
    id_professor INT,
    PRIMARY KEY (id_estudante, id_professor),
    FOREIGN KEY (id_estudante) REFERENCES estudante(id_estudante),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);



--Coisas de SELECT 

INSERT INTO cadastro (email, senha, usuario, datanasc)
VALUES
('teste@gmail.com', '123', 'teste','17-10-2006');


INSERT INTO login(email, senha) 
VALUES ('teste@gmail.com', '123');

--VIEWS
CREATE VIEW verificar_login 
AS 
SELECT email, senha FROM cadastro;

CREATE VIEW vw_atividades_estudante AS
SELECT 
    a.id_atividades,
    e.nome AS nome_estudante,
    a.materia,
    a.exercicios,
    a.data
FROM 
    atividades a
JOIN 
    estudante e ON a.id_estudante = e.id_estudante;

--PROCEDURES
DELIMITER $$
CREATE PROCEDURE insert_cadastro( IN pc_nome VARCHAR(20),
    IN pc_data_nasc DATE,
    IN pc_sexo ENUM('selecione','masculino', 'feminino', 'outro'),
    IN pc_email VARCHAR(100) UNIQUE,
    IN pc_senha VARCHAR(32),
    ) 

BEGIN
    INSERT INTO cadastro(nome, data_nasc, sexo, email, senha)
    VALUES (pc_nome, pc_data_nasc, pc_sexo, pc_senha);
END $$ 
DELIMITER;

DELIMITER //
CREATE PROCEDURE registrar_checkin (IN id_estudante INT)
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM checkin 
        WHERE id_estudante = id_estudante AND DATE(data) = CURDATE()
    ) THEN
        INSERT INTO checkin (id_estudante, data, horario)
        VALUES (id_estudante, CURDATE(), CURTIME());
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE solicitar_aprovacao_professor (IN p_id_usuario INT, IN p_arquivo_diploma VARCHAR(255))
BEGIN
    UPDATE usuario 
    SET status = 'Aguardando Aprovação' 
    WHERE id_usuario = p_id_usuario;
    
    INSERT INTO diploma (id_usuario, arquivo_diploma, status)
    VALUES (p_id_usuario, p_arquivo_diploma, 'Pendente');
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE aprovar_professor (IN p_id_usuario INT)
BEGIN
    UPDATE usuario 
    SET status = 'Professor' 
    WHERE id_usuario = p_id_usuario;
    
    UPDATE diploma
    SET status = 'Aprovado'
    WHERE id_usuario = p_id_usuario AND status = 'Pendente';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE rejeitar_diploma (IN p_id_usuario INT)
BEGIN
    UPDATE usuario 
    SET status = 'Estudante' 
    WHERE id_usuario = p_id_usuario;
    
    UPDATE diploma
    SET status = 'Rejeitado'
    WHERE id_usuario = p_id_usuario AND status = 'Pendente';
END //
DELIMITER ;


