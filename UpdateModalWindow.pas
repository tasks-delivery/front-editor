unit UpdateModalWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShellApi, OleCtrls, SHDocVw;

type
  TUpdateApp = class(TForm)
    ReleaseHistory: TRichEdit;
    DownloadApp: TButton;
    LabelAppVersion: TLabel;
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

uses MainForm;

{$R *.dfm}

procedure TUpdateApp.DownloadAppClick(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://github.com/tasks-delivery/front-editor/raw/master/Front_Editor.exe', nil, nil, SW_SHOW);
end;

procedure TUpdateApp.FormCreate(Sender: TObject);
begin
  LabelAppVersion.Font.Color := clBlue;
  LabelAppVersion.Font.Style := [fsUnderline];
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
