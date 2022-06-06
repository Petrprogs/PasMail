unit Logger;

interface

uses 
  System, System.IO;

type
  TLogger = class
    procedure NewEvent(text: string);
  end;

implementation

//Write new event to log
procedure Logger.TLogger.NewEvent(text: string);
begin
  System.IO.File.AppendAllText('./pasmail.log', DateTime.Now.ToString('dd.MM.yyyy hh:mm') + ' : ' + text + NewLine);
end;
end.