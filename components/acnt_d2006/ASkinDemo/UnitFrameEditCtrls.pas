unit UnitFrameEditCtrls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ComCtrls,

  sFrameAdapter, sMemo, sComboBoxes, sTooledit, sCurrencyEdit, sComboEdit, sCurrEdit, sCustomComboEdit, sEdit,
  sSpinEdit, sComboBox, sMaskEdit, sListBox, sLabel, sRichEdit, sButton, sDialogs, sCheckListBox, sTreeView,
  sCheckBox, sGroupBox, sFileCtrl, sFontCtrls,

  UnitFrameCustom, Buttons, sBitBtn, ImgList, acAlphaImageList,
  acPopupCtrls;
  

type
  TFrame_EditCtrls = class(TCustomInfoFrame)
    sMemo1: TsMemo;
    sSpinEdit1: TsSpinEdit;
    sEdit1: TsEdit;
    sMaskEdit1: TsMaskEdit;
    sRichEdit1: TsRichEdit;
    sButton1: TsBitBtn;
    sOpenDialog1: TOpenDialog;
    sTreeView1: TsTreeView;
    sTimePicker1: TsTimePicker;
    sDateEdit1: TsDateEdit;
    sCalcEdit1: TsCalcEdit;
    sComboEdit1: TsComboEdit;
    sCurrencyEdit1: TsCurrencyEdit;
    sFilenameEdit1: TsFilenameEdit;
    sDirectoryEdit1: TsDirectoryEdit;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sGroupBox1: TsGroupBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sDecimalSpinEdit1: TsDecimalSpinEdit;
    sTrackEdit1: TsTrackEdit;
    sCheckBox7: TsCheckBox;
    procedure sButton1Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
    procedure sCheckBox5Click(Sender: TObject);
    procedure sCheckBox6Click(Sender: TObject);
    procedure sCheckBox7Click(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;


implementation

uses MainUnit,
  sVCLUtils, sConst, sMessages;

{$R *.DFM}

procedure TFrame_EditCtrls.sButton1Click(Sender: TObject);
begin
  if sOpenDialog1.Execute then
    sRichedit1.Lines.LoadFromFile(sOpenDialog1.fileName);
end;


procedure TFrame_EditCtrls.sCheckBox1Click(Sender: TObject);
begin
  sSpinEdit1.ShowSpinButtons := sCheckBox1.Checked;
  sTimePicker1.ShowSpinButtons := sCheckBox1.Checked;
  sDecimalSpinEdit1.ShowSpinButtons := sCheckBox1.Checked;
  sCheckBox2.Enabled := sCheckBox1.Checked;
end;


procedure TFrame_EditCtrls.sCheckBox2Click(Sender: TObject);
begin
  sSpinEdit1.FlatSpinButtons := sCheckBox2.Checked;
  sTimePicker1.FlatSpinButtons := sCheckBox2.Checked;
  sDecimalSpinEdit1.FlatSpinButtons := sCheckBox2.Checked;
end;


procedure ChangeVisible(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsEditLabel then
    Ctrl.Visible := boolean(Data);
end;

procedure TFrame_EditCtrls.sCheckBox3Click(Sender: TObject);
begin
  IterateControls(Self, Integer(sCheckBox3.Checked), ChangeVisible);
end;


procedure ChangeDirectInput(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsCustomComboEdit then
    TsComboEdit(Ctrl).DirectInput := boolean(Data);
end;

procedure TFrame_EditCtrls.sCheckBox4Click(Sender: TObject);
begin
  IterateControls(Self, Integer(sCheckBox4.Checked), ChangeDirectInput);
end;


procedure GlyphsRepaint(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsCustomComboEdit then begin
    TsComboEdit(Ctrl).Perform(SM_ALPHACMD, AC_REFRESH_HI, 0);
    TsComboEdit(Ctrl).SkinData.Invalidate;
  end;
end;

procedure TFrame_EditCtrls.sCheckBox5Click(Sender: TObject);
begin
  sConst.ac_OldGlyphsMode := sCheckBox5.Checked;
  IterateControls(Self, Integer(sCheckBox5.Checked), GlyphsRepaint);
end;


procedure ChangeShowButton(Ctrl: TControl; Data: integer);
begin
  if (Ctrl is TsCustomComboEdit) and not (Ctrl is TsCurrencyEdit) then
    TsComboEdit(Ctrl).ShowButton := boolean(Data);
end;


procedure TFrame_EditCtrls.sCheckBox6Click(Sender: TObject);
begin
  IterateControls(Self, Integer(sCheckBox6.Checked), ChangeShowButton);
end;


procedure TFrame_EditCtrls.AfterCreation;
var
  i: integer;
begin
  for i := 1 to 100 do 
    sTreeView1.Items.Add(nil, 'Item ' + IntToStr(i));
end;

procedure TFrame_EditCtrls.sCheckBox7Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ControlCount - 1 do
    if Controls[i] is TsCustomComboEdit then
      if sCheckBox7.Checked then
        TsCustomComboEdit(Controls[i]).BoundLabel.Layout := sclLeftLeft
      else
        TsCustomComboEdit(Controls[i]).BoundLabel.Layout := sclLeft;
end;

end.
