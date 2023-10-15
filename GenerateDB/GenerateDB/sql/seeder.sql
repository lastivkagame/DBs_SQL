

INSERT INTO tbl_Categories values('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
							 ('Condiments','Sweet and savory sauces, relishes, spreads, and seasonings'),
							 ('Confections','Desserts, candies, and sweet breads'),
							 ('Dairy Products','Cheeses'),
							 ('Grains/Cereals','Breads, crackers, pasta, and cereal'),
							 ('Meat/Poultry','Prepared meats'),
							 ('Produce','Dried fruit and bean curd'),
							 ('Seafood','Seaweed and fish')


INSERT INTO tbl_Suppliers values('Exotic Liquid', '49 Gilbert St.','London','UK'),
							('New Orleans Cajun Delights', 'P.O. Box 78934','New Orleans','USA'),
							('Grandma Kellys Homestead', '707 Oxford Rd.','Ann Arbor','USA'),
							('Tokyo Traders', '9-8 Sekimai Musashino-shi','Tokyo','Japan')


INSERT INTO tbl_Customers values('Alfreds Futterkiste', 'Obere Str. 57','Berlin','Germany'),
							('Ana Trujillo Emparedados y helados', 'Avda. de la Constitucion 2222','Mexico D.F.','Mexico'),
							('Antonio Moreno Taqueria', 'Mataderos 2312','Mexico D.F.','Mexico'),
							('Around the Horn', '120 Hanover Sq.','London','UK')


INSERT INTO tbl_Products values('Chais', '1', '1', '10 boxes x 20 bags', 18, 2),
						   ('Chang','1','1','24 - 12 oz bottles', 19, 8),
						   ('Aniseed Syrup','1','2','12 - 550 ml bottles', 15, 5),
						   ('Chef Antons Cajun Seasoning','2','2','48 - 6 oz jars', 22, 3)


INSERT INTO tbl_Employees values('Davolio','Nancy', '1968-12-08'),
							('Fuller', 'Andrew', '1952-02-19'),
							('Leverling', 'Janet', '1963-08-30'),
							('Peacock',	'Margaret',	'1958-09-19')


INSERT INTO tbl_Shippers values('Speedy Express', '503-555-9831'),
						   ('United Package', '503-555-3199'),
						   ('Federal Shipping',	'503-555-9931')


INSERT INTO tbl_Orders values('1', '1', '2001-07-04', '1'),
						 ('2', '3', '2004-07-05', '2'),
						 ('4', '2', '1996-07-08', '3'),
						 ('3', '4', '1996-07-08', '3');

						 
INSERT INTO tbl_OrdersDetails values('3', '1',200 ,12, 'REJECTED'),
							    ('1', '2',400, 10, 'REJECTED'),
							    ('3', '2',600 ,5, 'READY'),
							    ('2', '3', 200,9, 'NEW ACTIVE')