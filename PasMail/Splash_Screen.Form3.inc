procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form3));
        self.pictureBox1 := new System.Windows.Forms.PictureBox();
        self.timer1 := new System.Windows.Forms.Timer(self.components);
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).BeginInit();
        self.SuspendLayout();
        // 
        // pictureBox1
        // 
        self.pictureBox1.Dock := System.Windows.Forms.DockStyle.Fill;
        self.pictureBox1.Image := (System.Drawing.Image(resources.GetObject('pictureBox1.Image')));
        self.pictureBox1.Location := new System.Drawing.Point(0, 0);
        self.pictureBox1.Name := 'pictureBox1';
        self.pictureBox1.Size := new System.Drawing.Size(420, 438);
        self.pictureBox1.SizeMode := System.Windows.Forms.PictureBoxSizeMode.AutoSize;
        self.pictureBox1.TabIndex := 0;
        self.pictureBox1.TabStop := false;
        // 
        // timer1
        // 
        self.timer1.Interval := 2000;
        self.timer1.Tick += timer1_Tick;
        // 
        // Form3
        // 
        self.BackgroundImageLayout := System.Windows.Forms.ImageLayout.None;
        self.ClientSize := new System.Drawing.Size(420, 438);
        self.ControlBox := false;
        self.Controls.Add(self.pictureBox1);
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.None;
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.MaximizeBox := false;
        self.MinimizeBox := false;
        self.Name := 'Form3';
        self.ShowIcon := false;
        self.ShowInTaskbar := false;
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Shown += Form3_Shown;
        self.Scroll += Form3_Scroll;
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).EndInit();
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
