CREATE DATABASE bradesco;

USE bradesco;


CREATE TABLE clientes (
	codcliente INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
);


SELECT * FROM clientes;

CREATE TABLE vendedores(
	codvendedor INT PRIMARY KEY,
	nome VARCHAR(50) NOT null
);


CREATE TABLE vendas(
	codvendas INT PRIMARY KEY,
	datavenda DATE NOT NULL,
	codcliente INT,
	codvendedor INT
);


ALTER TABLE vendas ADD CONSTRAINT fk_vendas_codcliente FOREIGN KEY (codcliente) REFERENCES clientes (codcliente);

ALTER TABLE vendas ADD CONSTRAINT fk_vendas_codvendedor FOREIGN KEY (codvendedor) REFERENCES vendedores (codvendedor);

DESC vendas

INSERT INTO clientes VALUES (1, 'Robson');
INSERT INTO clientes VALUES (2, 'Rafael');
SELECT * FROM clientes;


INSERT INTO vendedores VALUES (1, 'Amauri');
INSERT INTO vendedores VALUES (2, 'Guilherme');

SELECT * FROM vendedores;

INSERT INTO vendas VALUES (10, "2023-04-27", 2, 1);

SELECT * FROM vendas

SELECT * FROM vendedores

INSERT INTO clientes VALUES (3, 'Robson');
INSERT INTO clientes VALUES (4, 'Francisco');
INSERT INTO clientes VALUES (5, 'André');
INSERT INTO clientes VALUES (6, 'Denilson');
INSERT INTO clientes VALUES (7, 'Maria');
INSERT INTO clientes VALUES (8, 'José');
INSERT INTO clientes VALUES (9, 'Dênis');
INSERT INTO clientes VALUES (10, 'Pedro');


INSERT INTO vendedores VALUES (3, 'Fabrício');
INSERT INTO vendedores VALUES (4, 'Gerson');
INSERT INTO vendedores VALUES (5, 'Vítor');
INSERT INTO vendedores VALUES (6, 'Darley');
INSERT INTO vendedores VALUES (7, 'Alessandro');
INSERT INTO vendedores VALUES (8, 'Kaio');
INSERT INTO vendedores VALUES (9, 'Diego');
INSERT INTO vendedores VALUES (10, 'Rodrigo');


INSERT INTO vendas VALUES (1, "2023-04-27", 9, 2);
INSERT INTO vendas VALUES (2, "2023-04-27", 3, 5);
INSERT INTO vendas VALUES (3, "2023-04-27", 4, 6);
INSERT INTO vendas VALUES (4, "2023-04-27", 5, 8);
INSERT INTO vendas VALUES (5, "2023-04-27", 6, 7);
INSERT INTO vendas VALUES (6, "2023-04-27", 2, 4);
INSERT INTO vendas VALUES (7, "2023-04-27", 8, 10);
INSERT INTO vendas VALUES (8, "2023-04-27", 7, 3);
INSERT INTO vendas VALUES (9, "2023-04-27", 10, 1);
-- 

SELECT * FROM clientes;
SELECT * FROM vendedores;
SELECT * FROM vendas;

ALTER TABLE vendas CHANGE codvendas cod_vendas INT;
ALTER TABLE vendas ADD NOME_VENDA VARCHAR(255);
ALTER TABLE vendas MODIFY COLUMN NOME_VENDA DATE;
ALTER TABLE vendas DROP COLUMN NOME_VENDA;



EXERCICIO ALTERANDO A TABELA

#1) Adicionar uma coluna na tabela vendas a gosto (sendo Varchar 255)
ALTER TABLE vendas ADD OBSERVACOES VARCHAR(255);

#2) Modificar uma coluna na tabela vendas criada no exercício 1 por varchar 100 (tipagem do campo)
ALTER TABLE vendas MODIFY COLUMN OBSERVACOES VARCHAR(100);

#3) Modificar a coluna datavenda na tabela vendas por data_venda
ALTER TABLE vendas CHANGE datavenda data_venda DATE;

#4) Excluir a coluna criada no exercício 1 da tabela vendas*/
ALTER TABLE vendas DROP COLUMN OBSERVACOES;

SELECT * FROM vendas;
DESC vendas;

UPDATE vendedores SET nome = '' WHERE codvendedor=1;

#EXERCICIO UPDATE 

#1) REALIZAR UM UPDATE NA TABELA VENDEDORES, COLOCANDO MAIS UM SOBRENOME EM CADA VENDEDOR (somente em 5 vendedores).
UPDATE vendedores SET nome = 'Amauri Santos' WHERE codvendedor=1;
UPDATE vendedores SET nome = 'Gaby Alves' WHERE codvendedor=2;
UPDATE vendedores SET nome = 'Fabrício Pereira' WHERE codvendedor=3;
UPDATE vendedores SET nome = 'Gerson Silva' WHERE codvendedor=4;
UPDATE vendedores SET nome = 'Vítor Batista' WHERE codvendedor=5;

#2) REALIZAR UM UPDATE NA TABELA CLIENTES, COLOCANDO MAIS UM SOBRENOME EM CADA CLIENTE (somente em 5 clientes).
UPDATE clientes SET nome = 'André Ferreira' WHERE codcliente=5;
UPDATE clientes SET nome = 'Denilson Alcântara' WHERE codcliente=6;
UPDATE clientes SET nome = 'Maria Mendes' WHERE codcliente=7;
UPDATE clientes SET nome = 'José Fernandes' WHERE codcliente=8;
UPDATE clientes SET nome = 'Dênis Marques' WHERE codcliente=9;


SELECT * FROM clientes

SELECT * FROM vendas vd
INNER JOIN vendedores vs
ON vd.codvendedor = vs.codvendedor


SELECT cs.codcliente, COUNT(vd.data_venda) AS qtd
FROM vendas vd
INNER JOIN clientes cs
ON vd.codcliente = cs.codcliente
GROUP BY cs.codcliente
ORDER BY qtd ASC 
LIMIT 10


DESC vendas



#EXERCICIO DE MANIPULAÇÃO

#1)INNER JOIN VENDAS X CLIENTES
SELECT * FROM vendas vd
INNER JOIN clientes cs
ON vd.codcliente = cs.codcliente;

#2)LEFT JOIN VENDAS X VENDEDORES
SELECT * FROM vendas vd
LEFT JOIN vendedores vs
ON vd.codvendedor = vs.codvendedor;

#3)RIGHT JOIN VENDAS X VENDEDORES
SELECT * FROM vendas vd
RIGHT JOIN vendedores vs
ON vd.codvendedor = vs.codvendedor

#4)INNER JOIN VENDAS X CLIENTES e LEFT JOIN VENDAS X VENDEDORES
SELECT * FROM vendas vd
	INNER JOIN clientes cs
	ON cs.codcliente = vd.codcliente
	LEFT JOIN vendedores vs
	ON vd.codvendedor = vs.codvendedor
	
#5)LEFT JOIN VENDAS X CLIENTES e RIGHT JOIN VENDAS X VENDEDORES, GROUP BY POR DATAVENDA, ORDER BY DESC POR DATAVENDA E UM LIMIT DE 1
SELECT vd.datavenda, COUNT(vd.codvendedor) FROM vendas vd
	LEFT JOIN clientes cs
	ON cs.codcliente = vd.codcliente
	RIGHT JOIN vendedores vs
	ON vd.codvendedor = vs.codvendedor
	GROUP BY vd.datavenda
	ORDER BY datavenda desc
	LIMIT 1;


DESC vendas;
DESC vendedores;
DESC clientes;

