/*
Passos para o processo:

1) No SQL Server Management Studio (SSMS) aberto, clique no ícone "Nova consulta".
2) Selecione a base de dados SUCOS_FRUTAS e abra uma nova janela para consulta de dados.
3) Retorne ao esquema que está ancorado.
*/

-- Exibindo a tabela de vendedores, em seguida, visualizando a tabela de Notas Fiscais:

SELECT * FROM TABELA_DE_VENDEDORES;

SELECT * FROM NOTAS_FISCAIS;

-- Realizando um JOIN para exibir o nome do vendedor, associando as tabelas de vendedores e Notas Fiscais:

SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM NOTAS_FISCAIS 
INNER JOIN TABELA_DE_VENDEDORES
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY  NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

-- Usando Alias para melhorar a legibilidade da consulta:

SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM NOTAS_FISCAIS NF
INNER JOIN TABELA_DE_VENDEDORES TV
ON NF.MATRICULA = TV.MATRICULA
GROUP BY  NF.MATRICULA, TV.NOME;

-- Realizando JOIN entre as tabelas de clientes e notas fiscais utilizando CPF:

SELECT 
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF;

-- Utilizando DISTINCT para exibir apenas clientes que realizaram compras:

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF;

-- Inserindo um novo cliente na tabela de clientes:

INSERT INTO TABELA_DE_CLIENTES
(CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE,
GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES ('23412632331', 'Juliana Silva', 'R. Tramandai','','Bangu','Rio de Janeiro','RJ','23400000',
'1989-02-04',33,'F',180000,24500, 0);

-- Exibindo a quantidade total de clientes cadastrados e quantos realizaram compras:

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF;

-- Utilizando LEFT JOIN para exibir todos os clientes, incluindo aqueles sem compras:

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
, NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC 
LEFT JOIN 
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF;

-- Exibindo apenas os clientes que não realizaram vendas utilizando LEFT JOIN e WHERE:

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO
, TC.NOME AS NOME_DO_CLIENTE
FROM TABELA_DE_CLIENTES TC 
LEFT JOIN 
NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL;

-- Calculando o preço médio das embalagens dos produtos:

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

-- Usando HAVING para filtrar e mostrar embalagens com preço médio inferior ou igual a 10:

SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
HAVING AVG(PRECO_DE_LISTA) <= 10;

-- Exemplo de subconsulta para filtrar embalagens com preço médio inferior ou igual a 10:

SELECT MEDIA_EMBALAGENS.EMBALAGEM, 
MEDIA_EMBALAGENS.PRECO_MEDIO FROM
(SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;
