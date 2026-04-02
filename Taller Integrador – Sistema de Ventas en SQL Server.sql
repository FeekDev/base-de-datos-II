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
SELECT valor 
dbo.calcular_subtotal(valor, cantidad) as subtotal
FROM productos

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
 ALTER PROCEDURE sp_AgregarProductoVenta
 @id_venta INT,
 @id_producto INT,
 @cantidad INT,
 @valor numeric(18,0)
 As
 BEGIN
 SELECT TOP 1 p.codigo
 FROM items_venta i
 JOIN productos p ON 
 i.codigo_pdt = p.codigo 
 WHERE p.codigo = @id_producto
 IF @cantidad > 1
    SET @valor = dbo.calcular_subtotal((SELECT valor FROM productos WHERE codigo = @id_producto), @cantidad)
 ELSE
    SET @valor = (SELECT valor FROM productos WHERE codigo = @id_producto)
 END
 INSERT INTO items_venta(codigo_pdt,codigo_vta,valor_vta,cantidad)
 VALUES(@id_producto,@id_venta,@valor,@cantidad)

 EXEC sp_AgregarProductoVenta
    @id_venta = 1031,
    @id_producto = 1,
    @cantidad = 5
    @valor = 0
