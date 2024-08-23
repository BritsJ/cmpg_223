using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmJobAddEdit : Form
    {
        private int _jobId { get; set; }

        public frmJobAddEdit(int jobId)
        {
            InitializeComponent();
            _jobId = jobId;
        }

        private void frmJobAddEdit_Load(object sender, EventArgs e)
        {
            loadAllEquipment();
            LoadClients();
            LoadEmpoyees();

            if (_jobId > 0)
            {
                // Load the job details
                LoadJobDetails();
                cmbClient.Enabled = false;
                cmbEmployee.Enabled = false;

            }

            dgvJobEquipment.Columns.Add("Equipment_Id", "Id");
            dgvJobEquipment.Columns.Add("Name", "Name");
            dgvJobEquipment.Columns.Add("Description", "Description");

        }

        private void LoadJobDetails()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Job_Id", _jobId)
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("GetJobById", "Job", parameters);

                // Bind the DataSet to the DataGridView
                dgvJobEquipment.DataSource = ds;
                dgvJobEquipment.DataMember = "Job";

                // Set the values of the controls on the form
                cmbClient.SelectedValue = ds.Tables[0].Rows[0]["Client_Id"];
                cmbEmployee.SelectedValue = ds.Tables[0].Rows[0]["Employee_Number"];
                dtpStartDate.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["Start_Date"]);

                //When the enddate is null, the datepicker will not display the date
                if (ds.Tables[0].Rows[0]["End_Date"] == DBNull.Value)
                    dtpEndDate.Checked = false;
                else
                    dtpEndDate.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["End_Date"]);
                txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();

                LoadJobEquipment();

            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void LoadJobEquipment()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Job_Id", _jobId)
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("GetJobEquipmentByJobId", "JobEquipment", parameters);

                // Bind the DataSet to the DataGridView
                dgvJobEquipment.DataSource = ds;
                dgvJobEquipment.DataMember = "JobEquipment";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
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

        private void LoadEmpoyees()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch.Text)
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchEmployees", "Employees", parameters);

                // Bind the DataSet to the combo box
                cmbEmployee.DataSource = ds.Tables[0];
                cmbEmployee.DisplayMember = "Username";
                cmbEmployee.ValueMember = "Employee_Number";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void loadAllEquipment()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", "")
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchJobEquipment", "Equipment", parameters);

                // Bind the DataSet to the DataGridView
                dgvEquipment.DataSource = ds;
                dgvEquipment.DataMember = "Equipment";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {

        }

        private void dgvEquipment_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            // Get the selected row and add it to the dgvSaleItems grid
            DataGridViewRow selectedRow = dgvEquipment.Rows[e.RowIndex];



            dgvJobEquipment.Rows.Add(selectedRow.Cells["Equipment Id"].Value,
                selectedRow.Cells["Equipment Code"].Value,
                selectedRow.Cells["Name"].Value,
                selectedRow.Cells["Description"].Value);
        }

        private void dgvJobEquipment_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            //only remove row if it contains a record
            if (dgvJobEquipment.Rows[e.RowIndex].Cells[0].Value != null)
                dgvJobEquipment.Rows.RemoveAt(e.RowIndex);
        }
    }
}
