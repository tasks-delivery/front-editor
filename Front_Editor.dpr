program Front_Editor;

uses
  Forms,
  MainForm in 'MainForm.pas' {Main},
  AboutModalWindow in 'AboutModalWindow.pas' {About};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Front-editor';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAbout, About);
  Application.Run;
end.
