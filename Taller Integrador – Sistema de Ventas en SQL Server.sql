-- Funcion para calcular subtotal ---
CREATE FUNCTION calcular_subtotal
(
    @precio numeric(18,0),
    @cantidad int
)
RETURNS numeric(18,0)
AS
BEGIN
    RETURN (@precio * @cantidad)
END

--- Recordar que los parametros deben ser separados por comas ---
SELECT codigo_vta, cantidad, valor_vta, 
dbo.calcular_subtotal(valor_vta, cantidad) as subtotal
FROM items_venta

-- Procedimiento para insertar una venta ---
ALTER PROCEDURE sp_CrearVenta
    @valor numeric(18, 0) = 0,
    @fecha DATE = NULL,
    @factura_num INT = NULL,
    @doc_vendor numeric(12,0),
    @doc_cli numeric(12,0)
AS
BEGIN
    IF @fecha IS NULL AND @factura_num IS NULL-- se debe agregar para poder convertir la fecha a formato date --
        SET @fecha = CONVERT(DATE, GETDATE())
        SET @factura_num = @factura_num + 1
    Insert into venta(valor, fecha, factura_num, doc_vendor, doc_cli )
    values (@valor, @fecha,@factura_num, @doc_vendor, @doc_cli)
END

EXEC sp_CrearVenta
    @doc_vendor = 555666,
    @doc_cli = 2011
SELECT top 1 codigo_vta from venta
    ORDER BY codigo_vta DESC

 -- agregar producto a la venta ---
 CREATE PROCEDURE sp_AgregarProductoVenta
 @id_venta
 @id_producto
 @cantidad
 As
 BEGIN
 INSERT INTO items_venta()