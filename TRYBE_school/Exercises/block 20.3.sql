/*** - Alavancando o poder dos principais operadores booleanos e relacionais ***/
/ * 1 -  Precisamos identificar os dados do cliente com o e-mail LEONARD.SCHOFIELD@sakilacustomer.org * /
USE sakila;
SELECT * FROM customer
WHERE email = 'LEONARD.SCHOFIELD@sakilacustomer.org';


/ * 2 -  Precisamos de um relatório dos nomes dos clientes, em ordem alfabética , que não estão mais ativos no nosso sistema e pertencem à loja com o id = 2 , e não inclua o cliente KENNETH no resultado.  * /
USE sakila;
SELECT first_name FROM customer
WHERE active = 0 AND store_id = 2 AND first_name <> 'KENNETH'
ORDER BY first_name;

/ * 3 -  O setor financeiro quer saber título, descrição, ano de lançamento e valor do custo de substituição ( replacement_cost ), dos 100 filmes com o maior custo de substituição, do valor mais alto ao mais baixo, entre os filmes feitos para menores de idade e que têm o custo mínimo de substituição de $18,00 dólares. Em caso de empate, ordene em ordem alfabética pelo título.  * /
USE sakila;
SELECT title, description, release_year, replacement_cost FROM film
WHERE rating <> 'NC-17' AND replacement_cost > 18.00
ORDER BY replacement_cost DESC, title
LIMIT 100;

/ * 4 -  Quantos clientes estão ativos e na loja 1 ?  * /
USE sakila;
SELECT COUNT(*) AS quantidade_de_clientes_ativos FROM customer
WHERE active = 1 AND store_id = 1;

/ * 5 -  Mostre todos os detalhes dos clientes que não estão ativos na loja 1 . */
USE sakila;
SELECT * FROM customer
WHERE active = 0 AND store_id = 1;

/ * 6 -  Precisamos descobrir quais são os 50 filmes feitos apenas para adultos com a menor taxa de aluguel, para que possamos fazer uma divulgação melhor desses filmes. Em caso de empate, ordene em ordem alfabética pelo título.  * /
USE sakila;
SELECT title FROM film
WHERE rating = 'NC-17' 
ORDER BY rental_rate DESC, title
LIMIT 50;


/*** - Como criar pesquisas mais dinâmicas e maleáveis usando o LIKE  ***/
/ * 1 -  Mostre todos os detalhes dos filmes que contêm a palavra ace no nome. * /
USE sakila;
SELECT * FROM film
WHERE title LIKE '%ace%';

/ * 2 -  Mostre todos os detalhes dos filmes cujas descrições finalizam com china . * /
USE sakila;
SELECT * FROM film
WHERE description LIKE '%china';

/ * 3 -  Mostre todos os detalhes dos dois filmes cujas descrições contêm a palavra girl e o título finaliza com a palavra lord . * /
USE sakila;
SELECT * FROM film
WHERE description LIKE '%girl%' AND title LIKE '%lord';

/ * 4 -  Mostre os dois casos em que, a partir do 4° caractere no título do filme, tem-se a palavra gon .  * /
USE sakila;
SELECT * FROM film
WHERE title LIKE '___gon%';

/ * 5 -  Mostre o único caso em que, a partir do 4° caractere no título do filme, tem-se a palavra gon e a descrição contém a palavra Documentary . * /
USE sakila;
SELECT * FROM film
WHERE title LIKE '___gon%' AND description LIKE '%Documentary%';

/ * 6 -  Mostre os dois filmes cujos títulos ou finalizam com academy ou iniciam com mosquito .  * /
USE sakila;
SELECT * FROM film
WHERE title LIKE '%academy' OR title LIKE 'mosquito%';

/ * 7 -  Mostre os seis filmes que contêm as palavras monkey e sumo em suas descrições.  * /
USE sakila;
SELECT * FROM film
WHERE description LIKE '%monkey%' AND description LIKE '%sumo%';


