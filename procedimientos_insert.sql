CREATE PROCEDURE insertar_vendedor
    -- No se incluyen los parámetros de entrada en la declaración del procedimiento, 
    -- Ya que se insertarán múltiples registros de vendedores
AS 
BEGIN 
BEGIN TRY -- Insertar un nuevo vendedor en la tabla Vendedor
INSERT INTO Vendedor (documento, nombre, tel, dir)
VALUES (
        1000001,
        'Carlos Mendoza',
        3101234567,
        'Cra 50 #85-10'
    ),
    (
        1000002,
        'Juan Pérez',
        3207654321,
        'Cra 43 #23-45'
    ),
    (
        1000003,
        'María García',
        3109876543,
        'Cra 45 #67-89'
    ),
    (
        1000004,
        'Roberto Silva',
        3102345678,
        'Cra 52 #34-56'
    ),
    (
        1000005,
        'Ana López',
        3208765432,
        'Cra 48 #78-90'
    ),
    (
        1000006,
        'Luis Martínez',
        3101112223,
        'Cra 44 #11-22'
    ),
    (
        1000007,
        'Sandra Rodríguez',
        3203334445,
        'Cra 51 #33-44'
    ),
    (
        1000008,
        'Fernando Díaz',
        3105556667,
        'Cra 49 #55-66'
    ),
    (
        1000009,
        'Patricia Gómez',
        3207778889,
        'Cra 46 #77-89'
    ),
    (
        1000010,
        'Miguel Torres',
        3109999001,
        'Cra 47 #99-100'
    ),
    (
        1000011,
        'Daniela Romero',
        3108765432,
        'Av Paseo Diag 26 #56-14'
    ),
    (
        1000012,
        'Andrés Castillo',
        3207654321,
        'Cra 54 #12-25'
    ),
    (
        1000013,
        'Valentina Cruz',
        3109876543,
        'Cra 55 #45-67'
    ),
    (
        1000014,
        'Javier Reyes',
        3102345678,
        'Cra 42 #78-90'
    ),
    (
        1000015,
        'Catalina Vega',
        3208765432,
        'Cra 36 #11-22'
    ),
    (
        1000016,
        'Nicolás Sánchez',
        3101112223,
        'Av Francisco de Miranda'
    ),
    (
        1000017,
        'Gabriela Ruiz',
        3203334445,
        'Cra 51 #34-56'
    ),
    (
        1000018,
        'Felipe Acosta',
        3105556667,
        'Av Bolívar #45-67'
    ),
    (
        1000019,
        'Sofía Navarro',
        3207778889,
        'Cra 54 #91-100'
    ),
    (
        1000020,
        'Diego Ramírez',
        3109999001,
        'Cra 53 #12-25'
    ),
    (
        1000021,
        'Laura Castillo',
        3108765432,
        'Cra 42 #45-67'
    ),
    (
        1000022,
        'Alejandro Morales',
        3207654321,
        'Cra 55 #78-90'
    ),
    (
        1000023,
        'Camila Velásquez',
        3109876543,
        'Av Paseo Diag 26 #56'
    ),
    (
        1000024,
        'Gustavo López',
        3102345678,
        'Cinta Costera #45'
    ),
    (
        1000025,
        'Mariana Santos',
        3208765432,
        'Av Francisco de Miranda'
    ),
    (
        1000026,
        'Pablo Hernández',
        3101112223,
        'Cra 60 #10-20'
    ),
    (
        1000027,
        'Isabel Moreno',
        3203334445,
        'Cra 49 #50-60'
    ),
    (
        1000028,
        'Ricardo Flores',
        3105556667,
        'Cra 44 #70-80'
    ),
    (
        1000029,
        'Cristina Ramos',
        3207778889,
        'Cra 38 #20-30'
    ),
    (
        1000030,
        'Mauricio Vargas',
        3109999001,
        'Cra 52 #40-50'
    ),
    (
        1000031,
        'Viviana Cortés',
        3108765432,
        'Cra 41 #60-70'
    ),
    (
        1000032,
        'Héctor Guzmán',
        3207654321,
        'Cra 37 #30-40'
    ),
    (
        1000033,
        'Tatiana Jiménez',
        3109876543,
        'Cra 43 #80-90'
    ),
    (
        1000034,
        'Sergio Pulido',
        3102345678,
        'Cra 39 #100-110'
    ),
    (
        1000035,
        'Adriana Quintero',
        3208765432,
        'Cra 35 #15-25'
    ),
    (
        1000036,
        'Óscar Velasco',
        3101112223,
        'Cra 31 #55-65'
    ),
    (
        1000037,
        'Roxana Molina',
        3203334445,
        'Cra 46 #25-35'
    ),
    (
        1000038,
        'Raúl Zamora',
        3105556667,
        'Cra 57 #65-75'
    ),
    (
        1000039,
        'Vanessa Fuentes',
        3207778889,
        'Cra 32 #40-50'
    ),
    (
        1000040,
        'Esteban Cabrera',
        3109999001,
        'Cra 48 #20-30'
    ),
    (
        1000041,
        'Marcela Henao',
        3108765432,
        'Cra 53 #85-95'
    ),
    (
        1000042,
        'Tomás Ospina',
        3207654321,
        'Cra 30 #75-85'
    ),
    (
        1000043,
        'Lorena Durán',
        3109876543,
        'Cra 59 #35-45'
    ),
    (
        1000044,
        'Vicente Ruiz',
        3102345678,
        'Cra 29 #90-100'
    ),
    (
        1000045,
        'Ángela Prieto',
        3208765432,
        'Cra 64 #50-60'
    ),
    (
        1000046,
        'Gerardo Ossa',
        3101112223,
        'Cra 28 #10-20'
    );
PRINT 'Vendedores insertados exitosamente.';
END TRY 
BEGIN CATCH -- Manejo de errores
PRINT 'Error al insertar el vendedor: ' + ERROR_MESSAGE();
END CATCH
END

EXEC insertar_vendedor

-- ====================================
-- PROCEDIMIENTO: Insertar 500 clientes
-- ====================================
CREATE PROCEDURE insertar_clientes
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

EXEC insertar_clientes


-- ====================================
-- PROCEDIMIENTO: Insertar 5000 productos
-- ====================================
CREATE PROCEDURE insertar_productos
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

    PRINT '✓ Se insertaron exitosamente 5000 productos nuevos.'
    SELECT COUNT(*) AS 'Total Productos Registrados' FROM productos
    
END TRY
BEGIN CATCH
    PRINT '✗ Error al insertar productos: ' + ERROR_MESSAGE()
    ROLLBACK
END CATCH
END


-- ====================================
-- EJECUTAR PROCEDIMIENTOS
-- ====================================
EXEC insertar_productos;

-- ====================================
-- PROCEDIMIENTO: Insertar 300000 ventas
-- ====================================

ALTER PROCEDURE insertar_ventas
AS
BEGIN
BEGIN TRY
    DECLARE @i BIGINT = 1
    DECLARE @doc_cli NUMERIC(12,0)
    DECLARE @doc_vendor NUMERIC(12,0)
    DECLARE @codigo_pdt INT
    DECLARE @cantidad INT
    DECLARE @factura_num INT = 1000
    DECLARE @precio_producto NUMERIC(18,0)
    DECLARE @valor_total NUMERIC(18,0)
    DECLARE @fecha_venta DATETIME
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
END CATCH
END

------------------------------------
-- Ejecutar el procedimiento para insertar ventas
-------------------------------------

EXEC insertar_ventas

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

-- ====================================
-- EJECUTAR LOS PROCEDIMIENTOS
-- ====================================

EXEC registrar_items_venta;
