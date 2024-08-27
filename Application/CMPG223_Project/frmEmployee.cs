using System;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmEmployee : Form
    {

        public frmEmployee()
        {
            InitializeComponent();
        }

        private void btnclose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            frmEmployeeAddEdit frmEmployeeAddEdit = new frmEmployeeAddEdit(0);
            frmEmployeeAddEdit.ShowDialog();
            LoadEmployees();
        }

        private void btnedit_Click(object sender, EventArgs e)
        {
            int employeeID = Convert.ToInt32(dgvEmployees.SelectedRows[0].Cells[0].Value);

            LoadEmployees();
            
            frmEmployeeAddEdit frmEmployeeAddEdit = new frmEmployeeAddEdit(employeeID);
            frmEmployeeAddEdit.ShowDialog();

            btnedit.Enabled = false;
        }

        private void LoadEmployees()
        {
            DataGridViewHelper.LoadDataGrid(dgvEmployees, txtsearch.Text, "SearchEmployees", "Employees");
        }

        private void txtsearch_TextChanged(object sender, EventArgs e)
        {
            LoadEmployees();
        }

        private void frmEmployee_Load(object sender, EventArgs e)
        {
            LoadEmployees();
        }

        private void dgvEmployees_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnedit.Enabled = true;
        }

        private void txtsearch_TextChanged_1(object sender, EventArgs e)
        {
            LoadEmployees();
        }
    }
}
