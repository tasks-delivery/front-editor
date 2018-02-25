unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, SynEditExport, SynExportHTML, SynEdit,
  SynMemo, SynEditHighlighter, SynHighlighterHtml, ImgList,
  ToolWin, SynHighlighterCSS, Buttons, ShellCtrls, ShellApi, SynHighlighterJava,
  SynHighlighterXML, SynHighlighterSQL, SynHighlighterJScript;

type
  TMain = class(TForm)
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuItemOpenFile: TMenuItem;
    MenuItemCloseApp: TMenuItem;
    MenuTemplate: TMenuItem;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    Editor: TSynMemo;
    SynHTMLSyn: TSynHTMLSyn;
    ImageList: TImageList;
    NavigationPanel: TToolBar;
    MenuAbout: TMenuItem;
    MenuItemHTML: TMenuItem;
    SynCssSyn: TSynCssSyn;
    MenuItemSaveas: TMenuItem;
    MenuEdit: TMenuItem;
    MenuItemNew: TMenuItem;
    MenuItemView: TMenuItem;
    FontDialog: TFontDialog;
    MenuItemJS: TMenuItem;
    BtnSaveF: TBitBtn;
    BtnOpenF: TBitBtn;
    ToolButton1: TToolButton;
    BtnHtmlTemplate: TBitBtn;
    BtnJsTemplate: TBitBtn;
    ToolButton2: TToolButton;
    BtnSupport: TBitBtn;
    BtnClearEditor: TBitBtn;
    BtnTextStyle: TBitBtn;
    PageEditor: TPageControl;
    BtnNewFile: TBitBtn;
    Tree: TShellTreeView;
    BtnTerminal: TBitBtn;
    MenuItemOpenTerminal: TMenuItem;
    SynJavaSyn: TSynJavaSyn;
    SynJScriptSyn: TSynJScriptSyn;
    SynSQLSyn: TSynSQLSyn;
    SynXMLSyn: TSynXMLSyn;
    MenuItemJava: TMenuItem;
    MenuItemSQL: TMenuItem;
    MenuItemXML: TMenuItem;
    MenuItemCSS: TMenuItem;
    BtnJavaTemplate: TBitBtn;
    BtnCssTemplate: TBitBtn;
    BtnXmlTemplate: TBitBtn;
    BtnSqlTemplate: TBitBtn;
    procedure MenuItemXMLClick(Sender: TObject);
    procedure BtnXmlTemplateClick(Sender: TObject);
    procedure MenuItemSQLClick(Sender: TObject);
    procedure BtnSqlTemplateClick(Sender: TObject);
    procedure MenuItemCSSClick(Sender: TObject);
    procedure BtnCssTemplateClick(Sender: TObject);
    procedure MenuItemJavaClick(Sender: TObject);
    procedure BtnJavaTemplateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MenuItemOpenTerminalClick(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure PageEditorChange(Sender: TObject);
    procedure BtnTerminalClick(Sender: TObject);
    procedure BtnSupportClick(Sender: TObject);
    procedure MenuItemCloseAppClick(Sender: TObject);
    procedure TreeClick(Sender: TObject);
    procedure MenuItemNewClick(Sender: TObject);
    procedure BtnNewFileClick(Sender: TObject);
    procedure BtnClearEditorClick(Sender: TObject);
    procedure BtnTextStyleClick(Sender: TObject);
    procedure BtnJsTemplateClick(Sender: TObject);
    procedure BtnOpenFClick(Sender: TObject);
    procedure MenuItemJSClick(Sender: TObject);
    procedure BtnSaveFClick(Sender: TObject);
    procedure MenuItemViewClick(Sender: TObject);
    procedure MenuItemSaveasClick(Sender: TObject);
    procedure BtnHtmlTemplateClick(Sender: TObject);
    procedure MenuItemHTMLClick(Sender: TObject);
    procedure MenuItemOpenFileClick(Sender: TObject);
  private
  public
  end;

var
  Main: TMain;
  FName, tabName, FileLoader: string;
  NewTab: TTabSheet;
  NewSynEdit: TSynEdit;

implementation

{$R *.dfm}

procedure TMain.MenuItemNewClick(Sender: TObject);
begin
   BtnNewFile.Click;
end;

procedure TMain.BtnNewFileClick(Sender: TObject);
begin
  NewTab := TTabSheet.Create(PageEditor);
  with NewTab do
  begin
    PageControl := PageEditor;
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
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  MenuItemSaveas.Click;
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.BtnTerminalClick(Sender: TObject);
begin
WinExec('cmd /c start cmd.exe', SW_SHOW)
end;

procedure TMain.Button1Click(Sender: TObject);
begin
//
end;

procedure TMain.BtnClearEditorClick(Sender: TObject);
begin
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.MenuItemCloseAppClick(Sender: TObject);
begin
Close;
end;

procedure TMain.MenuItemCSSClick(Sender: TObject);
begin
  BtnCssTemplate.Click
end;

procedure TMain.EditorChange(Sender: TObject);
begin
//
end;

procedure TMain.MenuItemOpenTerminalClick(Sender: TObject);
begin
  BtnTerminal.Click
end;

procedure TMain.MenuItemHTMLClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
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
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
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
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.BtnCssTemplateClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(tabName+' css stylesheet');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(tabName+' css stylesheet');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.BtnHtmlTemplateClick(Sender: TObject);
begin
   MenuItemHTML.Click;
end;

procedure TMain.BtnJavaTemplateClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('public class '+tabName + ' {');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('public class '+tabName+ ' {');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.BtnJsTemplateClick(Sender: TObject);
begin
   MenuItemJS.Click;
end;

procedure TMain.BtnOpenFClick(Sender: TObject);
begin
   MenuItemOpenFile.Click;
end;

procedure TMain.MenuItemOpenFileClick(Sender: TObject);
begin
if OpenFile.Execute then begin
  NewTab := TTabSheet.Create(PageEditor);
  with NewTab do
  begin
    PageControl := PageEditor;
  end;
  NewSynEdit := TSynEdit.Create(NewTab);
  begin
    with NewSynEdit do
    begin
    Parent := NewTab;
    Align := alClient;
   begin
  FName := OpenFile.FileName;
  Editor.Enabled := True;
  PageEditor.ActivePageIndex := PageEditor.PageCount - 1;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.LoadFromFile(FName);
  FileLoader:=copy(ExtractFileName(FName),0,pos('.',FName)-1);
  tabName:=ChangeFileExt(ExtractFileName(FName),'');
  NewTab.Caption := FileLoader;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  if (FileLoader = tabName + '.css') or (FileLoader = tabName + '.less') then
  begin
  NewSynEdit.Highlighter:=SynCssSyn;
  end;
  if (FileLoader = tabName + '.html') or (FileLoader = tabName + '.htm') then
  begin
  NewSynEdit.Highlighter:=SynHTMLSyn;
  end;
  if (FileLoader = tabName + '.java') or (FileLoader = tabName + '.jsp')then
  begin
  NewSynEdit.Highlighter:=SynJavaSyn;
  end;
  if FileLoader = tabName + '.js' then
  begin
  NewSynEdit.Highlighter:=SynJScriptSyn;
  end;
  if FileLoader = tabName + '.sql' then
  begin
  NewSynEdit.Highlighter:=SynSQLSyn;
  end;
     if (FileLoader = tabName + '.xml') or (FileLoader = tabName + '.xsd') or
     (FileLoader = tabName + '.xsl') or (FileLoader = tabName + '.xslt') or
     (FileLoader = tabName + '.dtd')  then
  begin
  NewSynEdit.Highlighter:=SynXMLSyn;
  end;
end;
end;
end;
end;
end;

procedure TMain.MenuItemJavaClick(Sender: TObject);
begin
    BtnJavaTemplate.Click
end;

procedure TMain.MenuItemJSClick(Sender: TObject);
begin
  if PageEditor.PageCount = 0 then
begin
     BtnNewFile.Click;
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
     (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
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
     (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
     Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
     (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
     (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
     (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.PageEditorChange(Sender: TObject);
begin
//
end;

procedure TMain.MenuItemSaveasClick(Sender: TObject);
begin
  SaveFile.FileName := FName;
  if PageEditor.ActivePageIndex >= 0 then
  if SaveFile.Execute then begin
  begin
    FName := SaveFile.FileName;
    Editor.Enabled := True;
    (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.SaveToFile(FName);
    FileLoader:=copy(ExtractFileName(FName),0,pos('.',FName)-1);
    tabName:=ChangeFileExt(ExtractFileName(FName),'');
    NewTab.Caption := FileLoader;
  if (FileLoader = tabName + '.css') or (FileLoader = tabName + '.less') then
  begin
  NewSynEdit.Highlighter:=SynCssSyn;
  end;
     if (FileLoader = tabName + '.html') or (FileLoader = tabName + '.htm') then
  begin
  NewSynEdit.Highlighter:=SynHTMLSyn;
  end;
     if (FileLoader = tabName + '.java') or (FileLoader = tabName + '.jsp')then
  begin
  NewSynEdit.Highlighter:=SynJavaSyn;
  end;
     if FileLoader = tabName + '.js' then
  begin
  NewSynEdit.Highlighter:=SynJScriptSyn;
  end;
     if FileLoader = tabName + '.sql' then
  begin
  NewSynEdit.Highlighter:=SynSQLSyn;
  end;
     if (FileLoader = tabName + '.xml') or (FileLoader = tabName + '.xsd') or
     (FileLoader = tabName + '.xsl') or (FileLoader = tabName + '.xslt') or
     (FileLoader = tabName + '.dtd')  then
  begin
  NewSynEdit.Highlighter:=SynXMLSyn;
  end;
  end;
  end;
end;

procedure TMain.MenuItemSQLClick(Sender: TObject);
begin
  BtnSqlTemplate.Click
end;

procedure TMain.BtnSaveFClick(Sender: TObject);
begin
  MenuItemSaveas.Click;
end;

procedure TMain.BtnSqlTemplateClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- description: Table structure for `'+tabname+'`');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('CREATE DATABASE  IF NOT EXISTS `'+tabname+'`;');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('USE `'+tabName+'`;');
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- description: Table structure for `'+tabname+'`');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('CREATE DATABASE  IF NOT EXISTS `'+tabname+'`;');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('USE `'+tabName+'`;');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.BtnSupportClick(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://github.com/tasks-delivery/front-editor', nil, nil, SW_SHOW);
end;

procedure TMain.BtnTextStyleClick(Sender: TObject);
begin
  MenuItemView.Click
end;

procedure TMain.BtnXmlTemplateClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.TreeClick(Sender: TObject);
var F: TShellFolder;
begin
 F := Tree.SelectedFolder;
 if Assigned(F) then
   if not F.IsFolder then
   begin
   MenuItemOpenFile.Click;
end;
end;

procedure TMain.MenuItemViewClick(Sender: TObject);
begin
if FontDialog.Execute then
Editor.Font := FontDialog.Font;
end;

procedure TMain.MenuItemXMLClick(Sender: TObject);
begin
   BtnXmlTemplate.Click
end;

end.
