using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
namespace CMPG223_Project
{
    public partial class frmSubcategory : Form
    {

        public frmSubcategory()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void LoadSubcategories()
        {
            try
            {
                
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch.Text)
                };

                
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchSubcategories", "Subcategories", parameters);

                
                dgvSubcategory.DataSource = ds;
                dgvSubcategory.DataMember = "Subcategories";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadSubcategories();
        }


        private void frmSubcategory_Load(object sender, EventArgs e)
        {
            LoadSubcategories();
            btnEdit.Enabled = false;
        }
        


        private void btnAdd_Click(object sender, EventArgs e)
        { 
            frmSubcategoryAddEdit frmAddEdit = new frmSubcategoryAddEdit(0);
            frmAddEdit.ShowDialog();
            LoadSubcategories();
            
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int subcategoryId = Convert.ToInt32(dgvSubcategory.SelectedRows[0].Cells[0].Value);

            frmSubcategoryAddEdit frmAddEdit = new frmSubcategoryAddEdit(subcategoryId);
            frmAddEdit.ShowDialog();
            LoadSubcategories();
            btnEdit.Enabled = false;
            btnAdd.Enabled = true;
        }



        private void dgvSubcategory_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = true;
        }
    }
}
