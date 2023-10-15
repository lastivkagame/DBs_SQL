using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenarationDB
{
    class Program
    {
        public static string conSTR = @"Data Source=SH\SQLEXPRESS;Integrated Security=True";

        static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            Console.InputEncoding = Encoding.UTF8;
            int action = 0;
            
            do
            {
                Console.WriteLine("0. Exit");
                Console.WriteLine("1. Database management");
                Console.WriteLine("2. Managing a separate database");
                action = int.Parse(Console.ReadLine());
                switch (action)
                {
                    case 1:
                        {
                            WorkDatabases();
                            break;
                        }
                    case 2:
                        {
                            Console.WriteLine("Enter the name of the database:");
                            string dbName = Console.ReadLine();
                            WorkTabelsInDB(dbName);
                            break;
                        }
                    
                }
            } while (action!=0);
        }

        //Database management
        static void WorkDatabases()
        {
            DatabaseManager dbManager = new DatabaseManager(conSTR);
            int action = 0;
            do
            {
                Console.WriteLine("0. Exit");
                Console.WriteLine("1. Create a DB");
                Console.WriteLine("2. Delete DB");
                Console.WriteLine("3. Show the list of databases");
                action = int.Parse(Console.ReadLine());
                switch (action)
                {
                    case 1:
                        {
                            try
                            {
                                string name;
                                Console.WriteLine("Enter the name of the database:");
                                name = Console.ReadLine();
                                dbManager.CreateDB(name);
                                Console.WriteLine("------The database has been successfully created----");
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine("Error creating a database --", ex.Message);
                            }
                            break;
                        }
                    case 2:
                        {
                            string name;
                            Console.WriteLine("Enter the name of the database:");
                            name = Console.ReadLine();
                            dbManager.DeleteDB(name);
                            Console.WriteLine("------The database has been successfully deleted----");
                            break;
                        }
                    case 3:
                        {
                            Console.WriteLine("List of databases:");
                            dbManager.ShowAllDatabase();
                            Console.WriteLine("------The database has been successfully deleted----");
                            break;
                        }
                }
            } while (action != 0);
        }

        // Manage a separate database
        static void WorkTabelsInDB(string dbName)
        {
            string conectionSTR = $"{conSTR};Initial Catalog={dbName}";
            TableManager tableManager = new TableManager(conectionSTR);
            int action = 0;
            do
            {
                Console.WriteLine("0. Exit");
                Console.WriteLine("1. Create tables");
                Console.WriteLine("2. Fill the database by default");
                Console.WriteLine("3. Fill with BogusRandom data");
                action = int.Parse(Console.ReadLine());
                switch (action)
                {
                    case 1:
                        {
                            tableManager.CreateTabels();
                            break;
                        }
                    case 2:
                        {
                            tableManager.SeederDatabase();
                            break;
                        }
                    case 3:
                        {
                            Stopwatch stopWatch = new Stopwatch();
                            stopWatch.Start();
                            Console.WriteLine("Tell us the number of clients");
                            int n = int.Parse(Console.ReadLine());
                            tableManager.RandomInsertCustomers(n);
                            stopWatch.Stop();
							
                            // Get the elapsed time as a TimeSpan value.
                            TimeSpan ts = stopWatch.Elapsed;
							
                            // Format and display the TimeSpan value.
                            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
                                ts.Hours, ts.Minutes, ts.Seconds,
                                ts.Milliseconds / 10);
                            Console.WriteLine("RunTime " + elapsedTime);
                            break;
                        }
                }
            } while (action != 0);
        }

    }
}
