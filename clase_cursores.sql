---. mostrar tabla de empleado --
--- con atributos venta - fecha . total- cliente--

DECLARE @documento (12,0)
DECLARE @nombre varchar(35)
DECLARE @cursor_empleados cursos
FOR
SELECT documento, nombre 
FROM dbo.vendedor 

OPEN cursor_empleados

FETCH NEXT FROM cursor_empleados
INTO @documento, @nombre

WHILE @@FETCH_STATUS=0
begin
    print replicate('*', 50)
    print 'Empleado: ' + nombre

    DECLARE @codigo_vta INT
    DECLARE @fecha DATE
    DECLARE @nombre VARCHAR(35)
    DECLARE @totalV NUMERIC(18,0)
    DECLARE @ventas_empleados cursos
    select v.codigo_vta AS codigoVenta, v.fecha AS fechaVenta, SUM(v.cantidad * i.cantidad) AS Total, c.nombre As nombreCliente
    from dbo.venta v
    JOIN item_venta i on v.codigo_vta = i.codigo_vta
    JOIN cliente c on c.documento = v.doc_cli
    where v.doc_vendor = @documento
    group by v.codigo_vta, v.fecha,  c.nombre

    print('CodigoVenta fechaVenta nombreCliente totalVenta')

    open ventas_empleados
    FETCH NEXT FROM ventas_empleados*
    INTO @documento, @nombre
    WHILE @@FETCH_STATUS=0

    select sum(v.cantidad * i.cantidad) as toalVentaVendedor
    from venta v
    JOIN item_venta i on v.codigo_vta = i.codigo_vta
    where v.doc_cli = @documento
    group by  

    print replicate('*', 50)
    FETCH NEXT FROM cursor_empleados
    INTO @documento, @nombre
END
CLOSE cursor_empleados
DEALLOCATE cursor_empleados