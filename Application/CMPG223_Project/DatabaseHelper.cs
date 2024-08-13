using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CMPG223_Project
{
    public static class DbHelper
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;

        public static SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }

        public static SqlDataReader ExecuteQuery(string query, SqlParameter[] parameters)
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

        public static int ExecuteNonQuery(string query, SqlParameter[] parameters)
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

        public static SqlDataReader ExecuteStoredProcedureReader(string storedProcedureName, SqlParameter[] parameters = null)
        {
            SqlConnection conn = GetConnection();
            conn.Open();

            using (SqlCommand command = new SqlCommand(storedProcedureName, conn))
            {
                command.CommandType = CommandType.StoredProcedure;
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters);
                }

                return command.ExecuteReader(CommandBehavior.CloseConnection);
            }
        }

        public static DataSet ExecuteStoredProcedureDataSet(string storedProcedureName, string sourceTable, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand command = new SqlCommand(storedProcedureName, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataSet ds = new DataSet();
                        adapter.Fill(ds, sourceTable);
                        return ds;
                    }
                }
            }
        }

        public static void ExecuteStoredProcedureNonQuery(string storedProcedureName, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = GetConnection())
            {
                using (SqlCommand command = new SqlCommand(storedProcedureName, conn))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    conn.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }

}
