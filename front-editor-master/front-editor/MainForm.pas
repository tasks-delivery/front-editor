unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, SynEditExport, SynExportHTML, SynEdit,
  SynMemo, SynEditHighlighter, SynHighlighterJava, SynHighlighterHtml, ImgList,
  ToolWin;

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
    Editor: TSynMemo;
    SynHTMLSyn1: TSynHTMLSyn;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    htmlTemplate: TToolButton;
    ToolButton3: TToolButton;
    About1: TMenuItem;
    HTML1: TMenuItem;
    procedure htmlTemplateClick(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
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

procedure TMain.HTML1Click(Sender: TObject);
begin
     Editor.Enabled := True;
     Editor.Lines.Clear;
     Editor.Lines.Add('<!doctype html>');
     Editor.Lines.Add(' <html lang="en">');
     Editor.Lines.Add('  <head>');
     Editor.Lines.Add('   <title></title>');
     Editor.Lines.Add('    <meta charset="utf-8">');
     Editor.Lines.Add('  </head>');
     Editor.Lines.Add('   <body>');
     Editor.Lines.Add('');
     Editor.Lines.Add('   </body>');
     Editor.Lines.Add(' </html>');
end;

procedure TMain.htmlTemplateClick(Sender: TObject);
begin
   HTML1.Click;
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

procedure TMain.SaveProjectClick(Sender: TObject);
begin
SaveFile.FileName := FName;
if SaveFile.Execute then
 begin
  FName := SaveFile.FileName;
  Editor.Lines.SaveToFile(FName);
end;
end;

end.
