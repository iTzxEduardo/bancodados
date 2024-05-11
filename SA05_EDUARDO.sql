CREATE DATABASE SA05_EDUARDO;
DROP DATABASE SA05_EDUARDO;


CREATE TABLE IF NOT EXISTS Clientes(
    ID SERIAL,
    Nome VARCHAR (50) NOT NULL,
    Sobrenome VARCHAR (50) NOT NULL,
    Email VARCHAR (50) NOT NULL,
    PRIMARY KEY (ID)
);

ALTER TABLE Clientes ADD CONSTRAINT Email UNIQUE (Email);


CREATE TABLE IF NOT EXISTS Pedidos(
    ID SERIAL,
    ID_Clientes INT ,
    Data_Pedido VARCHAR (50) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN kEY (ID_Clientes) REFERENCES Clientes (ID)
);

 
CREATE TABLE IF NOT EXISTS Produtos(
    ID SERIAL,
    Nome VARCHAR (50) NOT NULL,
    Descricao VARCHAR (50) NOT NULL,
    Preco INT NOT NULL, 
    PRIMARY KEY(ID)
);

ALTER TABLE Produtos ADD CONSTRAINT preco_positive CHECK (Preco >= 0);



CREATE TABLE IF NOT EXISTS Categorias(
    ID SERIAL,
    Nome VARCHAR (50) NOT NULL,
    PRIMARY KEY (ID)
);


CREATE TABLE IF NOT EXISTS Pedidos_Produtos(
    ID_Pedido INT,
    ID_Produto INT,
    FOREIGN KEY(ID_Pedido) REFERENCES Pedidos (ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
);


CREATE TABLE IF NOT EXISTS Produtos_Categorias(
    ID_Produto INT,
    ID_Categoria INT,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID)
);


CREATE TABLE IF NOT EXISTS Empregados(
    ID SERIAL,
    Nome VARCHAR (50) NOT NULL,
    Sobrenome VARCHAR (50) NOT NULL,
    Cargo VARCHAR (50) NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT valid_cargo CHECK (Cargo IN ('Gerente', 'Vendedor', 'Atendente'))
);


CREATE TABLE IF NOT EXISTS Vendas(
    ID SERIAL,
    ID_Produto INT,
    ID_Cliente INT,
    Data_Venda DATE,
    Quantidade INT,
    Cargo VARCHAR (50) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
    );

    
ALTER TABLE Clientes ADD Telefone VARCHAR(20);

UPDATE Produtos SET Descricao = NULL WHERE Descricao = '';

ALTER TABLE Pedidos DROP CONSTRAINT pedidos_id_clientes_fkey;

ALTER TABLE Empregados RENAME TO Funcionarios;



INSERT INTO Clientes (Nome, Sobrenome, Email) VALUES 
    ('João', 'João', 'joao@example.com'),
    ('Jo', 'Jo', 'Jo@example.com'),
    ('Maria', 'Maria', 'maria@example.com'),
    ('Ma', 'Ma', 'Ma@example.com'),
    ('Du', 'Du', 'Du@example.com');

    
INSERT INTO Pedidos (ID_Clientes, Data_Pedido) VALUES 
    (1, '2024-04-15'), 
    (2, '2024-04-16'), 
    (3, '2024-03-17'), 
    (4, '2024-03-18'), 
    (5, '2024-02-19'), 
    (6, '2024-02-20'), 
    (7, '2024-02-21'), 
    (8, '2024-02-22'), 
    (9, '2024-01-23'), 
    (10, '2024-01-24'); 

    INSERT INTO Produtos (Nome, Descricao, Preco)  VALUES 
    ('Camisa', 'Camisa de algodão', 25),
    ('Calça Jeans', 'Calça jeans masculina', 40),
    ('Tênis', 'Tênis esportivo', 60),
    ('Jaqueta', 'Jaqueta de couro', 80),
    ('Vestido', 'Vestido de festa', 50),
    ('Sapato', 'Sapato social', 45),
    ('Blusa', 'Blusa de frio', 30),
    ('Bermuda', 'Bermuda casual', 35),
    ('Saia', 'Saia rodada', 20),
    ('Blazer', 'Blazer feminino', 70),
    ('Moletom', 'Moletom com capuz', 55),
    ('Sapatenis', 'Sapatênis masculino', 50),
    ('Legging', 'Legging fitness', 25),
    ('Coturno', 'Coturno militar', 65),
    ('Sandália', 'Sandália feminina', 40);



INSERT INTO Pedidos_Produtos (ID_Pedido, ID_Produto) VALUES
    (1, 1), 
    (1, 2), 
    (1, 3); 

    INSERT INTO Categorias (Nome) VALUES
    ('Roupas'),
    ('Calcados'),
    ('Acessrios'),
    ('Eletronicos'),
    ('Cosmeticos');


INSERT INTO Produtos_Categorias (ID_Produto, ID_Categoria) VALUES
    (1, 1),   
    (2, 2),  
    (3, 3); 

INSERT INTO Funcionarios (Nome, Sobrenome, Cargo)  VALUES 
    ('João', 'Silva', 'Gerente'),
    ('Maria', 'Santos', 'Vendedor'),
    ('Pedro', 'Costa', 'Atendente'),
    ('Ana', 'Martins', 'Vendedor'),
    ('Carlos', 'Oliveira', 'Atendente');

INSERT INTO Vendas (ID_Produto, ID_Cliente, Data_Venda, Quantidade, Cargo)  VALUES 
    (1, 1, '2024-04-15', 2, 'Vendedor'),  
    (2, 2, '2024-01-16', 1, 'Atendente'), 
    (3, 3, '2024-01-17', 3, 'Vendedor'),  
    (4, 1, '2024-02-18', 1, 'Vendedor'),  
    (5, 4, '2024-03-19', 2, 'Atendente'), 
    (6, 5, '2024-02-20', 1, 'Vendedor');  

    UPDATE Produtos SET Preco = 50 WHERE ID = 1;

   UPDATE Funcionarios SET Cargo = 'Vendedor' WHERE ID = 1;


DELETE FROM Pedidos WHERE ID_Clientes = (SELECT ID FROM Clientes WHERE Nome = 'Jo');

DELETE FROM Clientes WHERE Nome = 'Jo';






