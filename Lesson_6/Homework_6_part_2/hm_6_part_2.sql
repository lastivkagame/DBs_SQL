/*		������� 1.
� ���� ������ ����������� ������� �� ������������� ������� � ����� ������ �������� ��������� ��������:
	1. ��� ���������� ������ ������ ������� ��������� ��� ������� �� ������, ���� ����� ����� ���� � �����
		������ � ������ ��������� � ��� ������������� �������, ������ ���������� ���������� 
		���������� ���������� � ���������� ������
	2. ��� ���������� ���������� ������� ��������� ���������� �� ��������� ���������� � ������� ������ �����������
	3. ������� ��������� ��������� ������ ��������, ���� ���������� ������������ ��������� ������ 6.*/
	
--������� �������: � ��� �� ���� ������ ����������� �������� ���� ���� � ���� ��������������� �� Shop ��� ����� ������

USE ShopRandom;
GO

--1 ��������� ������
CREATE TRIGGER tr_Product
ON tbl_Products
AFTER INSERT
AS
DECLARE @Name NVARCHAR(225)
SELECT @Name = (SELECT ProductName FROM tbl_Products WHERE Id = (SELECT MAX(Id) FROM tbl_Products))
DECLARE @SupID int
SELECT @SupID = (SELECT SuppliersID FROM tbl_Products WHERE Id = (SELECT MAX(Id) FROM tbl_Products))
DECLARE @CatID int
SELECT @CatID = (SELECT CategoryID FROM tbl_Products WHERE Id = (SELECT MAX(Id) FROM tbl_Products))
DECLARE @Unit NVARCHAR(225)
SELECT @Unit = (SELECT Unit FROM tbl_Products WHERE Id = (SELECT MAX(Id) FROM tbl_Products))
DECLARE @Prices MONEY
SELECT @Prices = (SELECT Price FROM tbl_Products WHERE Id = (SELECT MAX(Id) FROM tbl_Products))
DECLARE @Quantit INT
SELECT @Quantit = (SELECT Quantity FROM tbl_Products WHERE Id = (SELECT MAX(Id) FROM tbl_Products))
DECLARE @Id INT
SELECT @Id = (SELECT Id FROM tbl_Products WHERE NOT Id = (SELECT MAX(Id) FROM tbl_Products) AND ProductName = @Name AND @SupID = SuppliersID AND @CatID = CategoryID AND Unit = @Unit AND Price = @Prices)
IF @Id != ''
DELETE FROM tbl_Products
WHERE Id = (SELECT MAX(Id) FROM tbl_Products)
IF @Id != ''
UPDATE tbl_Products
SET Quantity = Quantity + @Quantit
WHERE Id = @Id;

--1.2 ������
INSERT INTO tbl_Products values('Chais', '1', '1', '10 boxes x 20 bags', 18, 2);
INSERT INTO tbl_Products values('Something','1','1','24 - 12 oz bottles', 19, 3);
INSERT INTO tbl_Products values('Sweet','2','1','2kg', 50, 2);

SELECT * FROM tbl_Products; 


--______________________________
--2  ��� ���������� ���������� ������� ��������� ���������� �� ��������� ���������� � ������� ������ �����������
--2.1 C������� ������ ������� ��� ����� ����������
CREATE TABLE tbl_Archive_Employees
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	LastName nvarchar(40),
	FirstName nvarchar(40),
	BirthDate date,
);

--2.2 ����� ����� � ������
CREATE TRIGGER Archive_Employees
ON tbl_Employees
AFTER DELETE
AS
INSERT INTO tbl_Archive_Employees (LastName, FirstName, BirthDate)
SELECT LastName, FirstName, BirthDate FROM DELETED

--2.3 � ������
DELETE FROM [tbl_Employees]
WHERE Id = 5;

SELECT * FROM [tbl_Employees]
SELECT * FROM [tbl_Archive_Employees]


