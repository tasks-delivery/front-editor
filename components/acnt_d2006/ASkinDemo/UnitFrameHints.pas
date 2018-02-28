unit UnitFrameHints;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,

  sFrameAdapter, sComboBox, sBitBtn, sLabel, sListBox, sGroupBox, sPanel,

  UnitFrameCustom, sCheckBox, sRadioButton;


type
  TFrame_Hints = class(TCustomInfoFrame)
    sLabelFX1: TsLabelFX;
    sGroupBox1: TsGroupBox;
    sRadioButton3: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton1: TsRadioButton;
    sListBox1: TsListBox;
    sBitBtn1: TsBitBtn;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    procedure sBitBtn1Click    (Sender: TObject);
    procedure sListBox1Click   (Sender: TObject);
    procedure sCheckBox1Click  (Sender: TObject);
    procedure sCheckBox2Click  (Sender: TObject);
    procedure sCheckBox3Click  (Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sGroupBox1CheckBoxChanged(Sender: TObject);
  public
    InUpdating: boolean;
    procedure UpdateStates;
    procedure AfterCreation; override;
  end;


implementation

uses sConst, MainUnit, acAlphaHintsEdit, sVCLUtils;

{$R *.DFM}

procedure TFrame_Hints.sBitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  EditHints(MainForm.sAlphaHints1);
  // Generate new list
  sListBox1.Items.Clear;
  sListBox1.Items.Add('Default internal');
  for i := 0 to MainForm.sAlphaHints1.Templates.Count - 1 do
    sListBox1.Items.Add(MainForm.sAlphaHints1.Templates[i].Name);

  sListBox1.ItemIndex := 0
end;


procedure TFrame_Hints.UpdateStates;
begin
  InUpdating := True;
  sGroupBox1.Checked := not MainForm.ActionHintsDisable.Checked;
  SetControlsEnabled(sGroupBox1, sGroupBox1.Checked);

  if MainForm.ActionHintsSkinned.Checked then
    sRadioButton1.Checked := True
  else
    if MainForm.ActionHintsCustom.Checked then
      sRadioButton2.Checked := True
    else
      if MainForm.ActionHintsStd.Checked then
        sRadioButton3.Checked := True;

  sListBox1.Enabled := MainForm.ActionHintsCustom.Checked;
  sBitBtn1.Enabled  := MainForm.ActionHintsCustom.Checked;
  InUpdating := False;
end;


procedure TFrame_Hints.sListBox1Click(Sender: TObject);
begin
  MainForm.sAlphaHints1.TemplateName := sListBox1.Items[sListBox1.ItemIndex]
end;


procedure TFrame_Hints.sCheckBox1Click(Sender: TObject);
begin
  MainForm.sAlphaHints1.Animated := sCheckBox1.Checked;
end;


procedure TFrame_Hints.sCheckBox2Click(Sender: TObject);
begin
  MainForm.sAlphaHints1.AutoAlignment := sCheckBox2.Checked;
end;


procedure TFrame_Hints.sCheckBox3Click(Sender: TObject);
begin
  MainForm.sAlphaHints1.HTMLMode := sCheckBox3.Checked;
end;


procedure TFrame_Hints.AfterCreation;
var
  i: integer;
begin
  sListBox1.Items.Clear;
  sListBox1.Items.Add('Default internal');
  for i := 0 to MainForm.sAlphaHints1.Templates.Count - 1 do
    sListBox1.Items.Add(MainForm.sAlphaHints1.Templates[i].Name);

  sListBox1.ItemIndex := 0;
  UpdateStates;
end;


procedure TFrame_Hints.sRadioButton1Click(Sender: TObject);
begin
  case TControl(Sender).Tag of
    0: MainForm.ActionHintsSkinned.Execute;
    1: MainForm.ActionHintsCustom.Execute;
    2: MainForm.ActionHintsStd.Execute;
  end;
  sListBox1.Enabled := MainForm.ActionHintsCustom.Checked;
  sBitBtn1.Enabled  := MainForm.ActionHintsCustom.Checked;
end;


procedure TFrame_Hints.sGroupBox1CheckBoxChanged(Sender: TObject);
begin
  if not InUpdating then begin
    MainForm.sSpeedButton4.Down := sGroupBox1.Checked;
    sGroupBox1.Perform(WM_SETREDRAW, 0, 0);
    SetControlsEnabled(sGroupBox1, sGroupBox1.Checked);
    if sGroupBox1.Checked then begin
      if sRadioButton1.Checked then
        sRadioButton1.OnClick(sRadioButton1)
      else
        if sRadioButton2.Checked then
          sRadioButton2.OnClick(sRadioButton2)
        else
          if sRadioButton3.Checked then
            sRadioButton3.OnClick(sRadioButton3);
    end
    else
      MainForm.ActionHintsDisable.Execute;

    sListBox1.Enabled := sGroupBox1.Checked and MainForm.ActionHintsCustom.Checked;
    sGroupBox1.Perform(WM_SETREDRAW, 1, 0);
    RedrawWindow(sGroupBox1.Handle, nil, 0, RDW_INVALIDATE or RDW_ALLCHILDREN);
  end;
end;

end.
