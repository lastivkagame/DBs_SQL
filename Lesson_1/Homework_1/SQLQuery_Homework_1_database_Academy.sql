CREATE DATABASE Academy

USE Academy

CREATE TABLE Faculties
(
	ID int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(100) NOT NULL UNIQUE,
)
Go

CREATE TABLE Teachers
(
	ID int PRIMARY KEY IDENTITY(1,1),
	EmployementDate date NOT NULL CHECK(Year(EmployementDate) >= 1990),
	[Name] nvarchar(max) NOT NULL,
	Premium money NOT NULL CHECK(Premium >= 0) DEFAULT(0),
	Salary money NOT NULL CHECK(Salary > 0),
	SurName nvarchar(max) NOT NULL
)
Go

CREATE TABLE Departments
(
	ID int PRIMARY KEY IDENTITY(1,1),
	Financing money NOT NULL DEFAULT(0) CHECK( Financing > 0),
	[Name] nvarchar(100) NOT NULL UNIQUE
)
Go

CREATE TABLE Groups
(
	ID int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(10) UNIQUE NOT NULL,
	Rating int NOT NULL CHECK(Rating >= 0 AND Rating <= 5),
	Year int NOT NULL CHECK(Year >= 1 AND Year <= 5),
)
Go