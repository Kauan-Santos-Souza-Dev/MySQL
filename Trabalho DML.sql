DROP DATABASE IF EXISTS db_formula1;
CREATE DATABASE db_formula1
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_0900_ai_ci;
USE db_formula1;
 

CREATE TABLE paises (
    codigo  INT          NOT NULL,
    nome    VARCHAR(60)  NOT NULL,
    CONSTRAINT pk_paises PRIMARY KEY (codigo)
);
 
CREATE TABLE equipes (
    sigla     CHAR(3)      NOT NULL,
    nome      VARCHAR(60)  NOT NULL,
    cod_pais  INT          NOT NULL,
    CONSTRAINT pk_equipes PRIMARY KEY (sigla),
    CONSTRAINT fk_equipes_paises FOREIGN KEY (cod_pais) REFERENCES paises (codigo)
);
 
CREATE TABLE pilotos (
    numero        INT          NOT NULL,
    nome          VARCHAR(80)  NOT NULL,
    cod_pais      INT          NOT NULL,
    sigla_equipe  CHAR(3)      NOT NULL,
    CONSTRAINT pk_pilotos PRIMARY KEY (numero),
    CONSTRAINT fk_pilotos_paises  FOREIGN KEY (cod_pais)     REFERENCES paises (codigo),
    CONSTRAINT fk_pilotos_equipes FOREIGN KEY (sigla_equipe) REFERENCES equipes (sigla)
);
 
CREATE TABLE corridas (
    sigla_gp  CHAR(3)      NOT NULL,
    nome_gp   VARCHAR(80)  NOT NULL,
    cod_pais  INT          NOT NULL,
    qtd_voltas INT         NOT NULL,
    CONSTRAINT pk_corridas PRIMARY KEY (sigla_gp),
    CONSTRAINT fk_corridas_paises FOREIGN KEY (cod_pais) REFERENCES paises (codigo)
);
 
CREATE TABLE participantes (
    sigla_gp         CHAR(3)  NOT NULL,
    num_piloto       INT      NOT NULL,
    posicao_largada  INT      NOT NULL,
    CONSTRAINT pk_participantes PRIMARY KEY (sigla_gp, num_piloto),
    CONSTRAINT fk_participantes_corridas FOREIGN KEY (sigla_gp)   REFERENCES corridas (sigla_gp),
    CONSTRAINT fk_participantes_pilotos  FOREIGN KEY (num_piloto) REFERENCES pilotos (numero)
);
 

 INSERT INTO paises (codigo, nome) VALUES
    (1,  'Brasil'),
    (2,  'Itália'),
    (3,  'França'),
    (4,  'Reino Unido'),
    (5,  'Alemanha'),
    (6,  'Holanda'),
    (7,  'Mônaco'),
    (8,  'Estados Unidos'),
    (9,  'Japão'),
    (10, 'Espanha'),
    (11, 'Austrália'),
    (12, 'Bélgica'),
    (13, 'Áustria');
 
INSERT INTO equipes (sigla, nome, cod_pais) VALUES
    ('FER', 'Scuderia Ferrari',          2),
    ('MCL', 'McLaren',                   4),
    ('WIL', 'Williams',                  4),
    ('MER', 'Mercedes',                  5),
    ('RBR', 'Red Bull Racing',          13),
    ('REN', 'Renault',                   3),
    ('LOT', 'Lotus',                     4),
    ('BRB', 'Brabham',                   4),
    ('HAA', 'Haas',                      8),
    ('AMR', 'Aston Martin',              4);
 
INSERT INTO pilotos (numero, nome, cod_pais, sigla_equipe) VALUES
    (12, 'Ayrton Senna',          1, 'MCL'),
    (6,  'Nelson Piquet',         1, 'BRB'),
    (5,  'Emerson Fittipaldi',    1, 'LOT'),
    (14, 'Rubens Barrichello',    1, 'FER'),
    (19, 'Felipe Massa',          1, 'FER'),
    (11, 'Giancarlo Fisichella',  2, 'REN'),
    (7,  'Jarno Trulli',          2, 'REN'),
    (9,  'Riccardo Patrese',      2, 'WIL'),
    (2,  'Alain Prost',           3, 'WIL'),
    (8,  'Romain Grosjean',       3, 'HAA'),
    (44, 'Lewis Hamilton',        4, 'MER'),
    (33, 'Max Verstappen',        6, 'RBR');
 
