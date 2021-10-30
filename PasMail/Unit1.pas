unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, System.Xml.Linq, Unit2, System.IO, System.Xml;

var
  inbox: MailKit.IMailFolder;
  InboxCount, i: integer;
  t: System.Threading.Thread;

var
  msgs: XmlDocument;

var
  message: array [0..1000] of MimeKit.MimeMessage;
  Credentials: array of string;

type
  Form1 = class(Form)
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure Form1_Load(sender: Object; e: EventArgs);
    procedure Form1_Validated(sender: Object; e: EventArgs);
    procedure Form1_Shown(sender: Object; e: EventArgs);
    procedure toolStripStatusLabel1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure Form1_FormClosing(sender: Object; e: FormClosingEventArgs);
    procedure addmsgtolist();
    procedure Sync;
    procedure toolStripProgressBar1_Click(sender: Object; e: EventArgs);
    procedure CheckedlistBox1_SelectedIndexChanged(sender: Object; e: EventArgs);
    procedure checkedListBox1_KeyDown(sender: Object; e: KeyEventArgs);
    procedure notifyIcon1_Click(sender: Object; e: EventArgs);
    procedure button4_Click(sender: Object; e: EventArgs);
  {$region FormDesigner}
  internal
    {$resource Unit1.Form1.resources}
    label1: &Label;
    label2: &Label;
    label3: &Label;
    label4: &Label;
    label5: &Label;
    label6: &Label;
    statusStrip1: StatusStrip;
    toolStripStatusLabel1: ToolStripStatusLabel;
    tabControl1: TabControl;
    tabPage1: TabPage;
    button2: Button;
    button1: Button;
    button3: Button;
    contextMenuStrip1: System.Windows.Forms.ContextMenuStrip;
    components: System.ComponentModel.IContainer;
    checkedListBox1: CheckedListBox;
    notifyIcon1: NotifyIcon;
    button4: Button;
    richTextBox1: RichTextBox;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation

