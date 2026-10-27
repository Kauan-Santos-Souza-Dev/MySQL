CREATE DATABASE db_formula1;
USE db_formula1;
 
-- TABELAS
CREATE TABLE paises (
  codigo INT PRIMARY KEY,
  nome VARCHAR(60)
);
 
CREATE TABLE equipes (
  sigla CHAR(3) PRIMARY KEY,
  nome VARCHAR(60),
  cod_pais INT,
  FOREIGN KEY (cod_pais) REFERENCES paises(codigo)
);
 
CREATE TABLE pilotos (
  numero INT PRIMARY KEY,
  nome VARCHAR(80),
  cod_pais INT,
  sigla_equipe CHAR(3),
  FOREIGN KEY (cod_pais) REFERENCES paises(codigo),
  FOREIGN KEY (sigla_equipe) REFERENCES equipes(sigla)
);
 
CREATE TABLE corridas (
  sigla_gp CHAR(3) PRIMARY KEY,
  nome_gp VARCHAR(80),
  cod_pais INT,
  qtd_voltas INT,
  FOREIGN KEY (cod_pais) REFERENCES paises(codigo)
);
 
CREATE TABLE participantes (
  sigla_gp CHAR(3),
  num_piloto INT,
  posicao_largada INT,
  PRIMARY KEY (sigla_gp, num_piloto),
  FOREIGN KEY (sigla_gp) REFERENCES corridas(sigla_gp),
  FOREIGN KEY (num_piloto) REFERENCES pilotos(numero)
);
 
-- POPULAR AS TABELAS (5 pilotos do Brasil, 3 da Itália, 2 da França)
INSERT INTO paises VALUES
(1, 'Brasil'), (2, 'Itália'), (3, 'França'), (4, 'Reino Unido'), (5, 'Mônaco');
 
INSERT INTO equipes VALUES
('FER', 'Ferrari', 2),
('MCL', 'McLaren', 4),
('WIL', 'Williams', 4),
('REN', 'Renault', 3),
('LOT', 'Lotus', 4);
 
INSERT INTO pilotos VALUES
(12, 'Ayrton Senna', 1, 'MCL'),
(6, 'Nelson Piquet', 1, 'WIL'),
(5, 'Emerson Fittipaldi', 1, 'LOT'),
(14, 'Rubens Barrichello', 1, 'FER'),
(19, 'Felipe Massa', 1, 'FER'),
(11, 'Giancarlo Fisichella', 2, 'REN'),
(7, 'Jarno Trulli', 2, 'REN'),
(9, 'Riccardo Patrese', 2, 'WIL'),
(2, 'Alain Prost', 3, 'MCL'),
(8, 'Romain Grosjean', 3, 'LOT');
 
INSERT INTO corridas VALUES
('BRA', 'GP do Brasil', 1, 71),
('MON', 'GP de Mônaco', 5, 78),
('ITA', 'GP da Itália', 2, 53);
 
INSERT INTO participantes VALUES
('BRA', 12, 1), ('BRA', 2, 2), ('BRA', 19, 3),
('MON', 12, 1), ('MON', 2, 2),
('ITA', 11, 1), ('ITA', 7, 2);
 
-- 3. Países que começam com B e terminam com L
SELECT nome FROM paises WHERE nome LIKE 'B%L';
 
-- 4. Pilotos do Brasil, Itália e França
SELECT pilotos.nome
FROM pilotos JOIN paises ON codigo = cod_pais
WHERE paises.nome IN ('Brasil', 'Itália', 'França');
 
-- 5. Nome dos pilotos
SELECT nome FROM pilotos;
 
-- 6. Nome dos GPs e quantidade de voltas (com ALIAS)
SELECT nome_gp AS gp, qtd_voltas AS voltas FROM corridas;
 
-- 7. Nome dos pilotos e seus países
SELECT pilotos.nome, paises.nome
FROM pilotos JOIN paises ON codigo = cod_pais;
 
-- 8. Inserir o atributo salário
ALTER TABLE pilotos ADD salario DECIMAL(10,2);
 
-- 9. Popular o salário
UPDATE pilotos SET salario = 95000 WHERE numero = 12;
UPDATE pilotos SET salario = 80000 WHERE numero = 6;
UPDATE pilotos SET salario = 70000 WHERE numero = 5;
UPDATE pilotos SET salario = 85000 WHERE numero = 14;
UPDATE pilotos SET salario = 100000 WHERE numero = 19;
UPDATE pilotos SET salario = 60000 WHERE numero = 11;
UPDATE pilotos SET salario = 75000 WHERE numero = 7;
UPDATE pilotos SET salario = 70000 WHERE numero = 9;
UPDATE pilotos SET salario = 120000 WHERE numero = 2;
UPDATE pilotos SET salario = 65000 WHERE numero = 8;
 
-- 10. Pilotos com salário entre 70 e 100 mil
SELECT nome FROM pilotos WHERE salario BETWEEN 70000 AND 100000;
 
-- 11. Média salarial por cod_pais
SELECT cod_pais, AVG(salario) FROM pilotos GROUP BY cod_pais;
 
-- 12. Salários diferentes em ordem crescente
SELECT DISTINCT salario FROM pilotos ORDER BY salario;







