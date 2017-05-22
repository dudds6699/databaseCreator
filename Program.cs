using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dbCreator
{
    class Program
    {        

        static void Main(string[] args)
        {

            Console.WriteLine("DataBase reset press any key to continue");
            Console.ReadKey();

            try
            {
                foreach (var ar in args)
                {
                    Console.WriteLine(ar);
                }

                SqlRunner runner = new SqlRunner(args[2], args[1], args[0]);
                runner.GetfileTextSet();
                runner.runScripts();
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }

            Console.ReadKey();

        }
    }
}
