program Front_Editor;

uses
  Forms,
  MainForm in 'MainForm.pas' {Main},
  AboutModalWindow in 'AboutModalWindow.pas' {About},
  KeymapInfoModalWindow in 'KeymapInfoModalWindow.pas' {KeymapInfo},
  UpdateModalWindow in 'UpdateModalWindow.pas' {UpdateApp},
  CodeStyleWindow in 'CodeStyleWindow.pas' {CodeStyleWin};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Front-editor';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAbout, About);
  Application.CreateForm(TKeymapInfo, KeymapInfo);
  Application.CreateForm(TUpdateApp, UpdateApp);
  Application.CreateForm(TCodeStyleWin, CodeStyleWin);
  Application.Run;
end.
