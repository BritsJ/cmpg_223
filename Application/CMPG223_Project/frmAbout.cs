using System;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmAbout : Form
    {
        public frmAbout()
        {
            InitializeComponent();
        }

        private void frmAbout_Load(object sender, EventArgs e)
        {
            txtAbout.Text = @"Version: 1.0.2 (user setup)
                            Commit: fee1edb8d6d72a0ddff41e5f71a671c23ed924b9
                            Date: 2024-08-14T17:29:30.058Z
                            OS: Windows_NT x64 10.0.22635";
        }
    }
}
