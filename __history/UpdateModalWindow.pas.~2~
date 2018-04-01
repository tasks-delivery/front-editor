unit UpdateModalWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShellApi, OleCtrls, SHDocVw, IniFiles;

type
  TUpdateApp = class(TForm)
    ReleaseHistory: TRichEdit;
    DownloadApp: TButton;
    LabelAppVersion: TLabel;
    CheckBoxOffNoti: TCheckBox;
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LabelAppVersionMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LabelAppVersionMouseLeave(Sender: TObject);
    procedure DownloadAppClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateApp: TUpdateApp;

implementation

uses MainForm, AboutModalWindow;

{$R *.dfm}

procedure TUpdateApp.DownloadAppClick(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://github.com/tasks-delivery/front-editor/raw/master/Front_Editor.exe', nil, nil, SW_SHOW);
end;

procedure TUpdateApp.FormClose(Sender: TObject; var Action: TCloseAction);
var IniFile: TIniFile;
    First : Boolean;
begin
  if CheckBoxOffNoti.State = cbUnchecked then First:=false
     else First:=True;
  IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.INI');
  IniFile.WriteBool('CheckBox', 'First', First);
  IniFile.Free;
end;

procedure TUpdateApp.FormCreate(Sender: TObject);
begin
  LabelAppVersion.Font.Color := clBlue;
  LabelAppVersion.Font.Style := [fsUnderline];
  LabelAppVersion.Caption := 'Version '+releaseVersion+' has been released';
end;

procedure TUpdateApp.FormPaint(Sender: TObject);
var IniFile: TIniFile;
    First : Boolean;
begin
if releaseVersion = Main.WebBrowser1.OleObject.Document.documentElement.innerText then
begin
 LabelAppVersion.Visible := True;
 DownloadApp.Enabled := True;
end;
begin
  IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Config.INI');
  First:=IniFile.ReadBool('CheckBox', 'First', False);
  if First = True then CheckBoxOffNoti.State:=cbChecked
     else CheckBoxOffNoti.State:=cbUnchecked;
  IniFile.Free;
end;
end;

procedure TUpdateApp.LabelAppVersionMouseLeave(Sender: TObject);
begin
  LabelAppVersion.Font.Color := clBlue;
end;

procedure TUpdateApp.LabelAppVersionMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  LabelAppVersion.Font.Color := clRed;
end;

end.
