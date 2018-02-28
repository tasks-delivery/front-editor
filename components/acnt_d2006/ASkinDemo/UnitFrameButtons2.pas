unit UnitFrameButtons2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UnitFrameCustom, Buttons, StdCtrls,

  sFrameAdapter, sButton, sBitBtn, sGroupBox, sCheckBox, sRadioButton,
  sEdit, sSpinEdit, sLabel, sGauge, sComboBox;

type
  TFrame_Buttons2 = class(TCustomInfoFrame)
    sBitBtn1: TsBitBtn;
    sRadioGroup1: TsRadioGroup;
    sRadioGroup2: TsRadioGroup;
    sCheckBox1: TsCheckBox;
    sRadioGroup3: TsRadioGroup;
    sCheckBox2: TsCheckBox;
    sGroupBox1: TsGroupBox;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sGroupBox2: TsGroupBox;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton3: TsRadioButton;
    sRadioButton4: TsRadioButton;
    sSpinEdit1: TsSpinEdit;
    sSpinEdit2: TsSpinEdit;
    sBitBtn2: TsBitBtn;
    sWebLabel1: TsWebLabel;
    sGauge1: TsGauge;
    sComboBox1: TsComboBox;
    procedure sCheckBox1Click  (Sender: TObject);
    procedure sRadioGroup1Click(Sender: TObject);
    procedure sRadioGroup2Click(Sender: TObject);
    procedure sRadioGroup3Click(Sender: TObject);
    procedure sCheckBox2Click  (Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
    procedure sCheckBox5Click(Sender: TObject);
    procedure sCheckBox6Click(Sender: TObject);
    procedure sGroupBox1CheckBoxChanged(Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sSpinEdit1Change(Sender: TObject);
    procedure sSpinEdit2Change(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
  public
    procedure CheckLayoutControls;
    procedure CheckDisableGroup;
    procedure CheckTextGroup;
  end;

var
  Frame_Buttons2: TFrame_Buttons2;

implementation

uses sConst, acntUtils, sVCLUtils, MainUnit;

{$R *.dfm}

const
  AlignmentArray:     array [0..2] of TAlignment         = (taLeftJustify, taRightJustify, taCenter);
  VertAlignmentArray: array [0..2] of TVerticalAlignment = (taAlignTop,    taAlignBottom,  taVerticalCenter);
  LayoutArray:        array [0..3] of TButtonLayout      = (blGlyphLeft,   blGlyphRight,   blGlyphTop,   blGlyphBottom);


procedure EnabledControls(Ctrl: TControl; Data: integer);
begin
  Ctrl.Enabled := not boolean(Data);
end;


procedure TFrame_Buttons2.sCheckBox1Click(Sender: TObject);
begin
  sBitBtn1.ShowCaption := sCheckBox1.Checked;
  sSpinEdit2.Enabled := sCheckBox1.Checked and sCheckBox2.Checked;
  CheckTextGroup;
  CheckLayoutControls;
end;


procedure TFrame_Buttons2.sRadioGroup1Click(Sender: TObject);
begin
  sBitBtn1.Alignment := AlignmentArray[sRadioGroup1.ItemIndex];
  sSpinEdit1.Enabled := (sRadioGroup1.ItemIndex < 2) or (sRadioGroup2.ItemIndex < 2);
  CheckTextGroup;
  CheckLayoutControls;
end;


procedure TFrame_Buttons2.sRadioGroup2Click(Sender: TObject);
begin
  sBitBtn1.VerticalAlignment := VertAlignmentArray[sRadioGroup2.ItemIndex];
  sSpinEdit1.Enabled := (sRadioGroup1.ItemIndex < 2) or (sRadioGroup2.ItemIndex < 2);
end;


procedure TFrame_Buttons2.sRadioGroup3Click(Sender: TObject);
begin
  sBitBtn1.TextAlignment := AlignmentArray[sRadioGroup3.ItemIndex];
end;


procedure TFrame_Buttons2.sCheckBox2Click(Sender: TObject);
begin
  sSpinEdit2.Enabled := sCheckBox1.Checked and sCheckBox2.Checked;
  CheckTextGroup;
  CheckLayoutControls;
  CheckDisableGroup;
  if sCheckBox2.Checked then
    sBitBtn1.Images := MainForm.ImageList32
  else
    sBitBtn1.Images := nil;
end;


procedure TFrame_Buttons2.sCheckBox3Click(Sender: TObject);
begin
  if sCheckBox3.Checked then
    sBitBtn1.DisabledKind := sBitBtn1.DisabledKind + [dkBlended]
  else
    sBitBtn1.DisabledKind := sBitBtn1.DisabledKind - [dkBlended];
end;


procedure TFrame_Buttons2.sCheckBox4Click(Sender: TObject);
begin
  sCheckBox6.Enabled := not sCheckBox4.Checked;
  if sCheckBox4.Checked then
    sBitBtn1.DisabledKind := sBitBtn1.DisabledKind + [dkGrayed]
  else
    sBitBtn1.DisabledKind := sBitBtn1.DisabledKind - [dkGrayed];
end;


procedure TFrame_Buttons2.sCheckBox5Click(Sender: TObject);
begin
  if sCheckBox5.Checked then
    sBitBtn1.DisabledGlyphKind := sBitBtn1.DisabledGlyphKind + [dgBlended]
  else
    sBitBtn1.DisabledGlyphKind := sBitBtn1.DisabledGlyphKind - [dgBlended];
end;


procedure TFrame_Buttons2.sCheckBox6Click(Sender: TObject);
begin
  sCheckBox4.Enabled := not sCheckBox6.Checked;
  if sCheckBox6.Checked then
    sBitBtn1.DisabledGlyphKind := sBitBtn1.DisabledGlyphKind + [dgGrayed]
  else
    sBitBtn1.DisabledGlyphKind := sBitBtn1.DisabledGlyphKind - [dgGrayed];
end;


procedure TFrame_Buttons2.sGroupBox1CheckBoxChanged(Sender: TObject);
begin
  sBitBtn1.Enabled := not sGroupBox1.Checked;
  CheckDisableGroup;
end;


procedure TFrame_Buttons2.sRadioButton1Click(Sender: TObject);
begin
  sBitBtn1.Layout := LayoutArray[TsRadioButton(Sender).Tag];
  sRadioGroup1.Controls[0].Enabled := TsRadioButton(Sender).Tag < 2;
  sRadioGroup1.Controls[1].Enabled := TsRadioButton(Sender).Tag < 2;
  CheckTextGroup;
end;


procedure TFrame_Buttons2.sSpinEdit1Change(Sender: TObject);
begin
  sBitBtn1.Margin := sSpinEdit1.Value;
  sBitBtn1.SkinData.Invalidate;
end;


procedure TFrame_Buttons2.sSpinEdit2Change(Sender: TObject);
begin
  sBitBtn1.Spacing := sSpinEdit2.Value;
end;


procedure TFrame_Buttons2.CheckLayoutControls;
begin
  sRadioButton1.Enabled := sCheckBox1.Checked and sCheckBox2.Checked;
  sRadioButton2.Enabled := sCheckBox1.Checked and sCheckBox2.Checked;
  sRadioButton3.Enabled := sCheckBox1.Checked and sCheckBox2.Checked and (sRadioGroup1.ItemIndex = 2);
  sRadioButton4.Enabled := sCheckBox1.Checked and sCheckBox2.Checked and (sRadioGroup1.ItemIndex = 2);
end;


procedure TFrame_Buttons2.CheckDisableGroup;
begin
  IterateControls(sGroupBox1, integer(sBitBtn1.Enabled), EnabledControls);
  sCheckBox3.Enabled := not sBitBtn1.Enabled;
  sCheckBox4.Enabled := not sBitBtn1.Enabled;
  sCheckBox5.Enabled := not sBitBtn1.Enabled and sCheckBox2.Checked;
  sCheckBox6.Enabled := not sBitBtn1.Enabled and sCheckBox2.Checked;
end;


procedure TFrame_Buttons2.CheckTextGroup;
begin
  sRadioGroup3.Enabled := sCheckBox1.Checked and sCheckBox2.Checked and ((sRadioGroup1.ItemIndex = 0) and sRadioButton1.Checked or (sRadioGroup1.ItemIndex = 1) and sRadioButton2.Checked);
end;


procedure TFrame_Buttons2.sComboBox1Change(Sender: TObject);
begin
  sBitBtn2.SkinData.SkinSection := sComboBox1.Text;
end;

end.
