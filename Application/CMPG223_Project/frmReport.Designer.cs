namespace CMPG223_Project
{
    partial class frmReport
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmReport));
            this.label1 = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnReport = new System.Windows.Forms.Button();
            this.cbSort = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rbJobs = new System.Windows.Forms.RadioButton();
            this.rbSales = new System.Windows.Forms.RadioButton();
            this.rbStock = new System.Windows.Forms.RadioButton();
            this.rbEmployees = new System.Windows.Forms.RadioButton();
            this.rbClients = new System.Windows.Forms.RadioButton();
            this.btnClose = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(186, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(87, 20);
            this.label1.TabIndex = 5;
            this.label1.Text = "Search for:";
            // 
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.txtSearch.Location = new System.Drawing.Point(186, 44);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(204, 23);
            this.txtSearch.TabIndex = 4;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 205);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(674, 270);
            this.dataGridView1.TabIndex = 3;
            // 
            // btnReport
            // 
            this.btnReport.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnReport.Location = new System.Drawing.Point(12, 168);
            this.btnReport.Name = "btnReport";
            this.btnReport.Size = new System.Drawing.Size(134, 31);
            this.btnReport.TabIndex = 6;
            this.btnReport.Text = "Generate Report";
            this.btnReport.UseVisualStyleBackColor = true;
            this.btnReport.Click += new System.EventHandler(this.btnReport_Click);
            // 
            // cbSort
            // 
            this.cbSort.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.cbSort.FormattingEnabled = true;
            this.cbSort.Items.AddRange(new object[] {
            "Alphabetically",
            "By ID",
            "Quantity(Ascending)",
            "Quantity(Descending)"});
            this.cbSort.Location = new System.Drawing.Point(186, 106);
            this.cbSort.Name = "cbSort";
            this.cbSort.Size = new System.Drawing.Size(204, 24);
            this.cbSort.TabIndex = 7;
            this.cbSort.SelectedIndexChanged += new System.EventHandler(this.cbSort_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(186, 85);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 20);
            this.label2.TabIndex = 8;
            this.label2.Text = "Sort by:";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbJobs);
            this.groupBox1.Controls.Add(this.rbSales);
            this.groupBox1.Controls.Add(this.rbStock);
            this.groupBox1.Controls.Add(this.rbEmployees);
            this.groupBox1.Controls.Add(this.rbClients);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(168, 150);
            this.groupBox1.TabIndex = 9;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Show all:";
            // 
            // rbJobs
            // 
            this.rbJobs.AutoSize = true;
            this.rbJobs.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.rbJobs.Location = new System.Drawing.Point(6, 119);
            this.rbJobs.Name = "rbJobs";
            this.rbJobs.Size = new System.Drawing.Size(61, 24);
            this.rbJobs.TabIndex = 14;
            this.rbJobs.TabStop = true;
            this.rbJobs.Text = "Jobs";
            this.rbJobs.UseVisualStyleBackColor = true;
            this.rbJobs.CheckedChanged += new System.EventHandler(this.radioButton_CheckedChanged);
            // 
            // rbSales
            // 
            this.rbSales.AutoSize = true;
            this.rbSales.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.rbSales.Location = new System.Drawing.Point(6, 94);
            this.rbSales.Name = "rbSales";
            this.rbSales.Size = new System.Drawing.Size(67, 24);
            this.rbSales.TabIndex = 13;
            this.rbSales.TabStop = true;
            this.rbSales.Text = "Sales";
            this.rbSales.UseVisualStyleBackColor = true;
            this.rbSales.CheckedChanged += new System.EventHandler(this.radioButton_CheckedChanged);
            // 
            // rbStock
            // 
            this.rbStock.AutoSize = true;
            this.rbStock.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.rbStock.Location = new System.Drawing.Point(6, 69);
            this.rbStock.Name = "rbStock";
            this.rbStock.Size = new System.Drawing.Size(68, 24);
            this.rbStock.TabIndex = 12;
            this.rbStock.TabStop = true;
            this.rbStock.Text = "Stock";
            this.rbStock.UseVisualStyleBackColor = true;
            this.rbStock.CheckedChanged += new System.EventHandler(this.radioButton_CheckedChanged);
            // 
            // rbEmployees
            // 
            this.rbEmployees.AutoSize = true;
            this.rbEmployees.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.rbEmployees.Location = new System.Drawing.Point(6, 44);
            this.rbEmployees.Name = "rbEmployees";
            this.rbEmployees.Size = new System.Drawing.Size(105, 24);
            this.rbEmployees.TabIndex = 11;
            this.rbEmployees.TabStop = true;
            this.rbEmployees.Text = "Employees";
            this.rbEmployees.UseVisualStyleBackColor = true;
            this.rbEmployees.CheckedChanged += new System.EventHandler(this.radioButton_CheckedChanged);
            // 
            // rbClients
            // 
            this.rbClients.AutoSize = true;
            this.rbClients.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.rbClients.Location = new System.Drawing.Point(6, 19);
            this.rbClients.Name = "rbClients";
            this.rbClients.Size = new System.Drawing.Size(75, 24);
            this.rbClients.TabIndex = 10;
            this.rbClients.TabStop = true;
            this.rbClients.Text = "Clients";
            this.rbClients.UseVisualStyleBackColor = true;
            this.rbClients.CheckedChanged += new System.EventHandler(this.radioButton_CheckedChanged);
            // 
            // btnClose
            // 
            this.btnClose.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnClose.Location = new System.Drawing.Point(552, 481);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(134, 31);
            this.btnClose.TabIndex = 9;
            this.btnClose.Text = "Close";
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // frmReport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(712, 526);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cbSort);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.btnReport);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmReport";
            this.Text = "Stock Report";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnReport;
        private System.Windows.Forms.ComboBox cbSort;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.RadioButton rbJobs;
        private System.Windows.Forms.RadioButton rbSales;
        private System.Windows.Forms.RadioButton rbStock;
        private System.Windows.Forms.RadioButton rbEmployees;
        private System.Windows.Forms.RadioButton rbClients;
    }
}