/* 
O que vamos explorar:

- Criar consultas avançadas utilizando funções no SQL Server;
- Compreender as funções de manipulação de texto como LOWER, UPPER, CONCAT, LEFT e REPLACE;
- Trabalhar com datas utilizando funções como GETDATE e ISDATE;
- Realizar cálculos com funções numéricas como ROUND, CEILING, FLOOR, POWER, EXP, SQRT e ABS;
- Converter tipos de dados usando a função CONVERT.
*/

-- Para converter os nomes para letras minúsculas, use a função LOWER:

SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO FROM TABELA_DE_CLIENTES;

-- Usando a função UPPER para transformar todos os caracteres em maiúsculos:

SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO, UPPER(NOME) AS NOME_MAIUSCULO FROM TABELA_DE_CLIENTES;

-- Concatenando os campos de endereço com a função CONCAT:

SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO, ' - ', CEP) AS ENDERECO_COMPLETO
FROM TABELA_DE_CLIENTES;

-- Concatenando os campos de endereço utilizando o operador +:

SELECT NOME , ENDERECO_1 + ' ' + BAIRRO + ' ' + CIDADE + ' ' + ESTADO + ' - ' + CEP AS ENDERECO_COMPLETO
FROM TABELA_DE_CLIENTES;

-- Usando a função LEFT para exibir os 3 primeiros caracteres do nome do produto:

SELECT NOME_DO_PRODUTO, LEFT(NOME_DO_PRODUTO,3) AS TRES_PRIMEIROS_CHAR FROM TABELA_DE_PRODUTOS;

-- Substituindo os textos "Litro" e "Litros" por "L" com a função REPLACE:

SELECT TAMANHO, REPLACE((REPLACE(TAMANHO, 'Litros', 'L')),'Litro','L') AS TAMANHO_MODIFICADO FROM TABELA_DE_PRODUTOS;

-- Exemplo de funções de data:

SELECT GETDATE() -- Obtendo a data atual

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS -- Mostrando qual será a data daqui a 10 dias

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
, DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS  -- Exibindo a data de 48 dias atrás

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
, DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS, DATEDIFF (DAY, '2022-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO -- Quantos dias se passaram desde o primeiro dia do ano?

SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS
, DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS, DATEDIFF (HOUR, '2022-01-01', GETDATE()) AS HORAS_DESDE_INICIO_ANO -- Quantas horas se passaram desde o início do ano?

SELECT ISDATE('2020-02-29') -- Verificando se uma data é válida ou não

-- Usando a função ROUND para arredondar um número para um número específico de casas decimais:

SELECT ROUND(3.437, 2),  ROUND(3.433, 2);

-- Usando CEILING para arredondar para o próximo número inteiro maior:

SELECT ROUND(3.437, 2), ROUND(3.433, 2), CEILING(3.433);

-- FLOOR arredonda para o número inteiro inferior mais próximo:

SELECT ROUND(3.437, 2), ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433);

-- A função POWER permite elevar um número a uma determinada potência:

SELECT ROUND(3.437, 2), ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2);

-- EXP retorna o valor de 'e' elevado a uma potência especificada:

SELECT ROUND(3.437, 2), ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2), EXP(3);

-- SQRT retorna a raiz quadrada de um número:

SELECT ROUND(3.437, 2), ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2), EXP(3), SQRT(300);

-- ABS retorna o valor absoluto de um número:

SELECT ROUND(3.437, 2), ROUND(3.433, 2), CEILING(3.433), FLOOR(3.433), POWER (12, 2), EXP(3), SQRT(300), ABS(10), ABS(-10);

-- Para converter uma data em formato texto, use o CONVERT:

SELECT CONVERT(VARCHAR(10), GETDATE(), 121);

-- Convertendo o campo DATA_DE_NASCIMENTO para texto:

SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 121)
FROM TABELA_DE_CLIENTES;

-- Usando a máscara 106 para formatar a data:

SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 106)
FROM TABELA_DE_CLIENTES;

-- Utilizando CONCAT para juntar texto com os dados de um campo:

SELECT NOME_DO_PRODUTO, CONCAT('O preço de lista é: ', PRECO_DE_LISTA) as PRECO
FROM TABELA_DE_PRODUTOS;
