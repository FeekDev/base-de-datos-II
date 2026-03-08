USE productos
GO

CREATE PROCEDURE guardar_producto
 @codigo INT,
 @nombre VARCHAR(50),
 @valor NUMERIC(18,0),
 @cantidad INT
AS
BEGIN
BEGIN TRY
 -- Validar si el producto ya existe
 IF EXISTS (SELECT 1 FROM productos WHERE codigo = @codigo)
 BEGIN
 -- Actualizar producto
 UPDATE productos
 SET nombre = @nombre,
 valor = @valor,
 cantidad = @cantidad
 WHERE codigo = @codigo
 PRINT 'Producto actualizado correctamente'
 END
 ELSE
 BEGIN
 -- Insertar producto nuevo
 INSERT INTO productos (nombre, valor, cantidad)
 VALUES (@nombre, @valor, @cantidad)
 PRINT 'Producto registrado correctamente'
 END
END TRY
BEGIN CATCH
 PRINT 'Ocurrió un error en la operación'
 PRINT ERROR_MESSAGE()
END CATCH
END

EXEC guardar_producto @codigo = 13, @nombre = 'Toyota Hilux', @valor = 165000000, @cantidad = 5
