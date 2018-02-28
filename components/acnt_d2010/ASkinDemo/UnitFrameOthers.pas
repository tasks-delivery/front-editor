unit UnitFrameOthers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,

  sLabel, sFrameAdapter, sSpeedButton, sColorSelect, sBitBtn, sMonthCalendar, sPanel, sFontCtrls, sScrollBar,
  acHeaderControl, sCheckBox, sComboBox, sEdit, sListBox,

  UnitFrameCustom, sButton;

type
  TFrame_Others = class(TCustomInfoFrame)
    sWebLabel1: TsWebLabel;
    sColorSelect1: TsColorSelect;
    sMonthCalendar1: TsMonthCalendar;
    sHeaderControl1: TsHeaderControl;
    sFontListBox1: TsFontListBox;
    sFontComboBox1: TsFontComboBox;
    sComboBox1: TsComboBox;
    sHTMLLabel1: TsHTMLLabel;
    sGradientPanel1: TsGradientPanel;
    sButton1: TsButton;
    sImgLabel1: TsImgLabel;
    sImgLabel2: TsImgLabel;
    procedure FrameResize(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sFontListBox1MeasureItem(Control: TWinControl;
      Index: Integer; var Height: Integer);
    procedure sButton1Click(Sender: TObject);
  end;

implementation

uses MainUnit, sConst, sGradient, sColorDialog, sGradBuilder;

{$R *.DFM}

procedure TFrame_Others.FrameResize(Sender: TObject);
begin
  sFontComboBox1.ItemIndex := 0;
end;


procedure TFrame_Others.sComboBox1Change(Sender: TObject);
begin
  sMonthCalendar1.SkinData.SkinSection := sComboBox1.Text
end;


procedure TFrame_Others.sFontListBox1MeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
begin
//  Height := 21;
end;


procedure TFrame_Others.sButton1Click(Sender: TObject);
var
  GradArray: TsGradArray;
begin
  CreateEditorForm(ColDlg);
  PrepareGradArray(sGradientPanel1.PaintData.CustomGradient, GradArray);
  GradBuilder.LoadFromArray(GradArray);
  GradBuilder.ShowModal;
  case GradBuilder.ModalResult of
    mrOk: sGradientPanel1.PaintData.CustomGradient := GradBuilder.AsString;
    mrNone: sGradientPanel1.PaintData.CustomGradient := '';
  end;
  KillForm;
end;

end.
