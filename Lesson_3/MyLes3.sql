USE Shapirko

CREATE TABLE Position
(
	Id int identity primary key,
	Name nvarchar(30) NOT NULL,
	Salary money NOT NULL,
)
go
CREATE TABLE Person
(
	ID int PRIMARY KEY IDENTITY(1,1),
	[Name] nvarchar(20) NOT NULL,
	LastName nvarchar(30) NOT NULL,
	DateOfBirth date CHECK(DateOfBirth < getdate() and year(DateOfBirth)>1900),
	Email varchar(30) UNIQUE,
	PositionId int foreign key references Position(Id)
)
go
insert into Position values('Sinior Programmer', 3000),
						   ('Junior Programmer', 4000),
						   ('Admin', 4000),
						   ('Meneger', 2000)

select * from Position
select * from Person

insert into Person values('Ivan', 'Ivanov', '2000-12-12','ivan@ivanko.com', 1),
						 ('Olia', 'Semeniuk','2000-1-1','olia@olia.com', 2),
						 ('Bill', 'Gates', '1999-1-1', 'bill@gmail.com', 3),
						 ('Mark', 'Tshukerberh','1990-6-1','mark@gmail.com', 1)

update Position
set Name='Programmer'
where Id=1

Select Person.Name,LastName,Email,Position.Name as Position, Salary
From Person,Position
where PositionId = Position.Id

Select Person.Name, LastName, Position.Name
From Person,Position
Where PositionId = Position.Id And Position.Name = 'Programmer'

create table Organization
(
	Id int identity primary key,
	Name nvarchar(30) NOT NULL,
	Country nvarchar(20) default('UA')
)

create table OrganizationPositions
(
	Id int identity primary key,
	OrganizationId int,  -- foreign key references Organization(Id)
	PositionId int --foreign key references Position(Id)-->
)

select O.Name, P.Name
From Organization O, Position P, OrganizationPositions OP
where O.Id = OP.OrganizationId ANd P.Id = OP.PositionId And O.Name='SoftServe'
