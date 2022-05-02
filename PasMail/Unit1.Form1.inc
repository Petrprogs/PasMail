procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form1));
        self.richTextBox1 := new System.Windows.Forms.RichTextBox();
        self.label1 := new System.Windows.Forms.Label();
        self.label2 := new System.Windows.Forms.Label();
        self.label3 := new System.Windows.Forms.Label();
        self.label4 := new System.Windows.Forms.Label();
        self.label5 := new System.Windows.Forms.Label();
        self.label6 := new System.Windows.Forms.Label();
        self.statusStrip1 := new System.Windows.Forms.StatusStrip();
        self.toolStripStatusLabel1 := new System.Windows.Forms.ToolStripStatusLabel();
        self.toolStripProgressBar1 := new System.Windows.Forms.ToolStripProgressBar();
        self.tabControl1 := new System.Windows.Forms.TabControl();
        self.tabPage1 := new System.Windows.Forms.TabPage();
        self.button4 := new System.Windows.Forms.Button();
        self.button1 := new System.Windows.Forms.Button();
        self.button2 := new System.Windows.Forms.Button();
        self.button3 := new System.Windows.Forms.Button();
        self.contextMenuStrip1 := new System.Windows.Forms.ContextMenuStrip(self.components);
        self.checkedListBox1 := new System.Windows.Forms.CheckedListBox();
        self.dataView1 := new System.Data.DataView();
        self.statusStrip1.SuspendLayout();
        self.tabControl1.SuspendLayout();
        self.tabPage1.SuspendLayout();
        (System.ComponentModel.ISupportInitialize(self.dataView1)).BeginInit();
        self.SuspendLayout();
        // 
        // richTextBox1
        // 
        self.richTextBox1.Anchor := (System.Windows.Forms.AnchorStyles(((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Bottom) 
                    or System.Windows.Forms.AnchorStyles.Left)));
        self.richTextBox1.BackColor := System.Drawing.SystemColors.ControlLightLight;
        self.richTextBox1.Font := new System.Drawing.Font('Microsoft Sans Serif', 10, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.richTextBox1.Location := new System.Drawing.Point(332, 152);
        self.richTextBox1.Name := 'richTextBox1';
        self.richTextBox1.ReadOnly := true;
        self.richTextBox1.Size := new System.Drawing.Size(740, 479);
        self.richTextBox1.TabIndex := 0;
        self.richTextBox1.Text := '';
        // 
        // label1
        // 
        self.label1.Location := new System.Drawing.Point(424, 69);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(242, 25);
        self.label1.TabIndex := 3;
        self.label1.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label2
        // 
        self.label2.Font := new System.Drawing.Font('Times New Roman', 9.5, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label2.Location := new System.Drawing.Point(333, 69);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(102, 25);
        self.label2.TabIndex := 4;
        self.label2.Text := 'From';
        self.label2.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label3
        // 
        self.label3.Font := new System.Drawing.Font('Times New Roman', 9.5, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label3.Location := new System.Drawing.Point(332, 94);
        self.label3.Name := 'label3';
        self.label3.Size := new System.Drawing.Size(100, 21);
        self.label3.TabIndex := 5;
        self.label3.Text := 'Subject';
        self.label3.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label4
        // 
        self.label4.Location := new System.Drawing.Point(424, 94);
        self.label4.Name := 'label4';
        self.label4.Size := new System.Drawing.Size(242, 21);
        self.label4.TabIndex := 6;
        self.label4.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label5
        // 
        self.label5.Font := new System.Drawing.Font('Times New Roman', 9.5, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label5.Location := new System.Drawing.Point(333, 115);
        self.label5.Name := 'label5';
        self.label5.Size := new System.Drawing.Size(101, 23);
        self.label5.TabIndex := 7;
        self.label5.Text := 'Send date';
        self.label5.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label6
        // 
        self.label6.Location := new System.Drawing.Point(424, 115);
        self.label6.Name := 'label6';
        self.label6.Size := new System.Drawing.Size(242, 23);
        self.label6.TabIndex := 8;
        self.label6.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // statusStrip1
        // 
        self.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[2](self.toolStripStatusLabel1, self.toolStripProgressBar1));
        self.statusStrip1.Location := new System.Drawing.Point(0, 658);
        self.statusStrip1.Name := 'statusStrip1';
        self.statusStrip1.Size := new System.Drawing.Size(1084, 22);
        self.statusStrip1.TabIndex := 9;
        self.statusStrip1.Text := 'statusStrip1';
        // 
        // toolStripStatusLabel1
        // 
        self.toolStripStatusLabel1.BackgroundImageLayout := System.Windows.Forms.ImageLayout.None;
        self.toolStripStatusLabel1.DisplayStyle := System.Windows.Forms.ToolStripItemDisplayStyle.Text;
        self.toolStripStatusLabel1.Name := 'toolStripStatusLabel1';
        self.toolStripStatusLabel1.Size := new System.Drawing.Size(31, 17);
        self.toolStripStatusLabel1.Text := '        ';
        self.toolStripStatusLabel1.Click += toolStripStatusLabel1_Click;
        // 
        // toolStripProgressBar1
        // 
        self.toolStripProgressBar1.Name := 'toolStripProgressBar1';
        self.toolStripProgressBar1.Size := new System.Drawing.Size(100, 16);
        // 
        // tabControl1
        // 
        self.tabControl1.Controls.Add(self.tabPage1);
        self.tabControl1.Location := new System.Drawing.Point(0, 0);
        self.tabControl1.Name := 'tabControl1';
        self.tabControl1.SelectedIndex := 0;
        self.tabControl1.Size := new System.Drawing.Size(1083, 68);
        self.tabControl1.TabIndex := 11;
        // 
        // tabPage1
        // 
        self.tabPage1.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(255)))), (System.Int32((System.Byte(255)))), (System.Int32((System.Byte(192)))));
        self.tabPage1.Controls.Add(self.button4);
        self.tabPage1.Controls.Add(self.button1);
        self.tabPage1.Controls.Add(self.button2);
        self.tabPage1.Location := new System.Drawing.Point(4, 22);
        self.tabPage1.Name := 'tabPage1';
        self.tabPage1.Padding := new System.Windows.Forms.Padding(3);
        self.tabPage1.Size := new System.Drawing.Size(1075, 42);
        self.tabPage1.TabIndex := 0;
        self.tabPage1.Text := 'Main';
        // 
        // button4
        // 
        self.button4.BackColor := System.Drawing.Color.Cyan;
        self.button4.Location := new System.Drawing.Point(199, 6);
        self.button4.Name := 'button4';
        self.button4.Size := new System.Drawing.Size(79, 30);
        self.button4.TabIndex := 13;
        self.button4.Text := 'Help Me!';
        self.button4.UseVisualStyleBackColor := false;
        self.button4.Click += button4_Click;
        // 
        // button1
        // 
        self.button1.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(192)))), (System.Int32((System.Byte(255)))), (System.Int32((System.Byte(192)))));
        self.button1.Image := (System.Drawing.Image(resources.GetObject('button1.Image')));
        self.button1.ImageAlign := System.Drawing.ContentAlignment.MiddleRight;
        self.button1.Location := new System.Drawing.Point(85, 6);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(108, 30);
        self.button1.TabIndex := 12;
        self.button1.Text := 'Sync with server';
        self.button1.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        self.button1.UseVisualStyleBackColor := false;
        self.button1.Click += button1_Click;
        // 
        // button2
        // 
        self.button2.BackColor := System.Drawing.SystemColors.Control;
        self.button2.Image := (System.Drawing.Image(resources.GetObject('button2.Image')));
        self.button2.ImageAlign := System.Drawing.ContentAlignment.MiddleRight;
        self.button2.Location := new System.Drawing.Point(9, 6);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(70, 30);
        self.button2.TabIndex := 10;
        self.button2.Text := 'Settings';
        self.button2.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        self.button2.UseVisualStyleBackColor := false;
        self.button2.Click += button2_Click;
        // 
        // button3
        // 
        self.button3.ContextMenuStrip := self.contextMenuStrip1;
        self.button3.Font := new System.Drawing.Font('Microsoft Sans Serif', 8.25, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.button3.Location := new System.Drawing.Point(934, 637);
        self.button3.Name := 'button3';
        self.button3.Size := new System.Drawing.Size(111, 19);
        self.button3.TabIndex := 13;
        self.button3.Text := 'Attachments found!';
        self.button3.UseVisualStyleBackColor := true;
        self.button3.Visible := false;
        // 
        // contextMenuStrip1
        // 
        self.contextMenuStrip1.Name := 'contextMenuStrip1';
        self.contextMenuStrip1.Size := new System.Drawing.Size(61, 4);
        // 
        // checkedListBox1
        // 
        self.checkedListBox1.FormattingEnabled := true;
        self.checkedListBox1.Location := new System.Drawing.Point(4, 74);
        self.checkedListBox1.Name := 'checkedListBox1';
        self.checkedListBox1.Size := new System.Drawing.Size(322, 559);
        self.checkedListBox1.TabIndex := 14;
        self.checkedListBox1.ThreeDCheckBoxes := true;
        self.checkedListBox1.ItemCheck += checkedListBox1_ItemCheck;
        self.checkedListBox1.SelectedIndexChanged += checkedListBox1_SelectedIndexChanged;
        self.checkedListBox1.DoubleClick += checkedListBox1_DoubleClick;
        self.checkedListBox1.KeyDown += checkedListBox1_KeyDown;
        // 
        // Form1
        // 
        self.AllowDrop := true;
        self.AutoScaleMode := System.Windows.Forms.AutoScaleMode.Inherit;
        self.AutoScroll := true;
        self.AutoSize := true;
        self.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(255)))), (System.Int32((System.Byte(255)))), (System.Int32((System.Byte(192)))));
        self.ClientSize := new System.Drawing.Size(1084, 680);
        self.Controls.Add(self.checkedListBox1);
        self.Controls.Add(self.button3);
        self.Controls.Add(self.tabControl1);
        self.Controls.Add(self.statusStrip1);
        self.Controls.Add(self.label6);
        self.Controls.Add(self.label5);
        self.Controls.Add(self.label4);
        self.Controls.Add(self.label3);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.richTextBox1);
        self.HelpButton := true;
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.Name := 'Form1';
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Text := 'PasMail';
        self.FormClosing += Form1_FormClosing;
        self.Load += Form1_Load;
        self.Shown += Form1_Shown;
        self.statusStrip1.ResumeLayout(false);
        self.statusStrip1.PerformLayout();
        self.tabControl1.ResumeLayout(false);
        self.tabPage1.ResumeLayout(false);
        (System.ComponentModel.ISupportInitialize(self.dataView1)).EndInit();
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
