/*__������� 1_____________________________________________________________________________________
�������� ���� ������ ����������� ����������. ��� ���� ������ ������ ��������� ���� ������� �����.
� ������� ����� �������:
 - ��� ��������, 
 - ���� ��������,
 - ���,
 - �������,
 - ����� ����������,
 - ������ ����������,
 - �������� �����.
��� �������� ���� ������ ����������� ������ CREATE DATABASE. ��� �������� ������� ����������� ������ CREATE TABLE.*/

--1.1.��������� ��
CREATE DATABASE TelephoneDirectory;
GO
USE TelephoneDirectory;
GO

--1.2.��������� �������
CREATE TABLE tbl_Peoples
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
    [FullName] NVARCHAR(255),
	[BirthDate] date,
	[Gender] NVARCHAR(255),
	[Phone] NVARCHAR(12),
    [City] NVARCHAR(255),
    [Country] NVARCHAR(255), 
    [Address] NVARCHAR(255),
)
GO

--*1.3.� ������ ������� ��������� � �������
INSERT INTO tbl_Peoples values ('Jose Pavarotti','1995-06-12','f','503-555-9831','Boise','USA','187 Suffolk Ln'),
							   ('Hari Kumar','2000-09-10','m','503-555-3199','London','UK','90 Wadhurst Rd'),
							   ('Dominique Perrier','2002-12-11','m','503-555-9931','Paris','France','25, rue Lauriston')
GO
SELECT * FROM tbl_Peoples;


/*_________________________________________________________________________________________________________
 ____������� 2____
�������� ���� ������ ��������. ���� ������ ������ ��������� ���������� � ���������, �����������, ��������.
���������� ������� ��������� ����������:
	1. � ���������: ���, email, ���������� �������
	2. � �����������: ���, email, ���������� �������
	3. � ��������: ����������, ��������, �������� ������, ���� �������, ���� ������.
��� �������� ����  ������ �����������  ������ CREATE  DATABASE. ���   ��������   �������   �����������   ������ CREATE TABLE. 
����������� ��� �������� ������ �������� ����� ����� ����.*/

--2.1.��������� ��
CREATE DATABASE Sales;
GO
USE Sales;
GO

--2.2.��������� ������i
CREATE TABLE tbl_Sellers  --�������i
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
    [FullName] NVARCHAR(255),
	[Email] NVARCHAR(255),
	[Phone] NVARCHAR(12)
)
GO

CREATE TABLE tbl_Buyers  --�������
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
    [FullName] NVARCHAR(255),
	[Email] NVARCHAR(255),
	[Phone] NVARCHAR(12)
)
GO

CREATE TABLE tbl_Sales  --������
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[BuyersID] INT FOREIGN KEY REFERENCES tbl_Buyers(Id),
	[SellersID] INT FOREIGN KEY REFERENCES tbl_Sellers(Id),
    [NameProduct] NVARCHAR(255),
	[Price] MONEY,
	[DateOfCase] DATE
)
GO

--*2.3.� ������ ������� ��������� � �������
INSERT INTO tbl_Sellers values('Charlotte Cooper','charlottecooper@gmail.com','503-555-9831'),
							  ('Shelley Burke','bruke32@gmail.com','403-555-3199'),
							  ('Yoshi Nagase','yoshi1nagase@gmail.com','601-555-9931')

INSERT INTO tbl_Buyers values('Maria Anders','marianders@gmail.com','233-651-8832'),
							  ('Thomas Hardy','thomashardy4@gmail.com','453-575-4198'),
							  ('Laurence Lebihans','lebihans@gmail.com','801-746-9939')
							
INSERT INTO tbl_Sales values(2,1,'Chartreuse verte','180','2014-03-09')

SELECT  tbl_Buyers.FullName as Buyer, tbl_Sellers.FullName as Seller ,tbl_Sales.NameProduct,tbl_Sales.Price, tbl_Sales.DateOfCase FROM tbl_Sales
INNER JOIN [tbl_Buyers]
ON  tbl_Sales.BuyersID = tbl_Buyers.Id
INNER JOIN [tbl_Sellers]
ON tbl_Sales.SellersID = tbl_Sellers.Id


/*_________________________________________________________________________________________________________
____������� 3_____
�������� ���� ������ ������������ ����������.���� ������ ������ ��������� ���������� 
	- ������������ ������,
	- ������������, 
	- ������.
���������� ������� ��������� ����������:
	1. � ����������� �����:
		- �������� �����,
		- �����������,
		- ���� �������,
		- �����,
		- ��������
	2. � ������: 
		- �������� ������
	3. �� ������������: 
		- ��������
	4. �� ���������: 
		- ��������,
		- ������
	5. � ������:
		- �������� �����,
		- �������� �����,
		- ������������ �����,
		- ����������� ����� �����,
		- �����������.
����������  ����������  ���������  ����  ������.  ���  �������� ���� ������ ����������� ������ CREATE DATA�BASE. 
��� �������� ������� ����������� ������ CREATE TABLE.  �����������  ���  ��������  ������  ��������  �����  ����� ����.*/