--________________________________
--3  ������� ��������� ��������� ������ ��������, ���� ���������� ������������ ��������� ������ 6.
--� ���� ������� �������� ���� ���� ������� tbl_employees(����������) ��� tbl_suppliers(�������������)
-- � ����� ������� ���������� �� ��� �� ��� ����� ��� �������

--3.1 �������� �������
CREATE TRIGGER Max_Employees
ON tbl_Employees
AFTER INSERT
AS
DECLARE @Counts int
SELECT @Counts = (SELECT COUNT(Id) FROM tbl_Employees)
IF @Counts > 6
DELETE FROM tbl_Employees
WHERE Id = (SELECT MAX(Id) FROM tbl_Employees)
IF @Counts > 6
PRINT 'TOO more employees'; 

--3.2 ������
INSERT INTO tbl_Employees VALUES ('Jake', 'Porton', '1998-11-29')
INSERT INTO tbl_Employees VALUES ('Lucy', 'Willison', '2002-09-04')
INSERT INTO tbl_Employees VALUES ('Janet', 'Fuller', '1999-03-15')
			



/*____________________________________________________________________________________________________________________________
		������� 2.
� ���� ������ ������������ ���������� �� ������������� ������� ������ ������� � ��������� � ��������������� � MS SQL Server�
�������� ��������� ��������:
	1. �������  ��  �����������  ��������  ���  ������������  � ��������� ������
	2. ������� �� ����������� ������� ����� ������ The Beatles
	3. ���  ��������  �����  �������  ���������  ����������  ��  ��������� ����� � ������� ������
	4. �������  ��  �����������  ���������  �  ���������  �����  ������������ ����� �Dark Power Pop�.*/

USE MusicCollection;
GO

--1 *�� ������� � ����� ������� CD 
--1.1 ������� ������
CREATE TRIGGER Not_Repeat_CD
ON tbl_CD
AFTER INSERT
AS
DECLARE @Name NVARCHAR(225)
SELECT @Name = (SELECT [Name] FROM tbl_CD WHERE Id = (SELECT MAX(Id) FROM tbl_CD))
DECLARE @Pubid INT
SELECT @Pubid = (SELECT PublisherID FROM tbl_CD WHERE Id = (SELECT MAX(Id) FROM tbl_CD))
DECLARE @Styleid INT
SELECT @Styleid = (SELECT StyleID FROM tbl_CD WHERE Id = (SELECT MAX(Id) FROM tbl_CD))
DECLARE @Artistid INT
SELECT @Artistid = (SELECT ArtistID FROM tbl_CD WHERE Id = (SELECT MAX(Id) FROM tbl_CD))
DECLARE @dates DATE
SELECT @dates = (SELECT DateOfCase FROM tbl_CD WHERE Id = (SELECT MAX(Id) FROM tbl_CD))
DECLARE @Id INT
SELECT @Id = (SELECT Id FROM tbl_CD WHERE NOT Id = (SELECT MAX(Id) FROM tbl_CD) AND [Name] = @Name 
AND @Pubid = PublisherID AND @Styleid = StyleID AND ArtistID = @Artistid AND DateOfCase = @dates)
IF @Id != ''
DELETE FROM tbl_CD
WHERE Id = (SELECT MAX(Id) FROM tbl_CD)
IF @Id != ''
PRINT 'Already exist this CD'

--1.2 ������
INSERT INTO tbl_CD VALUES ('Different music', 2, 1,'2007-09-03',' - ', 3);
INSERT INTO tbl_CD VALUES ('New Music', 1, 2,'2017-07-17',' - ', 3);

SELECT * FROM tbl_CD;


