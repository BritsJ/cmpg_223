using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmReport : Form
    {
        private string currentSortColumn = "";

        public frmReport()
        {
            InitializeComponent();
            InitializeDataGridView();
        }

        private void InitializeDataGridView()
        {
            dataGridView1.DataSource = null;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            LoadData(GetStoredProcedureNameFromRadioButton());
        }
 
        private void radioButton_CheckedChanged(object sender, EventArgs e)
        {
            currentSortColumn = null;
            cbSort.SelectedIndex = -1;
            txtSearch.Clear();

            if (rbClients.Checked)
            {
                UpdateComboBox(new string[] {"Client_ID", "Business_Name"});
            }
            else if (rbEmployees.Checked)
            {
                UpdateComboBox(new string[] {"Employee_Number", "Hire_Date"});
            }
            else if (rbStock.Checked)
            {
                UpdateComboBox(new string[] {"Stock_ID", "Purchase_Date", "Purchase_Price", "Selling_Price", "Quantity" });
            }
            else if (rbJobs.Checked)
            {
                UpdateComboBox(new string[] {"Job_ID", "Client_Id", "Employee_Number", "Start_Date_Time" });
            }
            else if (rbSales.Checked)
            {
                UpdateComboBox(new string[] {"Sale_ID", "Employee_Number", "Sale_Date_Time", "Cash_Received" });
            }
            else if (rbEquipment.Checked)
            {
                UpdateComboBox(new string[] { "Equipment_Id", "Name", "Quantity", "Quantity_Checked_Out" });
            }
        }

        private void LoadData(string storedProcedureName)
        {
            SqlParameter[] parameters = null;

            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchValue", txtSearch.Text)
                };
            }

            DataSet ds = DbHelper.ExecuteStoredProcedureDataSet(storedProcedureName, "SourceTable", parameters);
            DataTable dataTable = ds.Tables["SourceTable"];

            if (!string.IsNullOrEmpty(currentSortColumn))
            {
                dataTable.DefaultView.Sort = $"{currentSortColumn} ASC";
            }

            dataGridView1.DataSource = dataTable;
        }

        private void UpdateComboBox(string[] items)
        {
            cbSort.Items.Clear();
            cbSort.Items.AddRange(items);
        }

        private void cbSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            currentSortColumn = cbSort.SelectedItem?.ToString() ?? "";
        }

        private string GetStoredProcedureNameFromRadioButton()
        {
            if (rbClients.Checked) return "rptClients";
            if (rbEmployees.Checked) return "rptEmployees";
            if (rbStock.Checked) return "rptStock";
            if (rbJobs.Checked) return "rptJobs";
            if (rbSales.Checked) return "rptSales";
            if (rbEquipment.Checked) return "rptEquipment";
            return "";
        }
    }
}