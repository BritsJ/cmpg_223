using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

                using(SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("GetEmployeeByNumber",  sp))
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
                    new SqlParameter("@Physical_Address", txtPhysicalAdress.Text)
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
                    new SqlParameter("@Id_Number", txtID.Text),
                    new SqlParameter("@First_Name", txtFirstName.Text),
                    new SqlParameter("@Middle_Name", txtMiddleName.Text),
                    new SqlParameter("@Last_Name", txtLastName.Text),
                    new SqlParameter("@Hire_Date", dateTimePicker1.Value),
                    new SqlParameter("@Phone_Number", txtPhoneNumber.Text),
                    new SqlParameter("@Email_Address", txtEmailAddress.Text),
                    new SqlParameter("@Physical_Address", txtPhysicalAdress.Text)
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
}
