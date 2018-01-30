unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, SynEditExport, SynExportHTML, SynEdit,
  SynMemo, SynEditHighlighter, SynHighlighterJava, SynHighlighterHtml, ImgList,
  ToolWin, SynHighlighterCSS;

type
  TMain = class(TForm)
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    OpenProject: TMenuItem;
    CloseApp: TMenuItem;
    MenuAbout: TMenuItem;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    SaveProject: TMenuItem;
    Tree: TMemo;
    Editor: TSynMemo;
    SynHTMLSyn: TSynHTMLSyn;
    ImageList: TImageList;
    ToolBar: TToolBar;
    htmlTemplate: TToolButton;
    Style: TToolButton;
    About: TMenuItem;
    HTML: TMenuItem;
    SynCssSyn: TSynCssSyn;
    Saveas: TMenuItem;
    Edit: TMenuItem;
    New: TMenuItem;
    Undo: TMenuItem;
    Redo: TMenuItem;
    Cut: TMenuItem;
    Copy: TMenuItem;
    Paste: TMenuItem;
    View: TMenuItem;
    FontDialog: TFontDialog;
    Packagejson1: TMenuItem;
    procedure Packagejson1Click(Sender: TObject);
    procedure StyleClick(Sender: TObject);
    procedure ViewClick(Sender: TObject);
    procedure SaveasClick(Sender: TObject);
    procedure htmlTemplateClick(Sender: TObject);
    procedure HTMLClick(Sender: TObject);
    procedure OpenProjectClick(Sender: TObject);
  private
  public
  end;

var
  Main: TMain;
  FName: string;

implementation

{$R *.dfm}

procedure TMain.HTMLClick(Sender: TObject);
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
     FName := '';
end;

procedure TMain.htmlTemplateClick(Sender: TObject);
begin
   HTML.Click;
end;

procedure TMain.OpenProjectClick(Sender: TObject);
var sr: TSearchRec;

begin
 if OpenFile.Execute then
 begin
  FName := OpenFile.FileName;
  Editor.Enabled := True;
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

procedure TMain.Packagejson1Click(Sender: TObject);
begin
     Editor.Enabled := True;
     Editor.Lines.Clear;
     Editor.Lines.Add('{');
     Editor.Lines.Add(' "name": "",');
     Editor.Lines.Add(' "private": true,');
     Editor.Lines.Add(' "version": "",');
     Editor.Lines.Add(' "description": "",');
     Editor.Lines.Add(' "repository": "",');
     Editor.Lines.Add(' license": "MIT",');
     Editor.Lines.Add(' "devDependencies": {');
     Editor.Lines.Add('             "": "^"');
     Editor.Lines.Add('             },');
     Editor.Lines.Add(' "scripts": {');
     Editor.Lines.Add('             "": ""');
     Editor.Lines.Add('             }');
     Editor.Lines.Add('}');
     FName := '';
end;

procedure TMain.SaveasClick(Sender: TObject);
begin
SaveFile.FileName := FName;
if SaveFile.Execute then
 begin
  FName := SaveFile.FileName;
    Editor.Enabled := True;
  Editor.Lines.SaveToFile(FName);
end;
end;

procedure TMain.StyleClick(Sender: TObject);
begin
  View.Click;
end;

procedure TMain.ViewClick(Sender: TObject);
begin
if FontDialog.Execute then
Editor.Font := FontDialog.Font;
end;

end.
