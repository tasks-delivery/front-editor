unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, SynEditExport, SynExportHTML, SynEdit,
  SynMemo, SynEditHighlighter, SynHighlighterHtml, ImgList,
  ToolWin, SynHighlighterCSS, Buttons, ShellCtrls, ShellApi;

type
  TMain = class(TForm)
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    OpenProject: TMenuItem;
    CloseApp: TMenuItem;
    MenuAbout: TMenuItem;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    Editor: TSynMemo;
    SynHTMLSyn: TSynHTMLSyn;
    ImageList: TImageList;
    ToolBar: TToolBar;
    About: TMenuItem;
    HTML: TMenuItem;
    SynCssSyn: TSynCssSyn;
    Saveas: TMenuItem;
    Edit: TMenuItem;
    New: TMenuItem;
    View: TMenuItem;
    FontDialog: TFontDialog;
    Packagejson: TMenuItem;
    SaveF: TBitBtn;
    OpenF: TBitBtn;
    ToolButton1: TToolButton;
    HtmlTemplate: TBitBtn;
    JsTemplate: TBitBtn;
    ToolButton2: TToolButton;
    Support: TBitBtn;
    ClearEditor: TBitBtn;
    TextStyle: TBitBtn;
    PageEditor: TPageControl;
    NewFile: TBitBtn;
    Tree: TShellTreeView;
    Terminal: TBitBtn;
    procedure TerminalClick(Sender: TObject);
    procedure SupportClick(Sender: TObject);
    procedure CloseAppClick(Sender: TObject);
    procedure TreeClick(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure NewFileClick(Sender: TObject);
    procedure ClearEditorClick(Sender: TObject);
    procedure TextStyleClick(Sender: TObject);
    procedure JsTemplateClick(Sender: TObject);
    procedure OpenFClick(Sender: TObject);
    procedure PackagejsonClick(Sender: TObject);
    procedure SaveFClick(Sender: TObject);
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
  NewTab: TTabSheet;
  NewSynEdit: TSynEdit;

implementation

{$R *.dfm}

procedure TMain.NewClick(Sender: TObject);
begin
   NewFile.Click;
end;

procedure TMain.NewFileClick(Sender: TObject);
begin
  NewTab := TTabSheet.Create(PageEditor);
  with NewTab do
  begin
    PageControl := PageEditor;
    Caption := 'Tab' + IntToStr(PageEditor.Tag + 1);
  end;
  NewSynEdit := TSynEdit.Create(NewTab);
  with NewSynEdit do
  begin
  Highlighter:=SynHTMLSyn;
    Parent := NewTab;
    Align := alClient;
    Clear;
  end;
  PageEditor.ActivePageIndex := PageEditor.PageCount - 1;
  Saveas.Click;
  end;

procedure TMain.TerminalClick(Sender: TObject);
begin
WinExec('cmd /c start cmd.exe', SW_SHOW)
end;

procedure TMain.ClearEditorClick(Sender: TObject);
begin
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
end;

procedure TMain.CloseAppClick(Sender: TObject);
begin
Close;
end;

procedure TMain.HTMLClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  NewFile.Click;
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<!doctype html>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' <html lang="en">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  <head>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('   <title></title>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <meta charset="utf-8">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  </head>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('   <body>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('   </body>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' </html>');
  end
  else
   Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<!doctype html>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' <html lang="en">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  <head>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('   <title></title>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <meta charset="utf-8">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  </head>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('   <body>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('   </body>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' </html>');
end;

procedure TMain.htmlTemplateClick(Sender: TObject);
begin
   HTML.Click;
end;

procedure TMain.JsTemplateClick(Sender: TObject);
begin
    Packagejson.Click;
end;

procedure TMain.OpenFClick(Sender: TObject);
begin
   OpenProject.Click;
end;

procedure TMain.OpenProjectClick(Sender: TObject);
begin
if OpenFile.Execute then begin
  NewTab := TTabSheet.Create(PageEditor);
  with NewTab do
  begin
    PageControl := PageEditor;
    Caption := FName;
  end;
  NewSynEdit := TSynEdit.Create(NewTab);
  with NewSynEdit do
  begin
  Highlighter:=SynHTMLSyn;
    Parent := NewTab;
    Align := alClient;
    Clear;
  end;
  FName := OpenFile.FileName;
  Editor.Enabled := True;
  PageEditor.ActivePageIndex := PageEditor.PageCount - 1;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.LoadFromFile(FName);
  end;
end;

procedure TMain.PackagejsonClick(Sender: TObject);
begin
  if PageEditor.PageCount = 0 then
begin
     NewFile.Click;
     Editor.Enabled := True;
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('{');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "name": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "private": true,');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "version": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "description": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "repository": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' license": "MIT",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "devDependencies": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": "^"');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             },');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "scripts": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": ""');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             }');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
     end
     else
     Editor.Enabled := True;
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('{');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "name": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "private": true,');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "version": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "description": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "repository": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' license": "MIT",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "devDependencies": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": "^"');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             },');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "scripts": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": ""');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             }');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
end;

procedure TMain.SaveasClick(Sender: TObject);
begin
  SaveFile.FileName := FName;
  if PageEditor.ActivePageIndex >= 0 then
  if SaveFile.Execute then begin
  begin
    FName := SaveFile.FileName;
    Editor.Enabled := True;
    (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.SaveToFile(FName);
end;
end;
end;

procedure TMain.SaveFClick(Sender: TObject);
begin
  Saveas.Click;
end;

procedure TMain.SupportClick(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://github.com/tasks-delivery/front-editor', nil, nil, SW_SHOW);
end;

procedure TMain.TextStyleClick(Sender: TObject);
begin
  View.Click
end;

procedure TMain.TreeClick(Sender: TObject);
var F: TShellFolder;
begin
 F := Tree.SelectedFolder;
 if Assigned(F) then
   if not F.IsFolder then
   begin
   OpenProject.Click;
end;
end;

procedure TMain.ViewClick(Sender: TObject);
begin
if FontDialog.Execute then
Editor.Font := FontDialog.Font;
end;



end.
