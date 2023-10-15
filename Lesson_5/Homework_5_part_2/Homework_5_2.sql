/*Зробити процедуру для добавлення масиву клієнтів у БД*/

--1.Вибираю бд
USE ShopRandom
GO

--2.Створюю тип щоб можна було додавати масив клієнтів
CREATE TYPE CustomersType AS TABLE
(
	[CustomerName] NVARCHAR(225),
	[Address]  NVARCHAR(225),
	[City] NVARCHAR(225),
	[Country] NVARCHAR(225)
)
GO

--3.Створюю процедуру в якій і буде додавати клієнтів в бд 
CREATE PROCEDURE sp_AddArrCustomers
@ListInsert CustomersType READONLY
AS
BEGIN 
  INSERT INTO tbl_Customers
  SELECT * FROM @ListInsert
END
GO

--4.Тестуюю
DECLARE @ParamInsert CustomersType
INSERT INTO @ParamInsert VALUES (N'Karl Jablonski','305 - 14th Ave. S. Suite 3B','Seattle','USA')
INSERT INTO @ParamInsert VALUES (N'Wilman Kala ','Keskuskatu 45','Helsinki','Finland')
INSERT INTO @ParamInsert VALUES (N'Rita Muller','Adenauerallee 900','Stuttgart','Germany')
INSERT INTO @ParamInsert VALUES (N'Paula Parente','Rua do Mercado, 12','Resende','Brazil')
EXECUTE sp_AddArrCustomers @ParamInsert;