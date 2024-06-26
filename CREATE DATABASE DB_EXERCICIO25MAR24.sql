CREATE DATABASE DB_EXERCICIO25MAR24;

DROP DATABASE DB_EXERCICIO25MAR24;

CREATE TABLE IF NOT EXISTS Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    STATUS VARCHAR(30) DEFAULT 'ATIVO',
    Fcidade VARCHAR (30),
    PRIMARY KEY (Fcodigo)
);

CREATE TABLE IF NOT EXISTS Peca(
    Pcodigo INT NOT NULL,
    Pnome VARCHAR(30) NOT NULL,
    Cor VARCHAR(30) NOT NULL,
    Peso NUMERIC (7,2) NOT NULL,
    Pcidade VARCHAR(30) NOT NULL,
    PRIMARY KEY (Pcodigo)
);

CREATE TABLE IF NOT EXISTS Instituicao(
    Icodigo INT NOT NULL,
    Inome VARCHAR(30) NOT NULL,
    PRIMARY KEY (Icodigo)
   
);

CREATE TABLE IF NOT EXISTS Projeto(
    PRcodigo INT NOT NULL,
    PRnome VARCHAR(30) NOT NULL,
    PRcidade VARCHAR(30) NOT NULL,
    Icodigo INT,
    FOREIGN KEY (Icodigo) REFERENCES Instituicao,
    PRIMARY KEY (PRcodigo)
);

CREATE TABLE IF NOT EXISTS Fornecimento(
    ID SERIAL PRIMARY KEY,
    Fcodigo INTEGER,
    Pcodigo INT,
    PRcodigo INT,
    Quantidade INT,
    FOREIGN KEY(Fcodigo) REFERENCES Fornecedor,
    FOREIGN KEY(Pcodigo) REFERENCES Peca,
    FOREIGN KEY(PRcodigo) REFERENCES Instituicao
);



CREATE TABLE IF NOT EXISTS Cidade(
    Ccodigo INT NOT NULL,
    Cnome VARCHAR(30) NOT NULL,
    UF VARCHAR(30)NOT NULL,
    PRIMARY KEY (Ccodigo)
   
);

ALTER TABLE Fornecedor ADD Fone INT;

ALTER TABLE peca ADD FOREIGN KEY(Ccodigo) REFERENCES Cidade;

ALTER TABLE peca DROP Pcidade;

ALTER TABLE Projeto DROP PRcidade;

ALTER TABLE Projeto DROP Icodigo;

ALTER TABLE Projeto ADD Ccodigo VARCHAR(30);

ALTER TABLE Projeto ADD CONSTRAINT FOREIGN KEY(Ccodigo) REFERENCES Cidade;

DROP TABLE Instituicao;



