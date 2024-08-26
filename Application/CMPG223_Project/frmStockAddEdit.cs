using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmStockAddEdit : Form
    {
        public int stockID {  get; set; }
        public frmStockAddEdit(int stockID)
        {
            InitializeComponent();
            LoadSubcategories();
            this.stockID = stockID;

            if(stockID != 0)
            {
                GetStock(stockID);
            }
        }

        private void GetStock(int stockID)
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Stock_Id", stockID)
                };

                using (SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("GetStockById", parameters))
                {
                    if (reader.Read())
                    {
                        txtCode.Text = reader["Stock_Code"].ToString();
                        txtName.Text = reader["Stock_Name"].ToString();
                        txtDescription.Text = reader["Stock_Description"].ToString();
                        purchaseDatePicker.Value = (DateTime)reader["Purchase_Date"];
                        numPPrice.Value = (Decimal)reader["Purchase_Price"];
                        NumSPrice.Value = (Decimal)reader["Selling_Price"];
                        numQty.Value = (Int32)reader["Quantity"];
                        cmbSubcategory.SelectedValue = (Int32)reader["Subcategory_Id"];
                    }
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AddStock()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Stock_Code", txtCode.Text),
                    new SqlParameter("@Stock_Name", txtName.Text),
                    new SqlParameter("@Stock_Description", txtDescription.Text),
                    new SqlParameter("@Purchase_Date", purchaseDatePicker.Value),
                    new SqlParameter("@Purchase_Price",  numPPrice.Value),
                    new SqlParameter("@Selling_Price", NumSPrice.Value),
                    new SqlParameter("@Quantity", numQty.Value),
                    new SqlParameter("@Subcategory_Id", cmbSubcategory.SelectedValue)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("AddStock", parameters);

                MessageBox.Show("Stock added successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void UpdateStock()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("Stock_Id", stockID),
                    new SqlParameter("@Stock_Code", txtCode.Text),
                    new SqlParameter("@Stock_Name", txtName.Text),
                    new SqlParameter("@Stock_Description", txtDescription.Text),
                    new SqlParameter("@Purchase_Date", purchaseDatePicker.Value),
                    new SqlParameter("@Purchase_Price",  numPPrice.Value),
                    new SqlParameter("@Selling_Price", NumSPrice.Value),
                    new SqlParameter("@Quantity", numQty.Value),
                    new SqlParameter("@Subcategory_Id", cmbSubcategory.SelectedValue)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("UpdateStock", parameters);

                MessageBox.Show("Stock updated successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (stockID != 0)
            {
                UpdateStock();
            }
            else
            {
                AddStock();
            }

            Close();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void cmbSubcategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void frmStockAddEdit_Load(object sender, EventArgs e)
        {
            
        }

        private void LoadSubcategories()
        {
            try
            {
                // Define the parameters for the stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", "")
                };

                // Use the DbHelper class to execute the stored procedure and get the DataSet
                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchSubcategories", "subcategories", parameters);

                // Bind the DataSet to the combo box
                cmbSubcategory.DataSource = ds.Tables[0];
                cmbSubcategory.DisplayMember = "Subcategory_Code";
                cmbSubcategory.ValueMember = "Subcategory_Id";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }
    }
}
