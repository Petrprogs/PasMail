procedure InitializeComponent;
    begin
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(Form1));
        self.pictureBox1 := new System.Windows.Forms.PictureBox();
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).BeginInit();
        self.SuspendLayout();
        // 
        // pictureBox1
        // 
        self.pictureBox1.Dock := System.Windows.Forms.DockStyle.Fill;
        self.pictureBox1.Image := (System.Drawing.Image(resources.GetObject('pictureBox1.Image')));
        self.pictureBox1.Location := new System.Drawing.Point(0, 0);
        self.pictureBox1.Name := 'pictureBox1';
        self.pictureBox1.Size := new System.Drawing.Size(420, 420);
        self.pictureBox1.SizeMode := System.Windows.Forms.PictureBoxSizeMode.AutoSize;
        self.pictureBox1.TabIndex := 0;
        self.pictureBox1.TabStop := false;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(420, 420);
        self.ControlBox := false;
        self.Controls.Add(self.pictureBox1);
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.None;
        self.MaximizeBox := false;
        self.MinimizeBox := false;
        self.Name := 'Form1';
        self.ShowIcon := false;
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        (System.ComponentModel.ISupportInitialize(self.pictureBox1)).EndInit();
        self.ResumeLayout(false);
        self.PerformLayout();
    end;
