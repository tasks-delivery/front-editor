program Front_Editor;

uses
  Forms,
  MainForm in 'MainForm.pas' {FrontEd},
  TopMenu in 'Menu\TopMenu.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrontEd, FrontEd);
  Application.Run;
end.
