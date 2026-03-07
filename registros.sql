-- INSERTS PARA TABLA VENDEDOR
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (123456, 'Carlos Mendoza', 3101234567, 'Cra 50 #85-10');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (7654321, 'Juan Pérez', 3207654321, 'Cra 43 #23-45');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (9876543, 'María García', 3109876543, 'Cra 45 #67-89');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (234567, 'Roberto Silva', 3102345678, 'Cra 52 #34-56');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (8765432, 'Ana López', 3208765432, 'Cra 48 #78-90');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (1112223, 'Luis Martínez', 3101112223, 'Cra 44 #11-22');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (3334445, 'Sandra Rodríguez', 3203334445, 'Cra 51 #33-44');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (555666, 'Fernando Díaz', 3105556667, 'Cra 49 #55-66');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (7778889, 'Patricia Gómez', 3207778889, 'Cra 46 #77-89');
INSERT INTO vendedor (documento, nombre, tel, dir) VALUES (99990, 'Miguel Torres', 3109999001, 'Cra 47 #99-100');

-- INSERTS PARA TABLA CLIENTE
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2001, 'Diego Ramírez', 'Cra 53 #12-25', 170, 3101234567);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2002, 'Laura Castillo', 'Cra 42 #45-67', 170, 3207654321);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2003, 'Andrés Morales', 'Cra 55 #78-90', 170, 3109876543);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2004, 'Valentina Cruz', 'Av Paseo Diag 26 #56-14', 591, 3102345678);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2005, 'Javier Reyes', 'Casco Viejo', 591, 3208765432);
INSERT INTO cliente (nombre, documento, dir, cod_pais, tel) VALUES ('Catalina Vega', 2006, 'Cinta Costera', 591, 3101112223);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2007, 'Nicolás Sánchez', 'Av Francisco de Miranda', 862, 3203334445);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2008, 'Gabriela Ruiz', 'Cra 51 #34-56', 170, 3105556667);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2009, 'Felipe Acosta', 'Av Bolívar', 862, 3207778889);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2010, 'Sofía Navarro', 'Cra 54 #91-100', 170, 3109999001);

-- INSERTS PARA TABLA PRODUCTOS (CARROS)
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Toyota Corolla 2024', 25000000, 5);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Honda Civic 2024', 27000000, 3);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Mazda CX-5 2024', 32000000, 4);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Hyundai Elantra 2024', 22000000, 6);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Chevrolet Cruze 2024', 24000000, 5);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Ford Focus 2024', 26000000, 4);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Nissan Sentra 2024', 23000000, 5);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Kia Forte 2024', 21000000, 7);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Volkswagen Jetta 2024', 25500000, 4);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('BMW 320i 2024', 55000000, 2);

-- INSERTS PARA TABLA VENTA
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (25000000, '2024-01-15', 1001, 123456, 2001);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (27000000, '2024-01-20', 1002, 7654321, 2002);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (32000000, '2024-01-25', 1003, 9876543, 2003);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (22000000, '2024-02-01', 1004, 234567, 2004);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (24000000, '2024-02-05', 1005, 8765432, 2005);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (26000000, '2024-02-10', 1006, 1112223, 2006);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (23000000, '2024-02-15', 1007, 3334445, 2007);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (21000000, '2024-02-20', 1008, 555666, 2008);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (25500000, '2024-02-25', 1009, 7778889, 2009);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (55000000, '2024-03-01', 1010, 99990, 2010);

-- INSERTS PARA TABLA ITEMS_VENTA
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (1, 1, 25000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (2, 2, 27000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (3, 3, 32000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (4, 4, 22000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (5, 5, 24000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (6, 6, 26000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (7, 7, 23000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (8, 8, 21000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (9, 9, 25500000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (10, 10, 55000000, 1);