USE todaytest
GO

INSERT INTO tbl_Products VALUES ('Sweet', '1', '1', '20 x cakes', 30)

GO
SELECT SCOPE_IDENTITY() as ID

