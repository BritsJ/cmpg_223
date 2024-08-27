using System;
using System.Windows.Forms;


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
            DataGridViewHelper.LoadDataGrid(dgvClients, txtSearch.Text, "SearchClients", "Clients");

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

            frmClientsEditAdd frmClientsAddEdit = new frmClientsEditAdd(clientId);
            frmClientsAddEdit.ShowDialog();
            LoadClients();
            btnAdd.Enabled = true;
            btnEdit.Enabled = false;
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



        private void dgvClients_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = true;
        }
    }
}
