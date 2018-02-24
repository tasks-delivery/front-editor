program Front_Editor;

uses
  Forms,
  MainForm in 'MainForm.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Front-editor';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
