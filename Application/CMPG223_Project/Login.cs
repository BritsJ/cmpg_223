using System;
using System.Windows.Forms;

/*
 * Login page of the application.
 * You can login using username "admin" and password "admin"
 */

namespace CMPG223_Project
{
    public partial class Login : Form
    {
        public string Username { get; set; }
        public string Password { get; set; }


        public Login()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            Username = txtUsername.Text;
            Password = txtPassword.Text;
            this.Close();

        }

        private void Login_Load(object sender, EventArgs e)
        {

        }
    }
}
