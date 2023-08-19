USE ecommerce;
-- Quantos pedidos foram feitos por cada cliente (exiba o nome e o último nome do cliente)?

SELECT CONCAT(Fname,' ', Minit,' ', Lname) AS Nome_Completo, idOrderClient AS ID_Cliente, COUNT(*) AS 'Num. Pedidos'
FROM orders ord
INNER JOIN clients cli ON ord.idOrderClient = cli.idClient
GROUP BY idOrderClient
ORDER BY CONCAT(Fname,' ', Minit,' ', Lname);

-- Quais clientes gastaram 100 reais ou mais comprando via aplicativo?

SELECT idOrderClient, orderDescription, SUM(sendValue) AS Total_gasto
FROM orders
WHERE orderDescription = 'compra via aplicativo'
GROUP BY idOrderClient
HAVING Total_gasto >= 50;

-- Quais clientes pagaram com cartão e tem um limite maior ou igual a 200?

SELECT CONCAT(Fname,' ',Lname) AS Nome_sobrenome, paymentType, limitAvailable
FROM payments pay
INNER JOIN clients cli USING(idClient)
WHERE paymentType = 'Cartão' AND limitAvailable >= 200;

-- Quais clientes possuem conta PF?

SELECT Fname, Lname, CPF, accountType
FROM accounts acc
INNER JOIN clients cli USING(idClient)
WHERE accountType = 'PF';

-- Recuperando quantos pedidos foram realizados pelos clientes
SELECT cli.idClient, Fname, count(*) AS Numero_de_pedidos 
FROM clients cli
INNER JOIN orders ord ON cli.idClient = ord.idOrderClient
GROUP BY idClient; 

-- Verificando quantos pedidos foram entregues, quantos estão em processo e quantos já foram enviados.

SELECT orderStatus, COUNT(*) AS Pedidos
FROM delivery
GROUP BY orderStatus;

-- Relação de nomes dos fornecedores e nomes dos produtos;

SELECT idSupplier, socialName AS Nome_Fornecedor, idProduct, Pname AS Nome_Produto
FROM supplier sup
INNER JOIN productsupplier pro_sup ON sup.idSupplier = pro_sup.idPsSupplier
INNER JOIN product pro ON pro_sup.idPsProduct = pro.idProduct;

-- Relação de produtos fornecedores e estoques

SELECT *
FROM productsupplier pro_sup
INNER JOIN supplier sup ON pro_sup.idPsSupplier = sup.idSupplier;
