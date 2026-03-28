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

CREATE PROCEDURE Ingresar_actualizar
-- Indicar los campos --
@valor NUMERIC(18,0),
@cantidad INT
@nombre VARCHAR(50)
AS
BEGIN
BEGIN TRY

END TRY
BEGIN CATCH
END CATCH
END

--while--
DECLARE @numero INT = 2
WHILE @numero <= 1000
BEGIN
  IF @numero % 2 = 0
  BEGIN
    PRINT(@numero)
  end
  SET @numero = @numero + 1
end

--

CREATE FUNCTION sumar_numeros
(@a int, @b int)
returns INT
AS
BEGIN
 return @a + @b
END

---

create function items_venta
(
@precio numeric(18,0),
@cantidad int
)
returns numeric(18,0)
as
begin
return declare @subtotal = @precio * @cantidad
end
create function items_venta
(
    @precio numeric(18,0),
    @cantidad int
)
returns numeric(18,0)
as
begin
    declare @subtotal numeric(12,0)
    set @subtotal = @precio * @cantidad
    return @subtotal
end
    SELECT..., dbo.items_venta(200, 2) as subtotal

CREATE FUNCTION Obtenerventa
(
 @codigo_vta INT
)
RETURNS INT
AS
RETURN
(
  SELECT v.codigo_vta, v.fecha_vta, c.nombre, i.precio, i.cantidad
  FROM venta v
  JOIN cliente c ON v.doc_cli = c.documento
  JOIN item_venta i ON v.codigo_vta = i.codigo_vta
  WHERE v.codigo_vta = @codigo_vta
  )
end

CREATE FUNCTION VentasCliente
(
 @doc_cli numeric(18,0)
)
RETURNS TABLE -- NECESITA UN ALIAS PARA DEVOLVER UNA TABLA
AS
RETURN
(
  SELECT v.codigo_vta, v.fecha_vta, i.precio, i.cantidad AS cantidad -- ALIAS PARA EVITAR CONFLICTOS DE NOMBRES
  FROM venta v
  JOIN item_venta i ON v.codigo_vta = i.codigo_vta
  WHERE v.doc_cli = @doc_cli
  )
end

-- Calcular comisión de un vendedor

CREATE FUNCTION calcComision
(
  @valor_vta numeric(18,0)
)
RETURN numeric(18,0)
as
begin
  declare @comision numeric(18,0)
  if @valor_vta >= 10000000
  begin
    set @comision = @valor_vta * 0.05
  end
  else if @valor_vta >= 5000000
  begin
    set @comision = @valor_vta * 0.03
  end
  else
  begin
    set @comision = @valor_vta * 0.01
  end
  return @comision
end

SELECT ven.nombre, SUM(iv.valor_vta * iv.cantidad) AS total_venta, dbo.calcComision(SUM(iv.valor_vta * iv.cantidad)) AS comision
from vendedor ven
join venta vta on ven.documento = ven.doc_vendor
JOIN item_venta iv on vta.codigo_vta = iv.codigo_vta
GROUP BY ven.nombre

-- FUNCIONES Y PROCEDIMIENTOS ALMACENADOS, cursores

--| cursor que consulte cliente y empleados
