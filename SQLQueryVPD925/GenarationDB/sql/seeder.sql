
INSERT INTO tblCategories values('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
                             ('Condiments','Sweet and savory sauces, relishes, spreads, and seasonings'),
                             ('Confections','Desserts, candies, and sweet breads'),
                             ('Dairy Products','Cheeses'),
                             ('Grains/Cereals','Breads, crackers, pasta, and cereal'),
                             ('Meat/Poultry','Prepared meats'),
                             ('Produce','Dried fruit and bean curd'),
                             ('Seafood','Seaweed and fish');

INSERT INTO tblSuppliers values('Exotic Liquid', '49 Gilbert St.','London','UK'),
                            ('New Orleans Cajun Delights', 'P.O. Box 78934','New Orleans','USA'),
                            ('Grandma Kellys Homestead', '707 Oxford Rd.','Ann Arbor','USA'),
                            ('Tokyo Traders', '9-8 Sekimai Musashino-shi','Tokyo','Japan');

INSERT INTO tblCustomers values('Alfreds Futterkiste', 'Obere Str. 57','Berlin','Germany'),
                            ('Ana Trujillo Emparedados y helados', 'Avda. de la Constitucion 2222','Mexico D.F.','Mexico'),
                            ('Antonio Moreno Taqueria', 'Mataderos 2312','Mexico D.F.','Mexico'),
                            ('Around the Horn', '120 Hanover Sq.','London','UK');

INSERT INTO tblProducts values('Chais', '1', '1', '10 boxes x 20 bags', 18),
                           ('Chang','1','1','24 - 12 oz bottles', 19),
                           ('Aniseed Syrup','1','2','12 - 550 ml bottles', 10),
                           ('Chef Antons Cajun Seasoning','2','2','48 - 6 oz jars', 22);

INSERT INTO tblEmployees values('Davolio','Nancy', '1968-12-08'),
                            ('Fuller', 'Andrew', '1952-02-19'),
                            ('Leverling', 'Janet', '1963-08-30'),
                            ('Peacock', 'Margaret', '1958-09-19');

INSERT INTO tblShippers values('Speedy Express', '503-555-9831'),
                           ('United Package', '503-555-3199'),
                           ('Federal Shipping', '503-555-9931');

INSERT INTO tblOrders values('1', '1', '1', '2001-07-04'),
                         ('2', '3', '3','1996-07-05'),
                         ('4', '2', '3', '1996-07-08'),
                         ('3', '4', '2','1996-07-08');
                         
INSERT INTO tblOrdersDetails values('4', '1', 200, 12),
                                ('1', '4', 400, 10),
                                ('3', '2', 600, 5),
                                ('2', '3', 200, 9);
