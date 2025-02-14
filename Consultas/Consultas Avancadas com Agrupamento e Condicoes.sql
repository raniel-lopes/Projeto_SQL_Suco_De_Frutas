/*
1) Abra o SQL Server Management Studio (SSMS) e verifique a conexão com o banco de dados.
2) Confirme que o esquema está ancorado corretamente.
3) Clique em "Nova Consulta" para começar a trabalhar com as tabelas.
4) Execute a consulta para visualizar o conteúdo da tabela de produtos.
*/

-- Exibe todos os registros da tabela de produtos
SELECT * FROM TABELA_DE_PRODUTOS;

-- Selecione o campo EMBALAGEM para visualizar os diferentes tipos de embalagem
SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

-- Utilize DISTINCT para exibir somente os tipos únicos de embalagem dos produtos de Maçã
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

-- Exibe combinações únicas de EMBALAGEM e SABOR de todos os produtos
SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

-- Exibe os primeiros 5 produtos cadastrados
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS;

-- Exibe os primeiros 5 produtos com sabor Maçã
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

-- Ordena a tabela de produtos pelo preço de lista de forma ascendente
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA ASC;

-- Exibe produtos ordenados de forma decrescente com base no preço de lista
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

-- Ordena a tabela primeiro por EMBALAGEM e depois por NOME_DO_PRODUTO
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

-- Conta quantos produtos com sabor Laranja existem, agrupados por embalagem
SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_PRODUTOS 
WHERE SABOR = 'Laranja' GROUP BY EMBALAGEM;

-- Exibe a soma do limite de crédito dos clientes agrupados por estado, 
-- somente para estados com soma superior a 900.000
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES 
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

-- Exibe o preço máximo e mínimo de produtos por embalagem com preço superior a 10
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM;

-- Aplica um filtro HAVING para mostrar somente embalagens com preço máximo maior que 20
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAX, MIN(PRECO_DE_LISTA) AS PRECO_MIN
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM
HAVING MAX(PRECO_DE_LISTA) >= 20;

-- Classifica os produtos de acordo com seu preço usando CASE WHEN
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga'
ORDER BY CLASSIFICACAO;

-- Aplica uma análise agrupada para contar a quantidade de produtos em cada categoria de preço
SELECT 
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
      WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO, COUNT(*) AS NUMERO_DE_PRODUTOS
FROM TABELA_DE_PRODUTOS
GROUP BY 
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
      WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END);
