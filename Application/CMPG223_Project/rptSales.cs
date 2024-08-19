using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Configuration;

namespace CMPG223_Project
{
    public partial class rptSales : Form
    {
        public rptSales()
        {
            InitializeComponent();
            InitializeDataGridView();
        }

        private void InitializeDataGridView()
        {
            dataGridView1.DataSource = null;
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            string sortOption = cbSort.SelectedItem?.ToString();

            DataTable dataTable;

            if (!string.IsNullOrEmpty(searchText) || !string.IsNullOrEmpty(sortOption))
            {
                dataTable = GenerateSalesReport(searchText, sortOption);
            }
            else
            {
                dataTable = ExecuteAllRecordsQuery();
            }

            dataGridView1.DataSource = dataTable;
        }

        private DataTable GenerateSalesReport(string searchTerm, string sortOption)
        {
            try
            {
                // Define parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", string.IsNullOrEmpty(searchTerm) ? (object)DBNull.Value : searchTerm),
                    new SqlParameter("@SortOption", string.IsNullOrEmpty(sortOption) ? (object)DBNull.Value : sortOption)
                };

                // Execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchAndSortSales", "Sales", parameters);

                // Return the DataTable from the DataSet
                return ds.Tables["Sales"];
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
                return null;
            }
        }

        private DataTable ExecuteAllRecordsQuery()
        {
            using (SqlConnection conn = DbHelper.GetConnection())
            {
                using (SqlCommand command = new SqlCommand("SELECT * FROM SALE", conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
        }
    }
}