/*Завдання 1.
Створити базу даних Магазин.

Categories(Категорії)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o CategoryName - рядок, унікальне
	o Description - опис категорії продуктів

Suppliers (Постачальники)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o SupplierName- рядок, унікальне
	o Address - рядок
	o City - рядок
	o Country - рядок

Customers(Клієнти)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o CustomerName- рядок
	o Address - рядок
	o City - рядок
	o Country - рядок

Products(Товари)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o ProductName - рядок
	o SupplierID - ціле, зовнішній ключ (для звязку з таблицею Supplier по полю Supplier.Id)
	o CategoryID - ціле, зовнішній ключ (для звязку з таблицею Categories по полю Categories.Id)
	o Unit (упаковка) - рядок
	o Price - грошового типу

Employees(Працівники)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o LastName - рядок
	o FirstName - рядок
	o BirthDate - дата(date)

Shippers(Перевізники)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o ShipperName - рядок
	o Phone - рядок

Orders( Замовлення)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o CustomerID - ціле, зовнішній ключ
	o EmployeeID- ціле, зовнішній ключ
	o OrderDate - дата
	o ShipperID - ціле, зовнішній ключ

OrderDetails(Деталі замовлень)
	o Id - ціле, автоінкремент, первинний ключ, не null
	o OrderID- ціле, зовнішній ключ
	o ProductID - ціле, зовнішній ключ
	o Quantity - ціле*/

CREATE DATABASE Shop

CREATE TABLE Categories
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	CategoryName nvarchar(50) UNIQUE,
	[Description] nvarchar(100),
)
go

CREATE TABLE Suppliers
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	SupplierName nvarchar(40) UNIQUE,
	[Address] nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
)
go
				
CREATE TABLE Customers
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	CustomerName nvarchar(40),
	[Address] nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
)
go

CREATE TABLE Products
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	ProductName nvarchar(40),
	SuppliersID int foreign key references Suppliers(ID),
	CategoryID int foreign key references Categories(Id),
	Unit nvarchar(40),
	Price money,
)
go
	
CREATE TABLE Employees
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	LastName nvarchar(40),
	FirstName nvarchar(40),
	BirthDate date,
)
go

CREATE TABLE Shippers
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	ShipperName nvarchar(40),
	Phone nvarchar(12),
)
go

CREATE TABLE Orders
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	CustomerID int foreign key references Customers(ID),
	EmployeeID int foreign key references Employees(ID),
	OrderDate date,
	ShipperID int foreign key references Shippers(Id),
)
go

CREATE TABLE OrdersDetails
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	OrderID int foreign key references Orders(ID),
	ProductID int foreign key references Products(ID),
	Quantity int,
)
go		 