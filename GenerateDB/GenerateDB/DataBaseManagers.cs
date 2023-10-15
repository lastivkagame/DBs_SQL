using System;
using System.Data.SqlClient;

namespace GenerateDB
{
    public class DataBaseManagers
    {
        private readonly SqlConnection con;

        public DataBaseManagers(string conStr)
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        /// <summary>
        /// Create DB
        /// </summary>
        /// <param name="name">Name DB</param>
        public void CreateDB(string name)
        {
            string sql = $"CREATE DATABASE [{name}];";

            SqlCommand command = con.CreateCommand();
            command.CommandText = sql;
            command.ExecuteNonQuery();
        }

        /// <summary>
        /// Drop DB
        /// </summary>
        /// <param name="name">Name DB</param>
        public void DeleteDB(string name)
        {
            string sql = $"DROP DATABASE [{name}];";

            SqlCommand command = con.CreateCommand();
            command.CommandText = sql;
            command.ExecuteNonQuery();
        }

        /// <summary>
        /// Simple print all DB
        /// </summary>
        public void ShowAllDB()
        {
            string sql = $"SELECT name FROM master.sys.databases where owner_sid!=1";

            using (SqlCommand command = con.CreateCommand())
            {
                command.CommandText = sql;
                using (var reader = command.ExecuteReader())
                {
                    Console.WriteLine();
                    while (reader.Read())
                    {
                        Console.WriteLine(reader["name"]);
                    }
                    Console.WriteLine();
                }
            }
        }
    }
}
