unit UnitCustomPopup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, sPanel, StdCtrls, Buttons,
  sListBox, sEdit, sGroupBox, ComCtrls, sPageControl, sBitBtn, sCheckBox, sSkinProvider,
  Mask, sMaskEdit, sCustomComboEdit, sToolEdit, sSpeedButton;

type
  TFormCustomPopup = class(TForm)
    sPanel1: TsPanel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sSkinProvider1: TsSkinProvider;
    sGroupBox1: TsGroupBox;
    sDateEdit2: TsDateEdit;
    sDateEdit1: TsDateEdit;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sDateEdit1Change(Sender: TObject);
    procedure sDateEdit2Change(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
  public
    OwnerControl: TControl;
  end;


var
  FormCustomPopup: TFormCustomPopup;


implementation

{$R *.dfm}


type
  TAccessControl = class(TControl);


procedure TFormCustomPopup.sBitBtn1Click(Sender: TObject);
begin
  TAccessControl(OwnerControl).Text := sDateEdit1.Text + ' - ' + sDateEdit2.Text;
  Close;
end;


procedure TFormCustomPopup.sBitBtn2Click(Sender: TObject);
begin
  Close;
end;


procedure TFormCustomPopup.sDateEdit1Change(Sender: TObject);
begin
  sDateEdit2.MinDate := sDateEdit1.Date;
  if not sDateEdit2.IsEmpty then
    sBitBtn1.Enabled := True;
end;


procedure TFormCustomPopup.sDateEdit2Change(Sender: TObject);
begin
  sDateEdit1.MaxDate := sDateEdit2.Date;
  if not sDateEdit1.IsEmpty then
    sBitBtn1.Enabled := True;
end;


procedure TFormCustomPopup.sSpeedButton1Click(Sender: TObject);
begin
  case TControl(Sender).Tag of
    0: TAccessControl(OwnerControl).Text := DateTimeToStr(IncMonth(Date, -1)) + ' - ' + DateTimeToStr(Date);
    1: TAccessControl(OwnerControl).Text := DateTimeToStr(Date - 7) + ' - ' + DateTimeToStr(Date);
    2: TAccessControl(OwnerControl).Text := DateTimeToStr(Date) + ' - ' + DateTimeToStr(Date + 7);
    3: TAccessControl(OwnerControl).Text := DateTimeToStr(Date) + ' - ' + DateTimeToStr(IncMonth(Date));
  end;
  Close;
end;

end.
