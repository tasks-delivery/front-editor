unit UnitFrameScrollBoxes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Mask, ComCtrls,

  sCheckbox, sPanel, sGroupBox, sTrackBar, sCustomComboEdit, sCurrEdit, sCurrencyEdit, StdCtrls,
  sMemo, sEdit, sSpinEdit, sScrollBox, sFrameAdapter, sPageControl, sTabControl, sButton, sMaskEdit,
  sGauge, sComboBox,

  UnitFrameCustom;


type
  TFrame_ScrollBoxes = class(TCustomInfoFrame)
    sScrollBox1: TsScrollBox;
    sSpinEdit2: TsSpinEdit;
    sMemo2: TsMemo;
    sCurrencyEdit2: TsCurrencyEdit;
    sCurrencyEdit3: TsCurrencyEdit;
    sSpinEdit3: TsSpinEdit;
    sTrackBar2: TsTrackBar;
    sGroupBox3: TsGroupBox;
    sCheckBox10: TsCheckBox;
    sCheckBox11: TsCheckBox;
    sCheckBox12: TsCheckBox;
    sCheckBox13: TsCheckBox;
    sCheckBox14: TsCheckBox;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    sTabSheet4: TsTabSheet;
    sTabSheet5: TsTabSheet;
    sTabSheet6: TsTabSheet;
    sPanel1: TsPanel;
    sButton4: TsButton;
    sButton5: TsButton;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sGauge1: TsGauge;
    sComboBox1: TsComboBox;
    sCheckBox1: TsCheckBox;
    sButton1: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    sTabSheet7: TsTabSheet;
    sTabSheet8: TsTabSheet;
    procedure sTrackBar2Change(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
  end;

implementation

uses MainUnit;

{$R *.DFM}


procedure TFrame_ScrollBoxes.sTrackBar2Change(Sender: TObject);
begin
  sGauge1.Progress := sTrackBar2.Position;
end;


procedure TFrame_ScrollBoxes.sComboBox1Change(Sender: TObject);
begin
  sScrollBox1.SkinData.SkinSection := sComboBox1.Text;
end;


procedure TFrame_ScrollBoxes.sCheckBox1Click(Sender: TObject);
begin
  sScrollBox1.AutoMouseWheel := sCheckBox1.Checked
end;

end.
