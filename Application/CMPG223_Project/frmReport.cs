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
            if (!rbClients.Checked && !rbEmployees.Checked && !rbStock.Checked && !rbJobs.Checked && !rbSales.Checked && !rbEquipment.Checked)
            {
                MessageBox.Show("Please select a category to generate the report.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return; 
            }

            LoadData(GetStoredProcedureNameFromRadioButton());
        }
 
        private void radioButton_CheckedChanged(object sender, EventArgs e)
        {
            currentSortColumn = null;
            cbSort.SelectedIndex = -1;
            cbSort.Refresh();
            txtSearch.Clear();

            if (rbClients.Checked)
            {
                UpdateComboBox(new string[] {"Business_Name", "Total_Jobs", "Total_Job_Duration"});
            }
            else if (rbEmployees.Checked)
            {
                UpdateComboBox(new string[] {"Employee_Number","First_Name", "Last_Name", "Total_Jobs", "Total_Sales" });
            }
            else if (rbStock.Checked)
            {
                UpdateComboBox(new string[] {"Stock_Code", "Stock_Name", "Total_Quantity", "Total_Purchase_Cost", "Total_Selling_Value" });
            }
            else if (rbJobs.Checked)
            {
                UpdateComboBox(new string[] {"Client_Id", "Client_Business_Name", "Total_Jobs" });
            }
            else if (rbSales.Checked)
            {
                UpdateComboBox(new string[] {"Employee_Number", "Total_Sales", "Total_Revenue" });
            }
            else if (rbEquipment.Checked)
            {
                UpdateComboBox(new string[] {"Name", "Equipmment_Code", "Total_Quantity", "Quantity_Checked_Out" });
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

            // Execute stored procedure and get the DataTable
            DataSet ds = DbHelper.ExecuteStoredProcedureDataSet(storedProcedureName, "SourceTable", parameters);
            DataTable dataTable = ds.Tables["SourceTable"];

            // Add columns dynamically if needed
            AddDynamicColumns(dataTable);

            // Apply sorting if the column exists
            if (!string.IsNullOrEmpty(currentSortColumn) && dataTable.Columns.Contains(currentSortColumn))
            {
                dataTable.DefaultView.Sort = $"{currentSortColumn} ASC";
            }

            dataGridView1.DataSource = dataTable;
        }


        private void AddDynamicColumns(DataTable dataTable)
        {
            if (rbClients.Checked)
            {
                if (!dataTable.Columns.Contains("Total_Jobs"))
                {
                    dataTable.Columns.Add("Total_Jobs", typeof(int));
                }
                if (!dataTable.Columns.Contains("Total_Job_Duration"))
                {
                    dataTable.Columns.Add("Total_Job_Duration", typeof(int));
                }
            }
            else if (rbEmployees.Checked)
            {
                {
                    if (!dataTable.Columns.Contains("Total_Jobs"))
                    {
                        dataTable.Columns.Add("Total_Jobs", typeof(int));
                    }
                    if (!dataTable.Columns.Contains("Total_Sales"))
                    {
                        dataTable.Columns.Add("Total_Sales", typeof(int));
                    }
                }
            }
            else if (rbStock.Checked)
            {
                if (!dataTable.Columns.Contains("Total_Quantity"))
                {
                    dataTable.Columns.Add("Total_Quantity", typeof(int));
                }
                if (!dataTable.Columns.Contains("Total_Purchase_Cost"))
                {
                    dataTable.Columns.Add("Total_Purchase_Cost", typeof(int));
                }
                if (!dataTable.Columns.Contains("Total_Selling_Value"))
                {
                    dataTable.Columns.Add("Total_Selling_Value", typeof(int));
                }
            }
            else if (rbJobs.Checked)
            {
                if (!dataTable.Columns.Contains("Total_Jobs"))
                {
                    dataTable.Columns.Add("Total_Jobs", typeof(int));
                }
            }
            else if (rbSales.Checked)
            {
                if (!dataTable.Columns.Contains("Total_Sales"))
                {
                    dataTable.Columns.Add("Total_Sales", typeof(int));
                }

                if (!dataTable.Columns.Contains("Total_Revenue"))
                {
                    dataTable.Columns.Add("Total_Revenue", typeof(decimal));
                }
            }
            else if (rbEquipment.Checked)
            {
                 if (!dataTable.Columns.Contains("Total_Quantity"))
                {
                    dataTable.Columns.Add("Total_Quantity", typeof(int));
                }
                if (!dataTable.Columns.Contains("Total_Checked_Out"))
                {
                    dataTable.Columns.Add("Total_Checked_Out", typeof(int));
                }
            }

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