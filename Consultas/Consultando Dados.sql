/* 
1) Clique com o botão direito do mouse sobre o item "Diagrama de Banco de Dados" e selecione "Novo Diagrama de Banco de Dados".

2) Acesse o SQL Server Management Studio e examine as tabelas do banco de dados de vendas da empresa de sucos de frutas:

3) As tabelas disponíveis são:

TABELA_DE_VENDEDORES - Contém informações sobre os vendedores que realizaram as vendas.
TABELA_DE_PRODUTOS - Contém a lista dos produtos oferecidos pela empresa.
TABELA_DE_CLIENTES - Contém os dados dos clientes que adquiriram os produtos.
NOTAS_FISCAIS - Contém as notas fiscais das vendas realizadas.
ITEMS_NOTAS_FISCAIS - Contém os itens das notas fiscais.

4) No esquema visual, clique no ícone para fixar a janela.

5) Clique em "Nova Consulta" para inserir o código e realizar consultas.
*/

-- Consulta para exibir todos os dados de uma tabela:

SELECT * FROM TABELA_DE_CLIENTES;

-- Exemplo de consulta com filtros aplicados:

SELECT CPF, NOME, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;

-- Utilizando Alias para renomear colunas:

SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DO CLIENTE], BAIRRO, CIDADE FROM TABELA_DE_CLIENTES TDC;

-- Usando Alias para referenciar as colunas:

SELECT [TDC].[CPF], [TDC].[NOME] FROM [TABELA_DE_CLIENTES] [TDC];

-- Exemplo de consulta com cláusula WHERE para aplicar filtro:

SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '290478';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'PET';
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'pet';
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE > 20;
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <= 18;
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <> 18;
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= '1995-11-14';
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO >= 'Lapa';

-- Exemplos de filtros lógicos mais complexos:

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470 ml');
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR SABOR = 'Laranja' OR SABOR = 'Melancia';

SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo') AND IDADE >= 20;
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo') AND (IDADE >= 20 AND IDADE <= 25);
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'São Paulo') AND (IDADE BETWEEN 20 AND 25);

-- Utilizando o operador LIKE para buscar padrões:

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Limao';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca%';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%';
SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR LIKE 'Morango%') AND (EMBALAGEM = 'PET');
