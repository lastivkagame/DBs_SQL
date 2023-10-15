/*���������� ������ �� ������� ���������� ��� �����������:
�� �������� �� ����������, ��� � �� ���������� ������� ������� ������ � �������� ���� ����������.*/

USE Shop;
SELECT Orders.Id as Order_ID, Products.ProductName, Products.Price, OrdersDetails.Quantity, OrdersDetails.Quantity * Products.Price as 'sum' 
FROM [Orders],[Customers], [OrdersDetails], [Products], [Categories]
WHERE Orders.CustomerID = Customers.Id
  AND OrdersDetails.OrderID = Orders.Id
  AND OrdersDetails.ProductID = Products.Id
  AND Categories.Id = Products.CategoryID
GROUP BY Orders.Id, OrdersDetails.Quantity, Products.Price, Products.ProductName;

-- ��� �������� ������ �� �������, �������������, ����� ������, ��������
USE Shop;
SELECT Orders.Id as Order_ID, SupplierName as Supplier ,Customers.CustomerName as Customer, Products.ProductName, 
Categories.CategoryName, Products.Price, OrdersDetails.Quantity, OrdersDetails.Quantity * Products.Price as 'sum' 
FROM [Orders],[Customers], [OrdersDetails], [Products], [Categories], [Suppliers]
WHERE Orders.CustomerID = Customers.Id
  AND OrdersDetails.OrderID = Orders.Id
  AND OrdersDetails.ProductID = Products.Id
  AND Categories.Id = Products.CategoryID
  AND Products.SuppliersID = Suppliers.Id
GROUP BY Orders.Id,SupplierName, Customers.CustomerName, OrdersDetails.Quantity, Products.Price, Products.ProductName, 
Categories.CategoryName;

