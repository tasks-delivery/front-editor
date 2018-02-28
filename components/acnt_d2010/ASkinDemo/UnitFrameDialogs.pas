unit UnitFrameDialogs;
{$WARNINGS OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,

  sFrameAdapter, sPanel, sGroupBox, sEdit, sCheckListBox, sRadioButton, sButton, sLabel, sCheckBox,

  UnitFrameCustom;

type
  TFrame_Dialogs = class(TCustomInfoFrame)
    sGroupBox1: TsGroupBox;
    sEdit1: TsEdit;
    sGroupBox2: TsGroupBox;
    sButton1: TsButton;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sRadioButton3: TsRadioButton;
    sRadioButton4: TsRadioButton;
    sGroupBox3: TsGroupBox;
    sEdit2: TsEdit;
    sButton2: TsButton;
    sGroupBox4: TsGroupBox;
    sEdit3: TsEdit;
    sButton3: TsButton;
    sRadioGroup1: TsRadioGroup;
    sButton4: TsButton;
    sCheckBox1: TsCheckBox;
    sEdit4: TsEdit;
    procedure FrameResize(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
  end;

var
  Frame_Dialogs: TFrame_Dialogs;

implementation

{$R *.DFM}

uses
  sDialogs, sConst, MainUnit;

procedure TFrame_Dialogs.FrameResize(Sender: TObject);
begin
  sRadioGroup1.ItemIndex := 1;
end;


procedure TFrame_Dialogs.sButton1Click(Sender: TObject);
var
  DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons;
begin
  if sRadioButton2.Checked then
    Dlgtype := mtError
  else
    if sRadioButton3.Checked then
      Dlgtype := mtInformation
    else
      if sRadioButton4.Checked then
        Dlgtype := mtConfirmation
      else
        Dlgtype := mtWarning;

  case sRadioGroup1.ItemIndex of
    0: Buttons := [mbOk];
    1: Buttons := [mbOk, mbCancel];
    2: Buttons := [mbAbort, mbRetry, mbIgnore];
    3: Buttons := [mbYes, mbNo, mbCancel];
    4: Buttons := [mbYes, mbNo];
    5: Buttons := [mbRetry, mbCancel];
  end;

  if sCheckBox1.Checked then
    Buttons := Buttons + [mbHelp];

  MainForm.Enabled := False; // Form Blackout works if TsSkinProvider.DisabledBlendValue is not 255
  sMessageDlg(sEdit4.Text, sEdit1.Text, DlgType, Buttons, 1);
  MainForm.Enabled := True;
end;


procedure TFrame_Dialogs.sButton2Click(Sender: TObject);
begin
  MainForm.Enabled := False; // Form Blackout works if TsSkinProvider.DisabledBlendValue is not 255
  sShowMessage(sEdit2.Text);
  MainForm.Enabled := True;
end;


procedure TFrame_Dialogs.sButton3Click(Sender: TObject);
var
  s: acString;
begin
  s := sEdit3.Text;
  MainForm.Enabled := False; // Form Blackout works if TsSkinProvider.DisabledBlendValue is not 255
  if sInputQuery('Test of InputQuery', 'Please enter the test string :', s) then
    sEdit3.Text := s;

  MainForm.Enabled := True;
end;


procedure TFrame_Dialogs.sButton4Click(Sender: TObject);
begin
  MainForm.Enabled := False; // Form Blackout works if TsSkinProvider.DisabledBlendValue is not 255
  Application.MessageBox(PChar(sEdit2.Text), 'Caption', MB_OK);
  MainForm.Enabled := True;
end;

end.
