unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, SynEditExport, SynExportHTML,
  SynEdit, SynMemo, SynEditHighlighter, SynHighlighterHtml, ImgList, AboutModalWindow,
  ToolWin, SynHighlighterCSS, Buttons, ShellCtrls, ShellApi, SynHighlighterJava,
  SynHighlighterXML, SynHighlighterSQL, SynHighlighterJScript, UxTheme, Themes,
  Math;

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
    MenuHelp: TMenuItem;
    MenuItemHTML: TMenuItem;
    SynCssSyn: TSynCssSyn;
    MenuItemSaveas: TMenuItem;
    MenuEdit: TMenuItem;
    MenuItemNew: TMenuItem;
    FontDialog: TFontDialog;
    MenuItemJS: TMenuItem;
    BtnSaveF: TBitBtn;
    BtnOpenF: TBitBtn;
    ToolButton1: TToolButton;
    BtnHtmlTemplate: TBitBtn;
    BtnJsTemplate: TBitBtn;
    ToolButton2: TToolButton;
    BtnClearEditor: TBitBtn;
    BtnTextStyle: TBitBtn;
    PageEditor: TPageControl;
    BtnNewFile: TBitBtn;
    Tree: TShellTreeView;
    BtnTerminal: TBitBtn;
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
    SubMenuItemPackageJson: TMenuItem;
    SubMenuItemPomXml: TMenuItem;
    SubMenuItemWroXml: TMenuItem;
    SubMenuItemTestNGXml: TMenuItem;
    SubMenuItemXml: TMenuItem;
    SubMenuItemJS: TMenuItem;
    ManuItemAbout: TMenuItem;
    MenuItemSupport: TMenuItem;
    BtnDelTab: TButton;
    ImageList1: TImageList;
    ools1: TMenuItem;
    MenuSubItemTodo: TMenuItem;
    Keymap1: TMenuItem;
    Update1: TMenuItem;
    Proxy1: TMenuItem;
    CustromTemplate1: TMenuItem;
    Settings1: TMenuItem;
    Keymap3: TMenuItem;
    CodeColor1: TMenuItem;
    Browsers1: TMenuItem;
    Chrome1: TMenuItem;
    Firefox1: TMenuItem;
    Edge1: TMenuItem;
    Safari1: TMenuItem;
    IE1: TMenuItem;
    Opera1: TMenuItem;
    CodeStyle1: TMenuItem;
    Structure1: TMenuItem;
    MenuItemView: TMenuItem;
    MenuItemOpenTerminal: TMenuItem;
    ProjectTree1: TMenuItem;
    Folders1: TMenuItem;
    ProjectFolders1: TMenuItem;
    procedure MenuSubItemTodoClick(Sender: TObject);
    procedure PageEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PageEditorDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PageEditorMouseLeave(Sender: TObject);
    procedure PageEditorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageEditorMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnDelTabClick(Sender: TObject);
    procedure PageEditorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageEditorDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ManuItemAboutClick(Sender: TObject);
    procedure MenuItemSupportClick(Sender: TObject);
    procedure MenuItemOpenTerminalClick(Sender: TObject);
    procedure SubMenuItemPomXmlClick(Sender: TObject);
    procedure SubMenuItemWroXmlClick(Sender: TObject);
    procedure SubMenuItemTestNGXmlClick(Sender: TObject);
    procedure SubMenuItemJSClick(Sender: TObject);
    procedure SubMenuItemXmlClick(Sender: TObject);
    procedure SubMenuItemPackageJsonClick(Sender: TObject);
    procedure BtnXmlTemplateClick(Sender: TObject);
    procedure MenuItemSQLClick(Sender: TObject);
    procedure BtnSqlTemplateClick(Sender: TObject);
    procedure MenuItemCSSClick(Sender: TObject);
    procedure BtnCssTemplateClick(Sender: TObject);
    procedure MenuItemJavaClick(Sender: TObject);
    procedure BtnJavaTemplateClick(Sender: TObject);
    procedure EditorChange(Sender: TObject);
    procedure PageEditorChange(Sender: TObject);
    procedure BtnTerminalClick(Sender: TObject);
    procedure MenuItemCloseAppClick(Sender: TObject);
    procedure TreeClick(Sender: TObject);
    procedure MenuItemNewClick(Sender: TObject);
    procedure BtnNewFileClick(Sender: TObject);
    procedure BtnClearEditorClick(Sender: TObject);
    procedure BtnTextStyleClick(Sender: TObject);
    procedure BtnJsTemplateClick(Sender: TObject);
    procedure BtnOpenFClick(Sender: TObject);
    procedure BtnSaveFClick(Sender: TObject);
    procedure MenuItemViewClick(Sender: TObject);
    procedure MenuItemSaveasClick(Sender: TObject);
    procedure BtnHtmlTemplateClick(Sender: TObject);
    procedure MenuItemHTMLClick(Sender: TObject);
    procedure MenuItemOpenFileClick(Sender: TObject);
    procedure CreateCloseBtn;
    procedure SetFocusToLastString;
    procedure SetLineNumbers;
    procedure SetCodeHighlighter;
    procedure SetFocusIfPageExists;
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
  SetFocusToLastString;
