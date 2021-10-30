procedure InitializeComponent;
    begin
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form2));
        self.OK := new System.Windows.Forms.Button();
        self.tabControl1 := new System.Windows.Forms.TabControl();
        self.tabPage1 := new System.Windows.Forms.TabPage();
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.label2 := new System.Windows.Forms.Label();
        self.button1 := new System.Windows.Forms.Button();
        self.label1 := new System.Windows.Forms.Label();
        self.textBox2 := new System.Windows.Forms.TextBox();
        self.tabPage2 := new System.Windows.Forms.TabPage();
        self.checkBox1 := new System.Windows.Forms.CheckBox();
        self.tabControl1.SuspendLayout();
        self.tabPage1.SuspendLayout();
        self.tabPage2.SuspendLayout();
        self.SuspendLayout();
        // 
        // OK
        // 
        self.OK.Location := new System.Drawing.Point(323, 114);
        self.OK.Name := 'OK';
        self.OK.Size := new System.Drawing.Size(75, 23);
        self.OK.TabIndex := 5;
        self.OK.Text := 'OK';
        self.OK.UseVisualStyleBackColor := true;
        self.OK.Click += OK_Click;
        // 
        // tabControl1
        // 
        self.tabControl1.Controls.Add(self.tabPage1);
        self.tabControl1.Controls.Add(self.tabPage2);
        self.tabControl1.Location := new System.Drawing.Point(2, 0);
        self.tabControl1.Name := 'tabControl1';
        self.tabControl1.SelectedIndex := 0;
        self.tabControl1.Size := new System.Drawing.Size(406, 108);
        self.tabControl1.TabIndex := 7;
        // 
        // tabPage1
        // 
        self.tabPage1.Controls.Add(self.textBox1);
        self.tabPage1.Controls.Add(self.label2);
        self.tabPage1.Controls.Add(self.button1);
        self.tabPage1.Controls.Add(self.label1);
        self.tabPage1.Controls.Add(self.textBox2);
        self.tabPage1.Location := new System.Drawing.Point(4, 22);
        self.tabPage1.Name := 'tabPage1';
        self.tabPage1.Padding := new System.Windows.Forms.Padding(3);
        self.tabPage1.Size := new System.Drawing.Size(398, 82);
        self.tabPage1.TabIndex := 0;
        self.tabPage1.Text := 'Credentials';
        self.tabPage1.UseVisualStyleBackColor := true;
        // 
        // textBox1
        // 
        self.textBox1.Location := new System.Drawing.Point(116, 6);
        self.textBox1.Name := 'textBox1';
        self.textBox1.Size := new System.Drawing.Size(184, 20);
        self.textBox1.TabIndex := 6;
        self.textBox1.TextChanged += textBox1_TextChanged;
        // 
        // label2
        // 
        self.label2.Location := new System.Drawing.Point(19, 38);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(91, 20);
        self.label2.TabIndex := 2;
        self.label2.Text := 'Password';
        self.label2.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // button1
        // 
        self.button1.Image := (System.Drawing.Image(resources.GetObject('button1.Image')));
        self.button1.Location := new System.Drawing.Point(307, 38);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(31, 20);
        self.button1.TabIndex := 4;
        self.button1.UseVisualStyleBackColor := true;
        self.button1.MouseDown += button1_MouseDown;
        self.button1.MouseEnter += button1_MouseEnter;
        self.button1.MouseLeave += button1_MouseLeave;
        // 
        // label1
        // 
        self.label1.Location := new System.Drawing.Point(19, 6);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(91, 20);
        self.label1.TabIndex := 1;
        self.label1.Text := 'Email ';
        self.label1.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // textBox2
        // 
        self.textBox2.Location := new System.Drawing.Point(116, 38);
        self.textBox2.Name := 'textBox2';
        self.textBox2.Size := new System.Drawing.Size(185, 20);
        self.textBox2.TabIndex := 3;
        self.textBox2.UseSystemPasswordChar := true;
        self.textBox2.TextChanged += textBox2_TextChanged;
        // 
        // tabPage2
        // 
        self.tabPage2.Controls.Add(self.checkBox1);
        self.tabPage2.Location := new System.Drawing.Point(4, 22);
        self.tabPage2.Name := 'tabPage2';
        self.tabPage2.Padding := new System.Windows.Forms.Padding(3);
        self.tabPage2.Size := new System.Drawing.Size(398, 82);
        self.tabPage2.TabIndex := 1;
        self.tabPage2.Text := 'Main';
        self.tabPage2.UseVisualStyleBackColor := true;
        // 
        // checkBox1
        // 
        self.checkBox1.Location := new System.Drawing.Point(6, 7);
        self.checkBox1.Name := 'checkBox1';
        self.checkBox1.Size := new System.Drawing.Size(105, 24);
        self.checkBox1.TabIndex := 0;
        self.checkBox1.Text := 'Close to tray';
        self.checkBox1.UseVisualStyleBackColor := true;
        self.checkBox1.CheckedChanged += checkBox1_CheckedChanged;
        // 
        // Form2
        // 
        self.ClientSize := new System.Drawing.Size(409, 144);
        self.Controls.Add(self.tabControl1);
        self.Controls.Add(self.OK);
        self.Name := 'Form2';
        self.Text := 'Settings(Настройки)';
        self.Load += Form2_Load;
        self.tabControl1.ResumeLayout(false);
        self.tabPage1.ResumeLayout(false);
        self.tabPage1.PerformLayout();
        self.tabPage2.ResumeLayout(false);
        self.ResumeLayout(false);
    end;
