USE [master]
GO
/****** Object:  Database [DBnewShop]    Script Date: 5/31/2020 10:06:30 AM ******/
CREATE DATABASE [DBnewShop]
 CONTAINMENT = NONE
 
/****** Object:  Table [dbo].[tbl_Categories]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Customers]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](40) NULL,
	[Address] [nvarchar](40) NULL,
	[City] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employees]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](40) NULL,
	[FirstName] [nvarchar](40) NULL,
	[BirthDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Orders]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [date] NULL,
	[ShipperID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrdersDetails]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrdersDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NULL,
	[SuppliersID] [int] NULL,
	[CategoryID] [int] NULL,
	[Unit] [nvarchar](40) NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Shippers]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Shippers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](40) NULL,
	[Phone] [nvarchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Suppliers]    Script Date: 5/31/2020 10:06:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](40) NULL,
	[Address] [nvarchar](40) NULL,
	[City] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Categories] ON 

INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (1, N'Beverages', N'Soft drinks, coffees, teas, beers, and ales')
INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (2, N'Condiments', N'Sweet and savory sauces, relishes, spreads, and seasonings')
INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (3, N'Confections', N'Desserts, candies, and sweet breads')
INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (4, N'Dairy Products', N'Cheeses')
INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (5, N'Grains/Cereals', N'Breads, crackers, pasta, and cereal')
INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (6, N'Meat/Poultry', N'Prepared meats')
INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (7, N'Produce', N'Dried fruit and bean curd')
INSERT [dbo].[tbl_Categories] ([Id], [CategoryName], [Description]) VALUES (8, N'Seafood', N'Seaweed and fish')
SET IDENTITY_INSERT [dbo].[tbl_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Customers] ON 

INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (1, N'Alfreds Futterkiste', N'Obere Str. 57', N'Berlin', N'Germany')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (2, N'Ana Trujillo Emparedados y helados', N'Avda. de la Constitucion 2222', N'Mexico D.F.', N'Mexico')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (3, N'Antonio Moreno Taqueria', N'Mataderos 2312', N'Mexico D.F.', N'Mexico')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (4, N'Around the Horn', N'120 Hanover Sq.', N'London', N'UK')
SET IDENTITY_INSERT [dbo].[tbl_Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employees] ON 

INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (1, N'Davolio', N'Nancy', CAST(N'1968-12-08' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (2, N'Fuller', N'Andrew', CAST(N'1952-02-19' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (3, N'Leverling', N'Janet', CAST(N'1963-08-30' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (4, N'Peacock', N'Margaret', CAST(N'1958-09-19' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Orders] ON 

INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (1, 1, 1, CAST(N'2001-07-04' AS Date), 1)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (2, 2, 3, CAST(N'2004-07-05' AS Date), 2)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (3, 4, 2, CAST(N'1996-07-08' AS Date), 3)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (4, 3, 4, CAST(N'1996-07-08' AS Date), 3)
SET IDENTITY_INSERT [dbo].[tbl_Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_OrdersDetails] ON 

INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Quantity]) VALUES (1, 4, 1, 12)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Quantity]) VALUES (2, 1, 4, 10)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Quantity]) VALUES (3, 3, 2, 5)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Quantity]) VALUES (4, 2, 3, 9)
SET IDENTITY_INSERT [dbo].[tbl_OrdersDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Products] ON 

INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (1, N'Chais', 1, 1, N'10 boxes x 20 bags', 18.0000)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (2, N'Chang', 1, 1, N'24 - 12 oz bottles', 19.0000)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (3, N'Aniseed Syrup', 1, 2, N'12 - 550 ml bottles', 10.0000)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (4, N'Chef Antons Cajun Seasoning', 2, 2, N'48 - 6 oz jars', 22.0000)
SET IDENTITY_INSERT [dbo].[tbl_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Shippers] ON 

INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (1, N'Speedy Express', N'503-555-9831')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (2, N'United Package', N'503-555-3199')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (3, N'Federal Shipping', N'503-555-9931')
SET IDENTITY_INSERT [dbo].[tbl_Shippers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Suppliers] ON 

INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (1, N'Exotic Liquid', N'49 Gilbert St.', N'London', N'UK')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (2, N'New Orleans Cajun Delights', N'P.O. Box 78934', N'New Orleans', N'USA')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (3, N'Grandma Kellys Homestead', N'707 Oxford Rd.', N'Ann Arbor', N'USA')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (4, N'Tokyo Traders', N'9-8 Sekimai Musashino-shi', N'Tokyo', N'Japan')
SET IDENTITY_INSERT [dbo].[tbl_Suppliers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Cate__8517B2E0DC5EEC81]    Script Date: 5/31/2020 10:06:30 AM ******/
ALTER TABLE [dbo].[tbl_Categories] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Supp__9C5DF66FE7E3E7FE]    Script Date: 5/31/2020 10:06:30 AM ******/
ALTER TABLE [dbo].[tbl_Suppliers] ADD UNIQUE NONCLUSTERED 
(
	[SupplierName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tbl_Customers] ([Id])
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tbl_Employees] ([Id])
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD FOREIGN KEY([ShipperID])
REFERENCES [dbo].[tbl_Shippers] ([Id])
GO
ALTER TABLE [dbo].[tbl_OrdersDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[tbl_Orders] ([Id])
GO
ALTER TABLE [dbo].[tbl_OrdersDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[tbl_Products] ([Id])
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbl_Categories] ([Id])
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD FOREIGN KEY([SuppliersID])
REFERENCES [dbo].[tbl_Suppliers] ([Id])
GO
USE [master]
GO
ALTER DATABASE [DBnewShop] SET  READ_WRITE 
GO
