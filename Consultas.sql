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
COUNT(v.factura_num) AS N�mero_de_ventas
FROM vendedor ve
JOIN venta v ON
ve.documento = v.doc_vendor
GROUP BY ve.nombre

-- 7) Producto m�s vendido (por cantidad)
SELECT p.nombre, COUNT(i.cantidad) AS Cantidad
FROM productos p
JOIN items_venta i ON
p.codigo = i.codigo_pdt
GROUP BY p.nombre


-- 8) Precio m�ximo y m�nimo vendido por producto
SELECT p.nombre, MAX(i.valor_vta * i.cantidad) AS M�ximo, 
MIN(i.valor_vta) AS M�nimo
FROM productos p
JOIN  items_venta i ON
p.codigo = i.codigo_pdt
GROUP BY p.nombre

-- 9 � Clientes que hayan comprado m�s de 1.000.000
SELECT c.nombre, SUM(v.valor) AS Total_Comprado
FROM cliente c
JOIN venta v  ON
c.documento = v.doc_cli
GROUP BY c.nombre
HAVING SUM(v.valor) > 1000000

-- 10 � Productos con m�s de 50 unidades vendidas
SELECT p.nombre, SUM(i.cantidad) AS Unidades_vendidas
FROM productos p
JOIN items_venta i  ON
p.codigo = i.codigo_pdt
GROUP BY p.nombre
HAVING SUM(i.cantidad) > 50

-- 11 � Reporte completo de ventas por fecha
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

