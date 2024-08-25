using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public static class DataGridViewHelper
    {

        public static void LoadDataGrid(DataGridView dataGridView, string txtSearch, string procedure, string dataMember)
        {
            //Clear grid before load
            dataGridView.DataSource = null;
            dataGridView.Rows.Clear();
            dataGridView.Refresh();


            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch)
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet(procedure, dataMember, parameters);

                // Bind the DataSet to the DataGridView
                dataGridView.DataSource = ds;
                dataGridView.DataMember = dataMember;
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }
    }
}