INSERT INTO corridas (sigla_gp, nome_gp, cod_pais, qtd_voltas) VALUES
    ('BRA', 'GP do Brasil',          1,  71),
    ('MON', 'GP de Mônaco',          7,  78),
    ('ITA', 'GP da Itália',          2,  53),
    ('GBR', 'GP da Grã-Bretanha',    4,  52),
    ('BEL', 'GP da Bélgica',        12,  44),
    ('JPN', 'GP do Japão',           9,  53),
    ('USA', 'GP dos Estados Unidos', 8,  56),
    ('ESP', 'GP da Espanha',        10,  66),
    ('AUS', 'GP da Austrália',      11,  58),
    ('FRA', 'GP da França',          3,  53),
    ('AUT', 'GP da Áustria',        13,  71),
    ('GER', 'GP da Alemanha',        5,  67);
 
INSERT INTO participantes (sigla_gp, num_piloto, posicao_largada) VALUES
    ('BRA', 33,  1), ('BRA', 44,  2), ('BRA', 12,  3), ('BRA', 2,   4),
    ('BRA', 19,  5), ('BRA', 14,  6), ('BRA', 6,   7), ('BRA', 5,   8),
    ('BRA', 11,  9), ('BRA', 7,  10), ('BRA', 9,  11), ('BRA', 8,  12),
    ('MON', 44,  1), ('MON', 33,  2), ('MON', 12,  3), ('MON', 2,   4),
    ('MON', 8,   5), ('MON', 19,  6), ('MON', 14,  7), ('MON', 9,   8),
    ('ITA', 33,  1), ('ITA', 19,  2), ('ITA', 14,  3), ('ITA', 11,  4),
    ('ITA', 7,   5), ('ITA', 44,  6);
 

 

SELECT pa.nome AS pais, COUNT(*) AS qtd_pilotos
FROM pilotos p
JOIN paises pa ON pa.codigo = p.cod_pais
WHERE pa.nome IN ('Brasil', 'Itália', 'França')
GROUP BY pa.nome;
 

SELECT 'paises'        AS tabela, COUNT(*) AS registros FROM paises
UNION ALL SELECT 'equipes',       COUNT(*) FROM equipes
UNION ALL SELECT 'pilotos',       COUNT(*) FROM pilotos
UNION ALL SELECT 'corridas',      COUNT(*) FROM corridas
UNION ALL SELECT 'participantes', COUNT(*) FROM participantes;
 
SELECT nome
FROM paises
WHERE nome LIKE 'B%L';
 
SELECT p.nome AS piloto, pa.nome AS pais
FROM pilotos p
JOIN paises pa ON pa.codigo = p.cod_pais
WHERE pa.nome IN ('Brasil', 'Itália', 'França');
 
SELECT nome
FROM pilotos;
 
SELECT nome_gp    AS 'Grande Prêmio',
       qtd_voltas AS 'Quantidade de Voltas'
FROM corridas;
 
SELECT p.nome  AS piloto,
       pa.nome AS pais
FROM pilotos p
JOIN paises pa ON pa.codigo = p.cod_pais;
 
ALTER TABLE pilotos
    ADD COLUMN salario DECIMAL(10,2) NULL;
 
UPDATE pilotos SET salario =  95000.00 WHERE numero = 12;  -- Ayrton Senna
UPDATE pilotos SET salario =  80000.00 WHERE numero = 6;   -- Nelson Piquet
UPDATE pilotos SET salario =  70000.00 WHERE numero = 5;   -- Emerson Fittipaldi
UPDATE pilotos SET salario =  85000.00 WHERE numero = 14;  -- Rubens Barrichello
UPDATE pilotos SET salario = 100000.00 WHERE numero = 19;  -- Felipe Massa
UPDATE pilotos SET salario =  60000.00 WHERE numero = 11;  -- Giancarlo Fisichella
UPDATE pilotos SET salario =  75000.00 WHERE numero = 7;   -- Jarno Trulli
UPDATE pilotos SET salario =  70000.00 WHERE numero = 9;   -- Riccardo Patrese
UPDATE pilotos SET salario = 120000.00 WHERE numero = 2;   -- Alain Prost
UPDATE pilotos SET salario =  65000.00 WHERE numero = 8;   -- Romain Grosjean
UPDATE pilotos SET salario = 150000.00 WHERE numero = 44;  -- Lewis Hamilton
UPDATE pilotos SET salario = 150000.00 WHERE numero = 33;  -- Max Verstappen
 
SELECT numero, nome, salario FROM pilotos;  -- conferência
 
SELECT nome, salario
FROM pilotos
WHERE salario BETWEEN 70000 AND 100000;
 
SELECT cod_pais,
       AVG(salario) AS media_salarial
FROM pilotos
GROUP BY cod_pais;

SELECT DISTINCT salario
FROM pilotos
ORDER BY salario ASC;
 

