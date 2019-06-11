// PL/SQL Developer Plug-In demo
// Copyright 1999 Allround Automations
// support@allroundautomations.nl
// http://www.allroundautomations.nl

// This demo shows the use of some basic functions in a practical plug-In that
// implements a wrap function.
// The selected object in the Browser will be saved as a text file and "wrapped"

library Wrap;

uses
  Windows, Dialogs, SysUtils, Classes, Registry;

// Declaration of some PL/SQL Developer callback functions
var
  // We want to save and restore the directory in the registry
  SYS_Registry: function: PChar; cdecl;
  // We need to search the wrap executable in ORACLE_HOME\bin
  SYS_OracleHome: function: PChar; cdecl;

  // The menu item will only be enabled if a program unit is selected in the Browser
  IDE_MenuState: procedure(ID, Index: Integer; Enabled: Bool); cdecl;
  // The currently selected object in the Browser is the one that will be wrapped
  IDE_GetBrowserInfo: procedure(var ObjectType, ObjectOwner, ObjectName: PChar); cdecl;

  // To retrieve the source from the database, we need to query sys.all_source
  SQL_Execute: function(SQL: PChar): Integer; cdecl;
  SQL_Eof: function: Bool; cdecl;
  SQL_Next: function: Integer; cdecl;
  SQL_Field: function(Field: Integer): PChar; cdecl;

var
  PlugInID: Integer;
  WrapExe: string = '';

const // Description of this Plug-In (as displayed in Plug-In configuration dialog)
  Desc = 'Wrap demo version 1.0';

// Determine the name for a temporary file
function TempFilename: string;
var Path: array[0..144] of char;
begin
  GetTempPath(SizeOf(Path), Path);
  Result := Path + 'wrap.tmp';
end;

// Determine the Wrap executable. If more than one is present, use the most
// recent one
procedure GetWrapExe;
var Path: string;
    SearchRec: TSearchRec;
    TimeStamp: Integer;
    Error: Integer;
begin
  Path := SYS_OracleHome + 'bin\';
  Error := FindFirst(Path + 'wrap*.exe', faArchive, SearchRec);
  TimeStamp := 0;
  while Error = 0 do
  begin
    if SearchRec.Time > TimeStamp then
    begin
      WrapExe := Path + SearchRec.Name;
      TimeStamp := SearchRec.Time;
    end;
    Error := FindNext(SearchRec);
  end;
  FindClose(SearchRec);
end;

// Save the currently selected program unit to a temporary file
function SaveProgramUnit: Boolean;
var ObjectType, ObjectOwner, ObjectName: PChar;
    Error: Integer;
    SQL: string;
    Source: TStringList;
    Line: string;
begin
  // Determine what object is selected in the Browser
  IDE_GetBrowserInfo(ObjectType, ObjectOwner, ObjectName);
  // Build a select statement to retrieve the source
  SQL := Format('select text from sys.all_source' +
                ' where type = ''%s'' and owner = ''%s'' and name = ''%s''' +
                ' order by line', [ObjectType, ObjectOwner, ObjectName]);
  // Execute the select statement and retrieve all source lines
  Source := TStringList.Create;
  Error := SQL_Execute(PChar(SQL));
  while (Error = 0) and not SQL_Eof do
  begin
    Line := TrimRight(SQL_Field(0));
    // Add the 'create or replace' syntax on the first line
    if Source.Count = 0 then Line := 'create or replace ' + Line;
    Source.Add(Line);
    Error := SQL_Next;
  end;
  Result := (Error = 0);
  if not Result then
    ShowMessage('SQL error ' + IntToStr(Error))
  else begin
    try
      // Save the text to a temporary file
      Source.SaveToFile(TempFilename);
    except
      on E:Exception do
      begin
        ShowMessage(E.Message);
        Result := False;
      end;
    end;
  end;
  Source.Free;
end;

// Determine the destination file name
function GetDestination: string;
var ObjectType, ObjectOwner, ObjectName: PChar;
    Registry: TRegistry;
    LastDir: string;
