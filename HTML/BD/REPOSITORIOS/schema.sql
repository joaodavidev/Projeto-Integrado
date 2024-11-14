CREATE DATABASE learnhub;
USE learnhub;

CREATE TABLE cadastro (
    id_cadastro INT PRIMARY KEY auto_increment,
    nome VARCHAR(20),
    data_nasc DATE,
    sexo ENUM('selecione','masculino', 'feminino', 'outro'),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(32)
);

CREATE TABLE diploma (
    id_diploma INT PRIMARY KEY AUTO_INCREMENT,
    id_cadastro INT,
    arquivo_diploma VARCHAR(255),
    status ENUM('Pendente', 'Aprovado', 'Rejeitado') DEFAULT 'Pendente',
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    id_cadastro INT,
    FOREIGN KEY (id_cadastro) REFERENCES cadastro(id_cadastro)
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

CREATE VIEW verificar_login 
AS 
SELECT email, senha FROM cadastro;

/* CRUD CADASTRO */
CREATE VIEW vw_cadastro AS
SELECT id_cadastro, nome, data_nasc, sexo, email FROM cadastro;

DELIMITER //
CREATE PROCEDURE insert_cadastro(
    IN pc_nome VARCHAR(20),
    IN pc_data_nasc DATE,
    IN pc_sexo ENUM('selecione','masculino', 'feminino', 'outro'),
    IN pc_email VARCHAR(100),
    IN pc_senha VARCHAR(32)
) 
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO cadastro(nome, data_nasc, sexo, email, senha)
    VALUES (pc_nome, pc_data_nasc, pc_sexo, pc_email, pc_senha);
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE update_cadastro(
    IN p_nome VARCHAR(20),
    IN p_data_nasc DATE,
    IN p_id_cadastro INT,
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE cadastro
    SET nome = p_nome, data_nasc = p_data_nasc
    WHERE id_cadastro = p_id_cadastro;
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_cadastro(IN p_id_cadastro INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM cadastro WHERE id_cadastro = p_id_cadastro;
    COMMIT;
END//
DELIMITER ;

/* CRUD DIPLOMA */
/*view*/
CREATE VIEW vw_diploma AS
SELECT id_diploma, id_usuario, arquivo_diploma, status FROM diploma;

/*create*/
DELIMITER //
CREATE PROCEDURE solicitar_aprovacao_professor (IN p_id_usuario INT, IN p_arquivo_diploma VARCHAR(255))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE usuario 
    SET status = 'Aguardando Aprovação' 
    WHERE id_usuario = p_id_usuario;
    
    INSERT INTO diploma (id_usuario, arquivo_diploma, status)
    VALUES (p_id_usuario, p_arquivo_diploma, 'Pendente');
    COMMIT;
END//
DELIMITER ;
/*update*/
DELIMITER //
CREATE PROCEDURE aprovar_professor (IN p_id_usuario INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE usuario 
    SET status = 'Professor' 
    WHERE id_usuario = p_id_usuario;
    
    UPDATE diploma
    SET status = 'Aprovado'
    WHERE id_usuario = p_id_usuario AND status = 'Pendente';
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE rejeitar_diploma (IN p_id_usuario INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE usuario 
    SET status = 'Estudante' 
    WHERE id_usuario = p_id_usuario;
    
    UPDATE diploma
    SET status = 'Rejeitado'
    WHERE id_usuario = p_id_usuario AND status = 'Pendente';
    COMMIT;
END//
DELIMITER ;
/*delete*/
DELIMITER //
CREATE PROCEDURE delete_diploma(IN p_id_diploma INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM diploma WHERE id_diploma = p_id_diploma;
    COMMIT;
END//
DELIMITER ;




/* CRUD MATERIAS */
/*view*/
CREATE VIEW vw_materias AS
SELECT id_materia, nome, id_estudante, id_professor FROM materias;
/*create*/
DELIMITER //
CREATE PROCEDURE adicionar_materia (
    IN p_nome_materia VARCHAR(100),
    IN p_id_estudante INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    INSERT INTO materias (nome, id_estudante, id_professor)
    VALUES (p_nome_materia, p_id_estudante, NULL);
    COMMIT;
END//
DELIMITER ;s
/*update*/
DELIMITER //
CREATE PROCEDURE update_materia(
    IN p_id_materia INT,
    IN p_nome VARCHAR(100),
    IN p_id_estudante INT,
    IN p_id_professor INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE materias
    SET nome = p_nome, id_estudante = p_id_estudante, id_professor = p_id_professor
    WHERE id_materia = p_id_materia;
    COMMIT;
END//
DELIMITER ;
/*delete*/
DELIMITER //
CREATE PROCEDURE delete_materia(IN p_id_materia INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM materias WHERE id_materia = p_id_materia;
    COMMIT;
END//
DELIMITER ;

/* CRUD ATIVIDADES */
/*view*/
CREATE VIEW vw_atividades_estudante AS
SELECT 
    a.id_atividades,
    e.nome AS nome_estudante,
    a.materia,
    a.exercicios,
    a.data
FROM 
    atividades AS a
JOIN 
    estudante AS e ON a.id_estudante = e.id_estudante;

/*update*/
DELIMITER //
CREATE PROCEDURE update_atividade(
    IN p_id_atividades INT,
    IN p_materia VARCHAR(100),
    IN p_exercicios TEXT,
    IN p_data DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    UPDATE atividades
    SET materia = p_materia, exercicios = p_exercicios, data = p_data
    WHERE id_atividades = p_id_atividades;
    COMMIT;
END//
DELIMITER ;

/*delete*/
DELIMITER //
CREATE PROCEDURE delete_atividade(IN p_id_atividades INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    DELETE FROM atividades WHERE id_atividades = p_id_atividades;
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE registrar_checkin (IN id_estudante INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    IF NOT EXISTS (
        SELECT 1 
        FROM checkin 
        WHERE id_estudante = id_estudante AND DATE(data) = CURDATE()
    ) THEN
        INSERT INTO checkin (id_estudante, data, horario)
        VALUES (id_estudante, CURDATE(), CURTIME());
    END IF;
    COMMIT;
END//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE update_cadastro(
    IN p_nome VARCHAR(20),
    IN p_data_nasc DATE,
    IN p_id_cadastro INT,
)
BEGIN
    UPDATE cadastro
    SET 
        nome = p_nome,
        data_nasc = p_data_nasc,
    WHERE id_cadastro = p_id_cadastro;
END //

DELIMITER ;
