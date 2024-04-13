-- DDL (Data Definition Language) Exercícios1:

-- Criar tabela "Clientes"
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

-- Criar tabela "Pedidos"
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Total DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

-- DML (Data Manipulation Language) Exercícios:

-- Inserir três novos clientes
INSERT INTO Clientes (ID, Nome, Sobrenome, Email) VALUES
(1, 'João', 'Silva', 'joao@example.com'),
(2, 'Maria', 'Santos', 'maria@example.com'),
(3, 'Carlos', 'Ferreira', 'carlos@example.com');

-- Inserir cinco novos registros de pedidos associados a diferentes clientes
INSERT INTO Pedidos (ID, ID_Cliente, Data_Pedido, Total, Status) VALUES
(1, 1, '2024-04-01', 100.00, 'Em andamento'),
(2, 1, '2024-04-02', 50.00, 'Finalizado'),
(3, 2, '2024-04-03', 75.00, 'Em andamento'),
(4, 3, '2024-04-04', 200.00, 'Em andamento'),
(5, 2, '2024-04-05', 30.00, 'Cancelado');

-- Atualizar o campo "Total" de um pedido específico
UPDATE Pedidos SET Total = 120.00 WHERE ID = 1;

-- Excluir um cliente e seus respectivos pedidos

DELETE FROM Pedidos WHERE ID_Cliente = 3;
DELETE FROM Clientes WHERE ID = 3;

-- Selecionar todos os pedidos com status "Em andamento"
SELECT * FROM Pedidos WHERE Status = 'Em andamento';

-- Listar o nome do cliente, a data do pedido e o total de cada pedido feito nos últimos 30 dias
SELECT c.Nome, p.Data_Pedido, p.Total
FROM Clientes c
JOIN Pedidos p ON c.ID = p.ID_Cliente
WHERE p.Data_Pedido >= CURRENT_DATE - 30;


----------------------------------------------------------------------------------------------------------------

2 

-- DDL (Data Definition Language) Exercícios 2:

-- Criar tabela "Produtos"
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    CONSTRAINT positive_price CHECK (Preco > 0)
);
CREATE INDEX idx_nome ON Produtos (Nome);

-- Criar tabela "Pedidos"
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    Data DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(20)
);

-- Criar tabela "Pedidos_Produtos"
CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
);

-- Criar tabela "Categorias"
CREATE TABLE Categorias (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Criar tabela de junção "Produtos_Categorias"
CREATE TABLE Produtos_Categorias (
    ID_Produto INT,
    ID_Categoria INT,
    PRIMARY KEY (ID_Produto, ID_Categoria),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID)
);

-- Criar tabela "Funcionários"
CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Cargo VARCHAR(20),
    CONSTRAINT valid_cargo CHECK (Cargo IN ('Gerente', 'Vendedor', 'Atendente'))
);

-- DML (Data Manipulation Language) Exercícios:

-- Inserir cinco novos produtos
INSERT INTO Produtos (ID, Nome, Descricao, Preco) VALUES
(1, 'Produto 1', 'Descrição do Produto 1', 50.00),
(2, 'Produto 2', 'Descrição do Produto 2', 75.00),
(3, 'Produto 3', 'Descrição do Produto 3', 100.00),
(4, 'Produto 4', 'Descrição do Produto 4', 25.00),
(5, 'Produto 5', 'Descrição do Produto 5', 150.00);

-- Associar alguns produtos aos pedidos na tabela "Pedidos_Produtos"
-- Suponha que os pedidos 1, 2 e 3 contenham os produtos 1, 2 e 3, respectivamente
INSERT INTO Pedidos_Produtos (ID_Pedido, ID_Produto) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Atualizar o preço de um produto específico
UPDATE Produtos SET Preco = 60.00 WHERE ID = 1;

-- Excluir um produto da tabela "Produtos" e todos os registros correspondentes na tabela "Pedidos_Produtos"
DELETE FROM Produtos WHERE ID = 4;
DELETE FROM Pedidos_Produtos WHERE ID_Produto = 4;

-- Selecionar todos os produtos de uma categoria específica na tabela "Produtos_Categorias"
-- Suponha que a categoria com ID 1 seja "Eletrônicos"
SELECT p.* 
FROM Produtos p 
JOIN Produtos_Categorias pc ON p.ID = pc.ID_Produto 
WHERE pc.ID_Categoria = 1;

-- Listar todos os funcionários e seus cargos na tabela "Funcionários"
SELECT * FROM Funcionarios;

-- Atualizar o cargo de um funcionário na tabela "Funcionários"
UPDATE Funcionarios SET Cargo = 'Supervisor' WHERE ID = 1;

-- Excluir um funcionário da tabela "Funcionários"
DELETE FROM Funcionarios WHERE ID = 3;

-- Selecionar todos os pedidos
SELECT * FROM Pedidos;

-- Listar os cinco produtos mais caros da tabela "Produtos"
SELECT * FROM Produtos ORDER BY Preco DESC LIMIT 5;

-- Calcular o valor total de todos os pedidos na tabela "Pedidos"
SELECT SUM(Valor) AS Valor_Total FROM Pedidos;

-- Listar todos os clientes que fizeram pelo menos um pedido cancelado
-- Supondo que os pedidos com status 'Cancelado' estejam marcados como tal na tabela "Pedidos"
SELECT c.*
FROM Clientes c
JOIN Pedidos p ON c.ID = p.ID_Cliente
WHERE p.Status = 'Cancelado';

-- Atualizar o status de todos os pedidos para "Finalizado" onde a data do pedido for anterior a uma determinada data
UPDATE Pedidos SET Status = 'Finalizado' WHERE Data < '2024-01-01';

-- Excluir todos os pedidos finalizados há mais de um ano
DELETE FROM Pedidos WHERE Status = 'Finalizado' AND Data < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Selecionar os clientes que fizeram mais de dois pedidos nos últimos três meses
-- Supondo que os pedidos sejam marcados com a data atual na coluna "Data" da tabela "Pedidos"
SELECT c.*
FROM Clientes c
JOIN Pedidos p ON c.ID = p.ID_Cliente
WHERE p.Data >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY c.ID
HAVING COUNT(p.ID) > 2;

-- Listar os pedidos agrupados por status e ordená-los pela data do pedido
SELECT * FROM Pedidos ORDER BY Status, Data;

-- Atualizar o status de todos os pedidos com mais de 30 dias para "Atrasado"
UPDATE Pedidos SET Status = 'Atrasado' WHERE Data < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Calcular o total de vendas por categoria de produto
SELECT c.Nome AS Categoria, SUM(p.Preco) AS Total_Vendas
FROM Produtos_Categorias pc
JOIN Produtos p ON pc.ID_Produto = p.ID
JOIN Categorias c ON pc.ID_Categoria = c.ID
GROUP BY c.Nome;

-- Listar os produtos que nunca foram associados a nenhum pedido na tabela "Pedidos_Produtos"
SELECT p.*
FROM Produtos p
LEFT JOIN Pedidos_Produtos pp ON p.ID = pp.ID_Produto
WHERE pp.ID_Produto IS NULL;
