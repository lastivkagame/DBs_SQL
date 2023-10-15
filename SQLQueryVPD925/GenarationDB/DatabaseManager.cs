using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenarationDB
{
    public class DatabaseManager
    {
        private readonly SqlConnection con;
        public DatabaseManager(string connStr)
        {
            con = new SqlConnection(connStr);
            con.Open();
        }

        public void CreateDB(string name)
        {
            string sql = $"CREATE DATABASE [{name}];";
            SqlCommand command = con.CreateCommand();
            command.CommandText = sql;
            command.ExecuteNonQuery(); //send the command to the database
        }

        public void DeleteDB(string name)
        {
            string sql = $"DROP DATABASE [{name}];";
            SqlCommand command = con.CreateCommand();
            command.CommandText = sql;
            command.ExecuteNonQuery(); //send the command to the database
        }

        public void ShowAllDatabase()
        {
            string sql = $"SELECT name FROM master.sys.databases where owner_sid!=1;";
            using (SqlCommand command = con.CreateCommand())
            {
                command.CommandText = sql;
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Console.WriteLine(reader["name"]);
                    }
                }
            }
        }
    }
}
