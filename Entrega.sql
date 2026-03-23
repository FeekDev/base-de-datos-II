,
CREATE TABLE vendedor(
	documento numeric(12,0) NOT NULL PRIMARY KEY,
	nombre varchar(35),
	tel numeric(18,0),
	dir varchar(50),
);

CREATE TABLE cliente (
	documento numeric(12,0) NOT NULL PRIMARY KEY,
	nombre varchar(35),
	dir varchar(50),
	cod_pais int
	tel numeric(15,0)
);

CREATE TABLE venta(
	codigo_vta int NOT NULL IDENTITY(1,1) PRIMARY KEY ,
	valor numeric(18,0),
	fecha date,
	factura_num int,
	doc_vendor numeric(12,0) FOREIGN KEY REFERENCES vendedor(documento),
	doc_cli numeric(12,0) FOREIGN KEY REFERENCES cliente(documento),
);

CREATE TABLE productos(
	codigo int NOT NULL PRIMARY KEY IDENTITY(1,1),
	valor numeric(18,0),
	cantidad int,
	nombre varchar(50)
);

CREATE TABLE items_venta(
	codigo_pdt int FOREIGN KEY REFERENCES productos(codigo),
	codigo_vta int FOREIGN KEY REFERENCES venta(codigo_vta),
	id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	valor_vta numeric(18,0),
	cantidad int
);

-- =====================================================
-- INSERCIONES Y ALTERACIONES
-- =====================================================

use productos
go

ALTER TABLE vendedor
ALTER COLUMN dir varchar(50)

ALTER TABLE cliente
ALTER COLUMN dir varchar(50);

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
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2006, 'Catalina Vega', 'Cinta Costera', 591, 3101112223);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES ('Catalina Vega', 2006, 'Cinta Costera', 591, 3101112223);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2007, 'Nicolás Sánchez', 'Av Francisco de Miranda', 862, 3203334445);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2008, 'Gabriela Ruiz', 'Cra 51 #34-56', 170, 3105556667);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2009, 'Felipe Acosta', 'Av Bolívar', 862, 3207778889);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2010, 'Sofía Navarro', 'Cra 54 #91-100', 170, 3109999001);
INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES (2011, 'Carlos Navarro', 'Cra 54 #92-102', 170, 3129999001);

-- INSERTS PARA TABLA PRODUCTOS (CARROS)
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Toyota Corolla', 25000000, 5);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Honda Civic', 27000000, 3);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Mazda CX-5', 32000000, 4);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Hyundai Elantra', 22000000, 6);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Chevrolet Cruze', 24000000, 5);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Ford Focus 2024', 26000000, 4);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Nissan Sentra', 23000000, 5);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Kia Forte', 21000000, 7);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Volkswagen Jetta', 25500000, 4);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('BMW 320i', 55000000, 2);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Volkswagen Gol 5', 26000000, 3);
INSERT INTO productos (nombre, valor, cantidad) VALUES ('Clutch Luk', 600000, 3);

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
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (55000000, '2024-03-02', 1010, 99990, 2010);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (600000, '2026-03-02', 1011, 7778889, 2009);
INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli) VALUES (600000, '2026-03-03', 1012, 555666, 2011);

-- INSERTS PARA TABLA ITEMS_VENTA
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (1, 11, 25000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (2, 12, 27000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (3, 13, 32000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (4, 14, 22000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (5, 15, 24000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (6, 16, 26000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (7, 17, 23000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (8, 18, 21000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (9, 19, 25500000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (10, 20, 55000000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (10, 21, 55000000, 3);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (10, 21, 55000000, 3);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (12, 22, 600000, 1);
INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad) VALUES (12, 23, 30000000, 50);

-- =====================================================
-- CONSULTAS
-- =====================================================

-- Ejercicios Consulta  --

-- Definir base de datos a usar --

use productos
go

-- 1) INNER JOIN (Ventas con Cliente y Vendedor)
SELECT v.codigo_vta, c.nombre, ve.nombre
FROM venta v
INNER JOIN cliente c ON
v.doc_cli = c.documento
INNER JOIN vendedor ve ON
v.doc_vendor = ve.documento

-- 2)  INNER JOIN con detalle (Ventas + Productos)
SELECT i.codigo_vta, p.nombre, 
i.cantidad, p.valor, SUM(i.cantidad * i.valor_vta) AS Subtotal
FROM items_venta i
INNER JOIN productos p ON
i.codigo_pdt = p.codigo
GROUP BY i.codigo_vta, p.nombre, i.cantidad, p.valor;

-- 3) LEFT JOIN (Clientes sin compras)
SELECT c.documento, c.nombre, v.codigo_vta, v.fecha
FROM cliente c -- Izquierda (preferente)
LEFT JOIN venta v ON -- Derecha
c.documento = v.doc_cli
ORDER BY c.nombre

-- 4) RIGHT JOIN (Productos no vendidos)
SELECT p.codigo, p.nombre, i.cantidad
FROM items_venta i -- Izquierda
RIGHT JOIN productos p ON -- Derecha  (Preferente)
p.codigo = i.codigo_pdt

-- 5)  Total vendido por cliente
SELECT c.nombre, SUM(v.valor) AS Valor, COUNT(v.factura_num) AS Facturas
FROM cliente c
JOIN venta v ON
c.documento = v.doc_cli
GROUP BY c.nombre

-- 6) Total vendido por vendedor
SELECT ve.nombre, SUM(v.valor) AS Total_vendido, 
COUNT(v.factura_num) AS Número_de_ventas
FROM vendedor ve
JOIN venta v ON
ve.documento = v.doc_vendor
GROUP BY ve.nombre

-- 7) Producto más vendido (por cantidad)
SELECT p.nombre, COUNT(i.cantidad) AS Cantidad
FROM productos p
JOIN items_venta i ON
p.codigo = i.codigo_pdt
GROUP BY p.nombre


-- 8) Precio máximo y mínimo vendido por producto
SELECT p.nombre, MAX(i.valor_vta * i.cantidad) AS Máximo, 
MIN(i.valor_vta) AS Mínimo
FROM productos p
JOIN  items_venta i ON
p.codigo = i.codigo_pdt
GROUP BY p.nombre

-- 9 – Clientes que hayan comprado más de 1.000.000
SELECT c.nombre, SUM(v.valor) AS Total_Comprado
FROM cliente c
JOIN venta v  ON
c.documento = v.doc_cli
GROUP BY c.nombre
HAVING SUM(v.valor) > 1000000

-- 10 – Productos con más de 50 unidades vendidas
SELECT p.nombre, SUM(i.cantidad) AS Unidades_vendidas
FROM productos p
JOIN items_venta i  ON
p.codigo = i.codigo_pdt
GROUP BY p.nombre
HAVING SUM(i.cantidad) > 50

-- 11 – Reporte completo de ventas por fecha
SELECT SUM(v.valor * i.cantidad) AS Valor_vendido , 
COUNT(v.factura_num) AS Num_Facturas, AVG(v.valor) AS Valor_promedio_X_Venta
FROM venta v
JOIN items_venta i  ON
v.codigo_vta = i.codigo_vta
GROUP BY v.fecha

-- 12 Mejor vendedor
SELECT TOP 1 ven.nombre, SUM(v.valor) AS Total_vendido
FROM venta v
JOIN vendedor ven ON
ven.documento = v.doc_vendor
GROUP BY ven.nombre
ORDER BY Total_vendido DESC
