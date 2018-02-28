program PCDemo;

uses
  Forms,
  PCDemo1 in 'PCDemo1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
