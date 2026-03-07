-- Clasificación clientes

SELECT documento, nombre,
COUNT(v.codigo_vta) as cant_ventas,-- cuenta todo los registros
CASE
WHEN count(v.codigo_vta)  >= 10 THEN 'Cliente premium'
WHEN count(v.codigo_vta)  > 0 THEN 'Cliente frecuente'
ELSE 'Cliente poco frecuente'
END AS Tipo_cliente
FROM cliente c
LEFT JOIN venta v on v.doc_cli = c.documento
GROUP BY c.documento, c.nombre