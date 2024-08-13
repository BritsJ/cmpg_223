using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace CMPG223_Project
{
    public partial class frmCategoryAddEdit : Form
    {
        private DatabaseHelper dbHelper = new DatabaseHelper();
        public int categoryId { get; set; }
        public frmCategoryAddEdit(int categoryId)
        {
            this.categoryId = categoryId;

            InitializeComponent();

            if (categoryId != 0)
            {
                // Get the category details

                GetCategory(categoryId);
            }
        }

        

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void GetCategory(int categoryId)
        {
            // Assume you've created a stored procedure called 'GetCategory'
            using (SqlConnection conn = dbHelper.GetConnection())
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("GetCategoryById", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Category_Id", categoryId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtName.Text = reader["Category_Name"].ToString();
                            txtDescription.Text = reader["Category_Description"].ToString();
                            txtCode.Text = reader["Category_Code"].ToString();
                            chkCanceled.Checked = Convert.ToBoolean(reader["Is_Active"]);
                        }
                    }
                }
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (categoryId != 0)
            {
                UpdateCategory();
            }
            else
            {
                AddNewCategory();
            }

            Close();
        }

        private void AddNewCategory()
        {
            using (SqlConnection conn = dbHelper.GetConnection())
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("AddCategory", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Category_Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Category_Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Category_Code", txtCode.Text);
                    cmd.Parameters.AddWithValue("@Is_Active", chkCanceled.Checked);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void UpdateCategory()
        {
            using (SqlConnection conn = dbHelper.GetConnection())
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("UpdateCategory", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Category_Id", categoryId);
                    cmd.Parameters.AddWithValue("@Category_Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Category_Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Category_Code", txtCode.Text);
                    cmd.Parameters.AddWithValue("@Is_Active", chkCanceled.Checked);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