--3.1.��������� ��
CREATE DATABASE MusicCollection;
GO
USE MusicCollection;
GO

--3.2.��������� ������i
/*����, ������ ���� 5 �������: ���, ������ �����, ����������,�����, �������� */

-- ��� ���������� ���� �������� �������: ����� � ���������� � �� �������� 
--��� ������ 2(3) ���� � ����� ������� ������

CREATE TABLE tbl_Publisher
(
	[Id] int IDENTITY PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(255),
	[Country] NVARCHAR(255),
)
GO

CREATE TABLE tbl_Style
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(255),
)
GO

CREATE TABLE tbl_Artist
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(255),
)
GO

-- ��� ������� �����, ���� ����� � �� 3 ��'���� � ������ ���������� ��������� 
CREATE TABLE tbl_CD
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(255),
	[ArtistID] INT FOREIGN KEY REFERENCES tbl_Artist(Id),
	[PublisherID] INT FOREIGN KEY REFERENCES tbl_Publisher(Id),
	[StyleID] INT FOREIGN KEY REFERENCES tbl_Style(Id),
	[DateOfCase] DATE
)
GO

-- � ������� � ���� ������� �� ��� � �� �� ������ ��� ������� ������� ��� �� ������ � �������� �����
--� ��� ��� � ���� ���� �� ������ ��� �� ��� ��������� �� ������ �����
CREATE TABLE tbl_Songs
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(255),
	[LengthSong] TIME,
	[CD_ID] INT FOREIGN KEY REFERENCES tbl_CD(Id),
)

--*3.3.� ������ ������� ��������� � �������
INSERT INTO tbl_Artist VALUES ('Jan Cyrka & Toby Bricheno');
INSERT INTO tbl_Publisher  VALUES ('someone','USA');
INSERT INTO tbl_Style  VALUES ('unknown');
INSERT INTO tbl_CD  VALUES  ('Rock and other energetic music',1,1,1,'11-10-2005');
INSERT INTO tbl_Songs  VALUES ('Pressure Cooker','1:30', 1);

SELECT tbl_Songs.Name as NameSong,tbl_CD.Name as CD_Name, tbl_Artist.Name as artist, tbl_Style.Name as style, tbl_Publisher.Name as publisher FROM tbl_CD
INNER JOIN [tbl_Songs]
ON  tbl_CD.Id = tbl_Songs.CD_ID
INNER JOIN [tbl_Artist]
ON tbl_CD.ArtistID = tbl_Artist.Id
INNER JOIN [tbl_Publisher]
ON tbl_CD.PublisherID = tbl_Publisher.Id
INNER JOIN [tbl_Style]
ON tbl_Style.Id = tbl_CD.StyleID



/*_________________________________________________________________________________________________________
_____������� 4_____
��� ������� ���������� ��������� �� ��������� � ���� ������ �� �������� �������:
	1. ��������  �  ���  ������������  �������  �  �����������  � ����������� ����� ������� � ������� ��������� �� ����
	2. �������� � ��� ������������ ������� � ����������� �� �������� ������� � ����������� ������� �������� �����
	3. �������� � ��� ������������ ������� � ����������� � ������ ������ ����, �������� �������� �����
	4. ������� �� ��� ������������ ������� � ����������� ��  ��������  �������  �  �����������  �������  ��������  �����
	5. ������� ����� ����� ��������� ������������ ������ � �������������
	6. �������� ����� ����� ��������� ������������ ������ � �������������.*/
	

--  4.1.0
ALTER TABLE [tbl_CD]
ADD [Review] NVARCHAR(255);
--*4.1.1 ������ ��������� ���������
Update tbl_CD
SET [Review] = 'Simple good, motivation song'
WHERE tbl_CD.Id = 1;


--  4.2.0
ALTER TABLE [tbl_Publisher]
ADD [Adress] NVARCHAR(255);
--*4.2.1������ ��������� ���������
Update [tbl_Publisher]
SET [Adress] = '770 Mabelle Flat'
WHERE tbl_Publisher.Id = 1;


--4.3.0
ALTER TABLE [tbl_Songs]
ALTER COLUMN [Name] NVARCHAR(200);


--4.4.0
ALTER TABLE [tbl_Publisher]
DROP COLUMN [Adress]


--4.5.0
ALTER TABLE [tbl_CD]
DROP CONSTRAINT [FK__tbl_CD__ArtistID__32E0915F];

ALTER TABLE [tbl_CD]
DROP COLUMN [ArtistID]


--4.6.0
ALTER TABLE [tbl_CD]
ADD [ArtistID] int;

ALTER TABLE [tbl_CD]
ADD FOREIGN KEY (ArtistID) REFERENCES tbl_Artist(Id); 




/*_________________________________________________________________________________________________________
_____������� 5_______
�������� ��������� �������������. � �������� ���� ������ ����������� ���� ������ �� �������� �������:
	1. ������������� ���������� �������� ���� ������
	2. ������������� ���������� �������� ���� ���������
	3. ������������� ���������� ������ ���������� � �����: �������� �����, �����������, ���� �������, �����, ��������.*/

-- �������� ����� �������� - � ������� ����� ������� view(�).