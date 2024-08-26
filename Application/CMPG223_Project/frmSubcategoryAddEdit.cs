using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
namespace CMPG223_Project
{
    public partial class frmSubcategoryAddEdit : Form
    {
        public int subcategoryId { get; set; }
        public frmSubcategoryAddEdit(int subcategoryId)
        {
            
            InitializeComponent();
            LoadCategories();
            this.subcategoryId = subcategoryId;


            if (subcategoryId != 0)
            {
                getSubcategory(subcategoryId);
            }
        }

        private void getSubcategory(int subcategoryId)
        {
            try
            {
                
                SqlParameter[] parameters = new SqlParameter[]
                {
                        new SqlParameter("@Subcategory_Id", subcategoryId)
                };

                
                using (SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("GetSubcategoryById", parameters))
                {
                    if (reader.Read())
                    {
                        txtName.Text = reader["Subcategory_Name"].ToString();
                        txtDescription.Text = reader["Subcategory_Description"].ToString();
                        txtCode.Text = reader["Subcategory_Code"].ToString();
                        chkIsActive.Checked = Convert.ToBoolean(reader["Is_Active"]);

                        cmbCategory.SelectedValue = reader["Category_Id"].ToString();
                    }
                }
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void LoadCategories()
        {
            try
            {

                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", "")
                };

                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchCategories", "Category", parameters);

                
                cmbCategory.DataSource = ds.Tables[0];
                cmbCategory.DisplayMember = "Category_Name";
                cmbCategory.ValueMember = "Category_Id";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }
        private void AddNewSubcategory()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                  new SqlParameter("@Subcategory_Id", subcategoryId),
                  new SqlParameter("@Subcategory_Name", txtName.Text),
                  new SqlParameter("@Subcategory_Description", txtDescription.Text),
                  new SqlParameter("@Subcategory_Code", txtCode.Text),
                  new SqlParameter("@Is_Active", chkIsActive.Checked),
                  new SqlParameter("@Category_Id", cmbCategory.SelectedValue)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("AddSubcategory", parameters);

                MessageBox.Show("Subcategory saved successfully.");
               
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }
        private void UpdateSubCategory()
        {
            try
            {
                
                SqlParameter[] parameters = new SqlParameter[]
                {
                  new SqlParameter("@Subcategory_Id", subcategoryId),
                  new SqlParameter("@Subcategory_Name", txtName.Text),
                  new SqlParameter("@Subcategory_Description", txtDescription.Text),
                  new SqlParameter("@Subcategory_Code", txtCode.Text),
                  new SqlParameter("@Is_Active", chkIsActive.Checked),
                  new SqlParameter("@Category_Id", cmbCategory.SelectedValue)
                };

                
                DbHelper.ExecuteStoredProcedureNonQuery("UpdateSubcategory", parameters);

                MessageBox.Show("Subcategory updated successfully.");
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }

        }
        private void frmSubcategoryAddEdit_Load(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (subcategoryId != 0)
            {
                UpdateSubCategory();
            }
            else
            {
                AddNewSubcategory();
            }

            Close();
        }
    }
}
