-- Criando o banco de dados
CREATE DATABASE GerenciamentoVendas;
USE GerenciamentoVendas;

-- Tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefone VARCHAR(15),
    Endereco TEXT
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Estoque INT NOT NULL
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataPedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabela de Itens do Pedido (relação muitos-para-muitos entre Pedidos e Produtos)
CREATE TABLE ItensPedido (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

-- Tabela de Pagamentos
CREATE TABLE Pagamentos (
    PagamentoID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    Valor DECIMAL(10,2) NOT NULL,
    MetodoPagamento ENUM('Cartao', 'Boleto', 'Pix', 'Dinheiro') NOT NULL,
    DataPagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);
