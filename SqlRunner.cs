using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using System.IO;


namespace dbCreator
{
    public class SqlRunner
    {
        public string FilesLocation { get; set; }
        public string ConnectionString { get; set; }
        private const string token = "#dbname";
        private List<fileRun> fileText { get; set; }
        private SqlConnection conn { get; set; }
        private Server server { get; set; }
        private string dbName { get; set; }

        public SqlRunner(string Location, string connection, string name)
        {
            dbName = name;
            FilesLocation = Location;
            ConnectionString = connection;
            conn = new SqlConnection(ConnectionString);
            server = new Server(new ServerConnection(conn));
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
            Console.WriteLine("");
            foreach (var file in fileText)
            {
               


                    server.ConnectionContext.ExecuteNonQuery(file.fileText);
                    Console.WriteLine(file.fileName);
              
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
}
