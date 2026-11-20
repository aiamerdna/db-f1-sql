Formula 1 — Banco de Dados Relacional

-- Sobre o projeto --

O projeto Formula 1 consiste no desenvolvimento de um banco de dados relacional utilizando SQL, com o objetivo de simular o gerenciamento de informações relacionadas ao universo da Fórmula 1. O sistema permite organizar dados de países, equipes, pilotos, corridas e participantes, estabelecendo relacionamentos entre essas entidades e possibilitando a realização de consultas para análise das informações. O projeto foi desenvolvido como parte dos estudos de Análise e Desenvolvimento de Sistemas, com foco na aplicação prática de conceitos de modelagem de dados e manipulação de bancos de dados relacionais.

-- Estrutura --

O banco de dados é composto por 5 tabelas principais:

1. paises: armazena os países cadastrados, identificados por códigos.
2. equipes: registra as equipes da Fórmula 1, seus nomes e países de origem.
3. pilotos: armazena os dados dos pilotos, incluindo número de identificação, nacionalidade, equipe e salário.
4. corridas: registra os Grandes Prêmios, seus países de realização e a quantidade de voltas.
5. participantes: relaciona os pilotos às corridas, registrando suas respectivas posições de largada.

-- Relacionamentos entre as tabelas --

O banco de dados utiliza chaves primárias e estrangeiras para estabelecer a integridade referencial entre as entidades:

- Países e equipes: um país pode estar associado a diversas equipes.
- Países e pilotos: um país pode possuir diversos pilotos cadastrados.
- Equipes e pilotos: uma equipe pode possuir diversos pilotos.
- Países e corridas: um país pode sediar diferentes Grandes Prêmios.
- Pilotos e corridas: possuem um relacionamento muitos para muitos, implementado por meio da tabela associativa participantes.

-- Funcionalidades --
Durante o desenvolvimento, foram utilizados diferentes recursos da linguagem SQL:

1. Criação e estruturação de tabelas

- Criação de tabelas utilizando CREATE TABLE.
- Definição de chaves primárias (PRIMARY KEY).
- Estabelecimento de relacionamentos com chaves estrangeiras (FOREIGN KEY).
- Utilização de restrições de integridade, como NOT NULL.

2. Manipulação de dados

- Inserção de registros com INSERT INTO.
- Atualização de informações com UPDATE.
- Alteração da estrutura de tabelas com ALTER TABLE.
- Adição de novas colunas ao banco de dados.

3. Consultas e filtragem

- Recuperação de informações utilizando SELECT.
- Filtragem de registros com WHERE.
- Utilização de LIKE para pesquisas por padrões de texto.
- Aplicação de BETWEEN para selecionar valores dentro de determinados intervalos.
- Utilização de IN para filtrar múltiplos valores.

4. Relacionamentos e JOINs

- Consultas envolvendo múltiplas tabelas.
- Utilização de INNER JOIN para combinar informações relacionadas.
- Associação de pilotos aos seus respectivos países.

5. Funções SQL
- Foram utilizadas funções para manipulação e análise dos dados:
- UPPER(): converte textos para letras maiúsculas.
- ROUND(): arredonda valores numéricos.
- AVG(): calcula médias salariais.
- DISTINCT: elimina valores duplicados dos resultados.

6. Agrupamento e ordenação

- Utilização de GROUP BY para agrupar pilotos por nacionalidade.
- Aplicação de funções de agregação para calcular médias salariais por país.
- Utilização de ORDER BY para organizar os resultados em ordem crescente.

-- Tecnologias utilizadas --

MySQL: sistema de gerenciamento de banco de dados relacional.
SQL: linguagem utilizada para criação, manipulação e consulta dos dados.

-- Objetivos de aprendizagem --

1. O desenvolvimento deste projeto teve como objetivo aprofundar conhecimentos em:
2. Modelagem e estruturação de bancos de dados relacionais.
3. Criação de tabelas e definição de relacionamentos.
4. Integridade referencial por meio de chaves primárias e estrangeiras.
5. Manipulação e atualização de registros.
6. Consultas envolvendo múltiplas tabelas.
7. Funções de texto e funções de agregação.
8. Agrupamento, filtragem e ordenação de resultados.
