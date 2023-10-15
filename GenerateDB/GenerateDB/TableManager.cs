using Bogus;
using GenerateDB.classes;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Transactions;

namespace GenerateDB
{
    public class TableManager
    {
        private readonly SqlConnection con;
        private string dirSql = "sql";

        public TableManager(string conStr)
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        /// <summary>
        /// Create table for shop
        /// + (one storage procedure: + 3 category)
        /// + (one category type)
        /// + (one view)
        /// </summary>
        public void CreateTable()
        {
            ExecuteCommandFromFile("tbl_Categories.sql");
            ExecuteCommandFromFile("tbl_Suppliers.sql");
            ExecuteCommandFromFile("tbl_Customers.sql");
            ExecuteCommandFromFile("tbl_Products.sql");
            ExecuteCommandFromFile("tbl_Employees.sql");
            ExecuteCommandFromFile("tbl_Shippers.sql");
            ExecuteCommandFromFile("tbl_Orders.sql");
            ExecuteCommandFromFile("tbl_OrdersDetails.sql");

            ExecuteCommandFromFile("viewProduct.sql");
            ExecuteCommandFromFile("CategoryType.sql");
            ExecuteCommandFromFile("spInsertCategoryList.sql");

        }

        /// <summary>
        /// Fill DB by seeder
        /// </summary>
        public void SeederDataVase()
        {
            ExecuteCommandFromFile("seeder.sql");
        }

        /// <summary>
        /// Fill DB by dll Bogus
        /// </summary>
        public void RandomInsertValues()
        {
            string localesation;

            #region All this for I know how already exist and how want to create categories/product/orders and other
            var old_cus_count = 0;
            var old_emp_count = 0;
            var old_ship_count = 0;
            var old_cat_count = 0;
            var old_supp_count = 0;
            var old_prod_count = 0;
            var old_ord_count = 0;

            int category_count = 0;
            int customer_count = 0;
            int employee_count = 0;
            int shippers_count = 0;
            int suppliers_count = 0;
            int orders_count = 0;
            int product_count = 0;
            int ordersdeteils_count = 0;
            #endregion

            #region This I receive how already exists categories/product/orders and other

            try
            {
                string sql_count = "SELECT COUNT(Id) as id_count FROM [tbl_Customers]";
                SqlCommand comm = con.CreateCommand();

                comm.CommandText = sql_count;
                var reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    old_cus_count = Convert.ToInt32(reader["id_count"]);
                }
                reader.Close();



                sql_count = "SELECT COUNT(Id) as id_count FROM [tbl_Employees]";
                comm = con.CreateCommand();

                comm.CommandText = sql_count;
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    old_emp_count = Convert.ToInt32(reader["id_count"]);
                }
                reader.Close();




                sql_count = "SELECT COUNT(Id) as id_count FROM [tbl_Shippers]";
                comm = con.CreateCommand();

                comm.CommandText = sql_count;
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    old_ship_count = Convert.ToInt32(reader["id_count"]);
                }
                reader.Close();




                sql_count = "SELECT COUNT(Id) as id_count FROM [tbl_Suppliers]";
                comm = con.CreateCommand();

