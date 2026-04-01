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
    @doc_vendor numeric(12,0),
    @doc_cli numeric(12,0)
AS
BEGIN
    IF @fecha IS NULL
        SET @fecha = CONVERT(DATE, GETDATE())
    Insert into venta(valor, fecha, doc_vendor, doc_cli )
    values (@valor, @fecha, @doc_vendor, @doc_cli)
END

EXECsp_CrearVenta
    @doc_vendor = 555666,
    @doc_cli = 2011
    SELECT top 1 codigo_vta from venta
    ORDER BY codigo_vta DESC 