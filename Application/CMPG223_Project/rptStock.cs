using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class rptStock : Form
    {
        public rptStock()
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

            DataTable dataTable = GenerateStockReport(searchText, sortOption);

            dataGridView1.DataSource = dataTable;
        }

        private DataTable GenerateStockReport(string searchTerm, string sortOption)
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
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchAndSortStock", "Stock", parameters);

                // Bind the DataSet to the DataGridView or report viewer
                return ds.Tables["Stock"];
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
                return null;
            }
        }
    }
}