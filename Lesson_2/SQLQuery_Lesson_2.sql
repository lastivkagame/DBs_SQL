--DDL Data  -> Definition Language: CREATE, ALTER, DROP.
--DML Data -> Manipulation Language Select, Insert, Update, Delete (CRUD - Create read update delete)
--DCL Data -> Control Language: Grant, Deny

--Create database
CREATE DATABASE Shapirko
Go
USE Shapirko
Go

--Create table
CREATE TABLE Employee
(
	ID int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(20) NOT NULL,
	LastName nvarchar(30) NOT NULL,
	DateOfBirth date CHECK(Year(GetDate()) - Year(DateOfBirth) >= 18),
	Salary money NOT NULL DEFAULT(4000) CHECK(Salary > 0),
	Position nvarchar(30) NOT NULL,
	Grants money,
	Email varchar(30) UNIQUE
)
Go

--Constraints(обмеження на поля): NOT NULL, NULL; DEFAULT; UNIQUE; Primary key = UNIQUE + NULL; IDENTITY, CHECK
-- Year Now - Year DOB >= 18

DELETE
FROM Employee
Go
SELECT * FROM Employee
--WHERE Id = 2
Go
TRUNCATE TABLE Employee
Go
INSERT INTO Employee VALUES('Olia', 'Bozhok', '2002-12-12',4600,'Admin', NULL,'olia@gmail.com'),
						   ('Ivan', 'Ivanenko', '2000-1-1',5000,'Prog', NULL, 'ivan@gmail.com')
Go
UPDATE Employee
SET Grants = 1000
--WHERE ID = 2
WHERE Name='Ivan' AND LastName LIKE 'Ivanenko'
Go
SELECT * FROM Employee
Go

INSERT INTO Employee(Name, LastName, Position) VALUES('Olexandr', 'Klymchuk', 'Prog')
--INSERT INTO Employee(Name, LastName, DateOfBirth) VALUES('Olexandr', 'Klymchuk', GetDate())

SELECT Name + ' ' + LastName As [Full Name], Position, Salary, Email
FROM Employee
WHERE Position LIKE 'Prog' AND Email is NOT NULL

SELECT Name, LastName, Position 
FROM Employee
--WHERE Name Like '[Oo]%' -- only first
WHERE Name NOT Like '[Oo]%' -- 
--WHERE Name Like '%[Oo]%' -- all
--WHERE Name Like '%[a]%'
--WHERE Name Like '[a%]'

-- % - будь яка к-сть символів
-- _ - 1 символ
-- [AaBb] - послідовність, або хоча б якійсь з  ...

SELECT *
FROM Employee
WHERE Salary > 4000
-- > < !> !<  <>  >=  <=  LIKE =  NOT LIKE !=

SELECT MIN(Salary) as 'MIN SALARY'
FROM Employee

SELECT AVG(Salary) as 'AVG SALARY'
FROM Employee

SELECT Name, LastName, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) as avg_sal FROM Employee)

-- агрегуючі функції - MIN, MAX, AVG, COUNT - пишуться SELECT, не можуть бути у WHERE

Alter table Employee
Add Gender nvarchar(10) 

Alter table Employee
Alter Column Salary money null

SELECT DISTINCT Position  -- DISTINCT - унікальні значення (без повторень)
FROM Employee

Update Employee
Set Gender = 'none'

Update Employee
Set Gender = 'male'
WHERE Salary is not null 