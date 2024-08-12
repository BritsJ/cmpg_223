using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmMain : Form
    {
        private DatabaseHelper dbHelper = new DatabaseHelper();

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

        private bool IsUserAdmin()
        {
            string qry = @"SELECT IsAdmin FROM [dbo].[SYSTEM_USER] WHERE UserId = @UserId";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@UserId", userId)
            };

            using (SqlConnection conn = dbHelper.GetConnection())
            {
                conn.Open();
                SqlCommand command = new SqlCommand(qry, conn);
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters);
                }

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return Convert.ToBoolean(reader["IsAdmin"]);
                    }
                    return false;
                }
            }

            

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

            string qry = @"SELECT IsActive, UserId, IsAdmin
                   FROM [dbo].[SYSTEM_USER]
                   WHERE Username = @Username 
                   AND PasswordHash = @Password
                   AND IsActive = 1";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Username", userName),
                new SqlParameter("@Password", password)
            };

            using (SqlConnection conn = dbHelper.GetConnection())
            {
                conn.Open();
                SqlCommand command = new SqlCommand(qry, conn);
                if (parameters != null)
                {
                    command.Parameters.AddRange(parameters);
                }

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        isUserAdmin = Convert.ToBoolean(reader["IsAdmin"]);
                        userId = Convert.ToInt32(reader["UserId"]);

                        MessageBox.Show("Login Successful");
                        return true;
                    }
                    else
                    {
                        MessageBox.Show("Login Failed");
                        return false;
                    }
                }
            } 
        }

        private void LoadSettings()
        {
            IsUserAdmin();

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
    }
}
