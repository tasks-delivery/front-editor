unit KeymapInfoModalWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, SynEditPrintPreview, SynAutoCorrect, SynURIOpener;

type
  TKeymapInfo = class(TForm)
    BtnOkCloseKeymapInfo: TButton;
    procedure BtnOkCloseKeymapInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KeymapInfo: TKeymapInfo;

implementation

uses MainForm;

{$R *.dfm}

procedure TKeymapInfo.BtnOkCloseKeymapInfoClick(Sender: TObject);
begin
   KeymapInfo.Close;
end;

end.
