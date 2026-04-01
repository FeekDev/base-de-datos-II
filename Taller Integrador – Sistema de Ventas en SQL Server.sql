-- Funcion para calcular subtotal ---
CREATE FUNCTION calcular_subtotal
(
    @precio numeric(18,0)
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