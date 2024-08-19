using System;
using System.Windows.Forms;

namespace CMPG223_Project
{
    public partial class frmSalePopup : Form
    {
        public decimal total { get; set; }
        public decimal amount_out { get; set; }
        public decimal amount_change { get; set; }
        public frmSalePopup(decimal total)
        {
            InitializeComponent();
            this.total = total;
        }


        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void frmSalePopup_Load(object sender, EventArgs e)
        {
            this.txtTotal.Text = total.ToString();
        }

        private void btnCalc_Click(object sender, EventArgs e)
        {
            // validate that the user has entered numbers value in the text box
            if (decimal.TryParse(txtAmount.Text, out decimal amount))
            {
                //validate that the amount is greater than the total
                if (amount < total)
                {
                    MessageBox.Show("The amount entered is less than the total");
                    return;
                }

                // calculate the change
                decimal change = amount - total;
                txtChange.Text = change.ToString();

                amount_out = amount;
                amount_change = change;

            }
            else
            {
                MessageBox.Show("Please enter a valid number in the amount field");
            }
        }
    }
}
