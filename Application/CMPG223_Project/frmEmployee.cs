using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmEmployee : Form
    {
        public bool isUserAdmin {  get; set; }
        public frmEmployee(bool isUserAdmin)
        {
            InitializeComponent();
            this.isUserAdmin = isUserAdmin;
        }

        private void btnclose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            frmEmployeeAddEdit frmEmployeeAddEdit = new frmEmployeeAddEdit();
            frmEmployeeAddEdit.ShowDialog();
        }

        private void btnedit_Click(object sender, EventArgs e)
        {
            int employeeID = Convert.ToInt32(dgvEmployees.SelectedRows[0].Cells[0].Value);

            LoadEmployees();
            
            frmEmployeeAddEdit frmEmployeeAddEdit = new frmEmployeeAddEdit();
            frmEmployeeAddEdit.ShowDialog();
        }

        private void LoadEmployees()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtsearch.Text)
                };

                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchEmployees", "Employees", parameters);

                dgvEmployees.DataSource = ds;
                dgvEmployees.DataMember = "Employees";
            }
            catch(SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void txtsearch_TextChanged(object sender, EventArgs e)
        {
            LoadEmployees();
        }
    }
}
