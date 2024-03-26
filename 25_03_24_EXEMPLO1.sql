CREATE DATABASE AULA_SQL;

DROP DATABASE AULA_SQL;

 CREATE DATABASE DB_AULA25MAR24;

--comando sql para criar tabela
CREATE TABLE Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR (30)
);

--selecionar dados na tabela
SELECT * FROM Fornecedor;

--cria a tabela se ela nao existir 
--se ela exisitr nao acontace nada inclusive erro
CREATE TABLE IF NOT EXISTS Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR (30)
);

CREATE TABLE IF NOT EXISTS Departamento(
    Dcodigo INT NOT NULL,
    Dnome VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30),
    PRIMARY KEY (Dcodigo)
);

--criação de tabela com foreing key
CREATE TABLE IF NOT EXISTS Empregado(
    Ecodigo INT NOT NULL,
    Enome VARCHAR(40) NOT NULL,
    CPF VARCHAR(15) NOT NULL,
    Salario DECIMAL(7,2),
    Dcodigo INT NOT NULL,
    PRIMARY KEY (Ecodigo,Enome),
    FOREIGN KEY (Dcodigo) REFERENCES Departamento
);

--alterar tabelas com o ALTER TABLE 

--ADD coluna

ALTER TABLE Empregado ADD sexo CHAR(1);

--renomear tabela

ALTER TABLE Emprego RENAME TO Funcionario;

--Drop coluna

ALTER TABLE Emprego DROP sexo;

--alter table tabela change campo nome tipo_dado;
ALTER TABLE Fornecedor ALTER COLUMN Status TYPE INT ativo TYPE BOOLEAN;

--EXIBIR

DROP TABLE Emprado;

