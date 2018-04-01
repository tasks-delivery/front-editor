program Front_Editor;

uses
  Forms,
  MainForm in 'MainForm.pas' {Main},
  AboutModalWindow in 'AboutModalWindow.pas' {About},
  KeymapInfoModalWindow in 'KeymapInfoModalWindow.pas' {KeymapInfo},
  UpdateModalWindow in 'UpdateModalWindow.pas' {UpdateApp};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Front-editor';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAbout, About);
  Application.CreateForm(TKeymapInfo, KeymapInfo);
  Application.CreateForm(TUpdateApp, UpdateApp);
  Application.Run;
end.
