unit UnitFrameForms;
{$I sDefs.inc}
//{$WARNINGS OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  sSpinEdit, sEdit, sCheckbox, sRadioButton, sPanel, sGroupBox, sSkinProvider, sFrameAdapter, sComboBox, sButton,
  UnitFrameCustom, ComCtrls, sComboBoxes;


type
  TFrame_Forms = class(TCustomInfoFrame)
    sGroupBox7: TsGroupBox;
    sRadioButton12: TsRadioButton;
    sRadioButton13: TsRadioButton;
    sRadioButton14: TsRadioButton;
    sRadioButton15: TsRadioButton;
    sRadioButton16: TsRadioButton;
    sRadioButton17: TsRadioButton;
    sButton1: TsButton;
    sGroupBox8: TsGroupBox;
    sCheckBox9: TsCheckBox;
    sCheckBox15: TsCheckBox;
    sCheckBox16: TsCheckBox;
    sCheckBox17: TsCheckBox;
    sGroupBox9: TsGroupBox;
    sRadioButton18: TsRadioButton;
    sRadioButton19: TsRadioButton;
    sRadioButton20: TsRadioButton;
    sEdit2: TsEdit;
    sComboBox1: TsComboBox;
    sGroupBox1: TsGroupBox;
    sColorBox1: TsColorBox;
    sGroupBox2: TsGroupBox;
    sCheckBox20: TsCheckBox;
    sCheckBox19: TsCheckBox;
    sCheckBox2: TsCheckBox;
    procedure sRadioButton12Click(Sender: TObject);
    procedure sRadioButton18Change(Sender: TObject);
    procedure sRadioButton19Change(Sender: TObject);
    procedure sRadioButton20Change(Sender: TObject);
    procedure sCheckBox19Change(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sGroupBox1CheckBoxChanged(Sender: TObject);
    procedure sGroupBox2CheckBoxChanged(Sender: TObject);
  public
    procedure CloseBtnClick(Sender: TObject);
  end;


var
  bs: TFormBorderStyle = bsSizeable;
  bi: TBorderIcons = [biSystemMenu, biMinimize, biMaximize];


implementation


uses
  MainUnit,
  ImgList, math,
  sConst, acntUtils, sMessages, sVclUtils;

{$R *.DFM}

procedure TFrame_Forms.sRadioButton12Click(Sender: TObject);
begin
  if Sender = sRadioButton12 then
    bs := bsDialog
  else
    if Sender = sRadioButton13 then
      bs := bsNone
    else
      if Sender = sRadioButton14 then
        bs := bsSingle
      else
        if Sender = sRadioButton15 then
          bs := bsSizeable
        else
          if Sender = sRadioButton16 then
            bs := bsSizeToolWin
          else
            if Sender = sRadioButton17 then
              bs := bsToolWindow;
end;


procedure TFrame_Forms.sRadioButton18Change(Sender: TObject);
begin
  MainForm.sSkinProvider1.CaptionAlignment := taLeftJustify;
end;


procedure TFrame_Forms.sRadioButton19Change(Sender: TObject);
begin
  MainForm.sSkinProvider1.CaptionAlignment := taCenter;
end;


procedure TFrame_Forms.sRadioButton20Change(Sender: TObject);
begin
  MainForm.sSkinProvider1.CaptionAlignment := taRightJustify;
end;


procedure TFrame_Forms.sCheckBox19Change(Sender: TObject);
begin
  MainForm.sSkinProvider1.ShowAppIcon := sCheckBox19.Checked;
end;


var
  FormNum: integer = 0;


procedure TFrame_Forms.sButton1Click(Sender: TObject);
var
  Form: TForm;
  SkinProvider: TsSkinProvider;
begin
  Application.CreateForm(TForm, Form);
  if not sGroupBox2.Checked then
    Form.Tag := Form.Tag or sConst.ExceptTag; // A skinning of Any standard window will be forbidden if ExceptTag flag is set in the Tag

  Form.AutoScroll := True;
  Form.BorderStyle := bs;
  Form.BorderWidth := 8;
  Form.Width := 400;
  Form.FormStyle := fsStayOnTop;
  Form.Position := poScreenCenter;
  Form.Scaled := False; // Disable automatic scaling by Delphi
  Form.Caption := sEdit2.Text;
  Form.Name := 'TestForm' + IntToStr(FormNum);
  inc(FormNum);
  Form.Constraints.MinWidth := Form.Width;
  Form.OnCloseQuery := MainForm.OnCloseQuery;

  bi := [];
  if sCheckBox9.Checked  then bi := bi + [biSystemMenu];
  if sCheckBox15.Checked then bi := bi + [biMaximize];
  if sCheckBox16.Checked then bi := bi + [biMinimize];
  if sCheckBox17.Checked then bi := bi + [biHelp];
  Form.BorderIcons := bi;

  // Receive an existing SkinProvider which was created automatically
  if not Form.HandleAllocated then Form.HandleNeeded;
  SkinProvider := TsSkinProvider(SendMessage(Form.Handle, SM_ALPHACMD, MakeWParam(0, AC_GETPROVIDER), 0));
  if SkinProvider <> nil then begin // If SkinProvider component exists (if Form.BorderStyle <> bsNone)
    SkinProvider.ScreenSnap := True;
    MainForm.sSkinProvider1.GluedForms.Add(Form.Name); // Add this form for test of gluedforms property

    SkinProvider.MakeSkinMenu := sCheckBox2.Checked;
    if sRadioButton18.Checked then
      SkinProvider.CaptionAlignment := taLeftJustify
    else
      if sRadioButton19.Checked then
        SkinProvider.CaptionAlignment := taCenter
      else
        if sRadioButton20.Checked then
          SkinProvider.CaptionAlignment := taRightJustify;

    SkinProvider.SkinData.SkinSection := sComboBox1.Text;
    SkinProvider.ShowAppIcon := sCheckBox19.Checked;
    if sCheckBox20.Checked then
      SkinProvider.GripMode := gmRightBottom
    else
      SkinProvider.GripMode := gmNone;
  end;
  with TsButton.Create(Form) do begin
    Caption := 'Close';
    SetBounds(146, 120, 84, 32);
    Anchors := Anchors + [akBottom, akRight] - [aktop];
    Parent := Form;
    OnClick := CloseBtnClick;
  end;
  with TsPanel.Create(Form) do begin
    Align := alTop;
    SetBounds(10, 10, 284, 82);
    Name := 'sPanel1';
    Parent := Form;
    Caption := 'This form may be glued to the MainForm automatically.'#13#10'Drag it to the edges of the main form and'#13#10'drag the main form for test.';
    Font.Style := [fsBold];
  end;
  if sGroupBox1.Checked then begin
    MainForm.sSkinProvider1.DisabledBlendColor := sColorBox1.Selected;
    MainForm.Enabled := False; // Form Blackout works if TsSkinProvider.DisabledBlendValue is not 255
    Form.ShowModal;
    MainForm.Enabled := True;
  end
  else
    Form.Show;
end;


procedure TFrame_Forms.CloseBtnClick(Sender: TObject);
begin
  TForm(TsButton(Sender).Parent).Close;
end;


procedure TFrame_Forms.sGroupBox1CheckBoxChanged(Sender: TObject);
begin
  sColorBox1.Enabled := sGroupBox1.Checked;
end;


procedure TFrame_Forms.sGroupBox2CheckBoxChanged(Sender: TObject);
begin
    SetControlsEnabled(sGroupBox2, sGroupBox2.Checked);
end;

end.
