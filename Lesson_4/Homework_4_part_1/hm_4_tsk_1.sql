/*
--1--
На основі запиту /****** Script for SelectTopNRows command from SSMS  ******/
SELECT o.Id, c.Name as CustomerName, e.FirstName+' '+e.LastName as EmployeeName, s.Name as Dostavka
FROM tblOrders as o, tblCustomers as c, tblEmployees as e, tblShippers as s
Where o.CustomerId=c.Id and o.EmployeeId=e.Id and o.ShipperId=s.Id
Зробити запит з використаням INNER JOIN
https://stackoverflow.com/questions/53949197/isnt-sql-a-left-join-b-just-a/53949327

--2--
Вказати коли неохідно використовувати об'єднання LEFT JOIN або RIGHT JOIN
Навести приклад.*/

--   _1_
--Примітка: у мене трохи по іншому названні таблиці і змінні))
/*JOIN — це бінарна операція з’єднання таблиць в SQL, яка сполучає дві таблиці в реляційній базі даних, 
утворюючи нову тимчасову таблицю, яку інколи називають «з’єднаною таблицею».*/

/*(INNER) JOIN — внутрішнє з’єднання в результуючому наборі якого присутні тільки записи, значення пов’язаних 
полів у яких збігаються. З ілюстрації усе зрозуміліше, потрібні нам дані це є дані, котрі опинилися на перетині множин таблиць.*/

use Shop;
SELECT o.Id, c.CustomerName as CustomerName, e.FirstName + ' ' + e.LastName as EmployeeName, s.ShipperName as Dostavka
FROM Orders as o
    INNER JOIN [Customers] as c
    ON o.CustomerId = c.Id
    INNER JOIN [Employees] as e
    ON o.EmployeeId=e.Id
	INNER JOIN Shippers as s
    ON o.ShipperId=s.Id

--   _2_
/*LEFT JOIN — ліве зовнішнє з’єднання. У результуючому наборі будуть присутні всі записи з таблиці А та відповідні 
записи з таблиці В. Якщо співпадінь не буде, поля з таблиці В будуть пусті.*/
-- використання в нашому випадку
use Shop;
SELECT Customers.CustomerName, Orders.Id,Orders.OrderDate
FROM Customers
LEFT JOIN Orders 
ON Customers.Id = Orders.CustomerID

/*RIGHT JOIN — праве зовнішнє з’єднання. В результуючому наборі присутні всі записи з таблиці В та відповідні 
записи з таблиці А. Якщо збігів не має, поля із Таблиці А будуть пусті. Діаграма-малюнок буде дзеркальне відображення LEFT JOIN. */
-- використання в нашому випадку
use Shop;
SELECT Customers.CustomerName, Orders.Id,Orders.OrderDate
FROM Customers
RIGHT JOIN Orders 
ON Customers.Id = Orders.CustomerID

/*Отже, буде зручніше використовувати LEFT/RIGHT JOIN якщо:
 - LEFT якщо треба вибірка яка буде містити всі строки из першої або лівої таблиці
 - RIGHT якщо треба вибірка яка буде містити всі строки из другої або правої таблиці
 - тобто вибірка має містити всі строки з першої або другої таблиць і відповідні їм */