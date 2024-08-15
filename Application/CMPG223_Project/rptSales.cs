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

            if (!string.IsNullOrEmpty(searchText) && !string.IsNullOrEmpty(sortOption))
            {
                dataTable = ExecuteSearchAndSortQuery(searchText, sortOption);
            }
            else if (!string.IsNullOrEmpty(searchText))
            {
                dataTable = ExecuteSearchQuery(searchText);
            }
            else if (!string.IsNullOrEmpty(sortOption))
            {
                dataTable = ExecuteSortQuery(sortOption);
            }
            else
            {
                dataTable = ExecuteAllRecordsQuery();
            }

            dataGridView1.DataSource = dataTable;
        }

        private DataTable ExecuteSearchAndSortQuery(string searchText, string sortOption)
        {
            DataTable searchResult = ExecuteSearchQuery(searchText);
            DataTable sortedResult = ExecuteSortQuery(sortOption);

            // Combine searchResult and sortedResult
            DataTable combinedResult = searchResult.Clone(); // Create an empty table with the same schema
            foreach (DataRow row in sortedResult.Rows)
            {
                DataRow[] foundRows = searchResult.Select($"Sale_Id = '{row["Sale_Id"]}'");
                if (foundRows.Length > 0)
                {
                    combinedResult.ImportRow(foundRows[0]);
                }
            }
            return combinedResult;
        }

        private DataTable ExecuteSearchQuery(string searchText)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@SearchTerm", searchText)
            };

            DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchSales", "Sales", parameters);
            return ds.Tables["Sales"];
        }

        private DataTable ExecuteSortQuery(string sortOption)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@SortOption", sortOption)
            };

            DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SortSales", "Sales", parameters);
            return ds.Tables["Sales"];
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