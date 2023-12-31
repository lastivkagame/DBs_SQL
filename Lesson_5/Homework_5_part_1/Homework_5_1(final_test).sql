USE [master]
GO
/****** Object:  Database [FinalTest]     ******/
CREATE DATABASE [FinalTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalTest', FILENAME = N'D:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\FinalTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalTest_log', FILENAME = N'D:\SQL2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\FinalTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinalTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalTest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FinalTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FinalTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalTest] SET  MULTI_USER 
GO
ALTER DATABASE [FinalTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalTest] SET QUERY_STORE = OFF
GO
USE [FinalTest]
GO
/****** Object:  UserDefinedTableType [dbo].[CategoryType]    ******/
CREATE TYPE [dbo].[CategoryType] AS TABLE(
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL
)
GO
/****** Object:  Table [dbo].[tbl_Categories]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Suppliers]     ******/
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
/****** Object:  Table [dbo].[tbl_Products]     ******/
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
/****** Object:  View [dbo].[View_Products]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Products]
AS
SELECT        NEWID() AS Id, dbo.tbl_Products.Id AS ProductId, dbo.tbl_Products.ProductName, dbo.tbl_Products.CategoryId, 
                dbo.tbl_Products.Unit, dbo.tbl_Products.Price, dbo.tbl_Categories.Name AS CategoryName, 
                         dbo.tbl_Suppliers.SupplierName AS SupplierName, dbo.tbl_Suppliers.Address AS SupplierAddress
FROM            dbo.tbl_Categories INNER JOIN
                         dbo.tbl_Products ON dbo.tbl_Categories.Id = dbo.tbl_Products.CategoryId INNER JOIN
                         dbo.tbl_Suppliers ON dbo.tbl_Products.SuppliersID = dbo.tbl_Suppliers.Id;
GO
/****** Object:  Table [dbo].[tbl_Customers]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NULL,
	[Address] [nvarchar](225) NULL,
	[City] [nvarchar](225) NULL,
	[Country] [nvarchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employees]    ******/
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
/****** Object:  Table [dbo].[tbl_Orders]    ******/
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
/****** Object:  Table [dbo].[tbl_OrdersDetails]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrdersDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Shippers]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Shippers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](40) NULL,
	[Phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Categories] ON 

INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (1, N'Beverages', N'Soft drinks, coffees, teas, beers, and ales')
INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (2, N'Condiments', N'Sweet and savory sauces, relishes, spreads, and seasonings')
INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (3, N'Confections', N'Desserts, candies, and sweet breads')
INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (4, N'Dairy Products', N'Cheeses')
INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (5, N'Grains/Cereals', N'Breads, crackers, pasta, and cereal')
INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (6, N'Meat/Poultry', N'Prepared meats')
INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (7, N'Produce', N'Dried fruit and bean curd')
INSERT [dbo].[tbl_Categories] ([Id], [Name], [Description]) VALUES (8, N'Seafood', N'Seaweed and fish')
SET IDENTITY_INSERT [dbo].[tbl_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Customers] ON 

INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (1, N'Irwin Cronin', N'96669 Lubowitz Neck', N'North Zella', N'Pakistan')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (2, N'Alena Davis', N'90484 Kayden Stravenue', N'Jocelynview', N'Niue')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (3, N'Damion Jast', N'789 Micheal Spurs', N'South Wilburn', N'Northern Mariana Islands')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (4, N'Eulah Lehner', N'97830 Gusikowski Place', N'New Annettaberg', N'Fiji')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (5, N'Wilma Crona', N'833 Felipe Hills', N'South Skylaview', N'Heard Island and McDonald Islands')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (6, N'Іванна Шевченко', N'площа Брюховичів, 0', N'Північний Єремій', N'Японія')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (7, N'Славомир Гладух', N'площа Коліївщини, 6', N'Тернопіль', N'Федеративні Штати Мікронезії')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (8, N'Горислав Михайлюк', N'площа Рудного, 869', N'Бровари', N'Вануату')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (9, N'Ян Стецьків', N'пр. Вічева, 143', N'Чернігів', N'Науру')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (10, N'Zola Heidenreich', N'155 Hahn Way', N'Port Sheldon', N'Cape Verde')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (11, N'Dion Dooley', N'6324 Robin Islands', N'Rennerfort', N'Chad')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (12, N'Rodrick Konopelski', N'408 Hermiston Parks', N'Uptonburgh', N'Cook Islands')
INSERT [dbo].[tbl_Customers] ([Id], [CustomerName], [Address], [City], [Country]) VALUES (13, N'Judge Lockman', N'01762 Lindsey Rapids', N'New Ebonychester', N'Hong Kong')
SET IDENTITY_INSERT [dbo].[tbl_Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Employees] ON 

INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (1, N'Barton', N'Halle', CAST(N'1965-10-05' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (2, N'Torp', N'Florian', CAST(N'1973-11-01' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (3, N'DuBuque', N'Selmer', CAST(N'1994-11-03' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (4, N'O''Hara', N'Edmond', CAST(N'1967-02-12' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (5, N'Марків', N'Ілона', CAST(N'1981-12-02' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (6, N'Горовий', N'Хорив', CAST(N'1973-06-26' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (7, N'Павленко', N'Віленіна', CAST(N'1984-08-16' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (8, N'Gaylord', N'Jonatan', CAST(N'1974-03-19' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (9, N'Brown', N'Mohammad', CAST(N'1971-06-06' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (10, N'Kirlin', N'Kira', CAST(N'1982-04-17' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (11, N'Runolfsson', N'Maxine', CAST(N'1960-12-28' AS Date))
INSERT [dbo].[tbl_Employees] ([Id], [LastName], [FirstName], [BirthDate]) VALUES (12, N'Altenwerth', N'Johnathon', CAST(N'2000-02-03' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Orders] ON 

INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (1, 3, 2, CAST(N'2000-07-20' AS Date), 1)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (2, 5, 2, CAST(N'1999-04-02' AS Date), 2)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (3, 3, 4, CAST(N'2002-08-27' AS Date), 3)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (4, 3, 4, CAST(N'1999-11-30' AS Date), 3)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (5, 3, 3, CAST(N'2004-01-10' AS Date), 1)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (6, 5, 5, CAST(N'1996-06-04' AS Date), 2)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (7, 5, 6, CAST(N'2018-06-17' AS Date), 6)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (8, 3, 3, CAST(N'2014-11-25' AS Date), 5)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (9, 3, 4, CAST(N'1995-09-08' AS Date), 3)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (10, 11, 3, CAST(N'2018-04-20' AS Date), 3)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (11, 7, 7, CAST(N'2015-04-13' AS Date), 9)
INSERT [dbo].[tbl_Orders] ([Id], [CustomerID], [EmployeeID], [OrderDate], [ShipperID]) VALUES (12, 10, 8, CAST(N'2005-07-19' AS Date), 4)
SET IDENTITY_INSERT [dbo].[tbl_Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_OrdersDetails] ON 

INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (1, 3, 1, 377.5000, 94)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (2, 5, 6, 88.5400, 166)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (3, 1, 7, 92.4100, 49)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (4, 2, 3, 492.9800, 158)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (5, 2, 5, 880.8900, 141)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (6, 1, 9, 723.6000, 48)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (7, 2, 11, 887.0600, 14)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (8, 4, 12, 503.7900, 128)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (9, 6, 15, 39.9000, 76)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (10, 1, 9, 393.0900, 94)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (11, 3, 8, 223.9700, 194)
INSERT [dbo].[tbl_OrdersDetails] ([Id], [OrderID], [ProductID], [Price], [Quantity]) VALUES (12, 12, 9, 638.9100, 108)
SET IDENTITY_INSERT [dbo].[tbl_OrdersDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Products] ON 

INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (1, N'Licensed Frozen Bike', 4, 3, N'Wooden', 777.5600)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (2, N'Generic Metal Pants', 4, 3, N'Rubber', 29.7600)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (3, N'Incredible Granite Keyboard', 1, 1, N'Wooden', 646.7500)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (4, N'Handmade Wooden Car', 1, 2, N'Fresh', 567.9000)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (5, N'Incredible Concrete Towels', 3, 6, N'Metal', 328.3400)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (6, N'Sleek Steel Bike', 4, 6, N'Granite', 885.5100)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (7, N'Practical Wooden Car', 3, 7, N'Granite', 523.3900)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (8, N'Practical Granite Chips', 7, 1, N'Concrete', 180.9000)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (9, N'Practical Soft Car', 6, 6, N'Cotton', 468.3700)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (10, N'Practical Frozen Bike', 4, 1, N'Rubber', 689.1500)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (11, N'Unbranded Frozen Bacon', 4, 2, N'Plastic', 913.8300)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (12, N'Gorgeous Soft Fish', 5, 7, N'Steel', 861.8300)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (13, N'Gorgeous Rubber Hat', 4, 2, N'Wooden', 727.4700)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (14, N'Unbranded Rubber Towels', 9, 1, N'Steel', 554.0500)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (15, N'Small Plastic Gloves', 2, 1, N'Frozen', 138.7400)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (16, N'Handcrafted Metal Shirt', 2, 3, N'Soft', 40.3300)
INSERT [dbo].[tbl_Products] ([Id], [ProductName], [SuppliersID], [CategoryID], [Unit], [Price]) VALUES (17, N'Gorgeous Fresh Chair', 11, 5, N'Wooden', 30.9200)
SET IDENTITY_INSERT [dbo].[tbl_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Shippers] ON 

INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (1, N'Борис Левадовський', N'(066) 729-96-29')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (2, N'Павліна Москаль', N'(093) 481-51-66')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (3, N'Яромил Шумило', N'(063) 750-83-66')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (4, N'Finn Steuber', N'799-535-4671 x9740')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (5, N'Peter Terry', N'1-387-668-0003 x0928')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (6, N'Nella Schumm', N'641-797-0917 x4489')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (7, N'Garett Bins', N'554-289-6411 x4813')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (8, N'Jakob Hackett', N'766-255-4268 x89906')
INSERT [dbo].[tbl_Shippers] ([Id], [ShipperName], [Phone]) VALUES (9, N'Serena Greenholt', N'923.739.3855 x7390')
SET IDENTITY_INSERT [dbo].[tbl_Shippers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Suppliers] ON 

INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (1, N'Lawson Swift', N'5439 Barrett Knoll', N'Weissnatchester', N'Russian Federation')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (2, N'Makenna Schimmel', N'761 Lavina Mountains', N'McCulloughville', N'Sweden')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (3, N'Sydney Cruickshank', N'883 Lily Drives', N'Kulasville', N'Guatemala')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (4, N'Sydnie Muller', N'240 Kessler Landing', N'Andreanneland', N'Albania')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (5, N'Валерія Кордун', N'пров. Вузька, 082', N'Артемівськ', N'Танзанія')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (6, N'Зиновій Іванишин', N'Нижанківського майдан, 5', N'Суми', N'Габон')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (7, N'Мар’ян Скоропадський', N'площа Зелена, 445', N'Східний Яровид', N'Гвінея-Бісау')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (8, N'Агапія Тарасюк', N'Вузька майдан, 534', N'Херсон', N'Бахрейн')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (9, N'Kane Kshlerin', N'017 Torp Views', N'East Blake', N'Maldives')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (10, N'Emelie Hammes', N'667 Schuster Burg', N'South Mayeport', N'Dominican Republic')
INSERT [dbo].[tbl_Suppliers] ([Id], [SupplierName], [Address], [City], [Country]) VALUES (11, N'Leanna Keebler', N'75852 Doyle Shore', N'West Korbin', N'Albania')
SET IDENTITY_INSERT [dbo].[tbl_Suppliers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Cate__737584F659F832B2]    ******/
ALTER TABLE [dbo].[tbl_Categories] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_Supp__9C5DF66FF5EE5DD3]     ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertCategoryList]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertCategoryList]
@ListInsert CategoryType READONLY
AS
BEGIN 
  INSERT INTO tbl_Categories
  SELECT * FROM @ListInsert
END
GO
USE [master]
GO
ALTER DATABASE [FinalTest] SET  READ_WRITE 
GO
