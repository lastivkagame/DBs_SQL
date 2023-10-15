CREATE TABLE tblOrders
(
    Id int IDENTITY PRIMARY KEY NOT NULL,
    CustomerId int foreign key references tblCustomers(Id),
    EmployeeId int foreign key references tblEmployees(Id),
    ShipperId int foreign key references tblShippers(Id),
    OrderDate date,
)
