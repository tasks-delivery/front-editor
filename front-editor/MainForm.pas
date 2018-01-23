unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls;

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
    Editor: TRichEdit;
    Tree: TMemo;
    procedure SaveProjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseAppClick(Sender: TObject);
    procedure OpenProjectClick(Sender: TObject);
  private
  MyArray : array of string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  FName: string;

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
var sr: TSearchRec;
    Text: String;
    i, a: Integer;
    tags : TStringList;
begin
 if OpenFile.Execute then
 begin
  FName := OpenFile.FileName;
  Editor.Lines.LoadFromFile(FName);
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
tags := TStringList.Create;
tags.CommaText := 'div';
for i := 0 to tags.Count-1 do
begin
Text:=tags[i];
      begin
      a:=0;
      While a<=Length(Editor.Text) do
            begin
            Editor.SelStart:=Editor.FindText(Text, a, Length(Editor.Text)-a, [stMatchCase]);
            Editor.SelLength:=Length(Text);
            Editor.SelAttributes.Color:=clBlue;
            Editor.SelAttributes.Style:=[fsbold];
            a:=Editor.SelStart+Length(Text);
            Application.ProcessMessages;
            end;
      end
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




