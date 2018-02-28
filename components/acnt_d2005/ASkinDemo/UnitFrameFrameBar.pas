unit UnitFrameFrameBar;
{$I sDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,

  sFrameAdapter, sPanel, sScrollBox, sLabel, sTrackBar, sCheckBox, sSpeedButton, sGroupBox, sComboBox, sFrameBar,
  sButton, sSplitter, sBitBtn,

  UnitFrameCustom;


type
  TFrame_FrameBar = class(TCustomInfoFrame)
    sFrameBar1: TsFrameBar;
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sTrackBar1: TsTrackBar;
    sTrackBar2: TsTrackBar;
    sGroupBox1: TsGroupBox;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sBitBtn1: TsBitBtn;
    sSplitter1: TsSplitter;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sGroupBox2: TsGroupBox;
    sCheckBox5: TsCheckBox;
    sCheckBox7: TsCheckBox;
    procedure sTrackBar1Change(Sender: TObject);
    procedure sTrackBar2Change(Sender: TObject);
    procedure sFrameBar1Items0CreateFrame(Sender: TObject; var Frame: TCustomFrame);
    procedure sComboBox1Change(Sender: TObject);
    procedure sComboBox2Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
    procedure sCheckBox5Click(Sender: TObject);
    procedure sCheckBox6Click(Sender: TObject);
    procedure sCheckBox7Click(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;

implementation

uses UnitFrameDemo, sVclUtils, sSkinProps, MainUnit;

{$R *.DFM}


procedure TFrame_FrameBar.sTrackBar1Change(Sender: TObject);
begin
  sFrameBar1.BorderWidth := sTrackBar1.Position;
end;


procedure TFrame_FrameBar.sTrackBar2Change(Sender: TObject);
begin
  sFrameBar1.TitleHeight := sTrackBar2.Position;
end;


procedure TFrame_FrameBar.sFrameBar1Items0CreateFrame(Sender: TObject; var Frame: TCustomFrame);
begin
  Frame := TFrameDemo.Create(nil);
  MainForm.sSkinManager1.UpdateScale(Frame);
  if sComboBox3.ItemIndex >= 0 then
    TFrameDemo(Frame).sFrameAdapter1.SkinData.SkinSection := sComboBox3.Text;
end;


procedure TFrame_FrameBar.sComboBox1Change(Sender: TObject);
begin
  sFrameBar1.SkinData.SkinSection := sComboBox1.Text;
end;


procedure TFrame_FrameBar.sComboBox2Change(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to sFrameBar1.Items.Count - 1 do
    sFrameBar1.Items[i].SkinSection := sComboBox2.Text;
end;


procedure TFrame_FrameBar.sComboBox3Change(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to sFrameBar1.Items.Count - 1 do
    if (sFrameBar1.Items[i].Frame <> nil) then
      TFrameDemo(sFrameBar1.Items[i].Frame).sFrameAdapter1.SkinData.SkinSection := sComboBox3.Text;
end;


procedure TFrame_FrameBar.sCheckBox2Click(Sender: TObject);
begin
  sFrameBar1.AllowAllOpen := sCheckBox2.Checked;
end;


procedure TFrame_FrameBar.sCheckBox1Click(Sender: TObject);
begin
  sFrameBar1.AllowAllClose := sCheckBox1.Checked;
end;


procedure TFrame_FrameBar.sBitBtn1Click(Sender: TObject);
begin
  with sFrameBar1.Items.Add as TsTitleItem do begin
    Caption := 'New item';
    OnCreateFrame := sFrameBar1Items0CreateFrame;
    ImageIndex := 8;
  end;
end;


procedure TFrame_FrameBar.sCheckBox3Click(Sender: TObject);
begin
  if sCheckBox3.Checked then
    sFrameBar1.SkinData.VertScrollData.ButtonsSize := -1
  else
    sFrameBar1.SkinData.VertScrollData.ButtonsSize := 0;
end;


procedure TFrame_FrameBar.sCheckBox4Click(Sender: TObject);
begin
  sFrameBar1.Animation := sCheckBox4.Checked;
end;


procedure TFrame_FrameBar.sCheckBox5Click(Sender: TObject);
begin
  sFrameBar1.DragItems := sCheckBox5.Checked;
end;


procedure TFrame_FrameBar.sCheckBox6Click(Sender: TObject);
var
  i: integer;
begin
  sFrameBar1.SkinData.BeginUpdate;
  for i := 0 to sFrameBar1.Items.Count - 1 do
    sFrameBar1.Items[i].ShowArrow := sCheckBox6.Checked;

  sFrameBar1.SkinData.EndUpdate;
  sFrameBar1.SkinData.Invalidate(True);
end;


procedure TFrame_FrameBar.AfterCreation;
begin
  sFrameBar1.Animation := MainForm.ActionAnimation.Checked;
end;


procedure TFrame_FrameBar.sCheckBox7Click(Sender: TObject);
var
  i: integer;
begin
  sFrameBar1.SkinData.BeginUpdate;
  for i := 0 to sFrameBar1.Items.Count - 1 do
    sFrameBar1.Items[i].ShowCloseBtn := sCheckBox7.Checked;

  sFrameBar1.SkinData.EndUpdate;
  sFrameBar1.SkinData.Invalidate(True);
end;

end.