end;

procedure TMain.CreateCloseBtn;
begin  {
     with tbutton.Create(application) do
  begin
    Parent := NewTab;
    Caption := 'X';
    Left := 0;
    Height := 20;
    Width := 20;
    Top := 0;
    Visible := True;
  end; }
end;

procedure TMain.PageEditorDrawTab(Control: TCustomTabControl; TabIndex: Integer;
  const Rect: TRect; Active: Boolean);
begin
//
end;

procedure TMain.PageEditorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PageEditor.BeginDrag(False);
end;

procedure TMain.PageEditorMouseLeave(Sender: TObject);
begin
//
end;

procedure TMain.PageEditorMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//
end;

procedure TMain.BtnTerminalClick(Sender: TObject);
begin
WinExec('cmd /c start cmd.exe', SW_SHOW)
end;

procedure TMain.BtnClearEditorClick(Sender: TObject);
begin
  if PageEditor.PageCount > 0 then
begin
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;
end;

procedure TMain.ManuItemAboutClick(Sender: TObject);
begin
  About.ShowModal ;
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

procedure TMain.FormCreate(Sender: TObject);
begin
//
end;

procedure TMain.MenuItemHTMLClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  SetLineNumbers;
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
  NewSynEdit.Highlighter:=SynHtmlSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
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
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynHtmlSyn;
end;
end;

procedure TMain.BtnCssTemplateClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(tabName+' css stylesheet');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  NewSynEdit.Highlighter:=SynCssSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(tabName+' css stylesheet');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
   SetFocusToLastString;
  NewSynEdit.Highlighter:=SynCssSyn;
end;
end;

procedure TMain.BtnDelTabClick(Sender: TObject);
begin
  if (PageEditor.PageCount>1) and (PageEditor.ActivePageIndex>0) then
PageEditor.ActivePage.Destroy;
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
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('public class '+tabName + ' {');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
  NewSynEdit.Highlighter:=SynJavaSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('public class '+tabName+ ' {');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynJavaSyn;
end;
end;

procedure TMain.BtnJsTemplateClick(Sender: TObject);
begin
 SubMenuItemJS.Click;
end;

procedure TMain.BtnOpenFClick(Sender: TObject);
begin
  MenuItemOpenFile.Click;
  SetFocusIfPageExists;
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
  SetCodeHighlighter;
end;
end;
end;
end;
end;

procedure TMain.MenuItemOpenTerminalClick(Sender: TObject);
begin
  BtnTerminal.Click;
end;

procedure TMain.MenuItemJavaClick(Sender: TObject);
begin
    BtnJavaTemplate.Click
end;

procedure TMain.SubMenuItemJSClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  NewSynEdit.Highlighter:=SynCssSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynCssSyn;
end;
end;

procedure TMain.SubMenuItemPackageJsonClick(Sender: TObject);
begin
  if PageEditor.PageCount = 0 then
begin
     BtnNewFile.Click;
     SetLineNumbers;
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('{');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "name": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "private": true,');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "version": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "description": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "repository": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "license": "MIT",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "devDependencies": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": "^"');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             },');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "scripts": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": ""');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             }');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
     NewSynEdit.Highlighter:=SynJScriptSyn;
    end;
if PageEditor.PageCount > 0 then
begin
     SetLineNumbers;
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('{');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "name": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "private": true,');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "version": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "description": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "repository": "",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "license": "MIT",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "devDependencies": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": "^"');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             },');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "scripts": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": ""');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             }');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
     SetFocusToLastString;
     NewSynEdit.Highlighter:=SynJScriptSyn;
end;
end;

procedure TMain.SubMenuItemTestNGXmlClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<suite name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</suite>');
  NewSynEdit.Highlighter:=SynXmlSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<suite name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</suite>');
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynXmlSyn;
end;
end;

