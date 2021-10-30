unit Unit2;

interface

uses System, System.Drawing, System.Windows.Forms;

type
  Form2 = class(Form)
    procedure textBox2_TextChanged(sender: Object; e: EventArgs);
    procedure button1_MouseDown(sender: Object; e: MouseEventArgs);
    procedure button1_MouseEnter(sender: Object; e: EventArgs);
    procedure button1_MouseLeave(sender: Object; e: EventArgs);
    procedure OK_Click(sender: Object; e: EventArgs);
    procedure maskedTextBox1_MaskInputRejected(sender: Object; e: MaskInputRejectedEventArgs);
    procedure textBox1_TextChanged(sender: Object; e: EventArgs);
    procedure tabPage1_Click(sender: Object; e: EventArgs);
    procedure checkBox1_CheckedChanged(sender: Object; e: EventArgs);
    procedure Form2_Load(sender: Object; e: EventArgs);
  {$region FormDesigner}
  internal
    {$resource Unit2.Form2.resources}
    tabControl1: TabControl;
    tabPage1: TabPage;
    textBox1: TextBox;
    label2: &Label;
    button1: Button;
    label1: &Label;
    textBox2: TextBox;
    tabPage2: TabPage;
    checkBox1: CheckBox;
    OK: Button;
    {$include Unit2.Form2.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation

uses Unit1;

procedure Form2.textBox2_TextChanged(sender: Object; e: EventArgs);
begin
  
end;

procedure Form2.button1_MouseDown(sender: Object; e: MouseEventArgs);
begin
end;

procedure Form2.button1_MouseEnter(sender: Object; e: EventArgs);
begin
  textBox2.UseSystemPasswordChar := false;
end;

procedure Form2.button1_MouseLeave(sender: Object; e: EventArgs);
begin
  textBox2.UseSystemPasswordChar := true;
end;

procedure Form2.OK_Click(sender: Object; e: EventArgs);
begin
  if textBox1.Text = '' then
    MessageBox.Show('"Email" field cannot be empty', 'Error!', MessageBoxButtons.OK, MessageBoxIcon.Error)
  else
  if textBox2.Text = '' then
    MessageBox.Show('"Password" field cannot be empty', 'Error!', MessageBoxButtons.OK, MessageBoxIcon.Error)
  else
    if checkBox1.Checked = true then 
  begin
    WriteAllText('Credentials.txt', TextBox1.Text + NewLine + textBox2.Text + NewLine + 'true');
    Form2.Create.Close;
  end
  else
   WriteAllText('Credentials.txt', TextBox1.Text + NewLine + textBox2.Text + NewLine + 'false');
    Form2.Create.Close;
end;

procedure Form2.maskedTextBox1_MaskInputRejected(sender: Object; e: MaskInputRejectedEventArgs);
begin
  
end;

procedure Form2.textBox1_TextChanged(sender: Object; e: EventArgs);
begin
  
end;

procedure Form2.tabPage1_Click(sender: Object; e: EventArgs);
begin
  
end;

procedure Form2.checkBox1_CheckedChanged(sender: Object; e: EventArgs);
begin
end;

procedure Form2.Form2_Load(sender: Object; e: EventArgs);
begin
 textBox1.Text:= ReadAllLines('Credentials.txt')[0];
 textBox2.Text:= ReadAllLines('Credentials.txt')[1];
end;

end.
