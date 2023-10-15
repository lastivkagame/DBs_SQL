--CREATE PROCEDURE spFindCustomer
--AS
--BEGIN
--	SELECT c.Id FROM tbltblCustomers c
--END
--GO

--EXECUTE spFindCustomer;

--CREATE PROCEDURE spFindCustomer(
--	@strFind as nvarchar(255)
--)
--AS
--BEGIN
--	SELECT c.Id, c.Name FROM tbltblCustomers c
--	WHERE c.Name LIKE '%' + @strFind + '%'
--END
--GO

EXECUTE spFindCustomer 'Ана'

--ALTER PROCEDURE spFindCustomer(
--	@strFind as nvarchar(255)
--)
--AS
--BEGIN
--	SELECT c.Id, c.Name, c.Address FROM tbltblCustomers c
--	WHERE c.Name LIKE '%' + @strFind + '%'
--END
--GO

--USE ShopRandom;
--GO
--CREATE PROCEDURE spOrders
--AS
--BEGIN
--SELECT tbl_Orders.Id as Order_ID, tbl_Products.ProductName, tbl_Products.Price, tbl_OrdersDetails.Quantity, tbl_OrdersDetails.Quantity * tbl_Products.Price as 'sum' 
--FROM [tbl_Orders],[tbl_Customers], [tbl_OrdersDetails], [tbl_Products], [tbl_Categories]
--WHERE tbl_Orders.CustomerID = tbl_Customers.Id
--  AND tbl_OrdersDetails.OrderID = tbl_Orders.Id
--  AND tbl_OrdersDetails.ProductID = tbl_Products.Id
--  AND tbl_Categories.Id = tbl_Products.CategoryID
--GROUP BY tbl_Orders.Id, tbl_OrdersDetails.Quantity, tbl_Products.Price, tbl_Products.ProductName;
--END;

--EXECUTE spOrders;



USE ShopRandom;
GO
AlTER PROCEDURE spOrders
(
@customerId AS int
)
AS
BEGIN
SELECT tbl_Orders.Id as Order_ID, 
	   tbl_Products.ProductName, 
	   tbl_Products.Price,
	   tbl_Customers.CustomerName,
       tbl_OrdersDetails.Quantity, 
       tbl_OrdersDetails.Quantity * tbl_Products.Price as 'sum' 
FROM [tbl_Orders],[tbl_Customers], [tbl_OrdersDetails], [tbl_Products], [tbl_Categories]
WHERE tbl_Orders.CustomerID = tbl_Customers.Id
  AND tbl_OrdersDetails.OrderID = tbl_Orders.Id
  AND tbl_OrdersDetails.ProductID = tbl_Products.Id
  AND tbl_Categories.Id = tbl_Products.CategoryID
  AND tbl_Customers.Id = @customerId
GROUP BY tbl_Orders.Id, tbl_OrdersDetails.Quantity, tbl_Products.Price,tbl_Customers.CustomerName, tbl_Products.ProductName;
END;

EXECUTE spOrders 4;