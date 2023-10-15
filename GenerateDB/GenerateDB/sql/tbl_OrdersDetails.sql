IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tbl_OrdersDetails]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE tbl_OrdersDetails
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	OrderID int foreign key references tbl_Orders(ID),
	ProductID int foreign key references tbl_Products(ID),
	Price money,
	Quantity int,
	StatusOrder nvarchar(255),
);'