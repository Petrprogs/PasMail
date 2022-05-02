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
    procedure FillingDB(no, from, date, subject, path, isreaded: string);
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
  TableDefNew.Fields.Append(TableDefNew.CreateField('No', DataTypeEnum.dbText, 10));
  TableDefNew.Fields.Append(TableDefNew.CreateField('from', DataTypeEnum.dbText, 100));
  TableDefNew.Fields.Append(TableDefNew.CreateField('date', DataTypeEnum.dbText, 100));
  TableDefNew.Fields.Append(TableDefNew.CreateField('subject', DataTypeEnum.dbText, 100));
  TableDefNew.Fields.Append(TableDefNew.CreateField('path', DataTypeEnum.dbText, 150));
  TableDefNew.Fields.Append(TableDefNew.CreateField('isreaded', DataTypeEnum.dbText, 10));
  AccessDB.TableDefs.Append(TableDefNew);
end;

  // Create the database
procedure MessageDB.TMessageDB.DatabaseCreate(DatabaseName: String);
begin
  // Create new empty database
  AccessDB := AccessDBEngine.CreateDatabase(DatabaseName, LanguageConstants.dbLangGeneral);
  CreateNewTable('Message DB');
  AccessDB.Close;
end;

// Open the database connection with the property settings

procedure MessageDB.TMessageDB.DatabaseOpen(DatabaseName: String);
begin
  AccessDBEngine := new Microsoft.Office.Interop.Access.Dao.DBEngineClass;  
  if not FileExists(DatabaseName) then
    DatabaseCreate(DatabaseName);  
  AccessDB := AccessDBEngine.OpenDatabase(DatabaseName);  
  MessageDBRecSet := AccessDB.OpenRecordset('Message DB', RecordsetTypeEnum.dbOpenDynaset);
  try
    MessageDBRecSet.MoveLast;
    MessageDBRecSet.MoveFirst
  except
    on ex: Exception do
  end;
end;
/// Filling DB
procedure MessageDB.TMessageDB.FillingDB(no, from, date, subject, path, isreaded: string);
var
  NoFld, FromFld, DateFld, SubjectFld, PathFld, IsreadedFld: Microsoft.Office.Interop.Access.Dao.Field;
begin
  MessageDBRecSet := AccessDB.OpenRecordset('Message DB', RecordsetTypeEnum.dbOpenDynaset);
   // Declare fields for the populating new records into table
  NoFld := MessageDBRecSet.Fields.Item['No'];
  FromFld := MessageDBRecSet.Fields.Item['from'];
  DateFld := MessageDBRecSet.Fields.Item['date'];
  SubjectFld := MessageDBRecSet.Fields.Item['subject'];
  PathFld := MessageDBRecSet.Fields.Item['path'];
  IsreadedFld := MessageDBRecSet.Fields.Item['isreaded'];
  MessageDBRecSet.AddNew;
  NoFld.Value := no;
  FromFld.Value := from;
  DateFld.Value := date;
  SubjectFld.Value := subject;
  PathFld.Value := path;
  IsreadedFld.Value := isreaded;
  MessageDBRecSet.Update;
  MessageDBRecSet.Close;
end;

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
      test:= MessageDBRecSet.Fields['No'].Value.ToString.ToInteger;
    until test = index;
  ReadingDBIndex := MessageDBRecSet.Fields[name].Value.ToString;
  end;
end;
end.