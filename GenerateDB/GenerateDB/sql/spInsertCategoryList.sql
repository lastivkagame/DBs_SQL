IF NOT EXISTS (SELECT * FROM sys.procedures WHERE object_id = OBJECT_ID(N'[spInsertCategoryList]'))
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE spInsertCategoryList
@ListInsert CategoryType READONLY
AS
BEGIN 
  INSERT INTO tbl_Categories
  SELECT * FROM @ListInsert
END'