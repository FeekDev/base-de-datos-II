-- ====================================
-- PROCEDIMIENTO: Insertar 500 clientes
-- ====================================
CREATE PROCEDURE insertar_500_clientes
AS
BEGIN
BEGIN TRY
    DECLARE @i INT = 1
    DECLARE @doc INT = 10001
    
    WHILE @i <= 500
    BEGIN
        INSERT INTO cliente (documento, nombre, dir, cod_pais, tel) VALUES
        (@doc,
         CONCAT(
            CASE WHEN @i % 10 = 0 THEN 'Diego' 
                 WHEN @i % 10 = 1 THEN 'Laura' 
                 WHEN @i % 10 = 2 THEN 'Andrés'
                 WHEN @i % 10 = 3 THEN 'Valentina'
                 WHEN @i % 10 = 4 THEN 'Javier'
                 WHEN @i % 10 = 5 THEN 'Catalina'
                 WHEN @i % 10 = 6 THEN 'Nicolás'
                 WHEN @i % 10 = 7 THEN 'Gabriela'
                 WHEN @i % 10 = 8 THEN 'Felipe'
                 ELSE 'Sofía' END,
            ' ',
            CASE WHEN @i % 8 = 0 THEN 'Ramírez' 
                 WHEN @i % 8 = 1 THEN 'Castillo' 
                 WHEN @i % 8 = 2 THEN 'Morales'
                 WHEN @i % 8 = 3 THEN 'Cruz'
                 WHEN @i % 8 = 4 THEN 'Reyes'
                 WHEN @i % 8 = 5 THEN 'Vega'
                 WHEN @i % 8 = 6 THEN 'Sánchez'
                 ELSE 'Ruiz' END
         ),
         CONCAT('Cra ', (30 + (@i % 60)), ' #', (10 + (@i % 90)), '-', (20 + (@i % 80))),
         CASE WHEN @i % 11 = 0 THEN 170 
              WHEN @i % 11 = 1 THEN 591
              WHEN @i % 11 = 2 THEN 862
              WHEN @i % 11 = 3 THEN 51
              WHEN @i % 11 = 4 THEN 56
              WHEN @i % 11 = 5 THEN 57
              WHEN @i % 11 = 6 THEN 55
              WHEN @i % 11 = 7 THEN 54
              WHEN @i % 11 = 8 THEN 58
              WHEN @i % 11 = 9 THEN 505
              ELSE 506 END,
         3100000000 + @doc)
        
        SET @doc = @doc + 1
        SET @i = @i + 1
    END
    
    PRINT '✓ Se insertaron exitosamente 500 clientes nuevos SIN DUPLICADOS.';
    SELECT COUNT(*) AS 'Total Clientes Registrados' FROM cliente;

END TRY
BEGIN CATCH
    PRINT '✗ Error al insertar clientes: ' + ERROR_MESSAGE();
    ROLLBACK;
END CATCH
END;
GO

-- ====================================
-- PROCEDIMIENTO: Insertar 5000 productos
-- ====================================
CREATE PROCEDURE insertar_5000_productos
AS
BEGIN
BEGIN TRY
    DECLARE @i INT = 1
    WHILE @i <= 5000
    BEGIN
        INSERT INTO productos (nombre, valor, cantidad) VALUES 
        (CONCAT('Producto_', @i, ' - ', CASE WHEN @i % 5 = 0 THEN 'Electrónico' 
                                               WHEN @i % 5 = 1 THEN 'Vehículo'
                                               WHEN @i % 5 = 2 THEN 'Accesorio'
                                               WHEN @i % 5 = 3 THEN 'Repuesto'
                                               ELSE 'Componente' END),
         1000000 + (@i * 5000) % 50000000,
         1 + (@i % 100))
        SET @i = @i + 1
    END

    PRINT '✓ Se insertaron exitosamente 5000 productos nuevos.';
    SELECT COUNT(*) AS 'Total Productos Registrados' FROM productos;
    
END TRY
BEGIN CATCH
    PRINT '✗ Error al insertar productos: ' + ERROR_MESSAGE();
    ROLLBACK;
END CATCH
END;
GO

