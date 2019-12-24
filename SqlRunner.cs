using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Text.RegularExpressions;


namespace dbCreator
{
    public class SqlRunner
    {
        public string FilesLocation { get; set; }
        public string ConnectionString { get; set; }
        private const string token = "#dbname";
        private List<fileRun> fileText { get; set; }
        private string dbName { get; set; }

        public SqlRunner(string Location, string connection, string name)
        {
            dbName = name;
            FilesLocation = Location;
            ConnectionString = connection;

            fileText = new List<fileRun>();
        }

        public SqlRunner(string Location)
        {
            FilesLocation = Location;
            fileText = new List<fileRun>();
        }


        public void GetfileTextSet()
        {
            var files = Directory.GetFiles(FilesLocation, "*.sql");
            foreach (var file in files)
            {
                fileText.Add(new fileRun(file, File.ReadAllText(file).Replace(token, dbName)));
            }
        }

        public void runScripts()
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                Console.WriteLine("");
                foreach (var file in fileText)
                {

                    IEnumerable<string> commandStrings = Regex.Split(file.fileText, @"^\s*GO\s*$",
                        RegexOptions.Multiline | RegexOptions.IgnoreCase);

                    foreach (var cmd in commandStrings)
                    {
                        if (cmd.isNullOrEmpty() == false)
                        {
                            var command = conn.CreateCommand();
                            command.CommandText = cmd;
                            command.ExecuteNonQuery();
                        }
                    }


                    Console.WriteLine(file.fileName);

                }
                Console.WriteLine("END OF LINE");
                conn.Close();
            }
        }
    }


    class fileRun
    {
        public string fileName { get; set; }
        public string fileText { get; set; }

        public fileRun(string name, string text)
        {
            this.fileText = text;
            this.fileName = name.Split('\\').Last();
        }
    }

    public static class frack
    {
        public static bool isNullOrEmpty(this string str)
        {
           return string.IsNullOrWhiteSpace(str);
        }
    }
}


