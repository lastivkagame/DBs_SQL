CREATE TABLE tblCategories
(
    Id int IDENTITY PRIMARY KEY NOT NULL,
    Name nvarchar(50) UNIQUE,
    [Description] nvarchar(100),
);

