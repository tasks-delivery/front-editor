unit UnitFrameOuterEffects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Buttons, ExtCtrls, Dialogs,
  StdCtrls, ComCtrls, Mask,

  sFrameAdapter, sSpinEdit, sEdit, sComboBox, sBitBtn, sRadioButton, sPanel, sCheckBox, sGauge, acProgressBar,
  sToolEdit, sMaskEdit, sCustomComboEdit, sCurrEdit, sComboBoxes, sListBox, sSpeedButton, sGroupBox,

  UnitFrameCustom, acPopupCtrls, acArcControls;

  
type
  TFrame_OuterEffects = class(TCustomInfoFrame)
    sEdit1: TsEdit;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sColorBox1: TsColorBox;
    sCalcEdit1: TsCalcEdit;
    sDirectoryEdit1: TsDirectoryEdit;
    sListBox1: TsListBox;
    sBitBtn6: TsBitBtn;
    sBitBtn7: TsBitBtn;
    sBitBtn8: TsBitBtn;
    sBitBtn9: TsBitBtn;
    sBitBtn10: TsBitBtn;
    sBitBtn11: TsBitBtn;
    sSpeedButton1: TsSpeedButton;
    sGroupBox1: TsGroupBox;
    sTrackEdit1: TsTrackEdit;
    sCheckBox1: TsCheckBox;
    sGauge1: TsGauge;
    sProgressBar1: TsProgressBar;
    sCheckBox2: TsCheckBox;
    sComboBox1: TsComboBox;
    sBadgeBtn2: TsBadgeBtn;
    sBadgeBtn1: TsBadgeBtn;
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sBitBtn8Click(Sender: TObject);
    procedure sBadgeBtn1Click(Sender: TObject);
  end;
  

implementation        

uses
  MainUnit,
  sConst, acntUtils, sCommonData, sVCLUtils;

{$R *.dfm}


const
  VisArray: array [0..1] of TacOuterVisibility = (ovNone, ovAlways);


procedure ChangeOuterStyle(Ctrl: TControl; Data: integer); // TacIterProc
var
  sd: TsCommonData;
begin
  sd := TsCommonData(GetObjProp(Ctrl, 'SkinData'));
  if sd <> nil then
    sd.OuterEffects.Visibility := VisArray[Data];
end;


procedure TFrame_OuterEffects.sBadgeBtn1Click(Sender: TObject);
begin
  Alert('Any control may be linked with the TsBadgeBtn component');
end;


procedure TFrame_OuterEffects.sBitBtn8Click(Sender: TObject);
var
  i: integer;
begin
  sBadgeBtn2.Visible := True;
  for i := 0 to 9 do begin
    sBadgeBtn2.Caption := IntToStr(Random(99));
    Delay(10);
  end;
end;


procedure TFrame_OuterEffects.sCheckBox1Click(Sender: TObject);
begin
  sFrameAdapter1.SkinData.BeginUpdate; // Grouped changing begin
  IterateControls(Self, integer(sCheckBox1.Checked), ChangeOuterStyle);
  sFrameAdapter1.SkinData.EndUpdate(True); // Grouped changing end
end;


procedure TFrame_OuterEffects.sCheckBox2Click(Sender: TObject);
begin
  MainForm.sSkinManager1.BeginUpdate;
  MainForm.sSkinManager1.Effects.AllowOuterEffects := sCheckBox2.Checked;
  MainForm.sSkinManager1.EndUpdate(True, False);
end;

end.
