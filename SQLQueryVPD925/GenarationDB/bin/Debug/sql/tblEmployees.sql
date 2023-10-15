CREATE TABLE tblEmployees
(
    Id int IDENTITY PRIMARY KEY NOT NULL,
    LastName nvarchar(40),
    FirstName nvarchar(40),
    BirthDate date,
)
