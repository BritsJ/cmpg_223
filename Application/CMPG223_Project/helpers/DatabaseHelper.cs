using System.Collections.Generic;
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

        public static int ExecuteStoredProcedureWithOutput(string storedProcedureName, string outputParameter, SqlParameter[] parameters = null)
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

                    SqlParameter outputId = new SqlParameter
                    {
                        ParameterName = outputParameter,
                        SqlDbType = SqlDbType.Int,
                        Direction = ParameterDirection.Output
                    };
                    command.Parameters.Add(outputId);

                    conn.Open();
                    command.ExecuteNonQuery();

                    return (int)outputId.Value;
                }
            }
        }

        public static void ExecuteTransaction(List<SqlCommand> commands)
        {
            using (SqlConnection conn = GetConnection())
            {
                conn.Open();
                using (SqlTransaction transaction = conn.BeginTransaction())
                {
                    try
                    {
                        foreach (var command in commands)
                        {
                            command.Connection = conn;
                            command.Transaction = transaction;
                            command.ExecuteNonQuery();
                        }
                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }

        public static DataTable ExecuteStoredProcedureDataTable(string storedProcedureName, SqlParameter[] parameters = null)
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
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
        }
    }

}
