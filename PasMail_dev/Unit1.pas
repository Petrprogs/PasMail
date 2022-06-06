unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, System.Xml.Linq, Unit2, System.IO, System.Xml, MessageDB, Microsoft.Office.Interop.Access.Dao, Microsoft.Win32, Logger;

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
  formatopt := new MimeKit.FormatOptions;
  subjstr := 'Nan';
  attachpath: string;
  log:= new TLogger;
  
type
  Form1 = class(Form)
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure Form1_Load(sender: Object; e: EventArgs);
    procedure Form1_Shown(sender: Object; e: EventArgs);
    procedure toolStripStatusLabel1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure Form1_FormClosing(sender: Object; e: FormClosingEventArgs);
    procedure addmsgtolist();
    procedure Sync;
    procedure CheckedlistBox1_SelectedIndexChanged(sender: Object; e: EventArgs);
    procedure checkedListBox1_KeyDown(sender: Object; e: KeyEventArgs);
    procedure button4_Click(sender: Object; e: EventArgs);
    procedure checkedListBox1_ItemCheck(sender: Object; e: ItemCheckEventArgs);
    procedure webBrowser1_Navigating(sender: Object; e: WebBrowserNavigatingEventArgs);
    procedure button5_Click(sender: Object; e: EventArgs);
    procedure button3_Click(sender: Object; e: EventArgs);
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
    webBrowser1: WebBrowser;
    process1: System.Diagnostics.Process;
    button5: Button;
    toolStripProgressBar1: ToolStripProgressBar;
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
  button3.Visible := false;
  MessageDBRecSet := AccessDB.OpenRecordset('SELECT * FROM MessageDB ORDER BY date DESC');
  var indexcount := CheckedListBox1.SelectedIndex;
  if indexcount = -1 then 
    indexcount := 0;
  webBrowser1.DocumentText := ReadAllText(DB.ReadingDBIndex('path', MessageDBRecSet.RecordCount - indexcount - 1));
  webBrowser1.Document.Encoding := 'windows-1251';
  label1.Text := DB.ReadingDBIndex('from', MessageDBRecSet.RecordCount - 1 - indexcount);
  label4.Text := DB.ReadingDBIndex('subject', MessageDBRecSet.RecordCount - 1 - indexcount);
  label6.Text := DB.ReadingDBIndex('date', MessageDBRecSet.RecordCount - 1 - indexcount);
  if DB.ReadingDBIndex('attachments_path', MessageDBRecSet.RecordCount - 1 - indexcount) = 'Nan' then
  else
    button3.Visible := true;
  MessageDBRecSet.Close;
  GC.Collect();
end;
/// Add messages to chekedlistbox
procedure Form1.addmsgtolist();
begin
  MessageDBRecSet := AccessDB.OpenRecordset('SELECT * FROM MessageDB ORDER BY No DESC');
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
  for var i := 0 to Directory.GetFiles('./DB').Length - 1 do
  begin
    if checkedListBox1.IsHandleCreated then
      CheckedListBox1.SetItemChecked(i, boolean.Parse(DB.ReadingDBIndex('isreaded', MessageDBRecSet.RecordCount - i - 1)));     
  end;
  MessageDBRecSet.Close;
  GC.Collect();
end;

procedure Form1.toolStripStatusLabel1_Click(sender: Object; e: EventArgs);
begin
end;

procedure Form1.Sync();
var
  fromstr := 'Nan';
  networkerror: boolean;
