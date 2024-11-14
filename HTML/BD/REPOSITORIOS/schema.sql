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
    nome_diploma INT PRIMARY KEY,
    id_cadastro INT,
    descricao_diploma VARCHAR(255),
    data_diploma DATE,
    FOREIGN KEY (id_cadastro) REFERENCES cadastro(id_cadastro)
);

CREATE TABLE meta_dia (
    id_meta_dia INT PRIMARY KEY,
    id_cadastro INT,
    meta INT,
    data_meta DATA,
    FOREIGN KEY (id_cadastro) REFERENCES cadastro(id_cadastro)
);

CREATE TABLE perfil (
    id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    data_nasc DATE,
);

CREATE TABLE materias (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_cadastro INT,
    FOREIGN KEY (id_cadastro) REFERENCES cadastro(id_cadastro),
);

CREATE TABLE atividades (
    id_cadastro INT,
    nome_atividade VARCHAR(50) PRIMARY KEY,
    num_exercicios INT,
    nome_materia VARCHAR(50)
    FOREIGN KEY (id_cadastro) REFERENCES cadastro(id_cadastro)
);

CREATE VIEW verificar_login 
AS 
SELECT email, senha FROM cadastro;


-- CRUD para tabela 'cadastro'

-- CREATE PROCEDURE para 'cadastro'
DELIMITER $$
CREATE PROCEDURE sp_create_cadastro(
    IN p_nome VARCHAR(20),
    IN p_data_nasc DATE,
    IN p_sexo ENUM('selecione', 'masculino', 'feminino', 'outro'),
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(32)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao inserir cadastro';
    END;
    START TRANSACTION;
    INSERT INTO cadastro (nome, data_nasc, sexo, email, senha)
    VALUES (p_nome, p_data_nasc, p_sexo, p_email, p_senha);
    COMMIT;
    SELECT 'Cadastro inserido com sucesso';
END $$
DELIMITER ;

-- UPDATE PROCEDURE para 'cadastro'
DELIMITER $$
CREATE PROCEDURE sp_update_cadastro(
    IN p_id_cadastro INT,
    IN p_nome VARCHAR(20),
    IN p_data_nasc DATE,
    IN p_sexo ENUM('selecione', 'masculino', 'feminino', 'outro'),
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(32)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao atualizar cadastro';
    END;
    START TRANSACTION;
    UPDATE cadastro
    SET nome = p_nome, data_nasc = p_data_nasc, sexo = p_sexo, email = p_email, senha = p_senha
    WHERE id_cadastro = p_id_cadastro;
    COMMIT;
    SELECT 'Cadastro atualizado com sucesso';
END $$
DELIMITER ;

-- DELETE PROCEDURE para 'cadastro'
DELIMITER $$
CREATE PROCEDURE sp_delete_cadastro(
    IN p_id_cadastro INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao excluir cadastro';
    END;
    START TRANSACTION;
    DELETE FROM cadastro WHERE id_cadastro = p_id_cadastro;
    COMMIT;
    SELECT 'Cadastro excluído com sucesso';
END $$
DELIMITER ;

-- VIEW para listar todos os cadastros
CREATE VIEW vw_cadastros AS
SELECT * FROM cadastro;

-- CRUD para tabela 'diploma'

-- CREATE PROCEDURE para 'diploma'
DELIMITER $$
CREATE PROCEDURE sp_create_diploma(
    IN p_nome_diploma INT,
    IN p_id_cadastro INT,
    IN p_descricao_diploma VARCHAR(255),
    IN p_data_diploma DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao inserir diploma';
    END;
    START TRANSACTION;
    INSERT INTO diploma (nome_diploma, id_cadastro, descircao_diploma, data_diploma)
    VALUES (p_nome_diploma, p_id_cadastro, p_descricao_diploma, p_data_diploma);
    COMMIT;
    SELECT 'Diploma inserido com sucesso';
END $$
DELIMITER ;

-- UPDATE PROCEDURE para 'diploma'
DELIMITER $$
CREATE PROCEDURE sp_update_diploma(
    IN p_nome_diploma INT,
    IN p_id_cadastro INT,
    IN p_descricao_diploma VARCHAR(255),
    IN p_data_diploma DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao atualizar diploma';
    END;
    START TRANSACTION;
    UPDATE diploma
    SET id_cadastro = p_id_cadastro, descircao_diploma = p_descricao_diploma, data_diploma = p_data_diploma
    WHERE nome_diploma = p_nome_diploma;
    COMMIT;
    SELECT 'Diploma atualizado com sucesso';
END $$
DELIMITER ;

-- DELETE PROCEDURE para 'diploma'
DELIMITER $$
CREATE PROCEDURE sp_delete_diploma(
    IN p_nome_diploma INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao excluir diploma';
    END;
    START TRANSACTION;
    DELETE FROM diploma WHERE nome_diploma = p_nome_diploma;
    COMMIT;
    SELECT 'Diploma excluído com sucesso';
END $$
DELIMITER ;

-- VIEW para listar todos os diplomas
CREATE VIEW vw_diplomas AS
SELECT * FROM diploma;

-- CRUD para tabela 'meta_dia'

-- CREATE PROCEDURE para 'meta_dia'
DELIMITER $$
CREATE PROCEDURE sp_create_meta_dia(
    IN p_id_meta_dia INT,
    IN p_id_cadastro INT,
    IN p_meta INT,
    IN p_data_meta DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao inserir meta do dia';
    END;
    START TRANSACTION;
    INSERT INTO meta_dia (id_meta_dia, id_cadastro, meta, data_meta)
    VALUES (p_id_meta_dia, p_id_cadastro, p_meta, p_data_meta);
    COMMIT;
    SELECT 'Meta do dia inserida com sucesso';
END $$
DELIMITER ;

-- UPDATE PROCEDURE para 'meta_dia'
DELIMITER $$
CREATE PROCEDURE sp_update_meta_dia(
    IN p_id_meta_dia INT,
    IN p_id_cadastro INT,
    IN p_meta INT,
    IN p_data_meta DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao atualizar meta do dia';
    END;
    START TRANSACTION;
    UPDATE meta_dia
    SET id_cadastro = p_id_cadastro, meta = p_meta, data_meta = p_data_meta
    WHERE id_meta_dia = p_id_meta_dia;
    COMMIT;
    SELECT 'Meta do dia atualizada com sucesso';
END $$
DELIMITER ;

-- DELETE PROCEDURE para 'meta_dia'
DELIMITER $$
CREATE PROCEDURE sp_delete_meta_dia(
    IN p_id_meta_dia INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao excluir meta do dia';
    END;
    START TRANSACTION;
    DELETE FROM meta_dia WHERE id_meta_dia = p_id_meta_dia;
    COMMIT;
    SELECT 'Meta do dia excluída com sucesso';
END $$
DELIMITER ;

-- VIEW para listar todas as metas diárias
CREATE VIEW vw_meta_dia AS
SELECT * FROM meta_dia;

-- CRUD para tabela 'perfil'

-- CREATE PROCEDURE para 'perfil'
DELIMITER $$
CREATE PROCEDURE sp_create_perfil(
    IN p_nome VARCHAR(100),
    IN p_descricao TEXT,
    IN p_data_nasc DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao inserir perfil';
    END;
    START TRANSACTION;
    INSERT INTO perfil (nome, descricao, data_nasc)
    VALUES (p_nome, p_descricao, p_data_nasc);
    COMMIT;
    SELECT 'Perfil inserido com sucesso';
END $$
DELIMITER ;

-- UPDATE PROCEDURE para 'perfil'
DELIMITER $$
CREATE PROCEDURE sp_update_perfil(
    IN p_id_perfil INT,
    IN p_nome VARCHAR(100),
    IN p_descricao TEXT,
    IN p_data_nasc DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao atualizar perfil';
    END;
    START TRANSACTION;
    UPDATE perfil
    SET nome = p_nome, descricao = p_descricao, data_nasc = p_data_nasc
    WHERE id_perfil = p_id_perfil;
    COMMIT;
    SELECT 'Perfil atualizado com sucesso';
END $$
DELIMITER ;

-- DELETE PROCEDURE para 'perfil'
DELIMITER $$
CREATE PROCEDURE sp_delete_perfil(
    IN p_id_perfil INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao excluir perfil';
    END;
    START TRANSACTION;
    DELETE FROM perfil WHERE id_perfil = p_id_perfil;
    COMMIT;
    SELECT 'Perfil excluído com sucesso';
END $$
DELIMITER ;

-- VIEW para listar todos os perfis
CREATE VIEW vw_perfis AS
SELECT * FROM perfil;

-- CRUD para tabela 'materias'

-- CREATE PROCEDURE para 'materias'
DELIMITER $$
CREATE PROCEDURE sp_create_materias(
    IN p_nome VARCHAR(100),
    IN p_id_cadastro INT,
    IN p_id_professor INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao inserir matéria';
    END;
    START TRANSACTION;
    INSERT INTO materias (nome, id_cadastro, id_professor)
    VALUES (p_nome, p_id_cadastro, p_id_professor);
    COMMIT;
    SELECT 'Matéria inserida com sucesso';
END $$
DELIMITER ;

-- UPDATE PROCEDURE para 'materias'
DELIMITER $$
CREATE PROCEDURE sp_update_materias(
    IN p_id_materia INT,
    IN p_nome VARCHAR(100),
    IN p_id_cadastro INT,
    IN p_id_professor INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao atualizar matéria';
    END;
    START TRANSACTION;
    UPDATE materias
    SET nome = p_nome, id_cadastro = p_id_cadastro, id_professor = p_id_professor
    WHERE id_materia = p_id_materia;
    COMMIT;
    SELECT 'Matéria atualizada com sucesso';
END $$
DELIMITER ;

-- DELETE PROCEDURE para 'materias'
DELIMITER $$
CREATE PROCEDURE sp_delete_materias(
    IN p_id_materia INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao excluir matéria';
    END;
    START TRANSACTION;
    DELETE FROM materias WHERE id_materia = p_id_materia;
    COMMIT;
    SELECT 'Matéria excluída com sucesso';
END $$
DELIMITER ;

-- VIEW para listar todas as matérias
CREATE VIEW vw_materias AS
SELECT * FROM materias;

-- CRUD para tabela 'atividades'

-- CREATE PROCEDURE para 'atividades'
DELIMITER $$
CREATE PROCEDURE sp_create_atividades(
    IN p_id_cadastro INT,
    IN p_nome_atividade VARCHAR(50),
    IN p_num_exercicios INT,
    IN p_nome_materia VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao inserir atividade';
    END;
    START TRANSACTION;
    INSERT INTO atividades (id_cadastro, nome_atividade, num_exercicios, nome_materia)
    VALUES (p_id_cadastro, p_nome_atividade, p_num_exercicios, p_nome_materia);
    COMMIT;
    SELECT 'Atividade inserida com sucesso';
END $$
DELIMITER ;

-- UPDATE PROCEDURE para 'atividades'
DELIMITER $$
CREATE PROCEDURE sp_update_atividades(
    IN p_nome_atividade VARCHAR(50),
    IN p_id_cadastro INT,
    IN p_num_exercicios INT,
    IN p_nome_materia VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao atualizar atividade';
    END;
    START TRANSACTION;
    UPDATE atividades
    SET id_cadastro = p_id_cadastro, num_exercicios = p_num_exercicios, nome_materia = p_nome_materia
    WHERE nome_atividade = p_nome_atividade;
    COMMIT;
    SELECT 'Atividade atualizada com sucesso';
END $$
DELIMITER ;

-- DELETE PROCEDURE para 'atividades'
DELIMITER $$
CREATE PROCEDURE sp_delete_atividades(
    IN p_nome_atividade VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro ao excluir atividade';
    END;
    START TRANSACTION;
    DELETE FROM atividades WHERE nome_atividade = p_nome_atividade;
    COMMIT;
    SELECT 'Atividade excluída com sucesso';
END $$
DELIMITER ;

-- VIEW para listar todas as atividades
CREATE VIEW vw_atividades AS
SELECT * FROM atividades;
