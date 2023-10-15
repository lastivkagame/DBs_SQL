IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Suppliers]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE tbl_Suppliers
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	SupplierName nvarchar(40) UNIQUE,
	[Address] nvarchar(40),
	City nvarchar(40),
	Country nvarchar(40),
);'