-- Criação do Bando de Dados
CREATE DATABASE db_Formula1;
USE db_Formula1;

-- Criação da tabela paises para organizar os países cadastrados
CREATE TABLE paises (
    codigo VARCHAR(5) PRIMARY KEY, -- Código identificador do país
    nome VARCHAR(50) NOT NULL -- Nome do país
);

-- Criação da tabela equipes para armazenar as equipes da Fórmula 1
CREATE TABLE equipes (
    sigla VARCHAR(10) PRIMARY KEY, -- Sigla identificadora da equipe
    nome VARCHAR(50) NOT NULL, -- Nome da equipe
    cod_pais VARCHAR(5) NOT NULL, -- Código do país de origem da equipe
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo) -- Relaciona a equipe ao seu país
);

-- Criação da tabela pilotos para guardar os dados dos pilotos
CREATE TABLE pilotos (
    numero INTEGER PRIMARY KEY, -- Número identificador do piloto
    nome VARCHAR(100) NOT NULL, -- Nome completo do piloto
    cod_pais VARCHAR(5) NOT NULL, -- Código do país de nacionalidade do piloto
    sigla_equipe VARCHAR(10) NOT NULL, -- Sigla da equipe à qual o piloto pertence
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo), -- Relaciona o piloto ao seu país
    FOREIGN KEY (sigla_equipe) REFERENCES equipes(sigla) -- Relaciona o piloto à sua equipe
);

-- Criação da tabela corridas para registrar os Grandes Prêmios
CREATE TABLE corridas (
    sigla_gp VARCHAR(10) PRIMARY KEY, -- Sigla identificadora do Grande Prêmio
    nome_gp VARCHAR(100) NOT NULL, -- Nome completo da corrida
    cod_pais VARCHAR(5) NOT NULL, -- Código do país onde a corrida acontece
    voltas INTEGER NOT NULL, -- Quantidade de voltas da corrida
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo) -- Relaciona a corrida ao país onde acontece
);

-- Criação da tabela associativa participantes para relacionar pilotos e corridas
CREATE TABLE participantes (
    sigla_gp VARCHAR(10), -- Sigla do Grande Prêmio
    num_piloto INTEGER, -- Número identificador do piloto
    posicao_larg INTEGER NOT NULL, -- Posição em que o piloto iniciou a corrida
    PRIMARY KEY (sigla_gp, num_piloto), -- Define uma chave primária composta pelos dois campos
    FOREIGN KEY (sigla_gp) REFERENCES corridas(sigla_gp), -- Relaciona o participante à corrida
    FOREIGN KEY (num_piloto) REFERENCES pilotos(numero) -- Relaciona o participante ao piloto
);

-- Inserção dos países e seus respectivos códigos
INSERT INTO paises (codigo, nome) VALUES
('BRA', 'Brasil'),
('ITA', 'Itália'),
('FRA', 'França'),
('GBR', 'Reino Unido'),
('GER', 'Alemanha'),
('ESP', 'Espanha'),
('USA', 'Estados Unidos'),
('JPN', 'Japão'),
('AUS', 'Austrália'),
('CAN', 'Canadá'),
('AUT', 'Áustria'),
('CHE', 'Suíça');

-- Inserção das equipes e seus respectivos países de origem
INSERT INTO equipes (sigla, nome, cod_pais) VALUES
('FER', 'Ferrari', 'ITA'),
('MCL', 'McLaren', 'GBR'),
('MER', 'Mercedes', 'GER'),
('RBR', 'Red Bull Racing', 'AUT'),
('WIL', 'Williams', 'GBR'),
('ALP', 'Alpine', 'FRA'),
('AST', 'Aston Martin', 'GBR'),
('SAU', 'Sauber', 'CHE'),
('HAS', 'Haas', 'USA'),
('LOT', 'Lotus', 'GBR');

