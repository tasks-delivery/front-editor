unit UnitFramePopupForms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, ComCtrls,
  Controls, Forms, Dialogs, UnitFrameCustom, ExtCtrls, StdCtrls, Mask,

  sMaskEdit, sPanel, sFrameAdapter, sButton, sCustomComboEdit, sComboEdit,
  acPopupCtrls, sRadioButton, sComboBoxes, sGroupBox, sEdit, sCheckBox,
  sComboBox;


type
  TFrame_PopupForms = class(TCustomInfoFrame)
    sGroupBox1: TsGroupBox;
    sColorBox1: TsColorBox;
    sGroupBox2: TsGroupBox;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sGroupBox3: TsGroupBox;
    sCheckBox1: TsCheckBox;
    sTrackEdit2: TsTrackEdit;
    sTrackEdit1: TsTrackEdit;
    sGroupBox4: TsGroupBox;
    sPanel2: TsPanel;
    sButton1: TsButton;
    sPopupBox1: TsPopupBox;
    sGroupBox5: TsGroupBox;
    sSkinSelector1: TsSkinSelector;
    sComboBox1: TsComboBox;
    sCheckBox2: TsCheckBox;
    procedure sButton1Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure sPopupBox1BeforePopup(Sender: TObject);
    procedure sPanel2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sComboBox1Change(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
  public
    procedure AfterCreation; override;
    destructor Destroy; override;
  end;


var
  Frame_PopupForms: TFrame_PopupForms;

implementation

{$R *.dfm}

uses
  UnitCustomPopup,
  sVCLUtils, acPopupController, MainUnit;


procedure TFrame_PopupForms.AfterCreation;
begin
  FormCustomPopup := TFormCustomPopup.Create(nil);
  sPopupBox1.PopupForm := FormCustomPopup;
end;


destructor TFrame_PopupForms.Destroy;
begin
  FreeAndNil(FormCustomPopup);
  inherited;
end;


procedure TFrame_PopupForms.sButton1Click(Sender: TObject);
begin
  if FormCustomPopup.BorderStyle = bsNone then begin
    FormCustomPopup.BorderStyle := bsSingle;
    FormCustomPopup.sSkinProvider1.AllowAnimation := True;
    FormCustomPopup.Height := FormCustomPopup.Height + 28;
    FormCustomPopup.Width := FormCustomPopup.Width + 4;
  end;
  FormCustomPopup.Position := poScreenCenter;
  FormCustomPopup.OwnerControl := sButton1;
  FormCustomPopup.ShowModal;
end;


procedure TFrame_PopupForms.sCheckBox1Click(Sender: TObject);
begin
  sTrackEdit1.AutoPopup := sCheckBox1.Checked;
  sTrackEdit2.AutoPopup := sCheckBox1.Checked;
end;


procedure TFrame_PopupForms.sCheckBox2Click(Sender: TObject);
begin
  sSkinSelector1.ShowNoSkin := sCheckBox2.Checked;
end;


procedure TFrame_PopupForms.sComboBox1Change(Sender: TObject);
begin
  sSkinSelector1.ThumbSize := TacThumbSize(sComboBox1.ItemIndex);
  case sSkinSelector1.ThumbSize of
    tsSmall: begin
      sSkinSelector1.ColCount := 1;
      sSkinSelector1.RowCount := 16;
    end
    else begin
      sSkinSelector1.ColCount := 3;
      sSkinSelector1.RowCount := 5;
    end;
  end;
end;


procedure TFrame_PopupForms.sPanel2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FormCustomPopup.BorderStyle = bsSingle then begin
    FormCustomPopup.BorderStyle := bsNone;
    FormCustomPopup.Height := FormCustomPopup.Height - 28;
    FormCustomPopup.Width := FormCustomPopup.Width - 4;
  end;
  FormCustomPopup.OwnerControl := sPanel2;
  ShowPopupForm(FormCustomPopup, acMousePos);
end;


procedure TFrame_PopupForms.sPopupBox1BeforePopup(Sender: TObject);
begin
  FormCustomPopup.OwnerControl := sPopupBox1;
end;


procedure TFrame_PopupForms.sRadioButton1Click(Sender: TObject);
begin
  sColorBox1.PopupMode := pmColorList;
end;


procedure TFrame_PopupForms.sRadioButton2Click(Sender: TObject);
begin
  sColorBox1.PopupMode := pmPickColor;
end;

end.
