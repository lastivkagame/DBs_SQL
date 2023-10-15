USE ShopRandom
GO
CREATE TYPE CategoryType AS TABLE
(
	CategoryName NVARCHAR(50),
	Description NVARCHAR(100)
)
GO

GO
CREATE PROCEDURE spInsertCategoryList
@ListInsert CategoryType READONLY
AS
BEGIN 
  INSERT INTO tbl_Categories
  SELECT * FROM @ListInsert
END

GO
DECLARE @ParamInsert CategoryType
INSERT INTO @ParamInsert VALUES (N'Cake','Chokolate cake with nuts')
INSERT INTO @ParamInsert VALUES (N'Ice-Cream','CLassic white ice cream');

EXECUTE spInsertCategoryList @ParamInsert;

