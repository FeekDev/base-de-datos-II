USE productos
GO

CREATE PROCEDURE registrar_venta
 @doc_cli NUMERIC(12,0),
 @doc_vendor NUMERIC(12,0),
 @codigo_pdt INT,
 @cantidad INT,
 @factura_num INT
AS
BEGIN
BEGIN TRY
 -- REGLAS DE VALIDACIÓN
 
 -- 1. Verificar que el cliente exista en la tabla cliente
 IF NOT EXISTS (SELECT 1 FROM cliente WHERE documento = @doc_cli)
 BEGIN
 PRINT 'Error: El cliente con documento ' + CAST(@doc_cli AS VARCHAR) + ' no existe en la tabla cliente.'
 RETURN
 END
 
 -- 2. Verificar que el vendedor exista en la tabla vendedor
 IF NOT EXISTS (SELECT 1 FROM vendedor WHERE documento = @doc_vendor)
 BEGIN
 PRINT 'Error: El vendedor con documento ' + CAST(@doc_vendor AS VARCHAR) + ' no existe en la tabla vendedor.'
 RETURN
 END
 
 -- 3. Verificar que el producto exista en la tabla productos
 IF NOT EXISTS (SELECT 1 FROM productos WHERE codigo = @codigo_pdt)
 BEGIN
 PRINT 'Error: El producto con código ' + CAST(@codigo_pdt AS VARCHAR) + ' no existe en la tabla productos.'
 RETURN
 END
 
 -- Declarar variables necesarias
 DECLARE @cantidad_disponible INT
 DECLARE @precio_producto NUMERIC(18,0)
 DECLARE @valor_total NUMERIC(18,0)
 DECLARE @codigo_vta INT
 
 -- 1. Obtener el precio del producto
 SELECT @precio_producto = valor, @cantidad_disponible = cantidad 
 FROM productos 
 WHERE codigo = @codigo_pdt
 
 -- 4. Verificar que la cantidad solicitada no sea mayor que el inventario disponible
 IF @cantidad < 1
 BEGIN
 PRINT 'Error: La cantidad solicitada debe ser mayor a 0.'
 RETURN
 END
 
 IF @cantidad > @cantidad_disponible
 BEGIN
 PRINT 'Error: La cantidad solicitada (' + CAST(@cantidad AS VARCHAR) + ') excede el inventario disponible (' + CAST(@cantidad_disponible AS VARCHAR) + ').'
 RETURN
 END
 
 -- 2. Calcular el valor total de la venta (precio * cantidad)
 SET @valor_total = @precio_producto * @cantidad
 
 -- 3. Insertar la venta en la tabla venta
 INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli)
 VALUES (@valor_total, GETDATE(), @factura_num, @doc_vendor, @doc_cli)
 
 SET @codigo_vta = SCOPE_IDENTITY()
 
 -- 4. Insertar el detalle en la tabla items_venta
 INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad)
 VALUES (@codigo_pdt, @codigo_vta, @precio_producto, @cantidad)
 
 -- 5. Actualizar el inventario del producto
 UPDATE productos
 SET cantidad = cantidad - @cantidad
 WHERE codigo = @codigo_pdt
 
 PRINT 'Venta registrada correctamente. Código de venta: ' + CAST(@codigo_vta AS VARCHAR)
 PRINT 'Precio unitario: ' + CAST(@precio_producto AS VARCHAR) + ' | Cantidad: ' + CAST(@cantidad AS VARCHAR) + ' | Valor total: ' + CAST(@valor_total AS VARCHAR)
 
END TRY
BEGIN CATCH
 PRINT 'Ocurrió un error en la operación'
 PRINT ERROR_MESSAGE()
END CATCH
END

EXEC registrar_venta @doc_cli = 2001, @doc_vendor = 99990, @codigo_pdt = 2, @cantidad = 1, @factura_num = 1014
