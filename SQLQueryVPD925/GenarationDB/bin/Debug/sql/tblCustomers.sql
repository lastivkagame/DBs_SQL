CREATE TABLE tblCustomers
(
    Id int IDENTITY PRIMARY KEY NOT NULL,
    Name nvarchar(255),
    [Address] nvarchar(255),
    City nvarchar(255),
    Country nvarchar(255),
)
