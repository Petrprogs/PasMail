unit MessageDB;

interface

uses 
  System, Microsoft.Office.Interop.Access, Microsoft.Office.Interop.Access.Dao;

var
  AccessDB: Microsoft.Office.Interop.Access.Dao.Database;
  AccessDBEngine: Microsoft.Office.Interop.Access.Dao.DBEngineClass;
  MessageDBRecSet: Microsoft.Office.Interop.Access.Dao.Recordset;

type
  TMessageDB = class
    procedure CreateNewTable(TableName: String);
    procedure DatabaseCreate(DatabaseName: String);
    procedure DatabaseOpen(DatabaseName: String);
    procedure FillingDB(no: integer; date: DateTime; from, subject, path: string; isreaded: boolean; attachments: string);
    function ReadingDB(name: string): string;
    function ReadingDBIndex(name: string; index: integer): string;
  end;

implementation

procedure MessageDB.TMessageDB.CreateNewTable(TableName: String);
var
  TableDefNew: Microsoft.Office.Interop.Access.Dao.TableDef;

begin  
  // Create a new TableDef object
  TableDefNew := AccessDB.CreateTableDef(TableName);
  TableDefNew.Fields.Append(TableDefNew.CreateField('No', DataTypeEnum.dbLong));
  TableDefNew.Fields.Append(TableDefNew.CreateField('from', DataTypeEnum.dbText));
  TableDefNew.Fields.Append(TableDefNew.CreateField('date', DataTypeEnum.dbDate));
  TableDefNew.Fields.Append(TableDefNew.CreateField('subject', DataTypeEnum.dbText));
  TableDefNew.Fields.Append(TableDefNew.CreateField('path', DataTypeEnum.dbText));
  TableDefNew.Fields.Append(TableDefNew.CreateField('isreaded', DataTypeEnum.dbBoolean));
  TableDefNew.Fields.Append(TableDefNew.CreateField('attachments_path', DataTypeEnum.dbText));
  AccessDB.TableDefs.Append(TableDefNew);
end;

  // Create the database
procedure MessageDB.TMessageDB.DatabaseCreate(DatabaseName: String);
begin
  // Create new empty database
  AccessDB := AccessDBEngine.CreateDatabase(DatabaseName, LanguageConstants.dbLangGeneral);
  CreateNewTable('MessageDB');
  AccessDB.Close;
end;

// Open the database connection with the property settings

procedure MessageDB.TMessageDB.DatabaseOpen(DatabaseName: String);
begin
  AccessDBEngine := new Microsoft.Office.Interop.Access.Dao.DBEngineClass;  
  if not FileExists(DatabaseName) then
    DatabaseCreate(DatabaseName);  
  AccessDB := AccessDBEngine.OpenDatabase(DatabaseName);  
end;
/// Filling DB
procedure MessageDB.TMessageDB.FillingDB(no: integer; date: DateTime; from, subject, path: string; isreaded: boolean; attachments: string);
var
  NoFld, FromFld, DateFld, SubjectFld, PathFld, IsreadedFld, AttachmentsPathFld: Microsoft.Office.Interop.Access.Dao.Field;
begin
   // Declare fields for the populating new records into table
  NoFld := MessageDBRecSet.Fields.Item['No'];
  FromFld := MessageDBRecSet.Fields.Item['from'];
  DateFld := MessageDBRecSet.Fields.Item['date'];
  SubjectFld := MessageDBRecSet.Fields.Item['subject'];
  PathFld := MessageDBRecSet.Fields.Item['path'];
  IsreadedFld := MessageDBRecSet.Fields.Item['isreaded'];
  AttachmentsPathFld := MessageDBRecSet.Fields.Item['attachments_path'];
  MessageDBRecSet.AddNew;
  NoFld.Value := no;
  FromFld.Value := from;
  DateFld.Value := date;
  SubjectFld.Value := subject;
  PathFld.Value := path;
  IsreadedFld.Value := isreaded;
  AttachmentsPathFld.Value := attachments;
  MessageDBRecSet.Update;
  MessageDBRecSet.Close;
end;
//Simple DB reading
function MessageDB.TMessageDB.ReadingDB(name: string): string;
begin
  if not MessageDBRecSet.EOF then
  begin
    MessageDBRecSet.MoveNext;
    if MessageDBRecSet.EOF then
    begin
      MessageDBRecSet.MoveLast;
      ReadingDB := MessageDBRecSet.Fields[name].Value.ToString;
    end
    else 
      ReadingDB := MessageDBRecSet.Fields[name].Value.ToString;
  end;
end;
//Reading DB with index
function MessageDB.TMessageDB.ReadingDBIndex(name: string; index: integer): string;
begin
  MessageDBRecSet.MoveFirst;
  var test := MessageDBRecSet.Fields['No'].Value.ToString.ToInteger;
  if test = index then
    ReadingDBIndex := MessageDBRecSet.Fields[name].Value.ToString
  else
  begin
    repeat
      MessageDBRecSet.MoveNext;
      test := MessageDBRecSet.Fields['No'].Value.ToString.ToInteger;
    until test = index;
    ReadingDBIndex := MessageDBRecSet.Fields[name].Value.ToString;
  end;
end;

end.