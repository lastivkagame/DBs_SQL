IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type='1' AND name ='CategoryType')
EXEC dbo.sp_executesql @statement = N'
CREATE TYPE CategoryType AS TABLE
(    
  Name NVARCHAR(50),
  Description NVARCHAR(100)
);'