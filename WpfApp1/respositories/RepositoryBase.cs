using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace WpfApp1.respositories
{
    public abstract class RepositoryBase
    {
        private readonly string _connectionString;
        public RepositoryBase()
        {
            _connectionString = "Server=(local); Database = Account; Integrated Security = true ";
        }
        protected SqlConnection GetConnection()
        {
            return new SqlConnection(_connectionString);    
        }

    }
}