procedure Form1.CheckedlistBox1_SelectedIndexChanged(sender: Object; e: EventArgs);
begin
  var indexcount := CheckedListBox1.SelectedIndex;
  if indexcount = -1 then 
    indexcount := 0;
  msgs.Load(Directory.GetFiles('.\\DB\')[indexcount]);
  label4.Text := msgs.GetElementsByTagName('Subject')[0].InnerText;
  label1.Text := msgs.GetElementsByTagName('From')[0].InnerText;
  label6.Text := msgs.GetElementsByTagName('Date')[0].InnerText;
  richTextBox1.Rtf := msgs.GetElementsByTagName('Body')[0].InnerText;
end;
/// Add messages to chekedlistbox
procedure Form1.addmsgtolist();
begin
  CheckedlistBox1.Items.Clear;
  //ListBox1.Items.Clear;
  //var tm:= Directory.GetFiles('.\\DB\').Length - 1;
  msgs := new XmlDocument;
  for var i := 0 to Directory.GetFiles('.\\DB\').Length - 1 do
  begin
    msgs.Load(Directory.GetFiles('.\\DB\')[i]);
    CheckedListBox1.Items.Add(msgs.GetElementsByTagName('Subject')[0].InnerText);
    if msgs.GetElementsByTagName('Isreaded')[0].InnerText = 'false' then 
      checkedListBox1.SetItemCheckState(i, CheckState.Indeterminate);
  end;
end;

procedure Form1.toolStripStatusLabel1_Click(sender: Object; e: EventArgs);
begin
end;

procedure Form1.Sync();
var
  networkerror: boolean;
begin
  repeat
    begin
      try
        begin
          networkerror := false;
          Credentials := ReadAllLines('Credentials.txt');
          Writeln('DEBUG');
          var client := new MailKit.Net.Imap.ImapClient;
          client.Connect('imap.yandex.ru', 993, true);
          client.Authenticate(Credentials[0], Credentials[1]);
          // The Inbox folder is always available on all IMAP servers...
          inbox := client.Inbox;
          inbox.Open(MailKit.FolderAccess.ReadWrite);				
          InboxCount := inbox.Count;
          for var i := 0 to (InboxCount - 1) do
          begin
            var index := i;
            var body: string;
            message[i] := inbox.GetMessage(i);
            if System.IO.File.Exists('.\\DB\' + message[i].MessageId + '.xml') then 
            else
            begin
              if message[i].HtmlBody = '' then
                body := message[i].TextBody
              else
              begin
                body := message[i].HtmlBody;
                //Writeln(body);
                var convert := new SautinSoft.HtmlToRtf;
                convert.PreserveImages := true;
                convert.PreserveFontFace := true;
                convert.PreserveHttpCss := true;
                convert.PreserveFontColor := true;
                convert.PreserveBackgroundColor := true;
                convert.PreserveAlignment := true;
                convert.PreserveHyperlinks := true;
                convert.Encoding := SautinSoft.HtmlToRtf.eEncoding.AutoDetect;
                var error := true;
                while error = true do
                begin
                  try
                    convert.OpenHtml(body);
                    body := convert.ToRtf;
                    error := false;
                  except
                    on ex: Exception do
                    begin
                      error := true;
                      body := message[i].TextBody;  
                      convert.InputFormat := SautinSoft.HtmlToRtf.eInputFormat.Text;
                    end;
                  end;
                end;
                Sleep(1000);
                var fetch := inbox.Fetch(i, i, MailKit.MessageSummaryItems.Flags);
                var checkseen := fetch[0].Flags.Value.HasFlag(MailKit.MessageFlags.Seen);
                Write(checkseen);
                var xdoc := new XDocument(new XElement('Message',
                new System.Xml.Linq.XElement('Subject', message[i].Subject), 
                new System.Xml.Linq.XElement('Isreaded', checkseen),
                new System.Xml.Linq.XElement('Body', body),
                new System.Xml.Linq.XElement('From', message[i].From[0].Name), 
                new System.Xml.Linq.XElement('Date', message[i].Date.DateTime.ToString('dd.mm.yyyy hh:mm'))));
                xdoc.Save('.\\DB\' + message[i].MessageId + '.xml');
                foreach var attachment in message[I].Attachments do
                begin
                  Writeln(attachment.ContentType);
                  var stream := System.IO.File.Create(attachment.ContentId);
                  if attachment is MimeKit.MessagePart then
                  begin
                    var rfc855: Mimekit.MessagePart; 
                    rfc855.Message.WriteTo(stream);
                  end
                  else
                  begin
                    var part: Mimekit.MimePart;
                    part.Content.DecodeTo(stream);
                  end;
                end;
                
              end;
            end;
          end;   
          addmsgtolist;
          toolStripStatusLabel1.Text := 'Synchronization finished!';
        end;
      
      except
        on 
        ex: System.Net.Sockets.SocketException do 
        begin
          MessageBox.Show('Network error(Сетевая ошибка)', 'Error!', MessageBoxButtons.OK, MessageBoxIcon.Error);
          networkerror := true;
          Writeln(ex.Message);
        end;
        on e: Exception do
          WriteAllText('Exceptions.txt', e.StackTrace);
      end;
    end;
  until networkerror = true;
end;

procedure Form1.button1_Click(sender: Object; e: EventArgs);
begin
  Sync;
end;

procedure Form1.Form1_Load(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.Form1_Validated(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.Form1_Shown(sender: Object; e: EventArgs);
begin
  if ReadAllText('Credentials.txt') = '' then  
  begin
    MessageBox.Show('You must enter your credentials in the settings!When you enter credentials, please restart programm.(Вы должны указать свои учетные данные в настройках! Когда вы сделаете это, то перезапустите программу)', 'Error', MessageBoxButtons.OK, MessageBoxIcon.Error);
    exit;
  end;
  if Directory.Exists('DB') then
      else
  begin
    MessageBox.Show('Directory "DB" not found! It seems you delete it! All message DB is deleted!(Дериктория "DB" не найдена! Похоже Вы удалили ее! Вся база данных сообщений была удалена!)', '', MessageBoxButtons.OK, MessageBoxIcon.Error);
    MkDir('DB');
  end;
  toolStripStatusLabel1.Text := 'Synchronization started...';  
  t := new System.Threading.Thread(Sync);
  t.Start; 
  addmsgtolist; 
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  Form2.Create.ShowDialog;
end;

procedure Form1.Form1_FormClosing(sender: Object; e: FormClosingEventArgs);
begin
  if ReadAllLines('Credentials.txt')[2] = 'true' then 
    Form1.Create.Close
  else
  begin
    var msg: System.Windows.Forms.DialogResult := MessageBox.Show('It seems programm now is synchronizating with server. Do you realy want to exit?',
    'Exit',
    MessageBoxButtons.YesNo, 
    MessageBoxIcon.Question);
    if t.IsAlive = true then
      if msg = System.Windows.Forms.DialogResult.Yes then
      begin
        t.Abort;
        Halt(0);
      end
      else
        e.Cancel := true;
  end;
end;

procedure Form1.toolStripProgressBar1_Click(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.CheckedlistBox1_KeyDown(sender: Object; e: KeyEventArgs);
begin
  if e.KeyCode = System.Windows.Forms.Keys.Delete then
  begin
    var indexcount := CheckedListBox1.SelectedIndex;
    if indexcount = -1 then 
      indexcount := 0;
    inbox.AddFlags(indexcount, MailKit.MessageFlags.Deleted, true);
    checkedListBox1.Items.Remove(indexcount);
  end;
end;

procedure Form1.notifyIcon1_Click(sender: Object; e: EventArgs);
begin
  Form1.Create.Show;
end;

procedure Form1.button4_Click(sender: Object; e: EventArgs);
begin
  //TODO 
  //  Create a help page and exec it here
end;
end.