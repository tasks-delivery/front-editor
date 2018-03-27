unit CodeStyleWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditHighlighter, SynHighlighterHtml, SynEdit, StdCtrls,
  SynHighlighterSQL, SynHighlighterXML, SynHighlighterJScript,
  SynHighlighterCSS, SynHighlighterJava;

type
  TCodeStyleWin = class(TForm)
    CodeStyleArea: TSynEdit;
    HtmlStyle: TSynHTMLSyn;
    JavaStyle: TSynJavaSyn;
    CssStyle: TSynCssSyn;
    JSStyle: TSynJScriptSyn;
    XmlStyle: TSynXMLSyn;
    SqlStyle: TSynSQLSyn;
    ComboBoxStyle: TComboBox;
    LabelStyle: TLabel;
    procedure ComboBoxStyleSelect(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ViewHtmlStyle;
    procedure ViewCssStyle;
    procedure ViewJavaStyle;
    procedure ViewXmlStyle;
    procedure ViewSqlStyle;
    procedure ViewJsStyle;
    procedure ViewPackageJsonStyle;
    procedure ViewPomStyle;
    procedure ViewWroStyle;
    procedure ViewTestNgStyle;
    procedure ViewToDoStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CodeStyleWin: TCodeStyleWin;

implementation

uses MainForm;

{$R *.dfm}

procedure TCodeStyleWin.ComboBoxStyleSelect(Sender: TObject);
begin
    if ComboBoxStyle.ItemIndex = 0 then
   ViewHtmlStyle;
  begin
    if ComboBoxStyle.ItemIndex = 1 then
  begin
   ViewJavaStyle;
  end;
    if ComboBoxStyle.ItemIndex = 2 then
  begin
   ViewXmlStyle;
  end;
    if ComboBoxStyle.ItemIndex = 3 then
  begin
   ViewSqlStyle;
  end;
    if ComboBoxStyle.ItemIndex = 4 then
   ViewCssStyle;
  begin
    if ComboBoxStyle.ItemIndex = 5 then
   ViewJsStyle;
  begin
    if ComboBoxStyle.ItemIndex = 6 then
   ViewPackageJsonStyle;
    if ComboBoxStyle.ItemIndex = 7 then
   ViewTestNgStyle;
  begin
    if ComboBoxStyle.ItemIndex = 8 then
   ViewPomStyle;
  begin
    if ComboBoxStyle.ItemIndex = 9 then
   ViewWroStyle;
  begin
    if ComboBoxStyle.ItemIndex = 10 then
   ViewToDoStyle;
  end;
end;
end;
end;
end;
end;
end;

procedure TCodeStyleWin.FormPaint(Sender: TObject);
begin
  ComboBoxStyle.items.add('HTML');
  ComboBoxStyle.items.add('Java');
  ComboBoxStyle.items.add('XML');
  ComboBoxStyle.items.add('SQL');
  ComboBoxStyle.items.add('CSS');
  ComboBoxStyle.items.add('Java Script');
  ComboBoxStyle.items.add('Package.json');
  ComboBoxStyle.items.add('TestNG.xml');
  ComboBoxStyle.items.add('Pom.xml');
  ComboBoxStyle.items.add('Wro.xml');
  ComboBoxStyle.items.add('TODO');
begin
   ViewHtmlStyle;
end;
end;

procedure TCodeStyleWin.ViewHtmlStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('<!doctype html>');
  CodeStyleArea.Lines.Add(' <html lang="en">');
  CodeStyleArea.Lines.Add('  <head>');
  CodeStyleArea.Lines.Add('   <title></title>');
  CodeStyleArea.Lines.Add('    <meta charset="utf-8">');
  CodeStyleArea.Lines.Add('  </head>');
  CodeStyleArea.Lines.Add('   <body>');
  CodeStyleArea.Lines.Add('');
  CodeStyleArea.Lines.Add('   </body>');
  CodeStyleArea.Lines.Add(' </html>');
  CodeStyleArea.Highlighter := HtmlStyle;
end;

procedure TCodeStyleWin.ViewJavaStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('public class test {');
  CodeStyleArea.Lines.Add('}');
  CodeStyleArea.Highlighter:=JavaStyle;
end;

procedure TCodeStyleWin.ViewCssStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('/*');
  CodeStyleArea.Lines.Add('test css stylesheet');
  CodeStyleArea.Lines.Add('author: User');
  CodeStyleArea.Lines.Add('description: none');
  CodeStyleArea.Lines.Add('*/');
  CodeStyleArea.Highlighter:=CssStyle;
end;

procedure TCodeStyleWin.ViewJsStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('/*');
  CodeStyleArea.Lines.Add('author: User');
  CodeStyleArea.Lines.Add('description: none');
  CodeStyleArea.Lines.Add('*/');
  CodeStyleArea.Highlighter:=JSStyle;
end;

procedure TCodeStyleWin.ViewXmlStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  CodeStyleArea.Highlighter:=XmlStyle;
end;

procedure TCodeStyleWin.ViewSqlStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('--');
  CodeStyleArea.Lines.Add('-- author: User');
  CodeStyleArea.Lines.Add('-- description: Table structure for `test`');
  CodeStyleArea.Lines.Add('--');
  CodeStyleArea.Lines.Add('CREATE DATABASE  IF NOT EXISTS `test`;');
  CodeStyleArea.Lines.Add('USE `test`;');
  CodeStyleArea.Highlighter:=SqlStyle;
end;

procedure TCodeStyleWin.ViewPackageJsonStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('{');
  CodeStyleArea.Lines.Add(' "name": "",');
  CodeStyleArea.Lines.Add(' "private": true,');
  CodeStyleArea.Lines.Add(' "version": "",');
  CodeStyleArea.Lines.Add(' "description": "",');
  CodeStyleArea.Lines.Add(' "repository": "",');
  CodeStyleArea.Lines.Add(' "license": "MIT",');
  CodeStyleArea.Lines.Add(' "devDependencies": {');
  CodeStyleArea.Lines.Add('             "": "^"');
  CodeStyleArea.Lines.Add('             },');
  CodeStyleArea.Lines.Add(' "scripts": {');
  CodeStyleArea.Lines.Add('             "": ""');
  CodeStyleArea.Lines.Add('             }');
  CodeStyleArea.Lines.Add('}');
  CodeStyleArea.Highlighter:=JSStyle;
end;

procedure TCodeStyleWin.ViewPomStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  CodeStyleArea.Lines.Add('<project xmlns="http://maven.apache.org/POM/4.0.0"');
  CodeStyleArea.Lines.Add('         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"');
  CodeStyleArea.Lines.Add('         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">');
  CodeStyleArea.Lines.Add('    <modelVersion>4.0.0</modelVersion>');
  CodeStyleArea.Lines.Add('    <groupId></groupId>');
  CodeStyleArea.Lines.Add('    <artifactId></artifactId>');
  CodeStyleArea.Lines.Add('    <version></version>');
  CodeStyleArea.Lines.Add('</project>');
  CodeStyleArea.Highlighter:=XmlStyle;
end;

procedure TCodeStyleWin.ViewTestNgStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('<?xml version="1.0" encoding="UTF-8"?>');
  CodeStyleArea.Lines.Add('<!DOCTYPE suite SYSTEM "http://testng.org/testng-1.0.dtd">');
  CodeStyleArea.Lines.Add('<suite name="">');
  CodeStyleArea.Lines.Add('</suite>');
  CodeStyleArea.Highlighter:=XmlStyle;
end;

procedure TCodeStyleWin.ViewWroStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('<groups xmlns="http://www.isdc.ro/wro">');
  CodeStyleArea.Lines.Add('  <group name="">');
  CodeStyleArea.Lines.Add('    <css></css>');
  CodeStyleArea.Lines.Add('  </group>');
  CodeStyleArea.Lines.Add('</groups>');
  CodeStyleArea.Highlighter:=XmlStyle;
end;

procedure TCodeStyleWin.ViewToDoStyle;
begin
  CodeStyleArea.Lines.Clear;
  CodeStyleArea.Lines.Add('/*');
  CodeStyleArea.Lines.Add('TODO:');
  CodeStyleArea.Lines.Add('/*');
  CodeStyleArea.Highlighter:=JavaStyle;
end;

end.
