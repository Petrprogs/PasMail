procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form1));
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
        self.button5 := new System.Windows.Forms.Button();
        self.button4 := new System.Windows.Forms.Button();
        self.button1 := new System.Windows.Forms.Button();
        self.button2 := new System.Windows.Forms.Button();
        self.button3 := new System.Windows.Forms.Button();
        self.contextMenuStrip1 := new System.Windows.Forms.ContextMenuStrip(self.components);
        self.checkedListBox1 := new System.Windows.Forms.CheckedListBox();
        self.webBrowser1 := new System.Windows.Forms.WebBrowser();
        self.process1 := new System.Diagnostics.Process();
        self.statusStrip1.SuspendLayout();
        self.tabControl1.SuspendLayout();
        self.tabPage1.SuspendLayout();
        self.SuspendLayout();
        // 
        // label1
        // 
        self.label1.Anchor := (System.Windows.Forms.AnchorStyles((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Right)));
        self.label1.AutoEllipsis := true;
        self.label1.Location := new System.Drawing.Point(429, 74);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(654, 21);
        self.label1.TabIndex := 3;
        self.label1.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        // 
        // label2
        // 
        self.label2.Anchor := (System.Windows.Forms.AnchorStyles((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Right)));
        self.label2.AutoEllipsis := true;
        self.label2.Font := new System.Drawing.Font('Times New Roman', 9.5, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label2.Location := new System.Drawing.Point(352, 74);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(71, 21);
        self.label2.TabIndex := 4;
        self.label2.Text := 'From';
        self.label2.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label3
        // 
        self.label3.Anchor := (System.Windows.Forms.AnchorStyles((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Right)));
        self.label3.Font := new System.Drawing.Font('Times New Roman', 9.5, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label3.Location := new System.Drawing.Point(352, 94);
        self.label3.Name := 'label3';
        self.label3.Size := new System.Drawing.Size(71, 21);
        self.label3.TabIndex := 5;
        self.label3.Text := 'Subject';
        self.label3.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label4
        // 
        self.label4.Anchor := (System.Windows.Forms.AnchorStyles((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Right)));
        self.label4.AutoEllipsis := true;
        self.label4.Location := new System.Drawing.Point(429, 94);
        self.label4.Name := 'label4';
        self.label4.Size := new System.Drawing.Size(654, 21);
        self.label4.TabIndex := 6;
        self.label4.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        // 
        // label5
        // 
        self.label5.Anchor := (System.Windows.Forms.AnchorStyles((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Right)));
        self.label5.Font := new System.Drawing.Font('Times New Roman', 9.5, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, (System.Byte(204)));
        self.label5.Location := new System.Drawing.Point(352, 115);
        self.label5.Name := 'label5';
        self.label5.Size := new System.Drawing.Size(71, 21);
        self.label5.TabIndex := 7;
        self.label5.Text := 'Send date';
        self.label5.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // label6
        // 
        self.label6.Anchor := (System.Windows.Forms.AnchorStyles((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Right)));
        self.label6.AutoEllipsis := true;
        self.label6.Location := new System.Drawing.Point(429, 115);
        self.label6.Name := 'label6';
        self.label6.Size := new System.Drawing.Size(654, 21);
        self.label6.TabIndex := 8;
        self.label6.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        // 
        // statusStrip1
        // 
        self.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[2](self.toolStripStatusLabel1, self.toolStripProgressBar1));
        self.statusStrip1.Location := new System.Drawing.Point(0, 667);
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
        self.toolStripStatusLabel1.Size := new System.Drawing.Size(16, 17);
        self.toolStripStatusLabel1.Text := '...';
        self.toolStripStatusLabel1.Click += toolStripStatusLabel1_Click;
        // 
        // toolStripProgressBar1
        // 
        self.toolStripProgressBar1.Name := 'toolStripProgressBar1';
        self.toolStripProgressBar1.Size := new System.Drawing.Size(300, 16);
        // 
        // tabControl1
        // 
        self.tabControl1.Controls.Add(self.tabPage1);
        self.tabControl1.Dock := System.Windows.Forms.DockStyle.Top;
        self.tabControl1.Location := new System.Drawing.Point(0, 0);
        self.tabControl1.Name := 'tabControl1';
        self.tabControl1.SelectedIndex := 0;
        self.tabControl1.Size := new System.Drawing.Size(1084, 68);
        self.tabControl1.TabIndex := 11;
        // 
        // tabPage1
        // 
        self.tabPage1.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(255)))), (System.Int32((System.Byte(255)))), (System.Int32((System.Byte(192)))));
        self.tabPage1.Controls.Add(self.button5);
        self.tabPage1.Controls.Add(self.button4);
        self.tabPage1.Controls.Add(self.button1);
        self.tabPage1.Controls.Add(self.button2);
        self.tabPage1.Location := new System.Drawing.Point(4, 22);
        self.tabPage1.Name := 'tabPage1';
        self.tabPage1.Padding := new System.Windows.Forms.Padding(3);
        self.tabPage1.Size := new System.Drawing.Size(1076, 42);
        self.tabPage1.TabIndex := 0;
        self.tabPage1.Text := 'Main';
        // 
        // button5
        // 
        self.button5.BackColor := System.Drawing.SystemColors.Menu;
        self.button5.BackgroundImageLayout := System.Windows.Forms.ImageLayout.None;
        self.button5.FlatAppearance.BorderColor := System.Drawing.SystemColors.Control;
        self.button5.FlatAppearance.MouseDownBackColor := System.Drawing.SystemColors.Control;
        self.button5.FlatAppearance.MouseOverBackColor := System.Drawing.SystemColors.Control;
        self.button5.ForeColor := System.Drawing.SystemColors.ControlText;
        self.button5.Image := (System.Drawing.Image(resources.GetObject('button5.Image')));
        self.button5.ImageAlign := System.Drawing.ContentAlignment.MiddleRight;
        self.button5.Location := new System.Drawing.Point(284, 6);
        self.button5.Name := 'button5';
        self.button5.Size := new System.Drawing.Size(113, 30);
        self.button5.TabIndex := 14;
        self.button5.Text := 'Delete message';
        self.button5.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        self.button5.UseVisualStyleBackColor := false;
        self.button5.Click += button5_Click;
        // 
        // button4
        // 
        self.button4.Anchor := System.Windows.Forms.AnchorStyles.Left;
        self.button4.AutoSizeMode := System.Windows.Forms.AutoSizeMode.GrowAndShrink;
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
        self.button1.Anchor := System.Windows.Forms.AnchorStyles.Left;
        self.button1.AutoSizeMode := System.Windows.Forms.AutoSizeMode.GrowAndShrink;
        self.button1.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(192)))), (System.Int32((System.Byte(255)))), (System.Int32((System.Byte(192)))));
        self.button1.Image := (System.Drawing.Image(resources.GetObject('button1.Image')));
        self.button1.ImageAlign := System.Drawing.ContentAlignment.MiddleRight;
        self.button1.Location := new System.Drawing.Point(85, 6);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(109, 30);
        self.button1.TabIndex := 12;
        self.button1.Text := 'Sync with server';
        self.button1.TextAlign := System.Drawing.ContentAlignment.MiddleLeft;
        self.button1.UseVisualStyleBackColor := false;
        self.button1.Click += button1_Click;
        // 
        // button2
        // 
        self.button2.Anchor := System.Windows.Forms.AnchorStyles.Left;
        self.button2.AutoSizeMode := System.Windows.Forms.AutoSizeMode.GrowAndShrink;
        self.button2.BackColor := System.Drawing.SystemColors.Control;
        self.button2.Image := (System.Drawing.Image(resources.GetObject('button2.Image')));
        self.button2.ImageAlign := System.Drawing.ContentAlignment.MiddleRight;
        self.button2.Location := new System.Drawing.Point(9, 6);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(71, 30);
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
        self.button3.Location := new System.Drawing.Point(937, 645);
        self.button3.Name := 'button3';
        self.button3.Size := new System.Drawing.Size(111, 19);
        self.button3.TabIndex := 13;
        self.button3.Text := 'Attachments found!';
        self.button3.UseVisualStyleBackColor := true;
        self.button3.Visible := false;
        self.button3.Click += button3_Click;
        // 
        // contextMenuStrip1
        // 
        self.contextMenuStrip1.Name := 'contextMenuStrip1';
        self.contextMenuStrip1.Size := new System.Drawing.Size(61, 4);
        // 
        // checkedListBox1
        // 
        self.checkedListBox1.Anchor := (System.Windows.Forms.AnchorStyles((((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Bottom) 
                    or System.Windows.Forms.AnchorStyles.Left) 
                    or System.Windows.Forms.AnchorStyles.Right)));
        self.checkedListBox1.FormattingEnabled := true;
        self.checkedListBox1.HorizontalScrollbar := true;
        self.checkedListBox1.Location := new System.Drawing.Point(4, 74);
        self.checkedListBox1.Name := 'checkedListBox1';
        self.checkedListBox1.Size := new System.Drawing.Size(322, 589);
        self.checkedListBox1.TabIndex := 14;
        self.checkedListBox1.ThreeDCheckBoxes := true;
        self.checkedListBox1.ItemCheck += checkedListBox1_ItemCheck;
        self.checkedListBox1.SelectedIndexChanged += checkedListBox1_SelectedIndexChanged;
        self.checkedListBox1.KeyDown += checkedListBox1_KeyDown;
        // 
        // webBrowser1
        // 
        self.webBrowser1.Anchor := (System.Windows.Forms.AnchorStyles(((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Bottom) 
                    or System.Windows.Forms.AnchorStyles.Right)));
        self.webBrowser1.IsWebBrowserContextMenuEnabled := false;
        self.webBrowser1.Location := new System.Drawing.Point(332, 141);
        self.webBrowser1.MinimumSize := new System.Drawing.Size(20, 20);
        self.webBrowser1.Name := 'webBrowser1';
        self.webBrowser1.Size := new System.Drawing.Size(746, 501);
        self.webBrowser1.TabIndex := 15;
        self.webBrowser1.Navigating += webBrowser1_Navigating;
        // 
        // process1
        // 
        self.process1.StartInfo.Domain := '';
        self.process1.StartInfo.LoadUserProfile := false;
        self.process1.StartInfo.Password := nil;
        self.process1.StartInfo.StandardErrorEncoding := nil;
        self.process1.StartInfo.StandardOutputEncoding := nil;
        self.process1.StartInfo.UserName := '';
        self.process1.SynchronizingObject := self;
        // 
        // Form1
        // 
        self.AllowDrop := true;
        self.AutoScaleMode := System.Windows.Forms.AutoScaleMode.Inherit;
        self.AutoSizeMode := System.Windows.Forms.AutoSizeMode.GrowAndShrink;
        self.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(255)))), (System.Int32((System.Byte(255)))), (System.Int32((System.Byte(192)))));
        self.ClientSize := new System.Drawing.Size(1084, 689);
        self.Controls.Add(self.webBrowser1);
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
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
