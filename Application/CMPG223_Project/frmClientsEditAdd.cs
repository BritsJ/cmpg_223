using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

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
                        txtName.Text= reader["First_Name"].ToString();
                        txtBusinessName.Text = reader["Business_Name"].ToString();
                        txtPhoneNumber.Text = reader["Phone_Number"].ToString();
                        txtEmail.Text = reader["Email_Address"].ToString();
                        txtPhysicalAddress.Text = reader["Physical_Address"].ToString();
                        txtAdditionalInfo.Text = reader["Additional_Info"].ToString();
                        chkIsActive.Checked = Convert.ToBoolean(reader["IsActive"]);

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
                UpdateClient();
            }
            else
            {
                AddNewClient();
            }

            Close();
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
                    new SqlParameter("@Additional_Info",chkIsActive.Text),
                    new SqlParameter("@Is_Active",txtPhoneNumber.Text),
                    

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
                    new SqlParameter("@Client_Code",txtClientCode.Text),
                    new SqlParameter("@Contact_Person_Name",txtName.Text),
                    new SqlParameter("@Business_Name",txtBusinessName.Text),
                    new SqlParameter("@Phone_Number",txtPhoneNumber.Text),
                    new SqlParameter("@Email_Address",txtEmail.Text),
                    new SqlParameter("@Physical_Address",txtPhysicalAddress.Text),
                    new SqlParameter("@Additional_Info",chkIsActive.Text),
                    new SqlParameter("@Is_Active",txtPhoneNumber.Text),
                };

                DbHelper.ExecuteStoredProcedureNonQuery("UpdateClient", parameters);

                MessageBox.Show("Client updated successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void frmClientsEditAdd_Load(object sender, EventArgs e)
        {

        }
    }
}
