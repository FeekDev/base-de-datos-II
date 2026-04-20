CREATE TRIGGER trv_vlidacion
ON itemsVenta -- Nombre de la tabla a la que se le aplicará el trigger
INSTEAD OF INSERT
AS
BEGIN
IF EXIST(SELECT * FROM inserted i -- La tabla "inserted" es una tabla virtual que contiene los datos que se están intentando insertar
join productos p on i.idProducto = p.idProducto -- Se une la tabla "inserted" con la tabla "productos" para obtener la cantidad disponible del producto
where i.cantidadItems > p.cantidadDisponible) --  Se verifica si la cantidad de items que se intenta insertar es mayor a la cantidad disponible del producto
BEGIN
    print"No es posible agregar el item de venta"
END
ELSE
    insert into itemsVenta(idVenta, idProducto, cantidadItems) -- se pone por ser identity el idtem 
    select idVenta, idProducto, cantidadItems from inserted 
END

insert into itemsVenta(idVenta, idProducto, cantidadItems)
values(1, 1, 5) -- Esto se insertará correctamente si el producto tiene al menos 5 unidades disponibles
