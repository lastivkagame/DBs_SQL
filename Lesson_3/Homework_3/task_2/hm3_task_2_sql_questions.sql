/*Завдання 2.
Побудувати однотабличні(на основі одної з таблиць) sql - запити для виконання наступних дій
	o вибрати товари з ціною від 10 до 20(скористатися операцією BETWEEN)
	o вибрати дані про постачальників з країн Italy, Spain, France (скористатися оператором IN)
	o вивести країни постачальників БЕЗ повторів(скористатися SELECT DISTINCT ....)
	o збільшити ціни товарів на 10% , що постачаютьcя певним постачальником
	o вибрати замовлення, які зроблені у певному місяці
	o вивести працівників, молодших від 30 років
	o вивести імена клієнтів, які починаються на деякі букви (наприклад, A B або С, скористатися Like '[ABC]%' )
	o вивести назви продуктів , впорядковані за зростанням
	o вивести товари, впорядковані за типом(по зростанню) та ціною(спаданням)*/

USE Shop;

-- 1
SELECT * FROM [Products]
WHERE Price BETWEEN 10 AND 20;

-- 2
SELECT * FROM [Suppliers]
WHERE Country IN ('Italy', 'Spain', 'France');

-- 3
SELECT DISTINCT Country FROM [Suppliers];

-- 4
UPDATE [Products]
SET Price = Price + Price * 0.1
WHERE SuppliersID = 1

--5
SELECT * FROM [Orders]
WHERE CustomerID = (SELECT Id FROM [Customers]
					WHERE Address = '120 Hanover Sq.')

--6
SELECT * FROM [Employees]
WHERE YEAR(GETDATE())- YEAR(BirthDate) < 30;

--7
SELECT * FROM [Employees]
WHERE FirstName LIKE '[A]%' 

SELECT * FROM [Employees]
WHERE FirstName LIKE '[B]%' 

SELECT * FROM [Employees]
WHERE FirstName LIKE '[J]%' 

SELECT * FROM [Employees]
WHERE FirstName LIKE '[C]%' 

--8
SELECT ProductName FROM [Products]
ORDER BY ProductName ASC;

--9
SELECT * FROM [Products]
ORDER BY Unit ASC, Price DESC;
