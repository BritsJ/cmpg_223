using System;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmClientsEditAdd : Form
    {
        public int clientId { get; set; }
        public frmClientsEditAdd(int clientId)
        {
            InitializeComponent();
            this.clientId = clientId;

            if (clientId != 0)
            {
                getClient(clientId);
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void getClient(int clientId)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Client_Id", clientId)
                };

                using (SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("GetClientById", sp))
                {
                    if (reader.Read())
                    {

                        txtClientCode.Text= reader["Client_Code"].ToString();
                        txtName.Text= reader["Contact_Person_Name"].ToString();
                        txtBusinessName.Text = reader["Business_Name"].ToString();
                        txtPhoneNumber.Text = reader["Phone_Number"].ToString();
                        txtEmail.Text = reader["Email_Address"].ToString();
                        txtPhysicalAddress.Text = reader["Physical_Address"].ToString();
                        txtAdditionalInfo.Text = reader["Additional_Info"].ToString();
                        chkIsActive.Checked = Convert.ToBoolean(reader["Is_Active"]);

                    }
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (clientId != 0)
            {
                if (IsValid())
                {
                    UpdateClient();
                    Close();
                }

            }
            else
            {
                if (IsValid())
                {
                    AddNewClient();
                    Close();
                }
            }

            
        }

        private void AddNewClient()
        {
            try
            {

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Client_Code",txtClientCode.Text),
                    new SqlParameter("@Contact_Person_Name",txtName.Text),
                    new SqlParameter("@Business_Name",txtBusinessName.Text),
                    new SqlParameter("@Phone_Number",txtPhoneNumber.Text),
                    new SqlParameter("@Email_Address",txtEmail.Text),
                    new SqlParameter("@Physical_Address",txtPhysicalAddress.Text),
                    new SqlParameter("@Additional_Info",txtAdditionalInfo.Text),
                    new SqlParameter("@Is_Active",chkIsActive.Checked)
                };
                
                DbHelper.ExecuteStoredProcedureNonQuery("AddClient", parameters);

                MessageBox.Show("Client added successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void UpdateClient()
        {
            try
            {
                
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Client_Id",clientId),
                    new SqlParameter("@Client_Code",txtClientCode.Text),
                    new SqlParameter("@Contact_Person_Name",txtName.Text),
                    new SqlParameter("@Business_Name",txtBusinessName.Text),
                    new SqlParameter("@Phone_Number",txtPhoneNumber.Text),
                    new SqlParameter("@Email_Address",txtEmail.Text),
                    new SqlParameter("@Physical_Address",txtPhysicalAddress.Text),
                    new SqlParameter("@Additional_Info",txtAdditionalInfo.Text),
                    new SqlParameter("@Is_Active",chkIsActive.Checked)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("UpdateClient", parameters);

                MessageBox.Show("Client updated successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private bool IsValid()

        {

            System.Text.RegularExpressions.Regex rEmail = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$");

            if (txtEmail.Text.Length > 0 && txtEmail.Text.Trim().Length != 0)
            {
                if (!rEmail.IsMatch(txtEmail.Text.Trim()))
                {
                    MessageBox.Show("Email not valid", "Validation", MessageBoxButtons.OK);
                    txtEmail.SelectAll();
                    return false;
                }

                return true;
            }

            return false;
        }
    }
}
