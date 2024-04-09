CREATE DATABASE exercicio_db;

DROP TABLE Clientes;
DROP TABLE Pedidos;

CREATE TABLE IF NOT EXISTS Clientes(
    ID INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Sobrenome VARCHAR(30) NOT NULL,
    Email VARCHAR (30) NOT NULL,
    PRIMARY KEY (ID)
);

ALTER TABLE Clientes ADD CONSTRAINT Email UNIQUE (Email);

SELECT * FROM Pedidos;

CREATE TABLE IF NOT EXISTS Pedidos(
    ID INT NOT NULL,
    ID_Pedido INT NOT NULL,
    Data_Pedido DATE NOT NULL,
    Total INT NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Clientes(ID),
    PRIMARY KEY (ID)
);

ALTER TABLE Pedidos ADD Status VARCHAR(20) DEFAULT 'EM ANDAMENTO';

INSERT INTO Clientes (ID, Nome, Sobrenome, Email) VALUES
    (1, 'João', 'João', 'jo@jo.com'),
    (2, 'Maria', 'Maria', 'ma@ma.com'),
    (3, 'Pedro', 'Pedro', 'pe@pe.com');

    INSERT INTO Pedidos (ID, ID_Pedido, Data_Pedido, Total, Status) VALUES
    ( 1,1, '2024-04-08', '100', 'Em andamento'),
    ( 2, 2,'2024-04-08', '150', 'Em andamento'),
    (3,1, '2024-04-07', '200', 'Finalizado'),
    (4,3, '2024-04-07', '120', 'Cancelado'),
    (5, 2,'2024-04-06', '80', 'Finalizado');

    UPDATE Pedidos SET Total = 200 WHERE ID = 1;

BEGIN TRANSACTION; 
DELETE FROM Pedidos WHERE ID_Pedido = 1;
DELETE FROM Clientes WHERE ID = 1;
COMMIT;

SELECT * FROM Pedidos WHERE Status = 'Em andamento';

SELECT c.Nome AS Nome_Cliente, p.Data_Pedido, p.Total
FROM Clientes c
JOIN Pedidos p ON c.ID = ID_Pedido
WHERE p.Data_Pedido BETWEEN DATE('2024-03-09') AND DATE('2024-04-08');

---------------------------------------------------------------------------------------------------------------------
CREATE DATABASE exercicio_db2;

DROP TABLE Produtos;

CREATE TABLE IF NOT EXISTS Produtos(
    ID INT NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Descricao VARCHAR(30) NOT NULL,
    Preco INT NOT NULL,
    PRIMARY KEY (ID)
);

ALTER TABLE Produtos ADD CONSTRAINT Preco CHECK (Preco >= 0);


CREATE TABLE IF NOT EXISTS Pedidos(
    ID INT NOT NULL,
    Data_Pedido DATE NOT NULL,
    Valor INT NOT NULL,
    Status VARCHAR (30) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Pedidos_Produtos(
    ID_Pedido INT,
    ID_Produto INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
    );

    CREATE INDEX idx_Nome ON Produtos (Nome);

CREATE TABLE IF NOT EXISTS Categorias(
    ID INT NOT NULL,
    Nome VARCHAR (50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Produtos_Categorias(
    ID_Produto INT,
    ID_Categorias INT,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Categorias) REFERENCES Categorias(ID)
    );





