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
    public partial class frmClients : Form
    {
        
        public frmClients()
        {
            InitializeComponent();
        }

        private void LoadClients()
        {

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch.Text)
                };
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchClients", "Clients ", parameters);

                dgvClients.DataSource = ds;
                dgvClients.DataMember = "SearchClients";
            }

            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadClients();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            frmClientsEditAdd frmClientsAddEdit = new frmClientsEditAdd(0);
            frmClientsAddEdit.ShowDialog();
            LoadClients();

            btnEdit.Enabled = false;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int clientId = Convert.ToInt32(dgvClients.SelectedRows[0].Cells[0].Value);

            frmCategoryAddEdit frmClientsAddEdit = new frmCategoryAddEdit(clientId);
            frmClientsAddEdit.ShowDialog();
            LoadClients();
            btnAdd.Enabled = false;
            btnEdit.Enabled = true;
        }

        private void frmClients_Load(object sender, EventArgs e)
        {
            btnEdit.Enabled = false;
            LoadClients();

        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void dgvClients_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = true;
        }
    }
}
