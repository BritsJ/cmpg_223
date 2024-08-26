using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmMain : Form
    {

        public int userId { get; set; }
        public bool isUserAdmin { get; set; }

        public frmMain()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            LoadSettings();
        }

        private void loginToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Login frmAccountM = new Login();
            frmAccountM.ShowDialog();
            string Username = frmAccountM.Username;
            string Password = frmAccountM.Password;
            bool loggedIn = UserLogin(Username, Password);
            if (loggedIn)
            {
                LoadSettings();
            }
        }

        private bool UserLogin(string userName, string password)
        {
            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
            {
                return false;
            }

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Username", userName),
                new SqlParameter("@PasswordHash", password)
            };

            try
            {
                using (SqlDataReader reader = DbHelper.ExecuteStoredProcedureReader("AuthenticateUser", parameters))
                {
                    if (reader.Read())
                    {
                        bool isActive = Convert.ToBoolean(reader["IsActive"]);
                        if (isActive)
                        {
                            isUserAdmin = Convert.ToBoolean(reader["IsAdmin"]);
                            userId = Convert.ToInt32(reader["UserId"]);

                            MessageBox.Show("Login Successful");
                            return true;
                        }
                    }

                    MessageBox.Show("Login Failed");
                    return false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return false;
            }
        }


        private void LoadSettings()
        {


            //check if user is loged in and is admin
            if (userId != 0)
            {
                //enable premium features
                maintainanceToolStripMenuItem.Enabled = true;
                servicesToolStripMenuItem.Visible = true;
                if (isUserAdmin)
                {
                    administratorToolStripMenuItem.Enabled = true;
                }
                else
                {
                    administratorToolStripMenuItem.Enabled = false;
                }

            }
            else
            {
                //disable premium features
                maintainanceToolStripMenuItem.Enabled = false;
                servicesToolStripMenuItem.Visible = false;
                administratorToolStripMenuItem.Enabled = false;
            }
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void categoryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmCategory frmUpcomingEvents = new frmCategory(userId);
            frmUpcomingEvents.MdiParent = this;
            frmUpcomingEvents.Show();
        }

        private void employeesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmEmployee frmEmployee = new frmEmployee();
            frmEmployee.MdiParent = this;
            frmEmployee.Show();
        }

        private void stockReportToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmReport rptStock = new frmReport();
            rptStock.MdiParent = this;
            rptStock.Show();
        }

        private void equipmentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmEquipment frmEquipment = new frmEquipment();
            frmEquipment.MdiParent = this;
            frmEquipment.Show();
        }

        private void stockToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStock frmStock = new frmStock();
            frmStock.MdiParent = this;
            frmStock.Show();
        }

        private void salesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSales frmSales = new frmSales(userId);
            frmSales.MdiParent = this;
            frmSales.Show();
        }

        private void reportsToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmReport frmReport = new frmReport();
            frmReport.MdiParent = this;
            frmReport.Show();
        }
        
        private void clientsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmClients frmClients = new frmClients();
            frmClients.MdiParent = this;
            frmClients.Show();
        }

        private void jobsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmJob frmJob = new frmJob();
            frmJob.MdiParent = this;
            frmJob.Show();
        }

        private void subcategoryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmSubcategory frmSubcategory = new frmSubcategory();
            frmSubcategory.MdiParent = this;
            frmSubcategory.Show();
        }
    }
}
