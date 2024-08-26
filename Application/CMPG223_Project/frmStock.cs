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
    public partial class frmStock : Form
    {
        public frmStock()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            frmStockAddEdit frm = new frmStockAddEdit(0);
            frm.ShowDialog();
            LoadStock();
            btnEdit.Enabled = false;
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int stock_Id = Convert.ToInt32(dgvStock.SelectedRows[0].Cells[0].Value);

            frmStockAddEdit frm = new frmStockAddEdit(stock_Id);
            frm.ShowDialog();
            LoadStock();
            btnEdit.Enabled = false;
            btnAdd.Enabled = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void LoadStock()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtSearch.Text)
                };

                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchStocks", "Stock", parameters);

                dgvStock.DataSource = ds;
                dgvStock.DataMember = "Stock";
            }
            catch (SqlException sqlException)
            {
                MessageBox.Show(sqlException.Message);
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadStock();
        }

        private void frmStock_Load(object sender, EventArgs e)
        {
            btnEdit.Enabled = false;
            LoadStock();
        }

        private void dgvStock_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = true; 
        }
    }
}
