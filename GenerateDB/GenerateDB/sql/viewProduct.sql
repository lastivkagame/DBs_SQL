IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_Products]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[View_Products]
AS
SELECT        NEWID() AS Id, dbo.tbl_Products.Id AS ProductId, dbo.tbl_Products.ProductName, dbo.tbl_Products.CategoryId, 
                dbo.tbl_Products.Unit, dbo.tbl_Products.Price, dbo.tbl_Categories.Name AS CategoryName, 
                         dbo.tbl_Suppliers.SupplierName AS SupplierName, dbo.tbl_Suppliers.Address AS SupplierAddress
FROM            dbo.tbl_Categories INNER JOIN
                         dbo.tbl_Products ON dbo.tbl_Categories.Id = dbo.tbl_Products.CategoryId INNER JOIN
                         dbo.tbl_Suppliers ON dbo.tbl_Products.SuppliersID = dbo.tbl_Suppliers.Id;'