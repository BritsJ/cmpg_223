using System;
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
            frm.ShowDialog();
            LoadEquipment();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            int equipmentId = Convert.ToInt32(dgvEquipment.SelectedRows[0].Cells[0].Value);

            frmEquipmentAddEdit frm = new frmEquipmentAddEdit(equipmentId);
            frm.ShowDialog();
            LoadEquipment();
            btnEdit.Enabled = false;
            btnAdd.Enabled = true;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void LoadEquipment()
        {
            DataGridViewHelper.LoadDataGrid(dgvEquipment, txtsearch.Text, "SearchEquipment", "Equipment");
        }

        private void frmEquipment_Load(object sender, EventArgs e)
        {
            LoadEquipment();
            btnEdit.Enabled = false;
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
