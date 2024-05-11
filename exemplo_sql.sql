CREATE TABLE Cliente (
id_cliente SERIAL PRIMARY KEY,
celular_cliente VARCHAR(15),
cpf_cliente NOT NULL VARCHAR(14),
nome NOT NULL VARCHAR(100)
)

CREATE TABLE produto (
id_produto SERIAL PRIMARY KEY,
qtde_produto INT,
valo_produto NOT NULL DECIMA(7,2)
)

CREATE TABLE Compra (
id_pedido SERIAL PRIMARY KEY,
data_compra_produto DATE,
id_produto INT,
id_cliente INT,
FOREIGN KEY(id_produto) REFERENCES produto (id_produto)
FOREIGN KEY(id_cliente_REFERENCES Cliente (id_cliente)
)

