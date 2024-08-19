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
    public partial class frmSales : Form
    {
        private int employee_number { get; set; }
        public frmSales(int employee_number)
        {
            InitializeComponent();
            this.employee_number = employee_number;
        }

        private void frmSales_Load(object sender, EventArgs e)
        {
            LoadClients();
            LoadStockItems();

            dgvSaleItems.Columns.Add("Stock_Id", "Id");
            dgvSaleItems.Columns.Add("Name", "Name");
            dgvSaleItems.Columns.Add("Price", "Price");

        }

        private void LoadClients()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch.Text)
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchClients", "Clients", parameters);

                // Bind the DataSet to the combo box
                cmbClient.DataSource = ds.Tables[0];
                cmbClient.DisplayMember = "Business_Name";
                cmbClient.ValueMember = "Client_Id";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void LoadStockItems()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch.Text)
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchStocksSales", "Stock", parameters);

                // Bind the DataSet to the DataGridView
                dgvStock.DataSource = ds;
                dgvStock.DataMember = "Stock";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void dgvStock_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            // Get the selected row and add it to the dgvSaleItems grid
            DataGridViewRow selectedRow = dgvStock.Rows[e.RowIndex];



            dgvSaleItems.Rows.Add(selectedRow.Cells["Stock ID"].Value,
                selectedRow.Cells["Name"].Value,
                selectedRow.Cells["Selling Price"].Value);

        }

        private void dgvSaleItems_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            //only remove row if it contains a record
            if (dgvSaleItems.Rows[e.RowIndex].Cells[0].Value != null)
                dgvSaleItems.Rows.RemoveAt(e.RowIndex);
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadStockItems();
        }

        private void btnPay_Click(object sender, EventArgs e)
        {
            // Calculate the total of the sale from the dgvSaleItems grid
            decimal total = 0;
            decimal pay = 0;
            decimal change = 0;

            foreach (DataGridViewRow row in dgvSaleItems.Rows)
            {
                // Skip the empty last row (if any)
                if (row.IsNewRow) continue;

                total += Convert.ToDecimal(row.Cells["Price"].Value);
            }

            // Round to 2 decimal places
            total = Math.Round(total, 2);

            // Show payment form
            frmSalePopup frmPay = new frmSalePopup(total);
            frmPay.ShowDialog();
            pay = frmPay.amount_out;
            change = frmPay.amount_change;

            // Check if payment is sufficient
            if (pay < total)
            {
                MessageBox.Show("Insufficient payment amount.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Insert the sale into the database and get the Sale_Id
            SqlParameter[] saleParams = 
                {
                    new SqlParameter("@Employee_Number", employee_number),
                    new SqlParameter("@Sale_Date_Time", DateTime.Now),
                    new SqlParameter("@Cash_Received", pay)//,
                   // new SqlParameter("@NewSale_Id", SqlDbType.Int) { Direction = ParameterDirection.Output }
                };

            int saleId = DbHelper.ExecuteStoredProcedureWithOutput("AddSale", "@NewSale_Id", saleParams);

            // Insert each sale item into the database
            foreach (DataGridViewRow row in dgvSaleItems.Rows)
            {
                // Skip the empty last row (if any)
                if (row.IsNewRow) continue;

                SqlParameter[] saleItemParams = 
                    {
                        new SqlParameter("@Stock_Id", Convert.ToInt32(row.Cells["Stock_Id"].Value)),
                        new SqlParameter("@Sale_Id", saleId),
                        new SqlParameter("@Quantity", 1), // Assuming quantity is 1, adjust as needed
                        new SqlParameter("@Price", Convert.ToDecimal(row.Cells["Price"].Value))
                    };

                DbHelper.ExecuteStoredProcedureNonQuery("AddSaleItem", saleItemParams);
            }


            Close();
        }


        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
