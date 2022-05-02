unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, System.Xml.Linq, Unit2, System.IO, System.Xml, MessageDB, Microsoft.Office.Interop.Access.Dao;

var
  inbox: MailKit.IMailFolder;
  InboxCount, i: integer;
  t: System.Threading.Thread;
  msgs: XmlDocument;
  message: array [0..10000] of MimeKit.MimeMessage;
  Credentials: array of string;
  DB := new MessageDB.TMessageDB;
  count: integer;
  client := new MailKit.Net.Imap.ImapClient;

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
    procedure checkedListBox1_ItemCheck(sender: Object; e: ItemCheckEventArgs);
    procedure checkedListBox1_DoubleClick(sender: Object; e: EventArgs);
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
    button4: Button;
    toolStripProgressBar1: ToolStripProgressBar;
    dataView1: System.Data.DataView;
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
  richTextBox1.Rtf := ReadAllText(DB.ReadingDBIndex('path', indexcount));//ReadAllText(Directory.GetFiles('.\\DB\')[indexcount]);
  label1.Text := DB.ReadingDBIndex('from', indexcount);
  label4.Text := DB.ReadingDBIndex('subject', indexcount);
  label6.Text := DB.ReadingDBIndex('date', indexcount);
end;
/// Add messages to chekedlistbox
procedure Form1.addmsgtolist();
begin
  MessageDB.MessageDBRecSet := AccessDB.OpenRecordset('Message DB');
  try
    MessageDBRecSet.MoveFirst;
  except 
    on ex: Exception do
  end;
  if checkedListBox1.IsHandleCreated then
    checkedListBox1.Invoke(CheckedlistBox1.Items.Clear);
  if checkedListBox1.IsHandleCreated then
    checkedListBox1.Invoke(CheckedListBox1.Items.Add(MessageDBRecSet.Fields['subject'].Value.ToString).GetType);
  for var i := 0 to Directory.GetFiles('./DB').Length - 2 do
  begin
    if checkedListBox1.IsHandleCreated then
      checkedListBox1.BeginInvoke(CheckedListBox1.Items.Add(DB.ReadingDB('subject')).GetType);     
  end;
  MessageDBRecSet.MoveFirst;
  for var i := 0 to Directory.GetFiles('./DB').Length - 2 do
  begin
    if checkedListBox1.IsHandleCreated then
      CheckedListBox1.SetItemChecked(i, boolean.Parse(DB.ReadingDB('isreaded')));     
  end;
end;

procedure Form1.toolStripStatusLabel1_Click(sender: Object; e: EventArgs);
begin
end;

procedure Form1.Sync();
var
  fromstr := 'Nan';
  networkerror: boolean;
begin
  try
    begin
      networkerror := false;
      Credentials := ReadAllLines('credentials.txt');
      lock client.SyncRoot do
        client.Connect('imap.yandex.ru', 993, true);
      client.Authenticate(Credentials[0], Credentials[1]);
          // The Inbox folder is always available on all IMAP servers...
      inbox := client.Inbox;
      inbox.Open(MailKit.FolderAccess.ReadOnly);
      if not inbox.IsOpen then
        MessageBox.Show('Inbox folder not open!', 'Folder');
      Sleep(100);
      statusStrip1.BeginInvoke(toolStripProgressBar1.GetType);
      toolStripProgressBar1.Maximum := inbox.Count - 1;
      for var i := 0 to (inbox.Count - 1) do
      begin
        toolStripProgressBar1.Value := i;
        var body: string;
        lock inbox.SyncRoot do
          message[i] := inbox.GetMessage(i);
        if System.IO.File.Exists('./DB/' + message[i].MessageId) then 
            else
        begin
          if message[i].HtmlBody = '' then
            body := message[i].TextBody
              else
          begin
            body := message[i].HtmlBody;
            var convert := new SautinSoft.HtmlToRtf;
            convert.PreserveImages := true;
            convert.PreserveFontFace := true;
            convert.PreserveHttpCss := true;
            convert.PreserveFontColor := true;
            convert.PreserveBackgroundColor := true;
            convert.PreserveAlignment := true;
            convert.PreserveHyperlinks := true;
            convert.PreserveFontSize := true;
            convert.PreserveHttpImages := true;
            convert.PreserveNestedTables := true;
            convert.PreserveTables := true;
            convert.RtfCompatibility := SautinSoft.HtmlToRtf.eRtfCompatibility.OldRtfReaders;
            convert.TableFastProcessing := true;
            convert.TableFitWidthByPage := true;
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
            if message[i].From[0].Name = string.Empty then
              fromstr := 'Nan'
            else
              fromstr := message[i].From[0].Name;
            DB.FillingDB(i.ToString, fromstr, message[i].Date.DateTime.ToString('dd.mm.yyyy hh:mm'), message[i].Subject, '.\\DB\' + message[i].MessageId, checkseen.ToString);
            WriteAllText('.\DB\' + message[i].MessageId, body);
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
      toolStripStatusLabel1.Text := 'Synchronization finished!';
    end;
  except
    on 
    ex: System.Net.Sockets.SocketException do 
    begin
      MessageBox.Show('Network error(Сетевая ошибка)', 'Error!', MessageBoxButtons.OK, MessageBoxIcon.Error);
      networkerror := true;
    end;
  end; 
  addmsgtolist;
end;

procedure Form1.button1_Click(sender: Object; e: EventArgs);
begin
  Sync;
end;

procedure Form1.Form1_Load(sender: Object; e: EventArgs);
begin
  DB.DatabaseOpen('messages.mdb');
end;

procedure Form1.Form1_Validated(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.Form1_Shown(sender: Object; e: EventArgs);
begin
  MessageDB.MessageDBRecSet := AccessDB.OpenRecordset('Message DB');
  if ReadAllText('credentials.txt') = '' then
  begin
    MessageBox.Show('You must enter your credentials in the settings! When you enter credentials, please restart programm. (Вы должны указать свои учетные данные в настройках! Когда вы сделаете это, то перезапустите программу)', 'Error', MessageBoxButtons.OK, MessageBoxIcon.Error);
    Unit2.Form2.Create.Show;
    exit;
  end;
  if Directory.Exists('DB') then
      else
  begin
    MessageBox.Show('Directory "DB" not found! It seems you delete it! All message DB is deleted! (Дериктория "DB" не найдена! Похоже Вы удалили ее! Вся база данных сообщений была удалена!)', '', MessageBoxButtons.OK, MessageBoxIcon.Error);
    MkDir('DB');
  end;
  toolStripStatusLabel1.Text := 'Synchronization started...';  
  var tst := MessageDBRecSet.RecordCount;
  if MessageDBRecSet.RecordCount = 0 then
  begin
    t := new System.Threading.Thread(Sync);
    t.Start;
  end
  else
  begin
    addmsgtolist;
    t := new System.Threading.Thread(Sync);
    t.Start;
  end;
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  Form2.Create.ShowDialog;
end;

procedure Form1.Form1_FormClosing(sender: Object; e: FormClosingEventArgs);
begin
  var msg: System.Windows.Forms.DialogResult := MessageBox.Show('Do you realy want to exit?',
    'Exit',
    MessageBoxButtons.YesNo, 
    MessageBoxIcon.Question);
  if msg = System.Windows.Forms.DialogResult.Yes then
  begin
    t.Abort;
    Halt(0);
  end
  else
    e.Cancel := true;
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

procedure Form1.checkedListBox1_ItemCheck(sender: Object; e: ItemCheckEventArgs);
begin
  
end;

procedure Form1.checkedListBox1_DoubleClick(sender: Object; e: EventArgs);
begin
end;
end.