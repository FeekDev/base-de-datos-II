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