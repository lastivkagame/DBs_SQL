/*
--1--
�� ����� ������ /****** Script for SelectTopNRows command from SSMS  ******/
SELECT o.Id, c.Name as CustomerName, e.FirstName+' '+e.LastName as EmployeeName, s.Name as Dostavka
FROM tblOrders as o, tblCustomers as c, tblEmployees as e, tblShippers as s
Where o.CustomerId=c.Id and o.EmployeeId=e.Id and o.ShipperId=s.Id
������� ����� � ������������ INNER JOIN
https://stackoverflow.com/questions/53949197/isnt-sql-a-left-join-b-just-a/53949327

--2--
������� ���� �������� ��������������� ��'������� LEFT JOIN ��� RIGHT JOIN
������� �������.*/

--   _1_
--�������: � ���� ����� �� ������ ������� ������� � ����))
/*JOIN � �� ������ �������� 璺������ ������� � SQL, ��� ������� �� ������� � ��������� ��� �����, 
��������� ���� ��������� �������, ��� ������ ��������� �璺������ ���������.*/

/*(INNER) JOIN � ������� 璺������ � ������������� ����� ����� ������� ����� ������, �������� ��������� 
���� � ���� ���������. � ���������� ��� ���������, ������ ��� ��� �� � ���, ���� ��������� �� ������� ������ �������.*/

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
/*LEFT JOIN � ��� ������ 璺������. � ������������� ����� ������ ������� �� ������ � ������� � �� ������� 
������ � ������� �. ���� �������� �� ����, ���� � ������� � ������ ����.*/
-- ������������ � ������ �������
use Shop;
SELECT Customers.CustomerName, Orders.Id,Orders.OrderDate
FROM Customers
LEFT JOIN Orders 
ON Customers.Id = Orders.CustomerID

/*RIGHT JOIN � ����� ������ 璺������. � ������������� ����� ������� �� ������ � ������� � �� ������� 
������ � ������� �. ���� ���� �� ��, ���� �� ������� � ������ ����. ĳ������-������� ���� ���������� ����������� LEFT JOIN. */
-- ������������ � ������ �������
use Shop;
SELECT Customers.CustomerName, Orders.Id,Orders.OrderDate
FROM Customers
RIGHT JOIN Orders 
ON Customers.Id = Orders.CustomerID

/*����, ���� ������� ��������������� LEFT/RIGHT JOIN ����:
 - LEFT ���� ����� ������ ��� ���� ������ �� ������ �� ����� ��� ��� �������
 - RIGHT ���� ����� ������ ��� ���� ������ �� ������ �� ����� ��� ����� �������
 - ����� ������ �� ������ �� ������ � ����� ��� ����� ������� � ������� �� */