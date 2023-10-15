/*
 Project to work with the DB
 There are both general methods: for adding/deleting/viewing databases
 There are also for working with specific databases (mainly for creating filling and correcting databases of the Shop type) 
*/

using GenerateDB.classes;
using System;
using System.Configuration;
using System.Diagnostics;

namespace GenerateDB
{
    class Program
    {
        #region Connection
        public static string conSTR = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString; //@"Data Source=SH\SQLEXPRESS;Integrated Security=True";
        public static DataBaseManagers dbManagers = new DataBaseManagers(conSTR);
        #endregion

        static void Main(string[] args)
        {
            int action = 0; //  to select a menu item
            string[] menu = { "      -Menu-", "       exit  ", "  manage DataBase ", " manage only one DB " };

            do
            {
                Console.Clear();

                foreach (string t in menu) // displaying the menu bar
                {
                    Console.WriteLine("  " + t);
                }

                action = keys(menu); //call the menu

                try
                {
                    switch (action)
                    {
                        case 1: //exit
                            {
                                Console.Clear();
                                Console.WriteLine("Have a nice day!");
                            }
                            break;
                        case 2: //manage DataBase
                            {
                                ManageDataBases();
                            }
                            break;
                        case 3: //manage only one DB
                            {
                                string db_name;
                                Console.Write("Enter name database: ");
                                db_name = Console.ReadLine();
                                ManageOneDB(db_name);
                            }
                            break;
                        default:
                            break;
                    }

                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error! " + ex.Message);
                }

            } while (action != 1);
        }

        /// <summary>
        /// To act with all databases (such as delete, create, view) using the menu
        /// </summary>
        static void ManageDataBases()
        {
            int action2 = 0;  // to select a menu item

            do
            {
                Console.Clear();

                string[] menu = { "       -Menu-", "        exit ", "   create DataBase ", "   delete DataBase ", " show all DataBases " };

                foreach (string t in menu) // show the menu
                {
                    Console.WriteLine("  " + t);
                }

                action2 = keys(menu); //call the menu

                Console.Clear();

                switch (action2)
                {
                    case 1: // exit
                        {

                        }
                        break;
                    case 2: // create DataBase
                        {
                            string db_name;
                            Console.Write("Enter name database: ");
                            db_name = Console.ReadLine();

                            try
                            {
                                dbManagers.CreateDB(db_name);
                                Console.WriteLine("--- DataBase success created---");
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    case 3: // delete DataBase
                        {
                            string db_name;
                            Console.Write("Enter name database: ");
                            db_name = Console.ReadLine();

                            try
                            {
                                dbManagers.DeleteDB(db_name);
                                Console.WriteLine("--- DataBase success delete---");
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    case 4:  //show all DataBases
                        {
                            Console.WriteLine(" ---All database---");
                            dbManagers.ShowAllDB();

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    default:
                        {

                        }
                        break;
                }

            } while (action2 != 1);
        }

        /// <summary>
        /// For actions with one concrete DB for example addition of tables, filling in various ways, etc. using the menu
        /// </summary>
        /// <param name="db_name"></param>
        static void ManageOneDB(string db_name)
        {
            int action2 = 0;  // to select a menu item

            #region Підключення до конкретної бд
            string connectionSTR = $"{conSTR};Initial Catalog={db_name}";
            TableManager tablemanager = new TableManager(connectionSTR);
            #endregion

            string[] menu = { "          -Menu-", "           exit ", "        add table ", "    add default values ",
                " Add random values in tbl\n(by Bogous Random) ", "      show product", "fill with help SP",
                "do operation transaction" };

            do
            {
                Console.Clear();

                foreach (string t in menu) // show the menu
                {
                    Console.WriteLine("  " + t);
                }

                action2 = keys(menu); //call the menu

                Console.Clear();

                switch (action2)
                {
                    case 2:  // add table
                        {
                            try
                            {
                                //tablemanager = new TableManager(connectionSTR);
                                tablemanager.CreateTable();
                                //tablemanager.SeederDataVase();
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    case 3:   //add default values(seeder.sql)
                        {
                            try
                            {
                                tablemanager.SeederDataVase();
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    case 4:  //Add random values in tbl(by Bogous Random)
                        {
                            #region Типу рахує час виконання задачі №1(початок)
                            Stopwatch stopWatch = new Stopwatch();
                            stopWatch.Start();
                            #endregion
                            tablemanager.RandomInsertValues();
                            #region Типу рахує час виконання задачі №2(кінець)
                            stopWatch.Stop();
                            // Get the elapsed time as a TimeSpan value.
                            TimeSpan ts = stopWatch.Elapsed;

                            // Format and display the TimeSpan value.
                            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
                                ts.Hours, ts.Minutes, ts.Seconds,
                                ts.Milliseconds / 10);
                            Console.WriteLine("RunTime " + elapsedTime);
                            #endregion

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    case 5:  //show product
                        {
                            try
                            {
                                var con = tablemanager.GetSqlConnection;
                                ProductManager pm = new ProductManager(con);
                                Console.WriteLine(" ------- Product BD ---------");
                                pm.Show();

                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    case 6:  //fill with help SP(storage procedure)
                        {
                            try
                            {
                                var con = tablemanager.GetSqlConnection;
                                ProductManager pm = new ProductManager(con);
                                Console.WriteLine(" ------- Add 3 Categories ---------");
                                pm.InsertCategoriesRandomSP();
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }

                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    case 7:  //do operation transactions
                        {
                            var con = tablemanager.GetSqlConnection;
                            ProductManager pm = new ProductManager(con);
                            Console.WriteLine("------test transaction--------");
                            pm.TransactionTest();
                            Console.Write("\n Press something ...");
                            Console.ReadKey();
                        }
                        break;
                    default:
                        {

                        }
                        break;
                }

            } while (action2 != 1);

        }

        /// <summary>
        /// EN: Change the color of the menu (to visually highlight an item)
        /// Note: the null(0) element will display as a header it is not included in the selection
        /// </summary>
        /// <param name="i">Here the item to be highlighted(by color)</param>
        /// <param name="texts">Here is an array of strings</param>
        static void Text(int i, string[] texts) //
        {
            Console.Clear();
            Console.WriteLine("  " + texts[0]);

            for (int j = 1; j < texts.Length; j++)
            {
                if (j == i)
                {
                    Console.BackgroundColor = ConsoleColor.Gray;
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.WriteLine("> " + texts[j] + " <");
                    Console.BackgroundColor = ConsoleColor.Black;
                    Console.ForegroundColor = ConsoleColor.White;
                }
                else
                {
                    Console.BackgroundColor = ConsoleColor.Black;
                    Console.ForegroundColor = ConsoleColor.White;
                    Console.WriteLine("  " + texts[j]);
                }
            }
        }

        /// <summary>
        /// EN: menu work
        /// </summary>
        /// <param name="texts">array of value for choose</param>
        /// <returns></returns>
        static int keys(string[] texts)
        {
            int num = 0; // will be the counter
            int max = texts.Length;
            bool flag = false;
            do
            {
                ConsoleKeyInfo keyPushed = Console.ReadKey();
                if (keyPushed.Key == ConsoleKey.DownArrow)
                {
                    num++;
                }
                if (keyPushed.Key == ConsoleKey.UpArrow)
                {
                    num--;
                }
                if (keyPushed.Key == ConsoleKey.Enter)
                {
                    flag = true;
                }
                if (num <= 0)
                {
                    num = max - 1;
                }
                else if (num >= max)
                {
                    num = 1;
                }

                Text(num, texts); // I have already written a description for it

            } while (!flag);
            return num;
        }
    }
}
