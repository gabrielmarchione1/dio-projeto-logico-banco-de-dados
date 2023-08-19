-- Criação do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(255),
	CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- criar tabela produto
-- size = dimensao do produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(255) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
    avaliação FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_order_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
		ON UPDATE CASCADE
);

-- criar tabela estoque
CREATE TABLE productStorage(
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact VARCHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- criar tabela vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    CPF CHAR(11),
    location VARCHAR(255),
    contact VARCHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- criar tabela produtos vendedor
CREATE TABLE productSeller(
	idPseller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- criar tabela produto pedido
CREATE TABLE productOrder(
	idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível','Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- criar tabela estoque localização
CREATE TABLE storageLocation(
	idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

-- criar tabela produto fornecedor
CREATE TABLE productSupplier(
	idPsSupplier INT,
    idPsProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);

-- criar tabela pagamentos
CREATE TABLE payments(
	idPayment INT AUTO_INCREMENT,
    idClient INT,
    paymentType ENUM('Boleto','Cartão','Dois cartões') NOT NULL,
    limitAvailable FLOAT,
    PRIMARY KEY (idPayment, idClient),
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient)
);


-- criar tabela Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações
CREATE TABLE accounts (
	idAccount INT AUTO_INCREMENT,
    idClient INT,
    accountType ENUM('PJ','PF') NOT NULL,
    PRIMARY KEY (idAccount, idClient),
    CONSTRAINT fk_client_account FOREIGN KEY (idClient) REFERENCES clients(idClient),
    CONSTRAINT unique_account UNIQUE (idClient)
);

-- criar tabela Entrega – Possui status e código de rastreio
CREATE TABLE delivery (
	idDelivery INT AUTO_INCREMENT,
    idOrder INT,
    idClient INT,
    orderStatus ENUM('Em processo','Enviado','Entregue') NOT NULL,
    trackingCode CHAR(9) NOT NULL,
    PRIMARY KEY (idDelivery, idOrder, idClient),
    CONSTRAINT fk_order_delivery FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
);
