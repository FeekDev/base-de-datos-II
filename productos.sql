IF OBJECT_ID('productos') is not null
 drop database productos
create database productos;

GO 
USE productos
GO 

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
	cod_pais int,
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

