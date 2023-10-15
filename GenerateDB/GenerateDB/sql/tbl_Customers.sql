IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Customers]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE tbl_Customers
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	CustomerName nvarchar(255),
	[Address] nvarchar(225),
	City nvarchar(225),
	Country nvarchar(225),
);'