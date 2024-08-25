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
    public partial class frmSubcategory : Form
    {
        private int userId { get; set; }
        public frmSubcategory(int userId)
        {
            InitializeComponent();
            this.userId = userId;
            cmbCategory.SelectedIndexChanged += cmbCategory_SelectedIndexChanged;
        }
        private void LoadCatgory()
        {
            try
            {
                
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch.Text)
                };

                
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchCategory", "Category", parameters);

                
                cmbCategory.DataSource = ds.Tables[0];
                cmbCategory.DisplayMember = "Category_Name";
                cmbCategory.ValueMember = "Category_Id";
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

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadCatgory();
        }

        private void dgvSubcategory_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //
        }

        private void frmSubcategory_Load(object sender, EventArgs e)
        {
            LoadCatgory();
        }
        private void LoadSubcategories()
        {
            try
            {
                
                int selectedCategoryId = (int)cmbCategory.SelectedValue;

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@CategoryId", selectedCategoryId)
                };

                
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("GetSubcategoriesByCategory", "Subcategories", parameters);
                dgvSubcategory.DataSource = ds.Tables[0];
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void cmbCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubcategories();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            int subcategoryId = Convert.ToInt32(dgvSubcategory.SelectedRows[0].Cells[0].Value);

            frmSubcategoryAddEdit frmAddEdit = new frmSubcategoryAddEdit(subcategoryId);
            frmAddEdit.ShowDialog();
            LoadSubcategories();
            
        }
    }
}
