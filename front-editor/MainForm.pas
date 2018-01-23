unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuFile: TMenuItem;
    OpenProject: TMenuItem;
    CloseApp: TMenuItem;
    MenuAbout: TMenuItem;
    Tree: TMemo;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    SaveProject: TMenuItem;
    Editor: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CloseAppClick(Sender: TObject);
    procedure OpenProjectClick(Sender: TObject);
    procedure SaveProjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.CloseAppClick(Sender: TObject);
begin
 Close;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
    Editor.Text := '';
    Tree.Text := '';
end;

procedure TMain.OpenProjectClick(Sender: TObject);
begin
  if OpenFile.Execute then
  begin
      Editor.Lines.LoadFromFile(openfile.FileName);
      Caption := '' + ExtractFilename(openfile.FileName);
  End;
End;

procedure TMain.SaveProjectClick(Sender: TObject);
begin
with SaveFile, Editor do
  if Execute then
    if pos('.html', FileName)<>0
      then Lines.SaveToFile(FileName)
      else Lines.SaveToFile(FileName+'.html');
end;
end.




