using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmEmployeeAddEdit : Form
    {
        public int employeeID { get; set; }
        public frmEmployeeAddEdit(int employeeID)
        {
            InitializeComponent();

            this.employeeID = employeeID;

            if(employeeID != 0 )
            {
                GetEmployee(employeeID);
            }
        }

        private void GetEmployee(int EmployeeID)
        {
            try
            {
                SqlParameter[] sp = new SqlParameter[]
                {
                    new SqlParameter("@Employee_Number", EmployeeID)
                };

                using(SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("GetEmployeeById",  sp))
                {
                    if(reader.Read())
                    {
                        txtID.Text = reader["Id_Number"].ToString();
                        txtFirstName.Text = reader["First_Name"].ToString();
                        txtMiddleName.Text = reader["Middle_Name"].ToString();
                        txtLastName.Text = reader["Last_Name"].ToString();
                        dateTimePicker1.Value = (DateTime)reader["Hire_Date"];
                        txtPhoneNumber.Text = reader["Phone_Number"].ToString();
                        txtEmailAddress.Text = reader["Email_Address"].ToString();
                        txtPhysicalAdress.Text = reader["Physical_Address"].ToString();
                        txtusername.Text = reader["Username"].ToString();
                        txtpassword.Text = reader["PasswordHash"].ToString();
                        chkadmin.Checked = Convert.ToBoolean(reader["IsAdmin"]);
                        chkactive.Checked = Convert.ToBoolean(reader["IsActive"]);
                    }
                }
            }
            catch(SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AddNewEmployee()
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@Id_Number", txtID.Text),
                    new SqlParameter("@First_Name", txtFirstName.Text),
                    new SqlParameter("@Middle_Name", txtMiddleName.Text),
                    new SqlParameter("@Last_Name", txtLastName.Text),
                    new SqlParameter("@Hire_Date", dateTimePicker1.Value),
                    new SqlParameter("@Phone_Number", txtPhoneNumber.Text),
                    new SqlParameter("@Email_Address", txtEmailAddress.Text),
                    new SqlParameter("@Physical_Address", txtPhysicalAdress.Text),
                    new SqlParameter("@Username", txtusername.Text),
                    new SqlParameter("@PasswordHash", txtpassword.Text),
                    new SqlParameter("@IsAdmin", chkadmin.Checked),
                    new SqlParameter("@IsActive", chkactive.Checked)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("AddEmployee", parameter);

                MessageBox.Show("Employee added successfully.");
            }
            catch(SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void UpdateEmployee()
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("Employee_Number", employeeID),
                    new SqlParameter("@Id_Number", txtID.Text),
                    new SqlParameter("@First_Name", txtFirstName.Text),
                    new SqlParameter("@Middle_Name", txtMiddleName.Text),
                    new SqlParameter("@Last_Name", txtLastName.Text),
                    new SqlParameter("@Hire_Date", dateTimePicker1.Value),
                    new SqlParameter("@Phone_Number", txtPhoneNumber.Text),
                    new SqlParameter("@Email_Address", txtEmailAddress.Text),
                    new SqlParameter("@Physical_Address", txtPhysicalAdress.Text),
                    new SqlParameter("@Username", txtusername.Text),
                    new SqlParameter("@PasswordHash", txtpassword.Text),
                    new SqlParameter("@IsAdmin", chkadmin.Checked),
                    new SqlParameter("@IsActive", chkactive.Checked)
                };

                DbHelper.ExecuteStoredProcedureNonQuery("UpdateEmployee", parameter);

                MessageBox.Show("Employee updated successfully.");
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnupdate_Click(object sender, EventArgs e)
        {
            //
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (IsValid())
            {
                if (employeeID != 0)
                {
                    UpdateEmployee();
                }
                else
                {
                    AddNewEmployee();
                }

                Close();
            }


        }

        private bool IsValid()
        {
            //Check if all fields are filled
            if (txtID.Text == "" || txtFirstName.Text == "" || txtLastName.Text == "" || txtPhoneNumber.Text == "" || txtEmailAddress.Text == "" || txtPhysicalAdress.Text == "" || txtusername.Text == "" || txtpassword.Text == "")
            {
                MessageBox.Show("Please fill in all fields.");
                return false;
            }

            //Check if ID number is numeric
            if (!int.TryParse(txtID.Text, out int id))
            {
                MessageBox.Show("ID number must be numeric.");
                return false;
            }

            //check if username is unique
            SqlParameter[] parameter = new SqlParameter[]
            {
                 new SqlParameter("Username", txtusername.Text)
            };

            if ((bool)DbHelper.ExecuteStoredProcedureScalar("CheckUsername", parameter))
            {
                MessageBox.Show("Username already exists.");
                return false;
            }

            //validate email address
            if (!txtEmailAddress.Text.Contains("@") || !txtEmailAddress.Text.Contains("."))
            {
                MessageBox.Show("Invalid email address.");
                return false;
            }

            return true;
        }

        private void btnclose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void chkadmin_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
