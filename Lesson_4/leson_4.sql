USE DBShopCreateByProgram

SELECT o.ID, c.CustomerName as CustomerName, e.FirstName + ' ' + e.LastName as EmployeeName, s.ShipperName as Dostavka
FROM tbl_Orders as o, tbl_Customers as c, tbl_Employees as e, tbl_Shippers as s
WHERE o.CustomerID = c.Id AND o.EmployeeID = e.Id AND o.ShipperID = s.Id;


--Знайти число товарів у категорії "Кондитерські вироби"(Confections)
SELECT tbl_Categories.CategoryName,COUNT(*) FROM [tbl_Products], [tbl_Categories] 
WHERE tbl_Products.CategoryID = tbl_Categories.Id AND tbl_Categories.Id = 3
GROUP BY tbl_Categories.CategoryName;

SELECT tbl_Categories.CategoryName, tbl_Categories.Id,COUNT(*) FROM [tbl_Products], [tbl_Categories] 
WHERE tbl_Products.CategoryID = tbl_Categories.Id AND tbl_Categories.Id = 3
GROUP BY tbl_Categories.CategoryName, tbl_Categories.Id;

--o Знайти загальне число товарів замовлених певним клієнтом(в умові вказувати назву клієнта, наприклад 'Romero y tomillo'), 
--тобто сумувати по полю quantity
SELECT tbl_OrdersDetails.Quantity * COUNT(tbl_Orders.CustomerID) as 'count' FROM [tbl_Orders],[tbl_Customers], [tbl_OrdersDetails]
WHERE tbl_Customers.CustomerName = 'Around the Horn' AND tbl_Orders.CustomerID = tbl_Customers.Id;

--14 o Знайти загальну грошову суму, на яку замовив товарів певний клієнт(в умові вказувати назву клієнта, наприклад 'Romero y tomillo')
SELECT tbl_Products.Id,tbl_Products.ProductName, tbl_OrdersDetails.Quantity * tbl_Products.Price as 'sum' --(tbl_OrdersDetails.Quantity * tbl_Products.Price * COUNT(tbl_Orders.CustomerID)) as 'count'
FROM [tbl_Orders],[tbl_Customers], [tbl_OrdersDetails], [tbl_Products]
WHERE tbl_Customers.Id = 1 AND tbl_Orders.CustomerID = tbl_Customers.Id AND tbl_OrdersDetails.OrderID = tbl_Orders.Id
AND tbl_OrdersDetails.ProductID = tbl_Products.Id
GROUP BY tbl_Products.Id, tbl_OrdersDetails.Quantity,tbl_Products.Price, tbl_Products.ProductName;

