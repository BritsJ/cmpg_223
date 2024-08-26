using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmEquipmentAddEdit : Form
    {
        public int equipmentId {  get; set; }
        public frmEquipmentAddEdit(int equipmentId)
        {
            InitializeComponent();

            this.equipmentId = equipmentId;

            if( equipmentId != 0)
            {
                GetEquipment(equipmentId);
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (equipmentId != 0)
            {
                UpdateEquipment();
            }
            else
            {
                AddEquipment();
            }

            Close();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void GetEquipment(int equipmentId)
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Equipment_Id", equipmentId)
                };

                using (SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("GetEquipmentById", parameters))
                {
                    if (reader.Read())
                    {
                        txtCode.Text = reader["Equipment_Code"].ToString();
                        txtName.Text = reader["Name"].ToString();
                        txtDescription.Text = reader["Description"].ToString();
                        numQty.Value = (Int32)reader["Quantity"];
                        numQty.Value = (Int32)reader["Quantity_Checked_Out"];
                        chkCanceled.Checked = Convert.ToBoolean(reader["Is_Active"]);
                    }
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AddEquipment()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Equipment_Code", txtCode.Text),
                    new SqlParameter("@Name", txtName.Text),
                    new SqlParameter("@Description", txtDescription.Text),
                    new SqlParameter("@Quantity", numQty.Value),
                    new SqlParameter("@Quantity_Checked_Out", numQtyOut.Value),
                    new SqlParameter("@Is_Active", chkCanceled.Checked)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("AddEquipment", parameters);

                MessageBox.Show("Equipment added successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void UpdateEquipment()
        {
            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@Equipment_Id", equipmentId),
                    new SqlParameter("@Equipment_Code", txtCode.Text),
                    new SqlParameter("@Name", txtName.Text),
                    new SqlParameter("@Description", txtDescription.Text),
                    new SqlParameter("@Quantity", numQty.Value),
                    new SqlParameter("@Quantity_Checked_Out", numQtyOut.Value),
                    new SqlParameter("@Is_Active", chkCanceled.Checked)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("UpdateEquipment", parameters);

                MessageBox.Show("Equipment updated successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void frmEquipmentAddEdit_Load(object sender, EventArgs e)
        {

        }
    }
}
