unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, SynEditExport, SynExportHTML, SynEdit,
  SynMemo, SynEditHighlighter, SynHighlighterJava;

type
  TMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuFile: TMenuItem;
    OpenProject: TMenuItem;
    CloseApp: TMenuItem;
    MenuAbout: TMenuItem;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    SaveProject: TMenuItem;
    Tree: TMemo;
    Editor: TRichEdit;
    RichEdit1: TRichEdit;
    procedure RichEdit1Change(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure SaveProjectClick(Sender: TObject);
    procedure OpenProjectClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Main: TMain;
  FName: string;

implementation

{$R *.dfm}

procedure HTMLSyntax(RichEdit: TRichEdit; TextCol, TagCol, DopCol: TColor);
var  i, iDop : integer;
  s    : string;
  Col  : TColor;
  isTag, isDop: boolean;

begin { HTMLSyntax }
  iDop := 0; 
  isDop := False; 
  isTag := False; 
  Col := TextCol; 
//  RichEdit.SetFocus;
  //   RichEdit.SelStart := i;
//  RichEdit.Lines.SaveToStream('test.txt');
  for i := 0 to Length(RichEdit.Text) do
  begin

    RichEdit.SelStart := i;
    RichEdit.SelLength := 1;
   s := RichEdit.SelText;

    if (s='<') or (s=char(123)) then
      isTag := True; 

    if isTag then
      if (s=char(34)) then 
        if not isDop then 
        begin 
          iDop := 1; 
          isDop := True
        end { not isDop } 
        else 
          isDop := False; 
    
    if isTag then 
      if isDop then 
      begin 
        if iDop<>1 then 
          Col := DopCol
      end { isDop } 
      else 
        Col := TagCol 
    else 
      Col := TextCol;
    RichEdit.SelAttributes.Color := Col;

    iDop := 0; 
    
    if (s='>') or (s=char(125)) then 
      isTag := False
  end; { for i }
  RichEdit.SelLength := 0
end; { HTMLSyntax }

procedure TMain.EditorChange(Sender: TObject);
begin
   // Editor.Lines.BeginUpdate;
    HTMLSyntax(Editor, clBlue, clRed, clGreen);
   // Editor.Lines.EndUpdate
end;

procedure TMain.OpenProjectClick(Sender: TObject);
var sr: TSearchRec;

begin
 if OpenFile.Execute then
 begin
  FName := OpenFile.FileName;
  Editor.Lines.LoadFromFile(FName);
end;

begin
 Tree.Clear;
 if FindFirst('*.*', faAnyFile, sr) = 0 then
  begin
  repeat
  Tree.Lines.Add(sr.Name);
  until FindNext(sr) <> 0;
  FindClose(sr);
end;
end;
end;

procedure TMain.RichEdit1Change(Sender: TObject);

var  fs: TFileStream;
     s : string;
begin
    s := RichEdit1.SelText;
 begin
   fs := tfilestream.create('D:\projects\Delphi\front-editor-master\front-editor\test.dat', fmCreate);
//   fs := TFileStream.Create('temp.txt', fmCreate or fmOpenWrite);
   fs.Write(s, Length(s));// this will give you garbage
   fs.Write(PChar(s)^, Length(s));// this is the correct way
end;
end;


procedure TMain.SaveProjectClick(Sender: TObject);
begin
SaveFile.FileName := FName;
if SaveFile.Execute then
 begin
  FName := SaveFile.FileName;
  Editor.Lines.SaveToFile(FName);
end;
end;

{
procedure caststring;
 var
   fs: TFileStream;
 const
   s: string = 'Hello';
 begin
   fs := TFileStream.Create('temp.txt', fmCreate or fmOpenWrite);
   fs.Write(s, Length(s));// this will give you garbage
   fs.Write(PChar(s)^, Length(s));// this is the correct way
 end;
 }

 procedure WriteStringToStream(stream: TStream; const appendText: string);
begin
  stream.WriteBuffer(Pointer(appendText)^,
   Length(appendText)*SizeOf(Char));
end;

end.
