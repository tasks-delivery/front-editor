unit UnitFrameCheckBoxes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  sCheckbox, sRadioButton, ExtCtrls, sPanel, sGroupBox, sFrameAdapter, StdCtrls, sComboBox,
  UnitFrameCustom, sLabel, ComCtrls, sTrackBar;

type
  TFrame_CheckBoxes = class(TCustomInfoFrame)
    sGroupBox2: TsGroupBox;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton5: TsRadioButton;
    sGroupBox6: TsGroupBox;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sRadioGroup1: TsRadioGroup;
    sComboBox1: TsComboBox;
    sCheckBox6: TsCheckBox;
    sTrackBar1: TsTrackBar;
    sLabel1: TsLabel;
    sCheckBox4: TsCheckBox;
    procedure sComboBox1Change(Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure sRadioButton5Click(Sender: TObject);
    procedure sCheckBox6Click(Sender: TObject);
    procedure sGroupBox2CheckBoxChanged(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
  public
    InUpdating: boolean;
    procedure AfterCreation; override;
  end;

implementation

uses sConst, sVclUtils, MainUnit;

{$R *.DFM}

procedure TFrame_CheckBoxes.sComboBox1Change(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TButtonControl then
      TrySetSkinSection(TControl(Components[i]), sComboBox1.Text);
end;


procedure TFrame_CheckBoxes.sRadioButton1Click(Sender: TObject);
begin
  if not InUpdating then
    MainForm.ActionHintsSkinned.Execute;
end;


procedure TFrame_CheckBoxes.sRadioButton2Click(Sender: TObject);
begin
  if not InUpdating then
    MainForm.ActionHintsStd.Execute;
end;


procedure TFrame_CheckBoxes.sRadioButton5Click(Sender: TObject);
begin
  if not InUpdating then
    MainForm.ActionHintsCustom.Execute;
end;


procedure TFrame_CheckBoxes.AfterCreation;
begin
  InUpdating := True;
  if Mainform.sAlphaHints1.Active then
    if Mainform.sAlphaHints1.UseSkinData then // Skinned hints
      sRadioButton1.Checked := True
    else // Custom hints
      sRadioButton5.Checked := True
  else // Std hnts
    sRadioButton2.Checked := True;

  sGroupBox2.Checked := MainForm.ShowHint;
  SetControlsEnabled(sGroupBox2, MainForm.ShowHint);
  InUpdating := False;
end;


procedure TFrame_CheckBoxes.sCheckBox4Click(Sender: TObject);
begin
  sRadioGroup1.DisableItemsIfUnchecked := sCheckBox4.Checked;
  if sCheckBox4.Checked then
    sRadioGroup1.Checked := False;
end;


procedure TFrame_CheckBoxes.sCheckBox6Click(Sender: TObject);
begin
  if sCheckBox6.Checked then
    sCheckBox6.Caption := 'Custom check glyph: Checked'
  else
    sCheckBox6.Caption := 'Custom check glyph: Unchecked'
end;


procedure TFrame_CheckBoxes.sGroupBox2CheckBoxChanged(Sender: TObject);
begin
  if not InUpdating then begin
    if sGroupBox2.Checked then
      if MainForm.sAlphaHints1.Active then
        if MainForm.sAlphaHints1.UseSkinData then
          MainForm.ActionHintsSkinned.Execute {enable skinned hints}
        else
          MainForm.ActionHintsCustom.Execute {enable custom hints}
      else
        MainForm.ActionHintsStd.Execute {enable std hints}
    else
      MainForm.ActionHintsDisable.Execute {disable hints};

    SetControlsEnabled(sGroupBox2, sGroupBox2.Checked);
  end;
end;


procedure TFrame_CheckBoxes.sTrackBar1Change(Sender: TObject);
begin
  sRadioGroup1.ContentVOffset := sTrackBar1.Position;
end;

end.
