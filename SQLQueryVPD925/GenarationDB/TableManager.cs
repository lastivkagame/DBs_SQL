using Bogus;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace GenarationDB
{
    public class TableManager
    {
        private readonly SqlConnection con;
        private string dirSql = "sql";
        public TableManager(string connStr)
        {
            con = new SqlConnection(connStr);
            con.Open();
        }
        public void CreateTabels()
        {
            //Category names
            ExecuteCommandFromFile("tblCategories.sql");
            //Suppliers of goods
            ExecuteCommandFromFile("tblSuppliers.sql");
            //Clients
            ExecuteCommandFromFile("tblCustomers.sql");
            //Products
            ExecuteCommandFromFile("tblProducts.sql");
            //Employees
            ExecuteCommandFromFile("tblEmployees.sql");
            //Delivery service
            ExecuteCommandFromFile("tblShippers.sql");
            //Orders
            ExecuteCommandFromFile("tblOrders.sql");
            //List of products in the order
            ExecuteCommandFromFile("tblOrdersDetails.sql");
        }

        /// <summary>
        /// Fill the database with default values
        /// </summary>
        public void SeederDatabase()
        {
            //Set default values in the database
            ExecuteCommandFromFile("seeder.sql");
        }


        public void RandomInsertCustomers(int count)
        {
            var customFaker = new Faker<Customer>("uk")
                .RuleFor(c => c.Name, f => f.Name.FullName())
                .RuleFor(c => c.Address, f => f.Address.StreetAddress())
                .RuleFor(c => c.Country, f => f.Address.Country())
                .RuleFor(c => c.City, f => f.Address.City());


            //example of data: "...VALUES(N'Alfreds Futterkiste', N'Obere Str. 57', N'Berlin', N'Germany')";
            for (int i = 0; i < count; i++)
            {
                var cust = customFaker.Generate();
                string sql = "INSERT[dbo].[tblCustomers]([Name], [Address], [City], [Country]) " +
                        "VALUES(@Name, @Address, @City, @Country)";
                SqlCommand command = con.CreateCommand();
                command.Parameters.AddWithValue("@Name", cust.Name);
                command.Parameters.AddWithValue("@Address", cust.Address);
                command.Parameters.AddWithValue("@City", cust.City);
                command.Parameters.AddWithValue("@Country", cust.Country);
                command.CommandText = sql;
                command.ExecuteNonQuery(); //send the command to the database
            }
            
        }

        private void ExecuteCommandFromFile(string file)
        {
            string sql = ReadSqlFile(file);
            SqlCommand command = con.CreateCommand();
            command.CommandText = sql;
            command.ExecuteNonQuery(); //send the command to the database
        }

        private string ReadSqlFile(string file)
        {
            string sql=File.ReadAllText($"{dirSql}\\{file}");
            return sql;
        }
    }
}
