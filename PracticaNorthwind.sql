USE Northwind;
GO
-- 1.	Seleccione todos los campos de la tabla cliente, ordenado por nombre del contacto de la compañía, alfabéticamente: 

-- 2.	Seleccione todos los campos de la tabla órdenes, ordenados por fecha de la orden, descendentemente. 

-- 3.	Seleccione todos los campos de la tabla detalle de la orden, ordenada por cantidad pedida. Ascendentemente. 

-- 4.	Obtener todos los productos, cuyo nombre comienzan con la letra P y tienen un precio unitario comprendido entre 10 y 120: 

-- 5.	Obtener todos los clientes de los países de: USA, Francia y UK: 

-- 6.	Obtener todos los productos descontinuados y sin stock, que pertenecen a la categoría 1, 3, 4 y 7. 

-- 7.	Obtener todas las órdenes hechas por el empleado con código: 2, 5 y 7 en el año 1996 

-- 8.	Seleccionar todos los clientes que cuenten con FAX

-- 9.	Seleccionar todos los clientes que no cuenten con FAX, del País de USA 

-- 10.	Seleccionar todos los empleados que cuentan con un jefe. 

-- 11.	Seleccionar todos los campos del cliente, cuya compañía empiecen con letra O hasta la S y pertenezcan al país de USA, ordenarlos por la dirección. 

-- 12.	Seleccionar todos los campos del cliente, cuya compañía empiecen con las letras de la B a la G, y pertenezcan al país de UK, ordenarlos por nombre de la compañía 

-- 13.	Seleccionar los productos vigentes cuyos precios unitarios están entre 35 y 250, sin stock en almacén, pertenecientes a las categorías 1, 3, 4, 7 y 8, que son distribuidos por los proveedores, 2, 4, 6, 7, 8 y 9.

-- 14.	Seleccionar todos los campos de los productos descontinuados, que pertenezcan a los proveedores con códigos: 1, 3, 7, 8 y 9, que tengan stock en almacén, y al mismo tiempo que sus precios unitarios estén entre 39 y 190, ordenados por código de proveedores y precio unitario de manera ascendente. 

-- 15.	Seleccionar los 7 productos con precio más caro, que cuenten con stock en almacén. 

-- 16.	Seleccionar los 9 productos, con menos stock en almacén, que pertenezcan a la categoría 3, 5 y 8. 

-- 17.	Seleccionar las órdenes de compra, realizadas por el empleado con código entre el 2 y 5, además de los clientes con código que comienzan con las letras de la A hasta la G, del 31 de julio de cualquier año. 

-- 18.	Seleccionar las órdenes de compra, realizadas por el empleado con código 3, de cualquier año, pero solo de los últimos 5 meses (agosto-diciembre) 

-- 19.	Seleccionar los detalles de las órdenes de compra, que tengan un monto de cantidad pedida entre 10 y 250. 

-- 20.	Seleccionar los detalles de las órdenes de compras, cuyo monto del pedido estén entre 10 y 100. 

-- 21.	Informar los diferentes países que se encuentra en la tabla Clientes

-- 22.	Mostrar los 15 productos más vendidos e incluyendo a los empates en el último registro (PD. El operador TOP solo saca ‘N’ registros). 

-- 23.	Visualizar el máximo y mínimo precio de los productos por categoría, mostrar el nombre de la categoría.

-- 24.	Visualizar el máximo y mínimo precio de los productos por proveedor, mostrar el nombre de la compañía proveedora

-- 25.	Seleccionar las categorías que tengan más 5 productos. Mostrar el nombre de la categoría y el número de productos.

-- 26.	Calcular cuántos clientes existen en cada País. 

-- 27.	Calcular cuántos clientes existen en cada Ciudad.

-- 28.	Calcular cuántos proveedores existen en cada Ciudad y País.

-- 29.	Calcular el stock total de los productos por cada categoría. Mostrar el nombre de la categoría y el stock por categoría.

-- 30.	Calcular el stock total de los productos por cada categoría. Mostrar el nombre de la categoría y el stock por categoría. Solamente las categorías 2, 5 y 8.

-- 31.	Obtener el nombre del cliente, nombre de proveedor, nombre del empleado y el nombre de los productos que están en la orden 10250.

-- 32.	Mostrar le número de ordenes realizadas de cada uno de los clientes por año. 

-- 33.	Mostrar el número de órdenes realizadas de cada uno de los empleados en cada año.

-- 34.	Mostrar el número de órdenes realizadas de cada uno de los clientes por cada mes y año.

-- 35.	Contar el número de órdenes que se han realizado por año y meses.

-- 36.	Seleccionar el nombre de la compañía del cliente, el código de la orden de compra, la fecha de la orden de compra, código del producto, cantidad pedida del producto, nombre del producto, el nombre de la compañía proveedora y la ciudad del proveedor.

-- 37.	Seleccionar el nombre de la compañía del cliente, nombre del contacto, el código de la orden de compra, la fecha de la orden de compra, código del producto, cantidad pedida del producto, nombre del producto y el nombre de la compañía proveedora, usar Join. Solamente las compañías proveedoras que comienzan con la letra de la A hasta la letra G, además la cantidad pedida del producto debe estar entre 18 y 190.

-- 38.	Seleccionar cuantos proveedores tengo en cada país, considerando solo a los nombres de los proveedores que comienzan con la letra E hasta la letra P, además de mostrar solo los países donde tenga más de 2 proveedores.

-- 39.	Obtener el número de productos, por cada categoría. Mostrando el nombre de la categoría, el nombre del producto, y el total de productos por categoría, solamente de las categorías 3, 5 y 8. Ordenar por el nombre de la categoría.

-- 40.	Mostar el número de la orden, la fecha de la orden y el importe total de cada orden.

-- 41.	Mostrar el nombre de producto y en cuantas órdenes de compra se encuentra.

-- 42.	Muestre los productos cuyo precio es mayor al promedio de precio de todos los productos 

