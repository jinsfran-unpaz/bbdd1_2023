USE northwind;
/* 1 */
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM Customers
ORDER BY ContactName;

/* 2 */
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
FROM Orders
ORDER BY OrderDate DESC;

/* 3 */
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
FROM `Order Details`
ORDER BY Quantity;

/* 4 */
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE ProductName LIKE 'P%' AND
UnitPrice BETWEEN 10 AND 120;

/* 5 */
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM Customers
WHERE Country IN ('USA', 'France', 'UK');

/* 6 */
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE Discontinued = 1 AND UnitsInStock = 0 AND CategoryID IN (1, 3, 4, 7);

/* 7 */
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
FROM Orders
WHERE EmployeeID IN (2, 5, 7) AND OrderDate >= '19960101' AND OrderDate < '19970101';

/* 8 */
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM Customers
WHERE Fax IS NOT NULL;

/* 9 */
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM Customers
WHERE Fax IS NULL AND Country = 'USA';

/* 10 */
SELECT EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath
FROM Employees
WHERE ReportsTo IS NOT NULL;

/* 11 */
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM Customers
WHERE CompanyName >= 'O' AND CompanyName < 'T' AND Country = 'USA'
ORDER BY Address;

/* 12 */
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax
FROM Customers
WHERE CompanyName >= 'B' AND CompanyName < 'H' AND Country = 'UK'
ORDER BY CompanyName;

/* 13 */
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE UnitPrice BETWEEN 35 AND 250 AND UnitsInStock = 0 
AND CategoryID IN (1, 3, 4, 7, 8) AND SupplierID IN (2, 4, 6, 7, 8, 9);

/* 14 */
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE Discontinued = 1 AND SupplierID IN (1, 3, 7, 8, 9) AND UnitsInStock > 0 
AND UnitPrice BETWEEN 39 AND 190
ORDER BY SupplierID, UnitPrice;

/* 15 */
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE UnitsInStock > 0
ORDER BY UnitPrice DESC
LIMIT 7;

/* 16 */
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE CategoryID IN (3, 5, 8)
ORDER BY UnitsInStock
LIMIT 9;

/* 17 */
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
FROM Orders
WHERE EmployeeID BETWEEN 2 AND 5 AND CustomerID >= 'A' AND CustomerID < 'H'
AND DAY(OrderDate) = 31 AND MONTH(OrderDate) = 7;

/* 18 */
SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
FROM Orders
WHERE EmployeeID = 3 AND MONTH(OrderDate) >= 8;

/* 19 */
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
FROM `Order Details`
WHERE Quantity BETWEEN 10 AND 250;

/* 20 */
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount
FROM `Order Details`
WHERE UnitPrice * Quantity  * (1 - Discount) BETWEEN 10 AND 100;

/* 21 */
SELECT DISTINCT Country
FROM Customers;

/* 22 */
SELECT ProductID
FROM `Order Details`
GROUP BY ProductID
ORDER BY SUM(Quantity) DESC
LIMIT 15;

/* 23 */
SELECT C.CategoryName, MAX(UnitPrice) AS PrecioMaximo, MIN(UnitPrice) AS PrecioMinimo
FROM Products AS P JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

/* 24 */
SELECT S.CompanyName, MAX(UnitPrice) AS PrecioMaximo, MIN(UnitPrice) AS PrecioMinimo
FROM Products AS P JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
GROUP BY S.CompanyName;

/* 25 */
SELECT C.CategoryName, COUNT(P.ProductID) AS CantidadProductos
FROM Products AS P JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
HAVING COUNT(P.ProductID) > 5;

/* 26 */
SELECT Country, COUNT(CustomerID) AS CantidadClientes
FROM Customers
GROUP BY Country;

/* 27 */
SELECT City, COUNT(CustomerID) AS CantidadClientes
FROM Customers
GROUP BY City;

/* 28 */
SELECT Country, City, COUNT(SupplierID) AS CantidadProveedores
FROM Suppliers
GROUP BY Country, City;

/* 29 */
SELECT C.CategoryName, SUM(UnitsInStock) AS Stock
FROM Products AS P JOIN Categories AS C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

/* 30 */
SELECT C.CategoryName, SUM(UnitsInStock) AS Stock
FROM Products AS P JOIN Categories AS C ON P.CategoryID = C.CategoryID
WHERE C.CategoryID IN (2, 5, 8)
GROUP BY C.CategoryName;

/* 31 */
SELECT C.CompanyName AS Cliente, S.CompanyName AS Proveedor, CONCAT(E.FirstName, ' ', E.LastName) AS Empleado, P.ProductName AS Producto
FROM Orders AS O JOIN `Order Details` AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
JOIN Customers AS C ON O.CustomerID = C.CustomerID
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
WHERE O.OrderID = 10250;

/* 32 */
SELECT CustomerID, YEAR(OrderDate) AS Anio, COUNT(OrderID) AS Cantidad
FROM Orders
GROUP BY CustomerID, YEAR(OrderDate);

/* 33 */
SELECT EmployeeID, YEAR(OrderDate) AS Anio, COUNT(OrderID) AS Cantidad
FROM Orders
GROUP BY EmployeeID, YEAR(OrderDate);

/* 34 */
SELECT CustomerID, YEAR(OrderDate) AS Anio, MONTH(OrderDate) AS Mes, COUNT(OrderID) AS Cantidad
FROM Orders
GROUP BY CustomerID, YEAR(OrderDate), MONTH(OrderDate);

/* 35 */
SELECT YEAR(OrderDate) AS Anio, MONTH(OrderDate) AS Mes, COUNT(OrderID) AS Cantidad
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate);

/* 36 */
SELECT C.CompanyName AS Cliente, O.OrderID, O.OrderDate, P.ProductID, OD.Quantity, P.ProductName AS Producto, S.CompanyName AS Proveedor, S.City
FROM Orders AS O JOIN `Order Details` AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
JOIN Customers AS C ON O.CustomerID = C.CustomerID;

/* 37 */
SELECT C.CompanyName AS Cliente, C.ContactName, O.OrderID, O.OrderDate, P.ProductID, OD.Quantity, P.ProductName AS Producto, S.CompanyName AS Proveedor
FROM Orders AS O JOIN `Order Details` AS OD ON O.OrderID = OD.OrderID
JOIN Products AS P ON OD.ProductID = P.ProductID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
JOIN Customers AS C ON O.CustomerID = C.CustomerID
WHERE S.CompanyName < 'H' AND OD.Quantity BETWEEN 18 AND 190;

/* 38 */
SELECT Country, COUNT(SupplierID) AS Cantidad
FROM Suppliers
WHERE CompanyName LIKE '[E-P]%'
GROUP BY Country
HAVING COUNT(SupplierID) > 2;

/* 39 */
SELECT C.CategoryName, P.ProductName, (SELECT COUNT(*) FROM Products AS PS WHERE PS.CategoryID = P.CategoryID) AS CantCategoria
FROM Products AS P JOIN Categories AS C ON P.CategoryID = C.CategoryID
WHERE P.CategoryID IN (3, 5, 8)
ORDER BY CategoryName;

/* 40 */
SELECT O.OrderID, O.OrderDate, SUM(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) AS Total
FROM Orders AS O JOIN `Order Details` AS OD ON O.OrderID = OD.OrderID
GROUP BY O.OrderID, O.OrderDate;

/* 41 */
SELECT P.ProductName, COUNT(DISTINCT OD.OrderID)
FROM `Order Details` AS OD JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName;

/* 42 */
SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);
