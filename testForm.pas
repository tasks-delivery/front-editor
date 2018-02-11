unit testForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SynEdit, ComCtrls;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    SynEdit1: TSynEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  NPageControl: TPageControl;
  NTab: TTabSheet;
  NSynEdit: TSynEdit;
  i: integer;
begin
  if OpenDialog1.Execute then
  begin
  // ������� ����� TabSheet
    NTab := TTabSheet.Create(PageControl1);
    with NTab do
    begin
      PageControl := PageControl1;
      Caption := '�������� ' + IntToStr(PageControl1.PageCount);
    end;
  NPageControl := TPageControl.Create(NTab);
  NPageControl.Parent := NTab;
  NPageControl.Align := alClient;
  for i := 1 to 2 do
  begin
    NTab := TTabSheet.Create(NPageControl);
    with NTab do
    begin
      PageControl := NPageControl;
      Caption := '�������� ' + IntToStr(NPageControl.PageCount);
    end;
  end;
  // ������� ����� WebBrowser NPageControl.Pages[0]
// ...
  // ������� ����� SynEdit �� NPageControl.Pages[1]
// ...
end;
end;

end.