begin
  // Determine the last used directory, as stored in the regitsry
  Registry := TRegistry.Create;
  Registry.RootKey := HKEY_CURRENT_USER;
  if Registry.OpenKey(SYS_Registry + '\WrapPlugIn', True) then
    LastDir := Registry.ReadString('LastDir')
  else
    LastDir := '';
  // Determine the object name, to be used as a default filename
  IDE_GetBrowserInfo(ObjectType, ObjectOwner, ObjectName);
  // Create a dialog to ask for a destination filename
  with TSaveDialog.Create(nil) do
  begin
    // Set various properties of the SaveDialog
    Title      := 'Save wrapped output file as';
    DefaultExt := 'plb';
    Filter     := 'Wrapped files (*.plb)|*.plb|All files (*.*)|*.*';
    InitialDir := LastDir;
    Filename   := AnsiLowerCase(ObjectName);
    Options    := [ofOverwritePrompt];
    // Execute it
    if not Execute then
      Result := ''
    else begin
      // Save the destination directory in the registry
      Result := Filename;
      Registry.WriteString('LastDir', ExtractFilePath(Filename));
    end;
  end;
  Registry.Free;
end;

// Wrap the program unit currently selected in the Browser
procedure WrapIt;
var WrapCommand: string;
    Destination: string;
begin
  // Check if we can actually wrap
  if WrapExe = '' then
  begin
    ShowMessage('Wrap executable not found in ' + SYS_OracleHome + 'bin');
    Exit;
  end;
  // Ask for the destination filename
  Destination := GetDestination;
  // If successful, continue
  if Destination <> '' then
  begin
    // Save the currently selected program unit to a temporary file
    if SaveProgramUnit then
    begin
      // If successfully saved, execute the wrap command
      WrapCommand := Format('%s iname="%s" oname="%s"', [WrapExe, TempFilename, Destination]);
      WinExec(PChar(WrapCommand), sw_Normal);
    end;
  end;
end;

// Plug-In identification, a unique identifier is received and
// the description is returned
function IdentifyPlugIn(ID: Integer): PChar;  cdecl;
begin
  PlugInID := ID;
  Result := Desc;
end;

// Registration of PL/SQL Developer callback functions
procedure RegisterCallback(Index: Integer; Addr: Pointer); cdecl;
begin
  case Index of
     2 : @SYS_Registry := Addr;
     4 : @SYS_OracleHome := Addr;
    10 : @IDE_MenuState := Addr;
    13 : @IDE_GetBrowserInfo := Addr;
    40 : @SQL_Execute := Addr;
    42 : @SQL_Eof := Addr;
    43 : @SQL_Next := Addr;
    44 : @SQL_Field := Addr;
  end;
end;

// Creating a menu item
function CreateMenuItem(Index: Integer): PChar;  cdecl;
begin
  Result := '';
  case Index of
    1 : Result := 'Tools / &Wrap program unit...';
  end;
end;

// Depending on the selected object in the Browser, enable/disable the menu item
procedure OnBrowserChange;
var ObjectType, ObjectOwner, ObjectName: PChar;
    Enabled: Boolean;
begin
  IDE_GetBrowserInfo(ObjectType, ObjectOwner, ObjectName);
  Enabled := (ObjectType = 'FUNCTION') or (ObjectType = 'PROCEDURE') or
             (ObjectType = 'PACKAGE')  or (ObjectType = 'PACKAGE BODY') or
             (ObjectType = 'TRIGGER')  or (ObjectType = 'TYPE') or
             (ObjectType = 'TYPE BODY');
  IDE_MenuState(PlugInID, 1, Enabled);
end;

// When the Plug-In gets activated, call OnBrowserChange to de/activate the menu
procedure OnActivate; cdecl;
begin
  if WrapExe = '' then GetWrapExe;
  OnBrowserChange;
end;

// The menu item got selected
procedure OnMenuClick(Index: Integer);  cdecl;
begin
  case Index of
    1 : WrapIt;
  end;
end;

exports // The export functions
  IdentifyPlugIn,
  CreateMenuItem,
  RegisterCallback,
  OnMenuClick,
  OnActivate,
  OnBrowserChange;

end.
