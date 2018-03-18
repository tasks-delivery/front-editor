unit AboutModalWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellApi, StdCtrls, ExtCtrls, jpeg;

type
  TAbout = class(TForm)
    BtnOkCloseAbout: TButton;
    AppDescription: TGroupBox;
    LinkToWikiLabel: TLabel;
    AppVersionLabel: TLabel;
    AboutIconApp: TImage;
    procedure LinkToWikiLabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LinkToWikiLabelMouseLeave(Sender: TObject);
    procedure BtnOkCloseAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LinkToWikiLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About: TAbout;

implementation
uses MainForm;

{$R *.dfm}

procedure TAbout.BtnOkCloseAboutClick(Sender: TObject);
begin
  About.Close;
end;

procedure TAbout.FormCreate(Sender: TObject);
begin

 LinkToWikiLabel.Font.Color := clBlue;
 LinkToWikiLabel.Font.Style := [fsUnderline];
 AppVersionLabel.Caption := 'Version '+releaseVersion;
end;

procedure TAbout.LinkToWikiLabelClick(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'https://github.com/tasks-delivery/front-editor/wiki', nil, nil, SW_SHOW);
end;

procedure TAbout.LinkToWikiLabelMouseLeave(Sender: TObject);
begin
   LinkToWikiLabel.Font.Color := clBlue;
end;

procedure TAbout.LinkToWikiLabelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   LinkToWikiLabel.Font.Color := clRed;
end;

end.
