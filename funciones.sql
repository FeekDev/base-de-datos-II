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
    declare @subtotal numeric(18,0)
    set @subtotal = @precio * @cantidad
    return @subtotal
end
    SELECT..., dbo.items_venta(200, 2) as subtotal