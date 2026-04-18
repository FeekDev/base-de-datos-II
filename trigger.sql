CREATE TRIGGER trv_vlidacion
ON itemsVenta
INSTEAD OF INSERT
AS
BEGIN
IF EXIST(SELECT * FROM inserted i
join productos p on i.idProducto = p.idProducto
where i.cantidadItems > p.cantidadDisponible)
BEGIN
    print"No es posible agregar el item de venta"
END
ELSE
    insert into itemsVenta(idVenta, idProducto, cantidadItems)
    SELECT idVenta, idProducto, cantidadItems FROM inserted
END
END

insert into itemsVenta(idVenta, idProducto, cantidadItems)
values(1, 1, 5) -- Esto se insertará correctamente si el producto tiene al menos 5 unidades disponibles
