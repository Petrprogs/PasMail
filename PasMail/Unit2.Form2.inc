procedure InitializeComponent;
    begin
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form2));
        self.OK := new System.Windows.Forms.Button();
        self.tabControl1 := new System.Windows.Forms.TabControl();
        self.tabPage1 := new System.Windows.Forms.TabPage();
        self.textBox4 := new System.Windows.Forms.TextBox();
        self.label4 := new System.Windows.Forms.Label();
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.label2 := new System.Windows.Forms.Label();
        self.button1 := new System.Windows.Forms.Button();
        self.label1 := new System.Windows.Forms.Label();
        self.textBox2 := new System.Windows.Forms.TextBox();
        self.tabPage2 := new System.Windows.Forms.TabPage();
        self.label3 := new System.Windows.Forms.Label();
        self.textBox3 := new System.Windows.Forms.TextBox();
        self.button2 := new System.Windows.Forms.Button();
        self.checkBox1 := new System.Windows.Forms.CheckBox();
        self.tabControl1.SuspendLayout();
        self.tabPage1.SuspendLayout();
        self.tabPage2.SuspendLayout();
        self.SuspendLayout();
        // 
        // OK
        // 
        self.OK.DialogResult := System.Windows.Forms.DialogResult.Cancel;
        self.OK.Location := new System.Drawing.Point(322, 152);
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
        self.tabControl1.Size := new System.Drawing.Size(406, 146);
        self.tabControl1.TabIndex := 7;
        // 
        // tabPage1
        // 
        self.tabPage1.Controls.Add(self.textBox4);
        self.tabPage1.Controls.Add(self.label4);
        self.tabPage1.Controls.Add(self.textBox1);
        self.tabPage1.Controls.Add(self.label2);
        self.tabPage1.Controls.Add(self.button1);
        self.tabPage1.Controls.Add(self.label1);
        self.tabPage1.Controls.Add(self.textBox2);
        self.tabPage1.Location := new System.Drawing.Point(4, 22);
        self.tabPage1.Name := 'tabPage1';
        self.tabPage1.Padding := new System.Windows.Forms.Padding(3);
        self.tabPage1.Size := new System.Drawing.Size(398, 120);
        self.tabPage1.TabIndex := 0;
        self.tabPage1.Text := 'Credentials';
        self.tabPage1.UseVisualStyleBackColor := true;
        // 
        // textBox4
        // 
        self.textBox4.Location := new System.Drawing.Point(116, 72);
        self.textBox4.Name := 'textBox4';
        self.textBox4.Size := new System.Drawing.Size(184, 20);
        self.textBox4.TabIndex := 8;
        // 
        // label4
        // 
        self.label4.Location := new System.Drawing.Point(19, 70);
        self.label4.Name := 'label4';
        self.label4.Size := new System.Drawing.Size(91, 23);
        self.label4.TabIndex := 7;
        self.label4.Text := 'IMAP Server';
        self.label4.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
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
        // 
        // tabPage2
        // 
        self.tabPage2.Controls.Add(self.checkBox1);
        self.tabPage2.Controls.Add(self.label3);
        self.tabPage2.Controls.Add(self.textBox3);
        self.tabPage2.Location := new System.Drawing.Point(4, 22);
        self.tabPage2.Name := 'tabPage2';
        self.tabPage2.Padding := new System.Windows.Forms.Padding(3);
        self.tabPage2.Size := new System.Drawing.Size(398, 120);
        self.tabPage2.TabIndex := 1;
        self.tabPage2.Text := 'Main';
        self.tabPage2.UseVisualStyleBackColor := true;
        // 
        // label3
        // 
        self.label3.Location := new System.Drawing.Point(7, 6);
        self.label3.Name := 'label3';
        self.label3.Size := new System.Drawing.Size(141, 20);
        self.label3.TabIndex := 1;
        self.label3.Text := 'Период обновления (мс)';
        self.label3.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        // 
        // textBox3
        // 
        self.textBox3.Location := new System.Drawing.Point(154, 6);
        self.textBox3.Name := 'textBox3';
        self.textBox3.Size := new System.Drawing.Size(118, 20);
        self.textBox3.TabIndex := 0;
        self.textBox3.Text := '60000';
        // 
        // button2
        // 
        self.button2.DialogResult := System.Windows.Forms.DialogResult.Cancel;
        self.button2.Location := new System.Drawing.Point(241, 152);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(75, 23);
        self.button2.TabIndex := 8;
        self.button2.Text := 'Cancel';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Click += button2_Click;
        // 
        // checkBox1
        // 
        self.checkBox1.Location := new System.Drawing.Point(7, 29);
        self.checkBox1.Name := 'checkBox1';
        self.checkBox1.Size := new System.Drawing.Size(194, 24);
        self.checkBox1.TabIndex := 2;
        self.checkBox1.Text := 'Безвозвратное удаление писем';
        self.checkBox1.UseVisualStyleBackColor := true;
        self.checkBox1.CheckedChanged += checkBox1_CheckedChanged;
        // 
        // Form2
        // 
        self.AcceptButton := self.OK;
        self.AutoScaleMode := System.Windows.Forms.AutoScaleMode.Inherit;
        self.AutoValidate := System.Windows.Forms.AutoValidate.EnablePreventFocusChange;
        self.CancelButton := self.button2;
        self.ClientSize := new System.Drawing.Size(409, 187);
        self.ControlBox := false;
        self.Controls.Add(self.button2);
        self.Controls.Add(self.tabControl1);
        self.Controls.Add(self.OK);
        self.Cursor := System.Windows.Forms.Cursors.Default;
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.FixedToolWindow;
        self.MaximizeBox := false;
        self.MinimizeBox := false;
        self.Name := 'Form2';
        self.ShowIcon := false;
        self.ShowInTaskbar := false;
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Text := 'Settings(Настройки)';
        self.TopMost := true;
        self.Load += Form2_Load;
        self.tabControl1.ResumeLayout(false);
        self.tabPage1.ResumeLayout(false);
        self.tabPage1.PerformLayout();
        self.tabPage2.ResumeLayout(false);
        self.tabPage2.PerformLayout();
        self.ResumeLayout(false);
    end;