procedure TMain.PageEditorChange(Sender: TObject);
begin
//
end;

procedure TMain.PageEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
const
  TCM_GETITEMRECT = $130A;
var
  TabRect: TRect;
  j: Integer;
begin
  if (Sender is TPageControl) then
  for j := 0 to PageEditor.PageCount - 1 do
    begin
      PageEditor.Perform(TCM_GETITEMRECT, j, LParam(@TabRect));
      if PtInRect(TabRect, Point(X, Y)) then
        begin
          if PageEditor.ActivePage.PageIndex <> j then PageEditor.ActivePage.PageIndex := j;
          Exit;
        end;
    end;
end;

procedure TMain.PageEditorDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if (Sender is TPageControl) then Accept := True;
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
    SetCodeHighlighter;
  end;
  end;
end;

procedure TMain.MenuItemSQLClick(Sender: TObject);
begin
  BtnSqlTemplate.Click;
end;

procedure TMain.MenuItemSupportClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'https://github.com/tasks-delivery/front-editor/issues', nil, nil, SW_SHOW);
end;

procedure TMain.BtnSaveFClick(Sender: TObject);
begin
  MenuItemSaveas.Click;
  SetFocusIfPageExists;
end;

procedure TMain.BtnSqlTemplateClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- description: Table structure for `'+tabname+'`');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('CREATE DATABASE  IF NOT EXISTS `'+tabname+'`;');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('USE `'+tabName+'`;');
  NewSynEdit.Highlighter:=SynSqlSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('-- description: Table structure for `'+tabname+'`');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('--');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('CREATE DATABASE  IF NOT EXISTS `'+tabname+'`;');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('USE `'+tabName+'`;');
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynSqlSyn;
end;
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
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  NewSynEdit.Highlighter:=SynXmlSyn;
  end
  else
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynXmlSyn;
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
  SetFocusIfPageExists;
end;

procedure TMain.SubMenuItemXmlClick(Sender: TObject);
begin
   BtnXmlTemplate.Click;
end;

procedure TMain.SubMenuItemWroXmlClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<groups xmlns="http://www.isdc.ro/wro">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  <group name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <css></css>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  </group>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</groups>');
  NewSynEdit.Highlighter:=SynXmlSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<groups xmlns="http://www.isdc.ro/wro">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<group name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<css></css>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</group>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</groups>');
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynXmlSyn;
end;
end;

procedure TMain.SubMenuItemPomXmlClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<project xmlns="http://maven.apache.org/POM/4.0.0"');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <modelVersion>4.0.0</modelVersion>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <groupId></groupId>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <artifactId></artifactId>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <version></version>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</project>');
  NewSynEdit.Highlighter:=SynXmlSyn;
  end;
if PageEditor.PageCount > 0 then
begin
  SetLineNumbers;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<project xmlns="http://maven.apache.org/POM/4.0.0"');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <modelVersion>4.0.0</modelVersion>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <groupId></groupId>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <artifactId></artifactId>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <version></version>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</project>');
  SetFocusToLastString;
  NewSynEdit.Highlighter:=SynXmlSyn;
end;
end;

procedure TMain.PageEditorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
end;

procedure TMain.MenuSubItemTodoClick(Sender: TObject);

begin
if PageEditor.PageCount > 0  then
begin
if (NewSynEdit.Highlighter = SynJavaSyn) or
   (NewSynEdit.Highlighter = SynJScriptSyn) or
   (NewSynEdit.Highlighter = SynCssSyn) then
begin
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('TODO:');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
end;
end;
end;

procedure TMain.SetLineNumbers;
begin
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
end;

procedure TMain.SetFocusToLastString;
begin
  (NewTab.PageControl.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((NewTab.PageControl.ActivePage.Components[0] as TSynEdit).lines.text);
  (NewTab.PageControl.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (NewTab.PageControl.ActivePage.Components[0] as TSynEdit).lines.count);
  (NewTab.PageControl.ActivePage.Components[0] as TSynEdit).SetFocus;
end;

procedure TMain.SetCodeHighlighter;
begin
  FileLoader:=copy(ExtractFileName(FName),0,pos('.',FName)-1);
    tabName:=ChangeFileExt(ExtractFileName(FName),'');
    NewTab.Caption := FileLoader + '                     ';
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
     if (FileLoader = tabName + '.js') or (FileLoader = tabName + '.json') then
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

procedure TMain.SetFocusIfPageExists;
begin
    if PageEditor.PageCount > 0 then
  begin
   (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  end;
end;

end.
