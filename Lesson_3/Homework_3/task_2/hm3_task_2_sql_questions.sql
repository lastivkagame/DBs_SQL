/*�������� 2.
���������� �����������(�� ����� ���� � �������) sql - ������ ��� ��������� ��������� ��
	o ������� ������ � ����� �� 10 �� 20(������������ ��������� BETWEEN)
	o ������� ��� ��� ������������� � ���� Italy, Spain, France (������������ ���������� IN)
	o ������� ����� ������������� ��� �������(������������ SELECT DISTINCT ....)
	o �������� ���� ������ �� 10% , �� ����������c� ������ ��������������
	o ������� ����������, �� ������� � ������� �����
	o ������� ����������, �������� �� 30 ����
	o ������� ����� �볺���, �� ����������� �� ���� ����� (���������, A B ��� �, ������������ Like '[ABC]%' )
	o ������� ����� �������� , ����������� �� ����������
	o ������� ������, ����������� �� �����(�� ���������) �� �����(���������)*/

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