                comm.CommandText = sql_count;
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    old_supp_count = Convert.ToInt32(reader["id_count"]);
                }
                reader.Close();




                sql_count = "SELECT COUNT(Id) as id_count FROM [tbl_Categories]";
                comm = con.CreateCommand();

                comm.CommandText = sql_count;
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    old_cat_count = Convert.ToInt32(reader["id_count"]);
                }
                reader.Close();



                sql_count = "SELECT COUNT(Id) as id_count FROM [tbl_Orders]";
                comm = con.CreateCommand();

                comm.CommandText = sql_count;
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    old_ord_count = Convert.ToInt32(reader["id_count"]);
                }
                reader.Close();




                sql_count = "SELECT COUNT(Id) as id_count FROM [tbl_Products]";
                comm = con.CreateCommand();

                comm.CommandText = sql_count;
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    old_prod_count = Convert.ToInt32(reader["id_count"]);
                }
                reader.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region Add Random Customer

            try
            {
                Console.Write("Enter count of customers: ");
                customer_count = Convert.ToInt32(Console.ReadLine());

                Console.Write("Enter locale: ");
                localesation = Console.ReadLine();

                var customFaker = new Faker<Customer>(localesation)
                        .RuleFor(c => c.Name, f => f.Name.FullName())
                        .RuleFor(c => c.Address, f => f.Address.StreetAddress())
                        .RuleFor(c => c.Country, f => f.Address.Country())
                        .RuleFor(c => c.City, f => f.Address.City());


                for (int i = 0; i < customer_count; i++)
                {
                    var customer = customFaker.Generate();
                    string sql = "INSERT [dbo].[tbl_Customers] ([CustomerName], [Address], [City], [Country]) " +
                        " VALUES (@Name, @Address, @City, @Country)";
                    SqlCommand command = con.CreateCommand();

                    command.Parameters.AddWithValue("@Name", customer.Name);
                    command.Parameters.AddWithValue("@Address", customer.Address);
                    command.Parameters.AddWithValue("@City", customer.City);
                    command.Parameters.AddWithValue("@Country", customer.Country);

                    command.CommandText = sql;
                    command.ExecuteNonQuery();  
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region Add Random Categories 

            try
            {
                if (old_cat_count < 8)
                {
                    string[] categies_name = { "Beverages", "Condiments", "Confections", "Dairy Products", "Grains/Cereals", "Meat/Poultry", "Produce", "Seafood" };

                    string[] categories_description = { "Soft drinks, coffees, teas, beers, and ales", "Sweet and savory sauces," +
                    " relishes, spreads, and seasonings", "Desserts, candies, and sweet breads", "Cheeses", "Breads, crackers," +
                    " pasta, and cereal", "Prepared meats", "Dried fruit and bean curd", "Seaweed and fish" };

                    int temp = 0;
                    category_count = 8;


                    var categorFaker = new Faker<Categories>()
                            .CustomInstantiator(f => new Categories(temp++))
                            .RuleFor(c => c.CategoryName, (f, c) => categies_name[c.Id])
                            .RuleFor(c => c.Description, (f, c) => categories_description[c.Id]);

                    for (int i = 0; i < category_count; i++)
                    {
                        var category = categorFaker.Generate();
                        string sql = "INSERT [dbo].[tbl_Categories] ([Name], [Description]) " +
                            " VALUES (@Name, @Description)";

                        SqlCommand command = con.CreateCommand();

                        command.Parameters.AddWithValue("@Name", category.CategoryName);
                        command.Parameters.AddWithValue("@Description", category.Description);

                        command.CommandText = sql;
                        command.ExecuteNonQuery(); 
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            #endregion

            #region Add Random  Employee

            try
            {
                employee_count = 0;

                Console.Write("Enter count of employee: ");
                employee_count = Convert.ToInt32(Console.ReadLine());
                DateTime dt = Convert.ToDateTime("1960-01-01");

                Console.Write("Enter locale: ");
                localesation = Console.ReadLine();

                var employeeFaker = new Faker<Employees>(localesation)
                        .RuleFor(c => c.FirstName, f => f.Name.FirstName())
                        .RuleFor(c => c.LastName, f => f.Name.LastName())
                        .RuleFor(c => c.BirthDate, f => f.Date.Between(dt, Convert.ToDateTime("2002-01-01")));

                for (int i = 0; i < employee_count; i++)
                {
                    var employee = employeeFaker.Generate();
                    string sql = "INSERT [dbo].[tbl_Employees] ([LastName], [FirstName], [BirthDate]) " +
                        " VALUES (@LastName, @FirstName, @BirthDate)";

                    SqlCommand command = con.CreateCommand();

                    command.Parameters.AddWithValue("@LastName", employee.LastName);
                    command.Parameters.AddWithValue("@FirstName", employee.FirstName);
                    command.Parameters.AddWithValue("@BirthDate", employee.BirthDate);

                    command.CommandText = sql;
                    command.ExecuteNonQuery(); 
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region Add Random Shippers

            try
            {
                shippers_count = 0;

                Console.Write("Enter count of shippers: ");
                shippers_count = Convert.ToInt32(Console.ReadLine());

                Console.Write("Enter locale: ");
                localesation = Console.ReadLine();

                var shippersFaker = new Faker<Shippers>(localesation)
                        .RuleFor(c => c.ShipperName, f => f.Name.FullName())
                        .RuleFor(c => c.Phone, f => f.Person.Phone);

                for (int i = 0; i < shippers_count; i++)
                {
                    var shippers = shippersFaker.Generate();
                    string sql = "INSERT [dbo].[tbl_Shippers] ([ShipperName], [Phone]) " +
                        " VALUES (@ShipperName, @Phone)";

                    SqlCommand command = con.CreateCommand();

                    command.Parameters.AddWithValue("@ShipperName", shippers.ShipperName);
                    command.Parameters.AddWithValue("@Phone", shippers.Phone);

                    command.CommandText = sql;
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region Add Random Suppliers
            try
            {
                Console.Write("Enter count of suppliers: ");
                suppliers_count = Convert.ToInt32(Console.ReadLine());

                Console.Write("Enter locale: ");
                localesation = Console.ReadLine();

                var suppliersFaker = new Faker<Suppliers>(localesation)
                        .RuleFor(c => c.SupplierName, f => f.Name.FullName())
                        .RuleFor(c => c.Address, f => f.Address.StreetAddress())
                        .RuleFor(c => c.Country, f => f.Address.Country())
                        .RuleFor(c => c.City, f => f.Address.City());

                for (int i = 0; i < suppliers_count; i++)
                {
                    var customer = suppliersFaker.Generate();
                    string sql = "INSERT [dbo].[tbl_Suppliers] ([SupplierName], [Address], [City], [Country]) " +
                        " VALUES (@SupplierName, @Address, @City, @Country)";
                    
                    SqlCommand command = con.CreateCommand();

                    command.Parameters.AddWithValue("@SupplierName", customer.SupplierName);
                    command.Parameters.AddWithValue("@Address", customer.Address);
                    command.Parameters.AddWithValue("@City", customer.City);
                    command.Parameters.AddWithValue("@Country", customer.Country);

                    command.CommandText = sql;
                    command.ExecuteNonQuery(); 
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region Add Random Product
            try
            {
                Console.Write("Enter count of product: ");
                product_count = Convert.ToInt32(Console.ReadLine());

                Console.Write("Enter locale: ");
                localesation = Console.ReadLine();

                var productsFaker = new Faker<Products>(localesation)
                        .RuleFor(c => c.ProductName, f => f.Commerce.ProductName())
                        .RuleFor(c => c.SuppliersID, f => f.Random.Number(1, old_supp_count + suppliers_count))
                        .RuleFor(c => c.CategoryID, f => f.Random.Number(1, old_cat_count + category_count))
                        .RuleFor(c => c.Unit, f => f.Commerce.ProductMaterial())
                        .RuleFor(c => c.Price, f => f.Commerce.Price())
                        .RuleFor(c => c.Quantity, f => f.Random.Number(1, 100));

                for (int i = 0; i < product_count; i++)
                {
                    var order = productsFaker.Generate();
                    string sql = "INSERT [dbo].[tbl_Products] ([ProductName], [SuppliersID], [CategoryID], [Unit], [Price], [Quantity]) " +
                        " VALUES (@ProductName, @SuppliersID, @CategoryID, @Unit, @Price, @Quantity)";
                    
                    SqlCommand command = con.CreateCommand();

                    command.Parameters.AddWithValue("@ProductName", order.ProductName);
                    command.Parameters.AddWithValue("@SuppliersID", order.SuppliersID);
                    command.Parameters.AddWithValue("@CategoryID", order.CategoryID);
                    command.Parameters.AddWithValue("@Unit", order.Unit);
                    command.Parameters.AddWithValue("@Price", order.Price);
                    command.Parameters.AddWithValue("@Quantity", order.Quantity);

                    command.CommandText = sql;
                    command.ExecuteNonQuery(); 
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region Add Random Orders
            try
            {
                Console.Write("Enter count of order: ");
                orders_count = Convert.ToInt32(Console.ReadLine());

                var ordersFaker = new Faker<Orders>()
                        .RuleFor(c => c.CustomerID, f => f.Random.Number(1, old_cus_count + customer_count))
                        .RuleFor(c => c.EmployeeID, f => f.Random.Number(1, old_emp_count + employee_count))
                        .RuleFor(c => c.ShipperID, f => f.Random.Number(1, old_ship_count + shippers_count))
                        .RuleFor(c => c.OrderDate, f => f.Date.Between(Convert.ToDateTime("1995-01-01"), Convert.ToDateTime("2019-01-01")));

                for (int i = 0; i < orders_count; i++)
                {
                    var order = ordersFaker.Generate();
                    string sql = "INSERT [dbo].[tbl_Orders] ([CustomerID], [EmployeeID], [OrderDate], [ShipperID]) " +
                        " VALUES (@CustomerID, @EmployeeID, @OrderDate, @ShipperID)";

                    SqlCommand command = con.CreateCommand();

                    command.Parameters.AddWithValue("@CustomerID", order.CustomerID);
                    command.Parameters.AddWithValue("@EmployeeID", order.EmployeeID);
                    command.Parameters.AddWithValue("@OrderDate", order.OrderDate);
                    command.Parameters.AddWithValue("@ShipperID", order.ShipperID);

                    command.CommandText = sql;
                    command.ExecuteNonQuery();
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion

            #region Add Random OrderDeteils(in this I use methods were use TransactionScope)
            /*
             So, there is a new field - status. So far, I can conditionally divide it into such states as: 
             - rejected - if the quantity of the product is 0 (i.e. it is not available)
             - active new - if there is a product and it is enough and if this order was added last
             - ready - if this order has ceased to be the last newly added, i.e. another one has been added and 
                                    the new one took that status) and this one was changed
             I know that it's not quite right to divide it this way, but let it be so because for now this is all we can do (well, we will fix it soon ;)
             (I divided it so that I could just test the transactions more)
             (The order is conditionally divided into 2 parts 1 - Orders, 2 - OrderDetails and in this
             the second part, in my opinion, it is much more convenient to dig through the status field)*/

            try
            {
                Console.Write("Enter count of orders deteils: ");
                ordersdeteils_count = Convert.ToInt32(Console.ReadLine());

                var orderdetailsFaker = new Faker<OrdersDetails>()
                        .RuleFor(c => c.OrderID, f => f.Random.Number(1, old_ord_count + orders_count))
                        .RuleFor(c => c.ProductID, f => f.Random.Number(1, old_prod_count + product_count))
                        .RuleFor(c => c.Price, f => f.Commerce.Price())
                        .RuleFor(c => c.Quantity, f => f.Random.Number(1, 30));

                int quality_prod = 0;
                string status;
                bool flag = false;

                for (int i = 0; i < ordersdeteils_count; i++)
                {
                    SetStatusReadyForOrderDet();

                    var order = orderdetailsFaker.Generate();
                    string sql = "INSERT [dbo].[tbl_OrdersDetails] ([OrderID], [ProductID], [Price], [Quantity], [StatusOrder]) " +
                        " VALUES (@OrderID, @ProductID, @Price, @Quantity, @StatusOrder)";
                    //Console.WriteLine(customer);
                    SqlCommand command = con.CreateCommand();
                    quality_prod = GetQualityProduct(order.ProductID);

                    if (quality_prod > 0)
                    {
                        if (order.Quantity < quality_prod)
                        {
                            status = "NEW_ACTIVE";
                            flag = true;
                        }
                        else
                        {
                            status = "REJECTED";
                        }
                    }
                    else
                    {
                        status = "REJECTED";
                    }

                    command.Parameters.AddWithValue("@OrderID", order.OrderID);
                    command.Parameters.AddWithValue("@ProductID", order.ProductID);
                    command.Parameters.AddWithValue("@Price", order.Price);
                    command.Parameters.AddWithValue("@Quantity", order.Quantity);
                    command.Parameters.AddWithValue("@StatusOrder", status);

                    command.CommandText = sql;
                    command.ExecuteNonQuery(); //посилаємо команду в БД 

                    if (flag)
                    {
                        LowQuantityProduct(quality_prod - order.Quantity, order.ProductID);
                    }

                    flag = false;
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            #endregion
        }

        public SqlConnection GetSqlConnection { get { return con; } }

        /// <summary>
        /// Reads from a file and executes commands
        /// </summary>
        /// <param name="file"></param>
        private void ExecuteCommandFromFile(string file)
        {
            string sql = ReadSQLFile(file);
            SqlCommand command = con.CreateCommand();
            command.CommandText = sql;
            command.ExecuteNonQuery(); // send the command to the database
        }

        /// <summary>
        /// Return file(path)
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        private string ReadSQLFile(string file)
        {
            return File.ReadAllText($"{dirSql}\\{file}");
        }

        /// <summary>
        /// Returns the quantity of a specific product
        /// </summary>
        /// <param name="id"> just returns the number of products with this id </param>
        /// <returns></returns>
        private int GetQualityProduct(int id)
        {
            int count = -3;

            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var strCon = con.ConnectionString;

                    using (SqlConnection conn = new SqlConnection(strCon))
                    {
                        conn.Open();
                        string sql = $"SELECT Quantity AS Q FROM tbl_Products WHERE tbl_Products.Id = {id}";
                        SqlCommand command = con.CreateCommand();

                        command.CommandText = sql;

                        using (var reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return count = int.Parse(reader["Q"].ToString());
                            }
                        }

                        scope.Complete();
                    }
                }
            }
            catch (TransactionAbortedException ex)
            {
                Console.WriteLine("TransactionAbortedException Message: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return count;
        }

        /// <summary>
        ///  Makes the status of the last added order completed (READY), if it is not canceled (REJECTED), (because the product can have the status - NEW ACTIVE)
        /// </summary>
        private void SetStatusReadyForOrderDet()
        {
            int id = 0;

            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var strCon = con.ConnectionString;

                    using (SqlConnection conn = new SqlConnection(strCon))
                    {
                        conn.Open();
                        string sql = "SELECT Id AS ID FROM tbl_OrdersDetails WHERE Id = (SELECT MAX(Id) FROM tbl_OrdersDetails)";
                        SqlCommand command = con.CreateCommand();

                        command.CommandText = sql;

                        using (var reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                id = int.Parse(reader["ID"].ToString());
                            }
                        }

                        sql = $"UPDATE[dbo].[tbl_OrdersDetails] SET [StatusOrder] = 'READY' WHERE Id = {id} AND StatusOrder != 'REJECTED'";
                        command.CommandText = sql;
                        var res = command.ExecuteNonQuery();

                        scope.Complete();
                    }
                }
            }
            catch (TransactionAbortedException ex)
            {
                Console.WriteLine("TransactionAbortedException Message: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        /// <summary>
        /// I use it if I need to reduce the quantity of a product by a certain amount
        /// </summary>
        /// <param name="quantity">what the quantity of goods should be</param>
        /// <param name="id">product quantity of which will be changed</param>
        private void LowQuantityProduct(int quantity, int id = 0)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var strCon = con.ConnectionString;

                    using (SqlConnection conn = new SqlConnection(strCon))
                    {
                        conn.Open();
                        string sql = $"UPDATE[dbo].[tbl_Products] SET [Quantity] = {quantity} WHERE Id = {id}";
                        SqlCommand command = con.CreateCommand();

                        command.CommandText = sql;
                        var res = command.ExecuteNonQuery();

                        scope.Complete();
                    }
                }
            }
            catch (TransactionAbortedException ex)
            {
                Console.WriteLine("TransactionAbortedException Message: {0}", ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
