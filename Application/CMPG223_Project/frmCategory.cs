using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmCategory : Form
    {
        private int userId { get; set; }
        private DatabaseHelper dbHelper = new DatabaseHelper();
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
            try
            {
                using (SqlConnection conn = dbHelper.GetConnection())
                {
                    conn.Open();

                    // Assume you've created a stored procedure called 'SearchEvents'
                    using (SqlCommand cmd = new SqlCommand("SearchCategories", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SearchTerm", txtSearch.Text);

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        adapter.Fill(ds, "Categories");

                        dgvMyCategories.DataSource = ds;
                        dgvMyCategories.DataMember = "Categories";
                    }
                }
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
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
