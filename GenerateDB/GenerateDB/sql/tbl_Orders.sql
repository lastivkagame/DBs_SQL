IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Orders]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE tbl_Orders
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	CustomerID int foreign key references tbl_Customers(ID),
	EmployeeID int foreign key references tbl_Employees(ID),
	OrderDate date,
	ShipperID int foreign key references tbl_Shippers(Id),
);'