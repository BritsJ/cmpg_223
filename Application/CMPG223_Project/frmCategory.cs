using System;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmCategory : Form
    {
        private int userId { get; set; }
        public frmCategory(int userId)
        {
            InitializeComponent();
            this.userId = userId;
        }

        private void btnAddEvent_Click(object sender, EventArgs e)
        {
            frmCategoryAddEdit addEvent = new frmCategoryAddEdit(0);
            addEvent.ShowDialog();
            LoadCategories();
            btnEditCategory.Enabled = false;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void frmCategory_Load(object sender, EventArgs e)
        {
            LoadCategories();
            btnEditCategory.Enabled = false;
        }

        private void LoadCategories()
        {
            DataGridViewHelper.LoadDataGrid(dgvMyCategories, txtSearch.Text, "SearchCategories", "Categories");
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadCategories();
        }

        private void dgvMyCategories_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEditCategory.Enabled = true;
        }

        private void btnEditCategory_Click(object sender, EventArgs e)
        {
            int categoryId = Convert.ToInt32(dgvMyCategories.SelectedRows[0].Cells[0].Value);

            frmCategoryAddEdit addEvent = new frmCategoryAddEdit(categoryId);
            addEvent.ShowDialog();
            LoadCategories();
            btnEditCategory.Enabled = false;
            btnAddCategory.Enabled = true;
        }
    }
}
