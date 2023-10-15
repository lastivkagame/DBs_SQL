IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Products]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE tbl_Products
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	ProductName nvarchar(40),
	SuppliersID int foreign key references tbl_Suppliers(ID),
	CategoryID int foreign key references tbl_Categories(Id),
	Unit nvarchar(40),
	Price money,
	Quantity int DEFAULT(0),
);'