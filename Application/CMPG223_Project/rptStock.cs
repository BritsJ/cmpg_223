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
        private string connectionString = "Server=DESKTOP;Database=koosieSeDatabase;User Id=sa;Password=p@55w0rd01;";

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
            string query = BuildQuery(searchText, sortOption);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);
                dataGridView1.DataSource = dataTable;
            }
        }

        private string BuildQuery(string searchText, string sortOption)
        {
            string baseQuery = "SELECT * FROM STOCK";
            string whereClause = string.Empty;
            string orderByClause = string.Empty;

            if (!string.IsNullOrEmpty(searchText))
            {
                whereClause = $" WHERE Stock_Name LIKE '%{searchText}%' OR Stock_Description LIKE '%{searchText}%'";
            }

            switch (sortOption)
            {
                case "Alphabetically":
                    orderByClause = " ORDER BY Stock_Name";
                    break;
                case "By ID":
                    orderByClause = " ORDER BY Stock_Id";
                    break;
                case "Quantity(Ascending)":
                    orderByClause = " ORDER BY Quantity ASC";
                    break;
                case "Quantity(Descending)":
                    orderByClause = " ORDER BY Quantity DESC";
                    break;
                default:
                    orderByClause = string.Empty;
                    break;
            }

            return $"{baseQuery}{whereClause}{orderByClause}";
        }
    }
}