/*** - Englobando uma faixa de resultados com IN e BETWEEN (consolidando o conhecimento) ***/
/ * 1 -  Mostre o nome, sobrenome e e-mail dos clientes com os seguintes sobrenomes: hicks, crawford, henry, boyd, mason, morales e kennedy , ordenados por nome em ordem alfabética. * /
USE sakila;
SELECT first_name, last_name, email FROM customer
WHERE last_name IN('hicks', 'crawford', 'henry', 'boyd', 'mason', 'morales', 'kennedy')
ORDER BY first_name;

/ * 2 -  Mostre o e-mail dos clientes com os address_id 172, 173, 174, 175 e 176 , ordenados em ordem alfabética. * /
USE sakila;
SELECT email FROM customer
WHERE address_id BETWEEN 172 AND 176
ORDER BY email;

/ * 3 -  Descubra quantos pagamentos foram feitos entre 01/05/2005 e 01/08/2005 . Lembre-se de que, no banco de dados, as datas estão armazenadas no formato ano/mês/dia , diferente do formato brasileiro, que é dia/mês/ano . * /
USE sakila;
SELECT COUNT(*) quantidade_de_pagamentos FROM payment
WHERE payment_date BETWEEN '2005-05-01' AND '2005-08-01';

/ * 4 -  Mostre o título, ano de lançamento e duração do empréstimo de todos os filmes com a duração de empréstimo de 3 a 6 . Os resultados devem ser classificados em filmes com maior duração de empréstimo primeiro. Em caso de empate, ordene em ordem alfabética pelo título. * /
USE sakila;
SELECT title, release_year, rental_duration FROM film
WHERE rental_duration BETWEEN 3 AND 6
ORDER BY rental_duration DESC, title;

/ * 5 -  Monte um relatório que exiba o título e classificação dos 500 primeiros filmes direcionados para as classificações indicativas G, PG e PG-13 . Os resultados devem estar ordenados por título. * /
USE sakila;
SELECT title, rating FROM film
WHERE rating IN('G', 'PG', 'PG-13')
ORDER BY title
LIMIT 500;

/*** - Encontrando e separando resultados que incluem datas (treinando consultas com datas) ***/
/ * 1 -  Quantos pagamentos temos com a data de retorno 2005-05-25 ? Há múltiplas maneiras possíveis de encontrar a resposta.  * /
USE sakila;
SELECT COUNT(*) Pagamentos FROM payment
WHERE DATE(payment_date) = '2005-05-25';

/ * 2 -  Quantos pagamentos foram feitos entre 01/07/2005 e 22/08/2005 ?   * /
USE sakila;
SELECT COUNT(*) Pagamentos FROM payment
WHERE payment_date BETWEEN '2005-07-01' AND '2005-08-22';

/ * 3 -  Usando a tabela rental , extraia data, ano, mês, dia, hora, minuto e segundo dos registros com rental_id = 10330. Utilize a coluna rental_date para extrair as informações.  * /
USE sakila;
SELECT DATE(rental_date) AS Data,
YEAR(rental_date) AS Ano ,
MONTH(rental_date) AS Mes,
DAY(rental_date) AS Dia,
HOUR(rental_date) AS Hora,
MINUTE(rental_date) AS Minuto,
SECOND(rental_date) AS Segundo
FROM rental
WHERE rental_id = 10330;

/ * 4 -  Monte uma query que retorne todos os dados do pagamento feito no dia 28/07/2005 a partir das 22 horas .   * /
USE sakila;
SELECT * FROM sakila.payment
WHERE DATE(payment_date) = '2005-07-28' AND HOUR(payment_date) >= 22;


/*** - Filtrando dados de Forma específica ***/
/ * 1 -  Escreva uma query para exibir todas as peças que começam com GR  * /
USE PecasFornecedores;
SELECT * FROM Pecas
WHERE name LIKE 'GR%';