--____________________________
--2 ������� �� ����������� ������� ����� ������ The Beatles
-- ���� ������
CREATE TRIGGER NOT_DEL_TheBeatles
ON tbl_CD
AFTER DELETE
AS
DECLARE @Artistid INT
SELECT @Artistid = (SELECT Id FROM tbl_Artist WHERE [Name] = 'The Beatles')
DECLARE @Beatlesid INT
SELECT @Beatlesid = (SELECT Id FROM DELETED WHERE ArtistID = @Artistid)
IF @Beatlesid != ''
INSERT INTO tbl_CD ([Name], PublisherID, StyleID, DateOfCase, Review, ArtistID)
SELECT [Name], PublisherID, StyleID, DateOfCase, Review, ArtistID FROM DELETED
WHERE Id = @Beatlesid
IF @Beatlesid != ''
PRINT 'You cant delete CD by group The Beatles'

--2.1 ������
DELETE FROM tbl_CD
WHERE Id = 8;

SELECT * FROM tbl_CD;


--______________________________
--3 ���  ��������  �����  �������  ���������  ����������  ��  ��������� ����� � ������� ������
--3.1 C������� ������ ������� ��� ����� �����
CREATE TABLE tbl_Archive_�D
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	[Name] nvarchar(255),
	PublisherID INT,
	StyleID INT,
	DateOfCase date,
	Review nvarchar(255),
	ArtistID INT
);

--3.2 ����� ����� � ������
CREATE TRIGGER Archive_CD
ON tbl_CD
AFTER DELETE
AS
INSERT INTO tbl_Archive_�D ([Name], PublisherID, StyleID, DateOfCase, Review, ArtistID)
SELECT [Name], PublisherID, StyleID, DateOfCase, Review, ArtistID FROM DELETED

--3.3 � ������
DELETE FROM [tbl_CD]
WHERE Id = 6;
SELECT * FROM [tbl_CD]
SELECT * FROM tbl_Archive_�D


--_______________________
--4 4. �������  ��  �����������  ���������  �  ���������  �����  ������������ ����� �Dark Power Pop�
--4.1 ������� �������
CREATE TRIGGER Not_DarkPowerPop
ON tbl_CD
AFTER INSERT
AS
DECLARE @Styleid int
SELECT @Styleid = (SELECT Id FROM tbl_Style WHERE [Name] = 'Dark Power Pop')
DECLARE @CD_Styleid int
SELECT @CD_Styleid = (SELECT Id FROM tbl_CD WHERE StyleID = @Styleid)
IF @CD_Styleid != ''
DELETE FROM tbl_CD
WHERE StyleID = @Styleid
IF @CD_Styleid != ''
PRINT 'You cant add CD by style - Dark Power Pop'; 

--4.2 ������
INSERT INTO tbl_CD VALUES ('New Music Dark Pop', 1, 4,'2017-07-17',' - ', 4);
INSERT INTO tbl_CD VALUES ('New Music', 1, 3,'2018-02-11',' something new ', 2);

SELECT * FROM tbl_CD;




/*_____________________________________________________________________________________________________________________________
			������� 3. 
� ���� ������ �������� �� ������������� ������� ������ ������� � ��������� � ��������������� � MS SQL Server�
�������� ��������� ��������:
	1. ���  ����������  ������  ����������  �������  ���������  ������� ����������� � ����� �� ��������. 
		��� ���������� ���������� ������� ���������� �� ���� ���������� � ����������� �������
	2. ��� �������� ���������� � ���������� ������� ��������� ��� ������� ������� � ������� �������� �������
	3. ��� ���������� �������� ������� ��������� ���� �� �� � ������� �����������, ���� ������ ����������
		���������� ������ �������� ����������
	4. ��� ���������� ���������� ������� ��������� ���� �� �� � ������� ���������, ���� ������ ���������� 
		���������� ������ ���������� ����������
	5. ������� �� ��������� ��������� ���������� � ������� ����� �������: ������, �����, �����, �����.*/

USE Sales;
GO

--1 
--1.1 �������� �� ���������� �������
CREATE TABLE tbl_RepeatBuyers
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	FullName nvarchar(255),
	Quality INT DEFAULT(2)
)

