unit UnitFrameButtons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Menus,
  StdCtrls, Buttons, ComCtrls, ToolWin,

  sPanel, sFrameAdapter, sButton, sColorSelect, sBitBtn, sSpeedButton, sToolBar, sComboBox, sGroupBox,
  sTrackBar, sLabel, sCheckBox, acCoolBar, acSlider, sComboBoxes,

  UnitFrameCustom;


type
  TFrame_Buttons = class(TCustomInfoFrame)
    sBitBtn3: TsBitBtn;
    sComboBox2: TsComboBox;
    sBitBtn8: TsBitBtn;
    sGroupBox2: TsGroupBox;
    sCheckBox1: TsCheckBox;
    sTrackBar1: TsTrackBar;
    sLabel1: TsLabel;
    sCheckBox2: TsCheckBox;
    sLabel2: TsLabel;
    sPanel2: TsPanel;
    sSpeedButton1: TsSpeedButton;
    sBitBtn1: TsBitBtn;
    sButton1: TsButton;
    sBitBtn6: TsBitBtn;
    sTrackBar2: TsTrackBar;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sComboBox4: TsComboBox;
    PopupMenu1: TPopupMenu;
    Item11: TMenuItem;
    Item21: TMenuItem;
    Item31: TMenuItem;
    Item41: TMenuItem;
    Subitem411: TMenuItem;
    Subitem421: TMenuItem;
    Subitem431: TMenuItem;
    Subitem441: TMenuItem;
    Subitem451: TMenuItem;
    Subitem461: TMenuItem;
    Subitem471: TMenuItem;
    sCoolBar1: TsCoolBar;
    sToolBar2: TsToolBar;
    ToolButton1: TToolButton;
    ToolButton8: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    sToolBar1: TsToolBar;
    ToolButton2: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    sBitBtn2: TsBitBtn;
    sTrackBar3: TsTrackBar;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sSpeedButton2: TsSpeedButton;
    sBitBtn5: TsBitBtn;
    sLabel7: TsLabel;
    sCheckBox3: TsCheckBox;
    sColorBox1: TsColorBox;
    sSpeedButton3: TsSpeedButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    sBitBtn4: TsBitBtn;
    sColorBox2: TsColorBox;
    sSpeedButton4: TsSpeedButton;
    procedure sComboBox2Change(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sComboBox4Change(Sender: TObject);
    procedure sTrackBar2Change(Sender: TObject);
    procedure sTrackBar3Change(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sColorBox1Change(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sColorBox2Change(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;


implementation

uses MainUnit, sVclUtils, sCommonData, acntUtils, sDialogs;

{$R *.DFM}

procedure TFrame_Buttons.sComboBox2Change(Sender: TObject);
begin
  sCoolBar1.SkinData.SkinSection := sComboBox2.Text;
  sPanel2.SkinData.SkinSection := sComboBox2.Text;
end;


procedure ChangeBlend(Ctrl: TControl; Data: integer); // TacIterProc
begin
  if HasProperty(Ctrl, 'Blend') then SetIntProp(Ctrl, 'Blend', Data);
end;

procedure TFrame_Buttons.sTrackBar1Change(Sender: TObject);
begin
  sLabel2.Caption := IntToStr(sTrackBar1.Position);
  IterateControls(MainForm, sTrackBar1.Position, ChangeBlend);
end;


procedure ChangeGrayed(Ctrl: TControl; Data: integer); // TacIterProc
begin
  if HasProperty(Ctrl, 'Grayed') then SetIntProp(Ctrl, 'Grayed', Data);
end;

procedure TFrame_Buttons.sCheckBox1Click(Sender: TObject);
begin
  IterateControls(MainForm, integer(sCheckBox1.Checked), ChangeGrayed);
end;


procedure ChangeReflected(Ctrl: TControl; Data: integer); // TacIterProc
begin
  if HasProperty(Ctrl, 'Reflected') then SetIntProp(Ctrl, 'Reflected', Data);
end;

procedure TFrame_Buttons.sCheckBox2Click(Sender: TObject);
begin
  IterateControls(MainForm, integer(sCheckBox2.Checked), ChangeReflected);
end;


procedure TFrame_Buttons.sComboBox4Change(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to sPanel2.ControlCount -1 do
    TrySetSkinSection(sPanel2.Controls[i], sComboBox4.Text);
end;


procedure TFrame_Buttons.sTrackBar2Change(Sender: TObject);
begin
  sLabel3.Caption := IntToStr(sTrackBar2.Position);
  MainForm.ImageList32.AcBeginUpdate;
  MainForm.ImageList32.Width := sTrackBar2.Position;
  MainForm.ImageList32.Height := sTrackBar2.Position;
  MainForm.ImageList32.AcEndUpdate(True);
end;


procedure TFrame_Buttons.sTrackBar3Change(Sender: TObject);
var
  i: integer;
  sd: TsCommonData;
begin
  sLabel6.Caption := IntToStr(sTrackBar3.Position);
  for i := 0 to sPanel2.ControlCount - 1 do
    if HasProperty(sPanel2.Controls[i], 'SkinData') then begin
      sd := TsCommonData(GetObjProp(sPanel2.Controls[i], 'SkinData'));
      if (sd <> nil) then
        sd.HUEOffset := sTrackBar3.Position;
    end;

  sColorBox1.Enabled := sTrackBar3.Position = 0;
end;


procedure TFrame_Buttons.sBitBtn3Click(Sender: TObject);
begin
  if sMessageDlg('Exit this demo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    MainForm.Close;
end;


procedure TFrame_Buttons.sCheckBox3Click(Sender: TObject);
begin
  sToolBar1.Flat := sCheckBox3.Checked;
  sToolBar2.Flat := sCheckBox3.Checked;
end;


procedure TFrame_Buttons.AfterCreation;
begin
  sToolBar1.Flat := True;
  sToolBar2.Flat := True;
end;


procedure TFrame_Buttons.sColorBox1Change(Sender: TObject);
begin
  sButton1.SkinData.ColorTone := sColorBox1.Selected;
  sTrackBar3.Enabled := sColorBox1.Selected = clNone;
  sSpeedButton3.Enabled := sColorBox1.Selected <> sColorBox1.NoneColorColor;
end;


procedure ChangeChildrenGlyphTone(APanel: TWinControl; AColor: TColor);
var
  i: integer;
begin
  for i := 0 to APanel.ControlCount - 1 do
    if HasProperty(APanel.Controls[i], 'GlyphColorTone') then
      SetIntProp(APanel.Controls[i], 'GlyphColorTone', AColor);
end;


procedure TFrame_Buttons.sColorBox2Change(Sender: TObject);
begin
  ChangeChildrenGlyphTone(Self, sColorBox2.Selected);
  sSpeedButton4.Enabled := sColorBox2.Selected <> sColorBox2.NoneColorColor;
end;


procedure TFrame_Buttons.sSpeedButton3Click(Sender: TObject);
begin
  sColorBox1.Selected := clNone;
  sSpeedButton3.Enabled := False;
  sColorBox1.OnChange(sColorBox1);
end;


procedure TFrame_Buttons.sSpeedButton4Click(Sender: TObject);
begin
  sColorBox2.Selected := clNone;
  sSpeedButton4.Enabled := False;
  ChangeChildrenGlyphTone(Self, clNone);
end;

end.
