create table Position
(
	Id int identity primary key,
	Name nvarchar(30) Not Null,
	Salary money Not Null
)
go
create table Person
(
	Id int identity primary key,
	Name nvarchar(30) Not null,
	LastName nvarchar(40) Not null,
	Email nvarchar(50) Unique,
	DateOfBirth date check(DateOfBirth < getdate() and year(DateOfBirth) > 1900),
	PositionId int foreign key references Position(Id)
)
go
insert into Position values('Sinior Programmer', 3000),
							('Junior Programmer', 400),
							('Admin', 1000),
							('Manager', 2000)

select * from Position
select * from Person
select * from Organization
select * from OrganizationPositions

select O.Name, P.Name
From Organization O, Position P, OrganizationPositions OP
Where O.Id=OP.OrganizationId ANd P.Id=OP.PositionId And O.Name='SoftServe'

insert into Person values ('Ivan', 'Ivanov', 'ivan@ivan.com', '2000-12-12', 1),
							('Olia', 'Semeniuk', 'olia@olia.com', '2000-1-1', 2),
							('Bill', 'Gates', 'bill@gmail.com', '1966-1-1', 3),
							('Mark', 'Tsukerberh', 'fb@gmail.com', '1983-6-1', 1)

update Position
set Name='Programmer'
where Id = 1

Select Person.Name,LastName, Email, Position.Name as Position, Salary
From Person, Position
Where PositionId = Position.Id

Select Person.Name, LastName, Position.Name
From Person, Position
Where PositionId = Position.Id And Position.Name = 'Programmer'

create table Organization(
	Id int identity primary key,
	Name nvarchar(30) Not null, 
	Country nvarchar(20) default('UA')
)

create table OrganizationPositions
(
	Id int identity primary key,
	OrganizationId int foreign key references Organization(Id),
	PositionId int foreign key references Position(Id)
)

