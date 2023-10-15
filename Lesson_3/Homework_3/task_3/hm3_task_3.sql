/*�������� 3.
�������� ������������� ������ �� ������ � ������������� ���������� ������� ��� ��������
���� ����� �������.
	o ������� ������� �������� ������
	o ������ ����� ������ � ������� "����������� ������"(Confections)
	o ����� ����� ������ � ������� "����"(Beverages)
	o ������ ������� ����, ����������� �� �������� ���� ������ � ����� �������
	o ������ ������� �� ����������
	o ������ ������(�����, ����, ��������), �� ������������ � ����� ����� (���볿 �� ��.)
	o ������� ����� ������, �����(�����) �볺��� �� ����� ������������� ������
	o ������� ����� ������������� �������� ��������(Seafood)
	o ������ ������ ��������� ������� ������ ���������(� ���� ��������� ����� ����������, ��������� 'Speedy Express' )
	o ������� ��� ��� ���������� (����� ����������, ����� �볺���, ��� ����������, ����� ����������) �� ������ ����� ������� ����
	o ������� ��� ��� ������� ���������� ������� �볺��� (����� ����������, ����� �볺���, ��� ����������, ����� ����������)
	o ������� ������� ��������� ������� �볺���( � ���� ��������� ����� �볺���)
	o ������ �������� ����� ������ ���������� ������ �볺����(� ���� ��������� ����� �볺���, ��������� 'Romero y tomillo'), 
����� �������� �� ���� quantity
	o ������ �������� ������� ����, �� ��� ������� ������ ������ �볺��(� ���� ��������� ����� �볺���, ��������� 'Romero y tomillo'),*/

-- 1
SELECT COUNT(CategoryName) AS 'Count of Category' FROM [Categories]

-- 2 - sorry, this little part  not work and i dont know how it to fix anf now i dont  have more time to throw like that
--please write me later why it not work.
--thanks)))

SELECT COUNT(Products.CategoryID) AS 'count of confections product' FROM [Products], [Categories]
WHERE Products.CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Confections')

SELECT COUNT((SELECT CategoryID FROM Products WHERE CategoryID = (SELECT Id FROM Categories WHERE CategoryName = 'Confections')))
			 FROM [Products]

--3
SELECT ProductName FROM Products
WHERE CategoryID = (SELECT Id FROM Categories WHERE CategoryName = 'Beverages')

--4
SELECT MAX(Price) as MAX_PRICE FROM [Products]
WHERE CategoryID = (SELECT Id FROM Categories WHERE CategoryName = 'Confections') 

SELECT AVG(Price) as AVG_PRICE FROM [Products]
WHERE CategoryID = (SELECT Id FROM Categories WHERE CategoryName = 'Beverages') 

SELECT MIN(Price) as MIN_PRICE FROM [Products]
WHERE CategoryID = (SELECT Id FROM Categories WHERE CategoryName = 'Condiments') 

--5 
SELECT AVG(YEAR(GETDATE())- YEAR(BirthDate)) AS 'AVG_AGE' FROM Employees

--6
SELECT ProductName,Price,Unit FROM [Products]
WHERE SuppliersID = (SELECT Id FROM Suppliers WHERE Country = 'UK')

--7
SELECT Products.ProductName, Customers.CustomerName, Suppliers.SupplierName FROM Suppliers,Products,Customers,Orders, OrdersDetails
WHERE (Products.SuppliersID = Suppliers.Id) AND (Orders.CustomerID = Customers.Id) AND (OrdersDetails.OrderID = Orders.Id) AND (OrdersDetails.ProductID = Products.Id)

--8
SELECT SupplierName FROM [Suppliers], [Products]
WHERE Products.CategoryID = (SELECT Id FROM Categories WHERE CategoryName = 'Seafood') AND Suppliers.Id = Products.SuppliersID;

--9
SELECT COUNT(Orders.ShipperID) as 'count' FROM [Shippers],[Orders]
WHERE Shippers.ShipperName = 'Speedy Express' AND Orders.ShipperID = Shippers.Id;

--10
SELECT Orders.Id, Orders.OrderDate, Customers.CustomerName, Employees.FirstName, Shippers.ShipperName
FROM [Orders], [Customers], [Employees], [Shippers]
WHERE OrderDate = '2019-02-12' AND Orders.CustomerID = Customers.Id AND Orders.EmployeeID = Employees.Id AND Orders.ShipperID = Shippers.Id;

--11
SELECT Orders.Id, Customers.CustomerName, Employees.FirstName, Shippers.ShipperName
FROM [Orders], [Customers], [Employees], [Shippers]
WHERE Customers.CustomerName = 'Antonio Moreno Taqueria' AND Orders.CustomerID = Customers.Id AND Orders.CustomerID = Customers.Id AND Orders.EmployeeID = Employees.Id AND Orders.ShipperID = Shippers.Id;

--12
SELECT COUNT(Orders.CustomerID) as 'count' FROM [Orders],[Customers]
WHERE Customers.CustomerName = 'Antonio Moreno Taqueria' AND Orders.CustomerID = Customers.Id;

--sorry, this little part not work and i dont know how it to fix anf now i dont  have more time to throw like that
--please write me later why it not work.
--thanks)))
--13
SELECT OrdersDetails.Quantity * COUNT(Orders.CustomerID) as 'count' FROM [Orders],[Customers], [OrdersDetails]
WHERE Customers.CustomerName = 'Around the Horn' AND Orders.CustomerID = Customers.Id;

--14
SELECT (OrdersDetails.Quantity * Products.Price * COUNT(Orders.CustomerID)) as 'count' FROM [Orders],[Customers], [OrdersDetails], [Products]
WHERE Customers.CustomerName = 'Around the Horn' AND Orders.CustomerID = Customers.Id AND OrdersDetails.OrderID = Orders.Id AND OrdersDetails.ProductID = Products.Id
