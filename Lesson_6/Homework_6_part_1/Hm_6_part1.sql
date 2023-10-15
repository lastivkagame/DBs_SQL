/*__Задание 1_____________________________________________________________________________________
Создайте базу данных «Телефонный спра­вочник». Эта база данных должна содержать одну таблицу «Люди».
В таблице нужно хранить:
 - ФИО человека, 
 - дату рождения,
 - пол,
 - телефон,
 - город проживания,
 - страна про­живания,
 - домашний адрес.
Для создания базы данных используйте запрос CREATE DATABASE. Для создания таблицы используйте запрос CREATE TABLE.*/

--1.1.Створюємо бд
CREATE DATABASE TelephoneDirectory;
GO
USE TelephoneDirectory;
GO

--1.2.Створюємо таблицю
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

--*1.3.І просто тестово заповнимо і глянемо
INSERT INTO tbl_Peoples values ('Jose Pavarotti','1995-06-12','f','503-555-9831','Boise','USA','187 Suffolk Ln'),
							   ('Hari Kumar','2000-09-10','m','503-555-3199','London','UK','90 Wadhurst Rd'),
							   ('Dominique Perrier','2002-12-11','m','503-555-9931','Paris','France','25, rue Lauriston')
GO
SELECT * FROM tbl_Peoples;


/*_________________________________________________________________________________________________________
 ____Задание 2____
Создайте базу данных «Продажи». База данных должна содержать информацию о продавцах, покупателях, продажах.
Необходимо хранить следующую информацию:
	1. О продавцах: ФИО, email, контактный телефон
	2. О покупателях: ФИО, email, контактный телефон
	3. О продажах: покупатель, продавец, название товара, цена продажи, дата сделки.
Для создания базы  данных используйте  запрос CREATE  DATABASE. Для   создания   таблицы   используйте   запрос CREATE TABLE. 
Обязательно при создании таблиц задавать связи между ними.*/

--2.1.Створюємо бд
CREATE DATABASE Sales;
GO
USE Sales;
GO

--2.2.Створюємо таблицi
CREATE TABLE tbl_Sellers  --продавцi
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
    [FullName] NVARCHAR(255),
	[Email] NVARCHAR(255),
	[Phone] NVARCHAR(12)
)
GO

CREATE TABLE tbl_Buyers  --покупці
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
    [FullName] NVARCHAR(255),
	[Email] NVARCHAR(255),
	[Phone] NVARCHAR(12)
)
GO

CREATE TABLE tbl_Sales  --продажі
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[BuyersID] INT FOREIGN KEY REFERENCES tbl_Buyers(Id),
	[SellersID] INT FOREIGN KEY REFERENCES tbl_Sellers(Id),
    [NameProduct] NVARCHAR(255),
	[Price] MONEY,
	[DateOfCase] DATE
)
GO

--*2.3.І просто тестово заповнимо і глянемо
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
____Задание 3_____
Создайте базу данных «Музыкальная коллек­ция».База данных должна содержать информацию 
	- музы­кальных дисках,
	- исполнителях, 
	- стилях.
Необходимо хранить следующую информацию:
	1. О музыкальном диске:
		- название диска,
		- исполнитель,
		- дата выпуска,
		- стиль,
		- издатель
	2. О стилях: 
		- названия стилей
	3. Об исполнителях: 
		- название
	4. Об издателях: 
		- название,
		- страна
	5. О песнях:
		- название песни,
		- название диска,
		- длительность песни,
		- музыкальный стиль песни,
		- исполнитель.
Продумайте  правильную  структуру  базы  данных.  Для  создания базы данных используйте запрос CREATE DATA­BASE. 
Для создания таблицы используйте запрос CREATE TABLE.  Обязательно  при  создании  таблиц  задавать  связи  между ними.*/

--3.1.Створюємо бд
CREATE DATABASE MusicCollection;
GO
USE MusicCollection;
GO

--3.2.Створюємо таблицi
/*Отже, всього буде 5 таблиць: пісні, музичні диски, виконавець,стиль, видавець */

-- Далі найпростіше буде створити таблиці: стиль і виконавець і ще видавець 
--там всього 2(3) поля і ніяких зовнішніх ключів

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

-- Далі таблиця диски, вона якраз і має 3 зв'язки з іншими попередніми таблицями 
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

-- І остання в умові описано які дані і що має містити але оскільки таблиця пісні має звязок з таблицею диски
--а там вже є деякі поля що описані там то тут дублювати їх небачу сенсу
CREATE TABLE tbl_Songs
(
	[Id] INT IDENTITY PRIMARY KEY NOT NULL,
	[Name] NVARCHAR(255),
	[LengthSong] TIME,
	[CD_ID] INT FOREIGN KEY REFERENCES tbl_CD(Id),
)

--*3.3.І просто тестово заповнимо і глянемо
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
_____Задание 4_____
Все задания необходимо выполнить по отно­шению к базе данных из третьего задания:
	1. Добавьте  к  уже  существующей  таблице  с  информацией  о музыкальном диске столбец с краткой рецензией на него
	2. Добавьте к уже существующей таблице с информацией об издателе столбец с юридическим адресом главного офиса
	3. Измените в уже существующей таблице с информацией о песнях размер поля, хранящий название песни
	4. Удалите из уже существующей таблицы с информацией об  издателе  столбец  с  юридическим  адресом  главного  офиса
	5. Удалите связь между таблицами «музыкальных дисков» и «исполнителей»
	6. Добавьте связь между таблицами «музыкальных дисков» и «исполнителей».*/
	

--  4.1.0
ALTER TABLE [tbl_CD]
ADD [Review] NVARCHAR(255);
--*4.1.1 просто додатково заповнимо
Update tbl_CD
SET [Review] = 'Simple good, motivation song'
WHERE tbl_CD.Id = 1;


--  4.2.0
ALTER TABLE [tbl_Publisher]
ADD [Adress] NVARCHAR(255);
--*4.2.1просто додатково заповнимо
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
_____Задание 5_______
Создайте следующие представления. В качестве базы данных используйте базу данных из третьего задания:
	1. Представление отображает названия всех стилей
	2. Представление отображает названия всех издателей
	3. Представление отображает полную информацию о диске: название диска, исполнитель, дата выпуска, стиль, издатель.*/

-- стосовно цього завдання - я зробила скріни кожного view(а).