using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmJob : Form
    {
        public frmJob()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadJobs();
        }

        private void frmJob_Load(object sender, EventArgs e)
        {
            LoadJobs();
            btnEditJob.Enabled = false;

        }

        private void LoadJobs()
        {
            DataGridViewHelper.LoadDataGrid(dgvMyJobs, txtSearch.Text, "SearchJobs", "Jobs");
        }

        private void btnEditJob_Click(object sender, EventArgs e)
        {
            int jobId = Convert.ToInt32(dgvMyJobs.SelectedRows[0].Cells[0].Value);

            frmJobAddEdit addEvent = new frmJobAddEdit(jobId);
            addEvent.ShowDialog();
            LoadJobs();
            btnEditJob.Enabled = false;
            btnAddJob.Enabled = true;
        }

        private void dgvMyJobs_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEditJob.Enabled = true;
        }

        private void btnAddJob_Click(object sender, EventArgs e)
        {
            frmJobAddEdit addEvent = new frmJobAddEdit(0);
            addEvent.ShowDialog();
            LoadJobs();
            btnEditJob.Enabled = false;
        }
    }
}
