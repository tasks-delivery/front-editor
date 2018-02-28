unit UnitFramePanels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  sSplitter, sPanel, sMonthCalendar, sGroupBox, sFrameAdapter, sButton, sStatusBar, sComboBox, sCheckBox,
  UnitFrameCustom, sComboBoxes, sEdit, sLabel;

type
  TFrame_Panels = class(TCustomInfoFrame)
    sPanel1: TsPanel;
    sContainer2: TsPanel;
    sSplitter1: TsSplitter;
    sSplitter2: TsSplitter;
    sPanel2: TsPanel;
    sPanel6: TsPanel;
    sPanel7: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sGroupBox1: TsGroupBox;
    sSplitter3: TsSplitter;
    sPanel8: TsPanel;
    sComboBox1: TsComboBox;
    sRadioGroup1: TsRadioGroup;
    sCheckBox1: TsCheckBox;
    sComboBox2: TsComboBox;
    sRollOutPanel1: TsRollOutPanel;
    sComboBox3: TsComboBox;
    sCheckBox2: TsCheckBox;
    sLabel1: TsLabel;
    sButton1: TsButton;
    sEdit1: TsEdit;
    sCheckBox3: TsCheckBox;
    procedure sComboBox2Change(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sRadioGroup1Click(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
  end;

implementation

{$R *.DFM}

uses sSkinProps, sConst, MainUnit;


procedure TFrame_Panels.sComboBox2Change(Sender: TObject);
begin
  sGroupBox1.CaptionSkin := sComboBox2.Text;
end;


procedure TFrame_Panels.sCheckBox1Click(Sender: TObject);
begin
  sSplitter1.SizingByClick := sCheckBox1.Checked;
  sSplitter2.SizingByClick := sCheckBox1.Checked;
  sSplitter3.SizingByClick := sCheckBox1.Checked;
end;


procedure TFrame_Panels.sRadioGroup1Click(Sender: TObject);
const
  BevelsArray: array [0..3] of TBevelCut = (bvNone, bvLowered, bvRaised, bvSpace);
begin
  sPanel8.BevelOuter := BevelsArray[sRadioGroup1.ItemIndex];
end;


procedure TFrame_Panels.sComboBox1Change(Sender: TObject);
begin
  sPanel8.SkinData.SkinSection := sComboBox1.Text;
  sRadioGroup1.Enabled := sComboBox1.Text = '';
end;


procedure TFrame_Panels.sComboBox3Change(Sender: TObject);
begin
  sRollOutPanel1.Placement := TacSide(sComboBox3.ItemIndex);
end;


procedure TFrame_Panels.sCheckBox2Click(Sender: TObject);
begin
  sRollOutPanel1.AutoHide := sCheckBox2.Checked;
end;

procedure TFrame_Panels.sCheckBox3Click(Sender: TObject);
begin
  sRollOutPanel1.AutoShow := sCheckBox3.Checked;
end;

end.
