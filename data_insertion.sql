USE ecommerce;
SHOW TABLES;

-- idClient, Fname, Minit, Lname, CPF, Address
INSERT INTO Clients (Fname, Minit, Lname, CPF, Address) VALUES
			 ('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');


-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
INSERT INTO product (Pname, classification_kids, category, avaliação, size) VALUES
							  ('Fone de ouvido',FALSE,'Eletrônico','4',NULL),
                              ('Barbie Elsa',TRUE,'Brinquedos','3',NULL),
                              ('Body Carters',TRUE,'Vestimenta','5',NULL),
                              ('Microfone Vedo - Youtuber',FALSE,'Eletrônico','4',NULL),
                              ('Sofá retrátil',FALSE,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',FALSE,'Alimentos','2',NULL),
                              ('Fire Stick Amazon',FALSE,'Eletrônico','3',NULL);

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (1, DEFAULT,'compra via aplicativo',NULL,1),
                             (2,DEFAULT,'compra via aplicativo',50,0),
                             (3,'Confirmado',NULL,NULL,1),
                             (4,DEFAULT,'compra via web site',150,0), 
                             (2,DEFAULT,'compra via web site',100,0),
                             (2,DEFAULT,'compra via web site',150,0), 
                             (3,'Confirmado','compra via aplicativo',50,0),
                             (1,DEFAULT,'compra via aplicativo',NULL,1),
                             (2,DEFAULT,NULL,100,0);

-- idPOproduct, idPOorder, poQuantity, poStatus
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
						 (1,1,2,NULL),
                         (2,1,1,NULL),
                         (3,2,1,NULL);

-- storageLocation,quantity
INSERT INTO productStorage (storageLocation,quantity) VALUES
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
INSERT INTO storageLocation (idLproduct, idLstorage, location) VALUES
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');

-- idPsSupplier, idPsProduct, quantity
INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity) VALUES
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
INSERT INTO seller (SocialName, CNPJ, CPF, location, contact) VALUES 
						('Tech eletronics', 123456789456321, NULL, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',285356789471389,123456783,'Rio de Janeiro', 219567895),
						('Kids World',456789123654485,NULL,'São Paulo', 1198657484);

-- idPseller, idProduct, prodQuantity
INSERT INTO productseller (idPseller, idProduct, prodQuantity) VALUES
								(3, 1, 4),
                                (2, 3, 7),
                                (1, 5, 2);

-- idClient, paymentType, limitAvailable                        
INSERT INTO payments (idClient, paymentType, limitAvailable) VALUES
						 (2, 'Cartão', 150),
                         (5, 'Dois cartões', 200),
                         (3, 'Boleto', NULL),
                         (1, 'Boleto', 150),
                         (6, 'Cartão', 300),
                         (4, 'Cartão', NULL);
					
-- idClient, accountType
INSERT INTO accounts (idClient, accountType) VALUES
						 (1, 'PF'),
                         (6, 'PF'),
                         (4, 'PJ');

-- idOrder, idClient, orderStatus, trackingCode                         
INSERT INTO delivery (idOrder, idClient, orderStatus, trackingCode) VALUES
						 (3,  3, 'Em processo', 'BR3086589'),
                         (1,  1, 'Em processo', 'BR1569386'),
                         (2,  2, 'Entregue', 'BR0957357'),
                         (4,  4, 'Enviado', 'BR1524753'),
                         (2,  2, 'Entregue', 'BR3009659'),
                         (4,  4, 'Em processo', 'BR0836525'),
                         (2,  2, 'Entregue', 'BR3847590'),
                         (3,  3, 'Enviado', 'BR0374880');