begin
  log.NewEvent('Sync started...');
  try
    begin
      client := new MailKit.Net.Imap.ImapClient;
      statusStrip1.BeginInvoke(toolStripStatusLabel1.GetType);
      toolStripStatusLabel1.Text := 'Connecting to server...';
      networkerror := false;
      Credentials := ReadAllLines('credentials.txt');
      log.NewEvent('Connecting to server...');
      if client.IsConnected then
        else
      begin
        lock client.SyncRoot do
          client.Connect(Credentials[3], 993, true);
      end;
      toolStripStatusLabel1.Text := 'Succesfully connected! Authenticating...';
      log.NewEvent('Connected succesfully!');
      log.NewEvent('Authing...');
      try
        begin
          client.Authenticate(Credentials[0], Credentials[1]);
        end;
      except 
        on InvalidLogin: MailKit.Security.AuthenticationException do
        begin
          MessageBox.Show('Authentication failed on the server, please check the username and password in the settings.', 'Authentication error', MessageBoxButtons.Ok, MessageBoxIcon.Exclamation);
          log.NewEvent('Auth failed - invalid credentials!');
          exit;
        end;
      end;
          // The Inbox folder is always available on all IMAP servers...
     log.NewEvent('Opening inbox folder for read-write');
      inbox := client.Inbox;
	  //Set folder access read and write
      inbox.Open(MailKit.FolderAccess.ReadWrite);
	  // Set toolStripStatusLabel1 text to succesfull auth
	  log.NewEvent('Opening succesfully!');
      toolStripStatusLabel1.Text := 'Succesfully Authenticated! Synchronizating...';
	  // Invoke all statusStrip to properly sync thread
      statusStrip1.BeginInvoke(toolStripProgressBar1.GetType);
	  // Set maximum of progress bar
      toolStripProgressBar1.Maximum := inbox.Count - 1;
	  //Main cycle of sync
	  log.NewEvent('Checking for new messages...');
      for var i := 0 to (inbox.Count - 1) do
      begin
	  //Set progressbar value to cycle inumirator
        toolStripProgressBar1.Value := i;
        var body: string;
		//Sync thread
        lock inbox.SyncRoot do
		//Get one message
          message[i] := inbox.GetMessage(i);
		  //Checking the message on availability
        if System.IO.File.Exists('./DB/' + message[i].MessageId.Replace('\', string.Empty).Replace('/', string.Empty) + '.html') then 
          log.NewEvent('Message already availlable!')
            else
        begin
		// If the message has no html body then use plain text body
		log.NewEvent('New message found!');
          if message[i].HtmlBody = '' then
            body := message[i].TextBody
          else
            body := message[i].HtmlBody;
			//Checking the message for seen
          var fetch := inbox.Fetch(i, i, MailKit.MessageSummaryItems.Flags);
          var checkseen := fetch[0].Flags.Value.HasFlag(MailKit.MessageFlags.Seen);
          if message[i].From[0].Name = string.Empty then
            fromstr := 'Nan'
          else
            fromstr := message[i].From[0].Name;
          if message[i].Subject = '' then
            subjstr := 'Nan'
          else
            subjstr := message[i].Subject;
			// Open DB recordes for writing
          MessageDBRecSet := AccessDB.OpenRecordset('MessageDB');
		  // Write body to file
		  log.NewEvent('Writing new message...');
          System.IO.File.AppendAllText('.\DB\' + message[i].MessageId.Replace('\', string.Empty).Replace('/', string.Empty) + '.html', body, Encoding.GetEncoding('windows-1251'));
		  // Check for attachments
          foreach var attachment in message[I].BodyParts do
          begin
            if attachment.IsAttachment then
            begin
              System.IO.Directory.CreateDirectory('.\DB\Attachments\' + message[i].MessageId).Create;
              attachment.WriteTo('.\DB\Attachments\' + message[i].MessageId + '\' + attachment.ContentType.Name, true);
              var decarr := Convert.FromBase64String(ReadAllText('.\DB\Attachments\' + message[i].MessageId + '\' + attachment.ContentType.Name));
              var decstr := Encoding.Default.GetString(decarr);
              var fileinfo := new System.IO.FileInfo('.\DB\Attachments\' + message[i].MessageId);
              fileInfo.IsReadOnly := false;
              System.IO.File.WriteAllText('.\DB\Attachments\' + message[i].MessageId + '\' + attachment.ContentType.Name, decstr, Encoding.Default);
              attachpath := '.\DB\Attachments\' + message[i].MessageId;
            end
            else
              attachpath := 'Nan'
          end;
		  // Fill the DB
          DB.FillingDB(i, message[i].Date.DateTime, fromstr, subjstr, '.\\DB\' + message[i].MessageId.Replace('\', string.Empty).Replace('/', string.Empty) + '.html', checkseen, attachpath);
          log.NewEvent('Writing succesfull!');
        end;   
      end;
	  // Collect garbage
      GC.Collect();
	  // Set toolStripStatusLabel1 to "succesfully synced"
      toolStripStatusLabel1.Text := 'Succesfully Synchronizated!';
      log.NewEvent('Succesfully Synchronizated!');
    end;
  
  //Catch network exception
  except
    on 
    ex: System.Net.Sockets.SocketException do 
    begin
      MessageBox.Show('Network error(Сетевая ошибка)', 'Error!', MessageBoxButtons.OK, MessageBoxIcon.Error);
      networkerror := true;
      log.NewEvent('Network error - check internet connection!');
      exit;
    end;
  end; 
  // Close inbox folder
  inbox.Close;
  // Disconnect from IMAP server
  client.Disconnect(true);
  // Destroy variable
  client := nil;
  // Add all messages to list
  addmsgtolist;  
  t.Abort;
end;

//Manual sync
procedure Form1.button1_Click(sender: Object; e: EventArgs);
begin
// Destroy t variable
  t := nil;
  // Initialize again
  t := new System.Threading.Thread(Sync);
  //Start thread
  t.Start;
end;

procedure Form1.Form1_Load(sender: Object; e: EventArgs);
begin
end;

procedure Form1.Form1_Shown(sender: Object; e: EventArgs);
begin
 // Write line to log, that app is started
  log.NewEvent('Pasmail starting!');
// Open DB
  DB.DatabaseOpen('messages.mdb');
  // Open  recordset
  MessageDBRecSet := AccessDB.OpenRecordset('SELECT * FROM MessageDB ORDER BY date DESC');
  // If credentials.txt is empty, then a message will be displayed about the need to enter a username and password
  log.NewEvent('Checking for credentials...');
  if ReadAllText('credentials.txt') = '' then
  begin
    MessageBox.Show('You must enter your credentials in the settings! When you enter credentials, please restart programm. (Вы должны указать свои учетные данные в настройках! Когда вы сделаете это, то перезапустите программу)', 'Error', MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
    Unit2.Form2.Create.Show;
  end;
  log.NewEvent('Succesfull!');
  //Checking the DB folder on availability. If it is empty, then show the message
  log.NewEvent('Checking for DB...');
  if Directory.Exists('DB') then
      else
  begin
    MessageBox.Show('Directory "DB" not found! It seems you delete it! All message DB is deleted! (Дериктория "DB" не найдена! Похоже Вы удалили ее! Вся база данных сообщений была удалена!)', '', MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
    MkDir('DB');
    MkDir('./DB/Attachments');
    exit;
  end;
  log.NewEvent('Succesfull!');
  // If now messages found, start the sync thread
  if MessageDBRecSet.RecordCount = 0 then
  begin
    t := new System.Threading.Thread(Sync);
    t.Start;
  end
  else
  begin
  // Else add it to list and start sync
    addmsgtolist;
    t := new System.Threading.Thread(Sync);
    t.Start;
  end;
  log.NewEvent('Pasmail started succesfully!');
end;

// Settings button
procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
// Show the settings form
  Form2.Create.ShowDialog;
end;

// Closing event hansdler
procedure Form1.Form1_FormClosing(sender: Object; e: FormClosingEventArgs);
begin
// Show message about exiting
  var msg: System.Windows.Forms.DialogResult := MessageBox.Show('Do you realy want to exit?',
    'Exit',
    MessageBoxButtons.YesNo, 
    MessageBoxIcon.Question);
  if msg = System.Windows.Forms.DialogResult.Yes then
  begin
    if t is System.Threading.Thread then
      t.Abort;
    MessageDB.AccessDB.Close;
    client := nil;
    log.NewEvent('Pasmail closed!');
    Halt(0);
  end
  else
    e.Cancel := true;
end;
// Key down event handler
procedure Form1.CheckedlistBox1_KeyDown(sender: Object; e: KeyEventArgs);
begin
// If delete key pressed, then delete the selected message
  if e.KeyCode = System.Windows.Forms.Keys.Delete then
  begin
    MessageDBRecSet := AccessDB.OpenRecordset('SELECT * FROM MessageDB ORDER BY date DESC');
    MessageDBRecSet.MoveFirst;
    var countindex := MessageDBRecSet.RecordCount;
    var indexcount := CheckedListBox1.SelectedIndex;
    if indexcount = -1 then 
      indexcount := 0;
    client := new MailKit.Net.Imap.ImapClient;
    client.Connect('imap.yandex.ru', 993, true);
    client.Authenticate(Credentials[0], Credentials[1]);
    inbox := client.Inbox;
    inbox.Open(MailKit.FolderAccess.ReadWrite);
    inbox.AddFlags(MessageDBRecSet.RecordCount - indexcount - 1, MailKit.MessageFlags.Deleted, false);
	// Delete body files
    DeleteFile(DB.ReadingDBIndex('path', countindex - indexcount - 1));
	// TODO delete attachments files
    MessageDBRecSet.FindFirst('[No] =' + (countindex - indexcount - 1).ToString);
    MessageDBRecSet.Delete;
    MessageDBRecSet.MoveFirst;
    MessageDBRecSet.Edit;
    MessageDBRecSet.MoveFirst;
	// Refresh the No field
    for var index := MessageDBRecSet.RecordCount - 1 downto 0 do
    begin
      MessageDBRecSet.Edit;
      MessageDBRecSet.Fields['No'].Value := index;
      MessageDBRecSet.Update;
      MessageDBRecSet.MoveNext;
    end;
	// Close recordset
    MessageDBRecSet.Close;
	// Remove item in listbox
    checkedListBox1.Items.RemoveAt(indexcount);
  end;
end;

procedure Form1.button4_Click(sender: Object; e: EventArgs);
begin
  //TODO 
  //  Create a help page and exec it here
end;

procedure Form1.checkedListBox1_ItemCheck(sender: Object; e: ItemCheckEventArgs);
begin
// Prevevent checkboxes from checking manualy
  if e.Index = checkedListBox1.SelectedIndex then
    e.NewValue := e.CurrentValue;
end;

// Prevent navigating to other ppages in internetexplorer
procedure Form1.webBrowser1_Navigating(sender: Object; e: WebBrowserNavigatingEventArgs);
begin
  if e.Url.ToString = 'about:blank' then
    else
  begin
    e.Cancel := true;
    var startinfo := new System.Diagnostics.ProcessStartInfo;
    startinfo.FileName := e.Url.ToString;
	// Start the default browser for link
    process1.StartInfo := startinfo;
    process1.Start;
  end;
end;
// Delete message
procedure Form1.button5_Click(sender: Object; e: EventArgs);
begin
  MessageDBRecSet := AccessDB.OpenRecordset('SELECT * FROM MessageDB ORDER BY date DESC');
    MessageDBRecSet.MoveFirst;
    var countindex := MessageDBRecSet.RecordCount;
    var indexcount := CheckedListBox1.SelectedIndex;
    if indexcount = -1 then 
      indexcount := 0;
   client := new MailKit.Net.Imap.ImapClient;
    client.Connect('imap.yandex.ru', 993, true);
    client.Authenticate(Credentials[0], Credentials[1]);
    inbox := client.Inbox;
    inbox.Open(MailKit.FolderAccess.ReadWrite);
    inbox.MoveTo(MessageDBRecSet.RecordCount - indexcount - 1, client.GetFolder(MailKit.SpecialFolder.Trash));
    //inbox.AddFlags(MessageDBRecSet.RecordCount - indexcount - 1, MailKit.MessageFlags.Deleted, false);}
	// TODO delete attachments files
    DeleteFile(DB.ReadingDBIndex('path', countindex - indexcount - 1));
    MessageDBRecSet.FindFirst('[No] =' + (countindex - indexcount - 1).ToString);
    MessageDBRecSet.Delete;
    MessageDBRecSet.MoveFirst;
    MessageDBRecSet.Edit;
    MessageDBRecSet.MoveFirst;
    for var index := MessageDBRecSet.RecordCount - 1 downto 0 do
    begin
      MessageDBRecSet.Edit;
      MessageDBRecSet.Fields['No'].Value := index;
      MessageDBRecSet.Update;
      MessageDBRecSet.MoveNext;
    end;
    MessageDBRecSet.Close;
    checkedListBox1.Items.RemoveAt(indexcount);
end;

procedure Form1.button3_Click(sender: Object; e: EventArgs);
begin
// Open explorer with attachments folder for currents message
  var indexcount := CheckedListBox1.SelectedIndex;
  if indexcount = -1 then 
    indexcount := 0;
  MessageDBRecSet := AccessDB.OpenRecordset('SELECT * FROM MessageDB ORDER BY date DESC');  
  Execute('explorer', DB.ReadingDBIndex('attachments_path', MessageDBRecSet.RecordCount - 1 - indexcount));
end;
end.