-- ====================================
-- PROCEDIMIENTO: Insertar 300,000 ventas
-- ====================================
CREATE PROCEDURE insertar_300mil_ventas
AS
BEGIN
BEGIN TRY
    DECLARE @i BIGINT = 1
    DECLARE @doc_cli NUMERIC(12,0)
    DECLARE @doc_vendor NUMERIC(12,0)
    DECLARE @codigo_vta INT
    DECLARE @factura_num INT = 1000
    DECLARE @precio_producto NUMERIC(18,0)
    DECLARE @valor NUMERIC(18,0)
    DECLARE @fecha DATETIME
    DECLARE @min_cliente NUMERIC(12,0)
    DECLARE @max_cliente NUMERIC(12,0)
    DECLARE @min_vendedor NUMERIC(12,0)
    DECLARE @max_vendedor NUMERIC(12,0)
    DECLARE @min_producto INT
    DECLARE @max_producto INT
    
    -- Obtener rangos de datos existentes
    SELECT @min_cliente = MIN(documento), @max_cliente = MAX(documento) FROM cliente
    SELECT @min_vendedor = MIN(documento), @max_vendedor = MAX(documento) FROM vendedor
    SELECT @min_producto = MIN(codigo), @max_producto = MAX(codigo) FROM productos
    
    WHILE @i <= 300000
    BEGIN
        -- Seleccionar cliente, vendedor y producto aleatorios
        SET @doc_cli = @min_cliente + ABS(CHECKSUM(NEWID())) % (@max_cliente - @min_cliente + 1)
        SET @doc_vendor = @min_vendedor + ABS(CHECKSUM(NEWID())) % (@max_vendedor - @min_vendedor + 1)
        SET @codigo_pdt = @min_producto + ABS(CHECKSUM(NEWID())) % (@max_producto - @min_producto + 1)
        
        -- Cantidad aleatoria entre 1 y 5
        SET @cantidad = 1 + ABS(CHECKSUM(NEWID())) % 5
        
        -- Obtener precio del producto
        SELECT @precio_producto = valor FROM productos WHERE codigo = @codigo_pdt
        
        -- Calcular valor total
        SET @valor_total = @precio_producto * @cantidad
        
        -- Generar fecha aleatoria entre 2024-01-01 y 2026-03-22
        SET @fecha_venta = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 810, '2024-01-01')
        
        -- Insertar venta
        INSERT INTO venta (valor, fecha, factura_num, doc_vendor, doc_cli)
        VALUES (@valor_total, @fecha_venta, @factura_num, @doc_vendor, @doc_cli)
        
        SET @factura_num = @factura_num + 1
        SET @i = @i + 1
        
        -- Mostrar progreso cada 50,000 registros
        IF @i % 50000 = 0
            PRINT CONCAT('Procesados: ', @i, ' ventas...')
    END
    
    PRINT '✓ Se insertaron exitosamente 300,000 ventas nuevas.';
    SELECT COUNT(*) AS 'Total Ventas Registradas' FROM venta;
    
END TRY
BEGIN CATCH
    PRINT '✗ Error al insertar ventas: ' + ERROR_MESSAGE();
    ROLLBACK;
END CATCH
END;
GO

-- ====================================
-- PROCEDIMIENTO: Registrar items_venta
-- ====================================
CREATE PROCEDURE registrar_items_venta
AS
BEGIN
BEGIN TRY
    DECLARE @codigo_vta INT
    DECLARE @codigo_pdt INT
    DECLARE @cantidad INT
    DECLARE @precio_producto NUMERIC(18,0)
    DECLARE @items_count INT = 0
    
    -- Recorrer todas las ventas sin items registrados
    DECLARE cursor_ventas CURSOR FOR
    SELECT v.codigo 
    FROM venta v
    WHERE NOT EXISTS (SELECT 1 FROM items_venta iv WHERE iv.codigo_vta = v.codigo)
    
    OPEN cursor_ventas
    FETCH NEXT FROM cursor_ventas INTO @codigo_vta
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generar items aleatorios para cada venta (1-3 items)
        DECLARE @num_items INT = 1 + ABS(CHECKSUM(NEWID())) % 3
        DECLARE @item_count INT = 1
        
        WHILE @item_count <= @num_items
        BEGIN
            -- Seleccionar producto aleatorio
            SELECT TOP 1 @codigo_pdt = codigo, @precio_producto = valor
            FROM productos
            ORDER BY NEWID()
            
            -- Cantidad entre 1 y 5
            SET @cantidad = 1 + ABS(CHECKSUM(NEWID())) % 5
            
            -- Insertar item de venta
            INSERT INTO items_venta (codigo_pdt, codigo_vta, valor_vta, cantidad)
            VALUES (@codigo_pdt, @codigo_vta, @precio_producto, @cantidad)
            
            -- Descontar del inventario
            UPDATE productos
            SET cantidad = cantidad - @cantidad
            WHERE codigo = @codigo_pdt
            
            SET @item_count = @item_count + 1
            SET @items_count = @items_count + 1
        END
        
        FETCH NEXT FROM cursor_ventas INTO @codigo_vta
    END
    
    CLOSE cursor_ventas
    DEALLOCATE cursor_ventas
    
    PRINT '✓ Se registraron exitosamente ' + CAST(@items_count AS VARCHAR) + ' items de venta.';
    SELECT COUNT(*) AS 'Total Items Venta Registrados' FROM items_venta;
    
END TRY
BEGIN CATCH
    PRINT '✗ Error al registrar items de venta: ' + ERROR_MESSAGE();
    IF CURSOR_STATUS('global', 'cursor_ventas') >= -1
    BEGIN
        CLOSE cursor_ventas
        DEALLOCATE cursor_ventas
    END
    ROLLBACK;
END CATCH
END;
GO

-- ====================================
-- EJECUTAR LOS PROCEDIMIENTOS
-- ====================================
-- EXEC insertar_500_clientes;
-- EXEC insertar_5000_productos;
-- EXEC insertar_300mil_ventas;
-- EXEC registrar_items_venta;
GO