--1.2 ����� ������
CREATE TRIGGER RepeatBuyer
ON tbl_Buyers
AFTER INSERT
AS
DECLARE @FullName nvarchar(255)
SELECT @FullName = (SELECT FullName FROM tbl_Buyers WHERE Id = (SELECT MAX(Id) FROM tbl_Buyers))
DECLARE @NameRepeatId INT
SELECT @NameRepeatId = (SELECT Id FROM tbl_RepeatBuyers WHERE @FullName = FullName)
DECLARE @CountRepeat INT
SELECT @CountRepeat = (SELECT COUNT(Id) FROM tbl_RepeatBuyers WHERE @FullName = FullName)
DECLARE @BuyersCount INT
SELECT @BuyersCount = (SELECT COUNT(*) FROM tbl_Buyers WHERE FullName = @FullName AND Id != (SELECT MAX(Id) FROM tbl_Buyers))
UPDATE tbl_RepeatBuyers SET Quality = Quality + 1 WHERE FullName = @FullName AND Id = @NameRepeatId AND @NameRepeatId != ''
IF @BuyersCount > 0 AND @CountRepeat = 0
INSERT INTO tbl_RepeatBuyers(FullName) VALUES (@FullName);

INSERT INTO tbl_Buyers VALUES ('Janna Miler', 'miler32@gmail.com', '233-651-8832');
INSERT INTO tbl_Buyers VALUES ('Olya Hery', 'olyanders@gmail.com', '244-851-9836');
INSERT INTO tbl_Buyers VALUES ('Jack Rivera', 'jack1riv@gmail.com', '244-851-9836');
				
SELECT * FROM tbl_Buyers;
SELECT * FROM tbl_RepeatBuyers;


--_________________________
--2 ��� �������� ���������� � ���������� ������� ��������� ��� ������� ������� � ������� �������� �������
--2.1 �������� ������� ����� �������
CREATE TABLE tbl_Archive_Sales
(
	Id int IDENTITY PRIMARY KEY NOT NULL,
	Buyers NVARCHAR(255),
	SellersID INT,
	NameProduct NVARCHAR(255),
	Price MONEY,
	DateOfCase DATE
)

--2.2 ������� � �������� ������
CREATE TRIGGER Archive_SalesByDelBuyers
ON tbl_Buyers
INSTEAD OF DELETE
AS
DECLARE @BuyerId INT
SELECT @BuyerId = (SELECT Id FROM DELETED)
DECLARE @BuyerName NVARCHAR(255)
SELECT @BuyerName = (SELECT FullName FROM DELETED)
INSERT INTO tbl_Archive_Sales (Buyers, SellersID , NameProduct, Price, DateOfCase)
SELECT @BuyerName, SellersID , NameProduct, Price, DateOfCase FROM tbl_Sales WHERE BuyersID = @BuyerId
DELETE FROM tbl_Sales
WHERE BuyersID = @BuyerId;
DELETE FROM tbl_Buyers
WHERE Id = @BuyerId;

--3.3 � ������
SELECT * FROM tbl_Sales
SELECT * FROM tbl_Buyers
SELECT * FROM tbl_Archive_Sales;

INSERT INTO tbl_Sales VALUES (150, 3, 'Chocolate', 30, '2020-02-05')

DELETE FROM tbl_Buyers
WHERE Id = 150;



--________________________________
--3 ��� ���������� �������� ������� ��������� ���� �� �� � ������� �����������, ���� ������ ���������� ���������� ������ �������� ����������
--3.1 ������� ������
CREATE TRIGGER AddSellers
ON tbl_Sellers
AFTER INSERT
AS
DECLARE @FullName nvarchar(255)
SELECT @FullName = (SELECT FullName FROM tbl_Sellers WHERE Id = (SELECT MAX(Id) FROM tbl_Sellers))
DECLARE @Email NVARCHAR(255)
SELECT @Email = (SELECT Email FROM tbl_Sellers WHERE Id = (SELECT MAX(Id) FROM tbl_Sellers))
DECLARE @NameId INT
SELECT @NameId = (SELECT Id FROM tbl_Buyers WHERE @FullName = FullName)
DECLARE @EmailId INT
SELECT @EmailId = (SELECT Id FROM tbl_Buyers WHERE @Email = Email)
IF @NameId != '' AND @EmailId != ''
DELETE FROM tbl_Sellers
WHERE Id = (SELECT MAX(Id) FROM tbl_Sellers);

