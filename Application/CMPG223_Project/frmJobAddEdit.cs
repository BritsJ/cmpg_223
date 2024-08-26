using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
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
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Job_Id", _jobId)
                };

                DataTable dt = DbHelper.ExecuteStoredProcedureDataTable("GetJobEquipmentByJobId", parameters);
                dgvJobEquipment.DataSource = dt;
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

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void loadAllEquipment()
        {
            DataGridViewHelper.LoadDataGrid(dgvEquipment, txtSearch.Text, "SearchJobEquipment", "Equipment");
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            // Add or Update the job
            if (_jobId > 0)
            {
                UpdateJob();
            }
            else
            {
                AddJob();
            }
        }

        private void AddJob()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Client_Id", cmbClient.SelectedValue),
                    new SqlParameter("@Employee_Number", cmbEmployee.SelectedValue),
                    new SqlParameter("@Start_Date_Time", dtpStartDate.Value),
                    new SqlParameter("@End_Date_Time", dtpEndDate.Checked ? dtpEndDate.Value : (object)DBNull.Value),
                    new SqlParameter("@Job_Description", txtDescription.Text)
                };

                // Use the DbHelper class to execute the stored procedure
                int jobId = DbHelper.ExecuteStoredProcedureWithOutput("AddJob", "@NewJob_Id", parameters);


                SaveJobEquipment(jobId, true);


                // Show a success message
                MessageBox.Show("Job added successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Close the form
                Close();
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void SaveJobEquipment(int jobId, bool isAdd)
        {
            try
            {
                if (!isAdd)
                {
                    // Delete all existing equipment for the job
                    SqlParameter[] deleteParameters = new SqlParameter[]
                    {
                        new SqlParameter("@Job_Id", jobId)
                    };

                    DbHelper.ExecuteStoredProcedureNonQuery("DeleteJobEquipment", deleteParameters);
                }


                // Add the new equipment records
                foreach (DataGridViewRow row in dgvJobEquipment.Rows)
                {
                    if (row.Cells[0].Value != null)
                    {
                        SqlParameter[] parameters = new SqlParameter[]
                        {
                            new SqlParameter("@Job_Id", jobId),
                            new SqlParameter("@Equipment_Id", row.Cells[0].Value)
                        };

                        DbHelper.ExecuteStoredProcedureNonQuery("AddJobEquipment", parameters);
                    }
                }
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void UpdateJob()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Job_Id", _jobId),
                    new SqlParameter("@Client_Id", cmbClient.SelectedValue),
                    new SqlParameter("@Employee_Number", cmbEmployee.SelectedValue),
                    new SqlParameter("@Start_Date_Time", dtpStartDate.Value),
                    new SqlParameter("@End_Date_Time", dtpEndDate.Checked ? dtpEndDate.Value : (object)DBNull.Value),
                    new SqlParameter("@Job_Description", txtDescription.Text)
                };

                // Use the DbHelper class to execute the stored procedure
                DbHelper.ExecuteStoredProcedureNonQuery("UpdateJob", parameters);

                SaveJobEquipment(_jobId, false);

                // Show a success message
                MessageBox.Show("Job updated successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Close the form
                Close();
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void dgvEquipment_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            // Get the selected row from dgvEquipment
            DataGridViewRow selectedRow = dgvEquipment.Rows[e.RowIndex];

            // Get the data source of dgvJobEquipment
            var dataSource = dgvJobEquipment.DataSource as DataTable;

            if (dataSource == null)
            {
                // If the data source is null, create a new DataTable and set it as the data source
                dataSource = new DataTable();
                dataSource.Columns.Add("Equipment Id");
                dataSource.Columns.Add("Equipment Code");
                dataSource.Columns.Add("Name");
                dataSource.Columns.Add("Description");
                dgvJobEquipment.DataSource = dataSource;
            }

            // Create a new DataRow and populate it with values from the selected row
            DataRow newRow = dataSource.NewRow();
            newRow["Equipment Id"] = selectedRow.Cells[0].Value;
            newRow["Equipment Code"] = selectedRow.Cells[1].Value;
            newRow["Name"] = selectedRow.Cells[2].Value;
            newRow["Description"] = selectedRow.Cells[3].Value;

            // Add the new row to the DataTable
            dataSource.Rows.Add(newRow);
        }

        private void dgvJobEquipment_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            //only remove row if it contains a record
            if (dgvJobEquipment.Rows[e.RowIndex].Cells[0].Value != null)
                dgvJobEquipment.Rows.RemoveAt(e.RowIndex);
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            loadAllEquipment();
        }
    }
}
