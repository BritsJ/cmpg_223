using System;
using System.Data;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace CMPG223_Project
{
    public partial class frmCategoryAddEdit : Form
    {
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
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                        new SqlParameter("@Category_Id", categoryId)
                };

                // Use the DbHelper class to execute the stored procedure and get the SqlDataReader
                using (SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("GetCategoryById", parameters))
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
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
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
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Category_Name", txtName.Text),
                    new SqlParameter("@Category_Description", txtDescription.Text),
                    new SqlParameter("@Category_Code", txtCode.Text),
                    new SqlParameter("@Is_Active", chkCanceled.Checked)
                };

                // Use the DbHelper class to execute the stored procedure
                DbHelper.ExecuteStoredProcedureNonQuery("AddCategory", parameters);

                MessageBox.Show("Category added successfully.");
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }


        private void UpdateCategory()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Category_Id", categoryId),
                    new SqlParameter("@Category_Name", txtName.Text),
                    new SqlParameter("@Category_Description", txtDescription.Text),
                    new SqlParameter("@Category_Code", txtCode.Text),
                    new SqlParameter("@Is_Active", chkCanceled.Checked)
                };

                // Use the DbHelper class to execute the stored procedure
                DbHelper.ExecuteStoredProcedureNonQuery("UpdateCategory", parameters);

                MessageBox.Show("Category updated successfully.");
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void chkCanceled_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
