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
    public partial class frmEquipment : Form
    {
        public frmEquipment()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            frmEquipmentAddEdit frm = new frmEquipmentAddEdit(0);
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int equipmentId = Convert.ToInt32(dgvEquipment.SelectedRows[0].Cells[0].Value);

            frmEquipmentAddEdit frm = new frmEquipmentAddEdit(equipmentId);
            frm.ShowDialog();

            btnEdit.Enabled = false;
            btnAdd.Enabled = true;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void LoadEquipment()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SearchTerm", txtsearch.Text)
                };

                DataSet ds = DbHelper.ExecuteStoredProcedureDataSet("SearchEquipment", "Equipment", parameters);

                dgvEquipment.DataSource = ds;
                dgvEquipment.DataMember = "Equipment";
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void frmEquipment_Load(object sender, EventArgs e)
        {
            LoadEquipment();
            btnAdd.Enabled = false;
        }

        private void txtsearch_TextChanged(object sender, EventArgs e)
        {
            LoadEquipment();
        }

        private void dgvEquipment_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = true;
        }
    }
}
