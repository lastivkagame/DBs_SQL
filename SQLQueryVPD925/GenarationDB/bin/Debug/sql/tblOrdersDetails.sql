CREATE TABLE tblOrdersDetails
(
    Id int IDENTITY PRIMARY KEY NOT NULL,
    OrderId int foreign key references tblOrders(Id),
    ProductId int foreign key references tblProducts(Id),
    Price money,
    Quantity int,
)
