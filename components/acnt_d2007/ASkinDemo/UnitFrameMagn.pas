unit UnitFrameMagn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StdCtrls, Dialogs, ComCtrls, Buttons,

  sFrameAdapter, sGroupBox, sComboBoxes, sCheckBox, sLabel, sTrackBar, sSpeedButton,

  UnitFrameCustom;


type
  TFrame_Magn = class(TCustomInfoFrame)
    sRadioGroup1: TsRadioGroup;
    sColorBox1: TsColorBox;
    sRadioGroup2: TsRadioGroup;
    sCheckBox1: TsCheckBox;
    sTrackBar1: TsTrackBar;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sSpeedButton1: TsSpeedButton;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    procedure sRadioGroup1Change(Sender: TObject);
    procedure sColorBox1Change(Sender: TObject);
    procedure sRadioGroup2Change(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;

var
  Frame_Magn: TFrame_Magn;

implementation

{$R *.dfm}

uses MainUnit, acMagn;


procedure TFrame_Magn.AfterCreation;
begin
  sRadioGroup1.ItemIndex := ord(MainForm.sMagnifier1.BorderStyle);
  sColorBox1.Selected := MainForm.sMagnifier1.BorderColor;
  sRadioGroup2.ItemIndex := ord(MainForm.sMagnifier1.Style);
  sCheckBox1.Checked := MainForm.sMagnifier1.ShowPopupMenu;
  sTrackBar1.Position := MainForm.sMagnifier1.Scaling;
  sLabel2.Caption := IntToStr(sTrackBar1.Position);
  sCheckBox3.Checked := boolean(MainForm.sMagnifier1.SizingMode <> asmNone);
end;


procedure TFrame_Magn.sCheckBox1Click(Sender: TObject);
begin
  MainForm.sMagnifier1.ShowPopupMenu := sCheckBox1.Checked;
end;


procedure TFrame_Magn.sCheckBox2Click(Sender: TObject);
begin
  MainForm.CustomMagnifierSource := sCheckBox2.Checked;
  MainForm.sMagnifier1.Refresh(False);
end;


procedure TFrame_Magn.sCheckBox3Click(Sender: TObject);
begin
  MainForm.sMagnifier1.SizingMode := TacSizingMode(integer(sCheckBox3.Checked));
end;


procedure TFrame_Magn.sColorBox1Change(Sender: TObject);
begin
  MainForm.sMagnifier1.BorderColor := sColorBox1.Selected;
end;


procedure TFrame_Magn.sRadioGroup1Change(Sender: TObject);
begin
  sColorBox1.Enabled := sRadioGroup1.ItemIndex = ord(bsFlat);
  if MainForm.sMagnifier1.BorderStyle <> TacBorderStyle(sRadioGroup1.ItemIndex) then begin
    MainForm.sMagnifier1.BorderStyle := TacBorderStyle(sRadioGroup1.ItemIndex);
    MainForm.sMagnifier1.Refresh(True);
  end;
end;


procedure TFrame_Magn.sRadioGroup2Change(Sender: TObject);
begin
  if MainForm.sMagnifier1.Style <> TacMagnStyle(sRadioGroup2.ItemIndex) then begin
    MainForm.sMagnifier1.Style := TacMagnStyle(sRadioGroup2.ItemIndex);
    MainForm.sMagnifier1.Refresh(True);
  end;
end;


procedure TFrame_Magn.sSpeedButton1Click(Sender: TObject);
begin
  MainForm.sMagnifier1.Execute;
end;


procedure TFrame_Magn.sTrackBar1Change(Sender: TObject);
begin
  MainForm.sMagnifier1.Scaling := sTrackBar1.Position;
  sLabel2.Caption := IntToStr(sTrackBar1.Position);
end;

end.
