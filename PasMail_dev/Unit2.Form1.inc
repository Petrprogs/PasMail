procedure InitializeComponent;
    begin
        self.textBox1 := new System.Windows.Forms.TextBox();
        self.label1 := new System.Windows.Forms.Label();
        self.label2 := new System.Windows.Forms.Label();
        self.textBox2 := new System.Windows.Forms.TextBox();
        self.button1 := new System.Windows.Forms.Button();
        self.SuspendLayout();
        // 
        // textBox1
        // 
        self.textBox1.Location := new System.Drawing.Point(109, 12);
        self.textBox1.Name := 'textBox1';
        self.textBox1.Size := new System.Drawing.Size(202, 20);
        self.textBox1.TabIndex := 0;
        // 
        // label1
        // 
        self.label1.Location := new System.Drawing.Point(12, 12);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(91, 20);
        self.label1.TabIndex := 1;
        self.label1.Text := 'E-mail address';
        self.label1.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label2
        // 
        self.label2.Location := new System.Drawing.Point(12, 57);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(91, 20);
        self.label2.TabIndex := 2;
        self.label2.Text := 'Пароль';
        self.label2.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // textBox2
        // 
        self.textBox2.Location := new System.Drawing.Point(109, 57);
        self.textBox2.Name := 'textBox2';
        self.textBox2.Size := new System.Drawing.Size(185, 20);
        self.textBox2.TabIndex := 3;
        self.textBox2.UseSystemPasswordChar := true;
        self.textBox2.TextChanged += textBox2_TextChanged;
        // 
        // button1
        // 
        self.button1.Location := new System.Drawing.Point(300, 57);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(21, 20);
        self.button1.TabIndex := 4;
        self.button1.Text := 'V';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        self.button1.KeyDown += button1_KeyDown;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(323, 262);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.textBox2);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.textBox1);
        self.Name := 'Form1';
        self.Text := 'Settings(Настройки)';
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