/ * 2 -  Escreva uma query para exibir todos os fornecimentos que contenham a peça com code 2 . Organize o resultado por ordem alfabética de fornecedor. * /
USE PecasFornecedores;
SELECT * FROM Fornecimentos
WHERE peca = 2 ORDER BY fornecedor;

/ * 3 -  Escreva uma query para exibir as peças, preço e fornecedor de todos os fornecimentos em que o código do fornecedor tenha a letra N * /
USE PecasFornecedores;
SELECT peca, preco, fornecedor FROM Fornecimentos
WHERE fornecedor LIKE '%N%';

/ * 4 -  Escreva uma query para exibir todas as informações dos fornecedores que são empresas limitadas (LTDA). Ordene os resultados em ordem alfabética decrescente. * /
USE PecasFornecedores;
SELECT * FROM Fornecedores
WHERE name LIKE '%LTDA' ORDER BY name DESC;

/ * 5 -  Escreva uma query para exibir o número de empresas (fornecedores) que contém a letra F no código * /
USE PecasFornecedores;
SELECT COUNT(*) FROM Fornecedores
WHERE code LIKE '%F%';

/ * 6 -  Escreva uma query para exibir os fornecimentos onde as peças custam mais de R$15,00 e menos de $40,00 . Ordene os resultados por ordem crescente. * /
USE PecasFornecedores;
SELECT * FROM Fornecimentos
WHERE preco BETWEEN 15 AND 40 ORDER BY preco;

/ * 7 -  Escreva uma query para exibir o número de vendas feitas entre o dia 15/04/2018 e o dia 30/07/2019 . * /
USE PecasFornecedores;
SELECT COUNT(*) FROM Vendas
WHERE DATE(order_date) BETWEEN '2018-04-15' AND '2019-07-30';

/*** - Solução dos exercícios Bônus ***/
/ * 1 -  Escreva uma query para exibir todas as informações de todos os cientistas que possuam a letra e em seu nome.  * /
USE Scientists;
SELECT * FROM Scientists
WHERE Name LIKE "%e%";

/ * 2 -  Escreva uma query para exibir o nome de todos os projetos cujo o código inicie com a letra A . Ordene o resultado em ordem alfabética * /
USE Scientists;
SELECT Name FROM Projects
WHERE Code LIKE "A%" ORDER BY Name;

/ * 3 -  Escreva uma query para exibir o código e nome de todos os projetos que possuam em seu código o número 3 . Ordene o resultado em ordem alfabética  * /
USE Scientists;
SELECT Code, Name FROM Projects
WHERE Code LIKE "%3%" ORDER BY Name;

/ * 4 -  Escreva uma query para exibir todos os cientistas (valores numéricos) cujos projetos sejam AeH3 , Ast3 ou Che1  * /
USE Scientists;
SELECT Scientist FROM AssignedTo
WHERE Project IN('AeH3', 'Ast3', 'Che1');

/ * 5 -  Escreva uma query para exibir todas as informações de todos os projetos com mais de 500 horas  * /
USE Scientists;
SELECT * FROM Projects
WHERE Hours > 500;

/ * 6 -  Escreva uma query para exibir todas as informações de todos os projetos cujas horas sejam maiores que 250 e menores 800  * /
USE Scientists;
SELECT * FROM Projects WHERE Hours > 250 AND Hours < 800;
-- ou
SELECT * FROM Projects WHERE Hours BETWEEN 250 AND 800;

/ * 7 -  Escreva uma query para exibir o nome e o código de todos os projetos cujo nome NÃO inicie com a letra A  * /
USE Scientists;
SELECT * FROM Projects WHERE Hours > 250 AND Hours < 800;
-- ou
SELECT * FROM Projects WHERE Hours BETWEEN 250 AND 800;

/ * 8 -  Escreva uma query para exibir o nome de todos os projetos cujo código contenha a letra H * /
USE Scientists;
SELECT Name FROM Projects
WHERE Code LIKE '%H%';
