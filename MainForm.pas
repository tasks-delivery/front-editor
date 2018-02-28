unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, SynEditExport, SynExportHTML, SynEdit,
  SynMemo, SynEditHighlighter, SynHighlighterHtml, ImgList, AboutModalWindow,
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
    MenuHelp: TMenuItem;
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
  private
  public

  end;

var
  Main: TMain;
  FName, tabName, FileLoader: string;
  NewTab: TTabSheet;
  NewSynEdit: TSynEdit;
  const size = 2;

implementation
  uses CommCtrl, Themes, Types;
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
with tbutton.create(self) do
begin
caption := 'Кнопка 1';
//onclick := testmethod; // Назначаем обработчик события
parent := NewTab;
end;
end;


procedure TMain.CreateCloseBtn;
begin
     with tbutton.Create(application) do
  begin
    Parent := NewTab;
    Caption := 'X';
    Left := 0;
    Height := 20;
    Width := 20;
    Top := 0;
    Visible := True;
  end;
end;

procedure TMain.PageEditorDrawTab(Control: TCustomTabControl; TabIndex: Integer;
  const Rect: TRect; Active: Boolean);
var
AText: string;
APoint: TPoint;
i: integer;
begin

with (Control as TPageControl).Canvas do
begin
AText:= TPageControl(Control).Pages[TabIndex].Caption;
APoint.x := 9+(Rect.Left - Rect.Right) div 2 + TextWidth(AText) div 2;
APoint.y := (Rect.Bottom - Rect.Top) div 2 - TextHeight(AText) div 2;
i:= TPageControl(Control).Pages[TabIndex].ImageIndex;
if TabIndex = (Control as TPageControl).TabIndex
then
begin
Font.Color:= clBlue; Font.Style:= [fsBold];
end
else
begin
Font.Color:= clWindowText; Font.Style:= [];
end;

TextRect(Rect, Rect.Left + APoint.x, Rect.Top + APoint.y, AText);
ImageList1.Draw(TPageControl(NewTab).Canvas, Rect.Right + APoint.x - 17, Rect.Top + APoint.y, i);
end;

end;

procedure TMain.PageEditorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  MousePos:TPoint;
  HI:TTCHitTestInfo;
  ret:integer;
  r: TRect;
  begin
 //
end;



procedure TMain.BtnTerminalClick(Sender: TObject);
begin
WinExec('cmd /c start cmd.exe', SW_SHOW)
end;

procedure TMain.BtnClearEditorClick(Sender: TObject);
begin
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
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
var I: Integer;
    NT:TMain;
begin
 //
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
  NewSynEdit.Highlighter:=SynHtmlSyn;
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
  NewSynEdit.Highlighter:=SynHtmlSyn;
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
  NewSynEdit.Highlighter:=SynCssSyn;
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
  NewSynEdit.Highlighter:=SynCssSyn;
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
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('public class '+tabName + ' {');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
  NewSynEdit.Highlighter:=SynJavaSyn;
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
  NewSynEdit.Highlighter:=SynJavaSyn;
end;

procedure TMain.BtnJsTemplateClick(Sender: TObject);
begin
 SubMenuItemJS.Click;
end;

procedure TMain.BtnOpenFClick(Sender: TObject);
begin
  MenuItemOpenFile.Click;
  if PageEditor.PageCount > 0 then
  begin
   (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  end;
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
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  NewSynEdit.Highlighter:=SynCssSyn;
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('/*');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('author: User');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('description: none');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('*/');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  NewSynEdit.Highlighter:=SynCssSyn;
end;
procedure TMain.SubMenuItemPackageJsonClick(Sender: TObject);
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
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "license": "MIT",');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "devDependencies": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": "^"');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             },');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "scripts": {');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             "": ""');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('             }');
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('}');
     NewSynEdit.Highlighter:=SynJScriptSyn;
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
     (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add(' "license": "MIT",');
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
     NewSynEdit.Highlighter:=SynJScriptSyn;
end;

procedure TMain.SubMenuItemTestNGXmlClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<suite name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</suite>');
  NewSynEdit.Highlighter:=SynXmlSyn;
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<suite name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</suite>');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  NewSynEdit.Highlighter:=SynXmlSyn;
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
  if PageEditor.PageCount > 0 then
  begin
   (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  end;
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
  NewSynEdit.Highlighter:=SynSqlSyn;
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
  NewSynEdit.Highlighter:=SynSqlSyn;
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
  NewSynEdit.Highlighter:=SynXmlSyn;
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
(PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
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
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<groups xmlns="http://www.isdc.ro/wro">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  <group name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <css></css>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('  </group>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</groups>');
  NewSynEdit.Highlighter:=SynXmlSyn;
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<groups xmlns="http://www.isdc.ro/wro">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<group name="">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<css></css>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</group>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</groups>');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  NewSynEdit.Highlighter:=SynXmlSyn;
end;

procedure TMain.SubMenuItemPomXmlClick(Sender: TObject);
begin
if PageEditor.PageCount = 0 then
begin
  BtnNewFile.Click;
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
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
  end
  else
  Editor.Enabled := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Gutter.ShowLineNumbers := True;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Clear;
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('<project xmlns="http://maven.apache.org/POM/4.0.0"');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <modelVersion>4.0.0</modelVersion>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <groupId></groupId>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <artifactId></artifactId>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('    <version></version>');
  (PageEditor.ActivePage.Components[0] as TSynEdit).Lines.Add('</project>');
  (PageEditor.ActivePage.Components[0] as  TSynEdit).SelStart:=
  Length((PageEditor.ActivePage.Components[0] as TSynEdit).lines.text);
  (PageEditor.ActivePage.Components[0] as TSynEdit).perform(EM_LINESCROLL,0,
  (PageEditor.ActivePage.Components[0] as TSynEdit).lines.count);
  (PageEditor.ActivePage.Components[0] as TSynEdit).SetFocus;
  NewSynEdit.Highlighter:=SynXmlSyn;
end;

end.
