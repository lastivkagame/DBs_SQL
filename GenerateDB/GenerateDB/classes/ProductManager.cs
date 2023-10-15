using System;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;

namespace GenerateDB.classes
{
    public class ProductManager
    {
        private readonly SqlConnection _con;

        public ProductManager(SqlConnection con)
        {
            _con = con;
        }

        /// <summary>
        /// EN: To Show Product table(Name and it category)
        /// </summary>
        public void Show()
        {
            string sql = "SELECT Id, CategoryName, ProductName FROM View_Product";
            SqlCommand comm = _con.CreateCommand();

            comm.CommandText = sql;
            using (var reader = comm.ExecuteReader())
            {
                while (reader.Read())
                {
                    Console.WriteLine("Id: {0}", reader["Id"]);
                    Console.WriteLine("Category: {0}", reader["CategoryName"]);
                    Console.WriteLine("Product: {0}", reader["ProductName"]);
                }
            }
        }

        /// <summary>
        /// EN: To Use Storage Procedure: it add 3 category at table
        /// </summary>
        public void InsertCategoriesRandomSP()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Description");
            dt.Rows.Add("Notebook", "Proffessional Gaming");
            dt.Rows.Add("PC", "Two GB");
            dt.Rows.Add("Smartphone", "Not new but work");

            SqlCommand comm = new SqlCommand("spInsertCategoryList", _con);
            comm.CommandType = CommandType.StoredProcedure;
            SqlParameter pCatLit = new SqlParameter()
            {
                ParameterName = "@ListInsert",
                Value = dt
            };

            comm.Parameters.Add(pCatLit);
            comm.ExecuteNonQuery();

        }

        /// <summary>
        /// EN: Insert, delete, output the last id, etc. using TransactionScope
        /// </summary>
        public void TransactionTest()
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var strCon = _con.ConnectionString;

                    using (SqlConnection con = new SqlConnection(strCon))
                    {
                        con.Open();
                        string sql = "INSERT INTO tbl_Products values('MultiCake', '1', '1', '20 x cakes', 28)"; // - we just put N to make it adequately insert
                        SqlCommand command = con.CreateCommand();
                        command.CommandText = sql;
                        var res = command.ExecuteNonQuery();
                        Console.WriteLine("---- res:  {0} ----", res);

                        int id = 0;
                        sql = "SELECT SCOPE_IDENTITY() as ID";
                        command.CommandText = sql;

                        using (var reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Console.WriteLine("Insted ID: {0}", reader["ID"]);
                                id = int.Parse(reader["ID"].ToString());
                            }
                        }

                        sql = $"UPDATE[dbo].[tbl_Products] SET [ProductName] = 'Chocolate Ice-Cream' WHERE Id = {id}";
                        command.CommandText = sql;
                        res = command.ExecuteNonQuery();
                        Console.WriteLine("---- update res:  {0} ----", res);

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
