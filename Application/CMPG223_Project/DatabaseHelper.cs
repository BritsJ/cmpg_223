using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CMPG223_Project
{
    public class DatabaseHelper
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;

        public SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }

        public SqlDataReader ExecuteQuery(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                SqlCommand command = new SqlCommand(query, conn);
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters);
                }
                return command.ExecuteReader(CommandBehavior.CloseConnection);
            }
        }

        public int ExecuteNonQuery(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = GetConnection())
            {
                SqlCommand command = new SqlCommand(query, conn);
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters);
                }
                conn.Open();
                return command.ExecuteNonQuery();
            }
        }
    }

}
