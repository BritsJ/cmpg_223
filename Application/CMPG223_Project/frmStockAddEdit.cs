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
using static System.Runtime.CompilerServices.RuntimeHelpers;
using System.Xml.Linq;

namespace CMPG223_Project
{
    public partial class frmStockAddEdit : Form
    {
        public int stockID {  get; set; }
        public frmStockAddEdit(int stockID)
        {
            InitializeComponent();
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
                        txtPurchase.Text = reader["Purchase_Price"].ToString();
                        txtSelling.Text = reader["Selling_Price"].ToString();
                        txtQuantity.Text = reader["Quantity"].ToString();
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
                    new SqlParameter("@Purchase_Price", txtPurchase.Text),
                    new SqlParameter("@Selling_Price", txtSelling.Text),
                    new SqlParameter("@Quantity", txtQuantity.Text)
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
                    new SqlParameter("@Purchase_Price", txtPurchase.Text),
                    new SqlParameter("@Selling_Price", txtSelling.Text),
                    new SqlParameter("@Quantity", txtQuantity.Text)
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
    }
}
