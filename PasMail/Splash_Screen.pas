Unit Splash_Screen;

interface

uses System, System.Drawing, System.Windows.Forms, Unit1;

type
  Form3 = class(Form)
    procedure Form3_Scroll(sender: Object; e: ScrollEventArgs);
    procedure Form3_Shown(sender: Object; e: EventArgs);
    procedure timer1_Tick(sender: Object; e: EventArgs);
  {$region FormDesigner}
  internal
    {$resource Splash_Screen.Form3.resources}
    timer1: Timer;
    components: System.ComponentModel.IContainer;
    pictureBox1: PictureBox;
    {$include Splash_Screen.Form3.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation

procedure Form3.Form3_Scroll(sender: Object; e: ScrollEventArgs);
begin

end;
procedure Splash_Show;
begin
  //  Sleep(4000);
  Form3.Create.Hide;
  Unit1.Form1.Create.Show;
end;
procedure Form3.Form3_Shown(sender: Object; e: EventArgs);
begin
  timer1.Start;
end;
procedure Form3.timer1_Tick(sender: Object; e: EventArgs);
begin
  timer1.Stop;
  self.Close;
  Unit1.Form1.Create.Show;
end;
end.