-- Inserção dos pilotos, suas nacionalidades e equipes
INSERT INTO pilotos
(numero, nome, cod_pais, sigla_equipe) VALUES
(1, 'Ayrton Senna', 'BRA', 'MCL'),
(2, 'Felipe Massa', 'BRA', 'FER'),
(3, 'Nelson Piquet', 'BRA', 'WIL'),
(4, 'Rubens Barrichello', 'BRA', 'FER'),
(5, 'Emerson Fittipaldi', 'BRA', 'LOT'),
(6, 'Jarno Trulli', 'ITA', 'LOT'),
(7, 'Giancarlo Fisichella', 'ITA', 'FER'),
(8, 'Andrea de Cesaris', 'ITA', 'MCL'),
(9, 'Alain Prost', 'FRA', 'ALP'),
(10, 'Pierre Gasly', 'FRA', 'ALP');

-- Inserção dos Grandes Prêmios, seus países e quantidades de voltas
INSERT INTO corridas
(sigla_gp, nome_gp, cod_pais, voltas) VALUES
('GPBRA', 'Grande Prêmio do Brasil', 'BRA', 71),
('GPITA', 'Grande Prêmio da Itália', 'ITA', 53),
('GPFRA', 'Grande Prêmio da França', 'FRA', 53),
('GPGBR', 'Grande Prêmio da Grã-Bretanha', 'GBR', 52),
('GPGER', 'Grande Prêmio da Alemanha', 'GER', 67),
('GPESP', 'Grande Prêmio da Espanha', 'ESP', 66),
('GPAUS', 'Grande Prêmio da Austrália', 'AUS', 58),
('GPJPN', 'Grande Prêmio do Japão', 'JPN', 53),
('GPCAN', 'Grande Prêmio do Canadá', 'CAN', 70),
('GPUSA', 'Grande Prêmio dos Estados Unidos', 'USA', 56);

-- Inserção dos participantes, relacionando cada piloto à sua corrida e posição de largada
INSERT INTO participantes
(sigla_gp, num_piloto, posicao_larg) VALUES
('GPBRA', 1, 1),
('GPITA', 2, 2),
('GPFRA', 3, 3),
('GPGBR', 4, 4),
('GPGER', 5, 5),
('GPESP', 6, 6),
('GPAUS', 7, 7),
('GPJPN', 8, 8),
('GPCAN', 9, 9),
('GPUSA', 10, 10);

-- Converte os nomes dos países para letras maiúsculas e seleciona aqueles que começam com B e terminam com L
SELECT UPPER(nome)
FROM paises
WHERE nome LIKE 'B%L';

-- Consulta os nomes dos pilotos brasileiros, italianos e franceses
SELECT pilotos.nome
FROM pilotos
INNER JOIN paises
    ON pilotos.cod_pais = paises.codigo
WHERE UPPER(paises.nome) IN ('BRASIL', 'ITÁLIA', 'FRANÇA');

-- Consulta e exibe o nome de todos os pilotos cadastrados
SELECT nome
FROM pilotos;

-- Consulta os nomes dos Grandes Prêmios e suas respectivas quantidades de voltas
SELECT
    nome_gp AS Grande_Premio,
    voltas AS Quantidade_de_Voltas
FROM corridas;

-- Consulta o nome dos pilotos e seus respectivos países
SELECT
    pilotos.nome AS Nome_Piloto,
    paises.nome AS Pais
FROM pilotos
INNER JOIN paises
    ON pilotos.cod_pais = paises.codigo;

-- Adiciona uma nova coluna chamada salario à tabela pilotoss
ALTER TABLE pilotos
ADD COLUMN salario DECIMAL(10,2);

-- Atualiza os salários dos pilotos de acordo com seus números de identificaçãos
UPDATE pilotos
SET salario = CASE
    WHEN numero BETWEEN 1 AND 5 THEN 80000.00
    WHEN numero BETWEEN 6 AND 8 THEN 95000.00
    ELSE 110000.00
END
WHERE numero > 0;

-- Consulta os nomes e salários dos pilotos que recebem entre 70.000,00 e 100.000,00
SELECT nome, salario
FROM pilotos
WHERE salario BETWEEN 70000.00 AND 100000.00;

-- Calcula a média salarial dos pilotos agrupados por país
SELECT
    cod_pais,
   ROUND(AVG(salario),2) AS Media_Salarial
FROM pilotos
GROUP BY cod_pais;

-- Consulta os salários cadastrados sem repetir valores
SELECT DISTINCT salario
FROM pilotos
ORDER BY salario ASC;