--3.2 ������
SELECT * FROM tbl_Sellers;
SELECT * FROM tbl_Buyers;

INSERT INTO tbl_Sellers VALUES ('Laurence Lebihans', 'lebihans@gmail.com', '801-746-9939');
INSERT INTO tbl_Sellers VALUES ('Jack Notis', 'notis@gmail.com', '567-525-5867');


--______________________________
--4 ��� ���������� ���������� ������� ��������� ���� �� �� � ������� ���������, ���� ������ ���������� ���������� ������ ���������� ����������
--4.1 ������� ������
CREATE TRIGGER AddBuyers
ON tbl_Buyers
AFTER INSERT
AS
DECLARE @FullName nvarchar(255)
SELECT @FullName = (SELECT FullName FROM tbl_Buyers WHERE Id = (SELECT MAX(Id) FROM tbl_Buyers))
DECLARE @Email NVARCHAR(255)
SELECT @Email = (SELECT Email FROM tbl_Buyers WHERE Id = (SELECT MAX(Id) FROM tbl_Buyers))
DECLARE @NameId INT
SELECT @NameId = (SELECT Id FROM tbl_Sellers WHERE @FullName = FullName)
DECLARE @EmailId INT
SELECT @EmailId = (SELECT Id FROM tbl_Sellers WHERE @Email = Email)
IF @NameId != '' AND @EmailId != ''
DELETE FROM tbl_Buyers
WHERE Id = (SELECT MAX(Id) FROM tbl_Buyers);

--4.2 ������
SELECT * FROM tbl_Sellers;
SELECT * FROM tbl_Buyers;

INSERT INTO tbl_Buyers VALUES ('Jack Notis', 'notis@gmail.com', '801-746-9939');
INSERT INTO tbl_Buyers VALUES ('Joanna Lebinhton', 'joan12@gmail.com', '924-725-9825');


--_______________________
--5 ������� �� ��������� ��������� ���������� � ������� ����� �������: ������, �����, �����, �����
--5.1 ������� ������
ALTER TRIGGER NotSomeProduct
ON tbl_Sales
AFTER INSERT
AS
DECLARE @ProductName nvarchar(255)
SELECT @ProductName = (SELECT NameProduct FROM tbl_Sales WHERE Id = (SELECT MAX(Id) FROM tbl_Sales))
IF @ProductName = '������' OR @ProductName = '�����' OR @ProductName = '�����' OR @ProductName = '�����' 
OR @ProductName = 'apples' OR @ProductName = 'pears' OR @ProductName = 'plums' OR @ProductName = 'cilantro' 
DELETE FROM tbl_Sales
WHERE Id = (SELECT MAX(Id) FROM tbl_Sales)
IF @ProductName = '������' OR @ProductName = '�����' OR @ProductName = '�����' OR @ProductName = '�����' 
OR @ProductName = 'apples' OR @ProductName = 'pears' OR @ProductName = 'plums' OR @ProductName = 'cilantro' 
PRINT 'You cant add product as apples, pears, plums, cilantro'

--5.2 ������
SELECT * FROM tbl_Sales;

INSERT INTO tbl_Sales VALUES (3,2,'�����',90.50, '2017-09-11');
INSERT INTO tbl_Sales VALUES (1,2,'bananas', 60.70, '2019-11-15');
INSERT INTO tbl_Sales VALUES (2,1,'apples', 100.30, '2018-08-12');
