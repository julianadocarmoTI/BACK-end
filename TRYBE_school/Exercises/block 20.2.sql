/ ********** - Solução dos exercícios SELECT e AS ********** /
/ * 1 - Monte uma query que exiba seu nome da tela * /
SELECT 'Juliana';

/ * 2 - Monte uma query que exiba seu nome, sobrenome e cidade natal * /
SELECT 'Juliana', 'Jordy', 'Belém';

/ * 3 - Monte uma query que, além de exibir todas as informações acima, identifica cada coluna usando o AS , que é chamado de alias na linguagem SQL (alias é como um apelido no português) * /
SELECT 'Juliana' AS Nome, 'Jordy' AS Sobrenome, 'Belém' AS 'Cidade Natal';

/ * 4 - Qual é o resultado de 13 * 8 ? Descubra usando apenas o SELECT * /
SELECT 13 * 8;

/ * 5 - Monte uma query que exiba a data e hora atuais e dê a essa coluna o nome 'Data Atual' * /
SELECT now() AS 'Data Atual';


/ ********** - Soluções Select Coluna ********** /
/ * 1 - Escreva uma query que selecione todas as colunas da tabela city * /
SELECT * FROM sakila.city;

/ * 2 - Escreva uma query que exiba apenas coluna first_name , last_name da tabela customer   * /
SELECT first_name, last_name FROM sakila.customer;

/ * 3 - Escreva uma query que exiba todas as colunas da tabela rental * /
SELECT * FROM sakila.rental;

/ * 4 - Escreva uma query que exiba o título , descrição e data de lançamento dos filmes registrados na tabela Filme * /
SELECT title, description, release_year FROM sakila.film;


/ ********** - Soluções CONCAT ********** /
/ * 1 - Na tabela sakila.film , monte uma query que exiba o título e o ano de lançamento dos filmes em uma única coluna e dê a ela o nome 'Lançamento do Filme' * /
SELECT CONCAT(title, ' ', release_year) AS 'Lançamento do Filme' FROM sakila.film;

/ * 2 - Na tabela sakila.film , crie uma query que exiba o título do filme e sua classificação indicativa (PG, G, NC-17) em apenas uma coluna. Dê a ela o nome 'Classificação'. Não se esqueça de deixar um espaço entre as palavras para que fiquem legíveis. * /
SELECT CONCAT(title, ' ', rating) AS Classificação FROM sakila.film;

/ * 3 - Na tabela sakila.address , monte uma query que exiba a rua e distrito de cada registro em uma coluna apenas, e dê a ela o nome 'Endereço'. * /


/ ********** - Soluções DISTINCT ********** /
/ * 1 -  Monte uma query para encontrar somente os nomes e idades , ambos únicos * /
SELECT DISTINCT Nome, Idade FROM Alunos;

/ * 2 -  Quantas linhas vocês encontraria no query anterior?  * /
Resposta : 4 linhas

/ * 3 -  Monte uma query para encontrar somente os nomes únicos * /
SELECT DISTINCT Nome FROM Alunos;

/ * 4 -  Quantas linhas vocês encontraria no query anterior?  * /
Resposta : 4 linhas

/ * 5 -  Monte uma query para encontrar somente as idades únicas * /
SELECT DISTINCT Idade FROM Alunos;

/ * 6 -  Quantas linhas vocês encontraria no query anterior? * /
Resposta : 4 linhas


/ ********** - Soluções Count  ********** /
/ * 1 -  Quantas senhas temos cadastradas nessa tabela? * /
Resposta: 1 
SELECT COUNT(password) FROM sakila.staff;

/ * 2 -  Quantas pessoas temos, no total, trabalhando para nossa empresa? * /
Resposta: 2 
SELECT COUNT(*) FROM sakila.staff;

/ * 3 -  Quantos emails temos cadastradas nessa tabela? * /
Resposta: 2 
SELECT COUNT(email) FROM sakila.staff;

/ * 4 -  Monte uma query para mostrar os 10 primeiros resultados a partir da Jennifer * /
SELECT * FROM sakila.actor LIMIT 10 OFFSET 5;


/ ********** - Soluções Desafios Gerais (montar o bolo)  ********** /
/ * 1 -  Escreva uma query que exiba todos os filmes cadastrados no banco de dados * /
SELECT * FROM sakila.film;

/ * 2 -  Escreva uma query que exiba apenas o nome dos filmes , ano de lançamento e classificação * /
SELECT title, rating, release_year FROM sakila.film;

/ * 3 -  Escreva uma query que exiba apenas os sobrenomes únicos cadastrados na tabela actor * /
SELECT DISTINCT(last_name) FROM sakila.actor;

/ * 4 -  Faça queries para descobrir o seguinte: Quantos filmes temos cadastrados?  * /
Resposta: 
SELECT COUNT(*) FROM sakila.film;

/ * 5 -  Quantos clientes temos registrados?  * /
Resposta: 599
SELECT COUNT(*) FROM sakila.customer;

/ * 6 -  Quantos sobrenomes únicos temos na tabela actor? * /
Resposta: 121
SELECT COUNT( DISTINCT last_name) FROM sakila.actor;

