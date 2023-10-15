IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Shippers]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE tbl_Shippers
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	ShipperName nvarchar(255),
	Phone nvarchar(255),
);'