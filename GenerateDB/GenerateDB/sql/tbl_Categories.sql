IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Categories]'))
EXEC dbo.sp_executesql @statement = N'
CREATE TABLE tbl_Categories
(
    Id int IDENTITY PRIMARY KEY NOT NULL,
    Name nvarchar(50) UNIQUE,
    [Description] nvarchar(100),
);'