/ * 7 -  Quantas categorias de filmes o banco sakila possui?  * /
Resposta: 16
SELECT COUNT(*) FROM sakila.category;

/ * 8 -  Quantos países são atendidos pela sakila?  * /
Resposta: 109
SELECT COUNT(*) FROM sakila.country;

/ * 9 -  Vá até à tabela language do Sakila e crie uma pesquise que mostre os 5 idiomas cadastrados , mas não mostre o idioma "english"  * /
SELECT * FROM sakila.language LIMIT 5 OFFSET 1;

/ * 10 -  Escreva uma query para encontrar os 20 primeiros filmes , incluindo o título , o ano de lançamento, a duração e a classificação , ordenando pelos filmes com a maior duração e depois pelo menor custo de substituição.   * /
SELECT title, release_year, length, replacement_cost, rating FROM sakila.film
ORDER BY length DESC, replacement_cost ASC
LIMIT 20;


/ ********** - Soluções Encontrando dados em um banco de dados - USE Scientists ********** /
/ * 1 -  Escreva uma query para exibir a string "This is SQL Exercise, Practice and Solution". */
USE Scientists;
SELECT 'This is SQL Exercise, Practice and Solution';

/ * 2 -  Escreva uma query para exibir três números em três colunas.  * /
SELECT 1, 2, 3;

/ * 3 -  Escreva uma query para exibir a soma dos números 10 e 15. * /
SELECT 10 + 15;

/ * 4 -  Escreva uma query para exibir o resultado de uma expressão aritmética qualquer. * /
SELECT (3 * 4) + 12;

/ * 5 -  Escreva uma query para exibir todas as informações de todos os cientistas * /
SELECT * FROM Scientists;

/ * 6 -  Escreva uma query para exibir o nome como "Nome do Projeto" e as horas como "Tempo de Trabalho" de cada projeto * /
SELECT Name AS 'Nome do Projeto', Hours AS 'Tempo de Trabalho' FROM Projects;

/ * 7 -  Escreva uma query para exibir o nome dos cientistas em ordem alfabética. * /
SELECT Name FROM Scientists
ORDER BY Name ASC;

/ * 8 -  Escreva uma query para exibir o nome dos Projetos em ordem alfabética descendente.  * /
SELECT Name FROM Projects
ORDER BY Name DESC;

/ * 9 -  Escreva uma query que exiba a string "O projeto Name precisou de Hours horas para ser concluído." para cada projeto. * /
SELECT CONCAT('O projeto ', Name, ' precisou de ', Hours, ' horas para ser concluído.') as resultado FROM Projects;

/ * 10 -  Escreva uma query para exibir o nome e as horas dos três projetos com a maior quantidade de horas. * /
SELECT Name, Hours FROM Projects
ORDER BY Hours DESC LIMIT 3;

/ * 11 -  Escreva uma query para exibir o código de todos os projetos da tabela AssignedTo sem que haja repetições. * /
SELECT DISTINCT Project FROM AssignedTo;

/ * 12 -  Escreva uma query para exibir o nome do projeto com maior quantidade de horas. * /
SELECT Name FROM Projects
ORDER BY Hours DESC
LIMIT 1;

/ * 13 -  Escreva uma query para exibir o nome do segundo projeto com menor quantidade de horas. * /
SELECT Name FROM Projects
ORDER BY Hours ASC
LIMIT 1
OFFSET 1;

/ * 14 -  Escreva uma query para exibir todas as informações dos cinco projetos com a menor quantidade de horas. * /
SELECT * FROM Projects
ORDER BY Hours ASC LIMIT 5;

/ * 15 -  Escreva uma query que exiba a string "Existem Number cientistas na tabela Scientists.", em que Number se refira a quantidade de cientistas. * /
SELECT CONCAT('Existem ', COUNT(Name), ' cientistas na tabela Scientists.') as resultado FROM Scientists;


/ ********** - Bônus - USE PiecesProviders ********** /
/ * 1 -  Escreva uma query para ordenar o nome das empresas de forma alfabética descendente e que retorne somente o código e o nome da primeira empresa. */
USE PiecesProviders;

SELECT Code, Name FROM Providers
ORDER BY Name DESC
LIMIT 1;

/ * 2 -  Escreve uma query para exibir todas as informações das cinco peças com os maiores preços. */
SELECT Piece, Price FROM Provides
ORDER BY Price DESC LIMIT 5;

/ * 3 -  Escreva uma query para exibir o nome das empresas e preço das peças, começando a lista a partir do 3º item, e exibindo o preço das quatro peças mais caras. */
SELECT DISTINCT Provider, Price FROM Provides
ORDER BY Price DESC LIMIT 4 OFFSET 3;

/ * 4 -  Escreva uma query para exibir a string "A peça mais cara é a: Piece , provida pela empresa Provider e custa Price reais.", essa query deve retornar somene uma única string, sendo que Price se refere ao maior preço. */
SELECT CONCAT('A peça mais cara é a: ', Piece, ', provida pela empresa ', Provider, ' e custa ', Price, ' reais.') as resultado FROM Provides
ORDER BY Price DESC
LIMIT 1;
