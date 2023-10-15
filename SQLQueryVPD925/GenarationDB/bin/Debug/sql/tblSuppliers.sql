CREATE TABLE tblSuppliers
(
    Id int IDENTITY PRIMARY KEY NOT NULL,
    Name nvarchar(40) UNIQUE,
    [Address] nvarchar(40),
    City nvarchar(40),
    Country nvarchar(40),
);
