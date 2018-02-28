unit UnitFrameMeter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  UnitFrameCustom,
  sFrameAdapter, acMeter, sGroupBox, ComCtrls, sTrackBar, sCheckBox, sEdit, sSpinEdit, sComboBoxes,
  ImgList, acAlphaImageList;

type
  TFrame_Meter = class(TCustomInfoFrame)
    sMeter1: TsMeter;

    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sCheckBox8: TsCheckBox;
    sCheckBox9: TsCheckBox;
    sCheckBox10: TsCheckBox;
    sCheckBox11: TsCheckBox;
    sCheckBox12: TsCheckBox;

    sColorBox1: TsColorBox;
    sColorBox2: TsColorBox;
    sColorBox3: TsColorBox;

    sTrackBar1: TsTrackBar;
    sGroupBox1: TsGroupBox;
    sRadioGroup1: TsRadioGroup;
    sVirtualImageList1: TsVirtualImageList;
    sAlphaImageList1: TsAlphaImageList;
    sSpinEdit3: TsSpinEdit;
    sSpinEdit4: TsSpinEdit;
    sSpinEdit5: TsSpinEdit;
    sSpinEdit6: TsSpinEdit;
    sGroupBox2: TsGroupBox;
    sSpinEdit1: TsSpinEdit;
    sSpinEdit2: TsSpinEdit;
    procedure sRadioGroup1Click(Sender: TObject);
    procedure sTrackBar1Change (Sender: TObject);
    procedure sCheckBox1Click  (Sender: TObject);
    procedure sCheckBox2Click  (Sender: TObject);
    procedure sSpinEdit1Change (Sender: TObject);
    procedure sSpinEdit2Change (Sender: TObject);
    procedure sCheckBox4Click  (Sender: TObject);
    procedure sColorBox1Change (Sender: TObject);
    procedure sColorBox2Change (Sender: TObject);
    procedure sCheckBox5Click  (Sender: TObject);
    procedure sCheckBox6Click  (Sender: TObject);
    procedure sCheckBox7Click  (Sender: TObject);
    procedure sCheckBox8Click  (Sender: TObject);
    procedure sColorBox3Change (Sender: TObject);
    procedure sCheckBox9Click(Sender: TObject);
    procedure sCheckBox10Click(Sender: TObject);
    procedure sCheckBox11Click(Sender: TObject);
    procedure sCheckBox12Click(Sender: TObject);
    procedure sSpinEdit3Change(Sender: TObject);
    procedure sSpinEdit4Change(Sender: TObject);
    procedure sSpinEdit5Change(Sender: TObject);
    procedure sSpinEdit6Change(Sender: TObject);
    procedure sGroupBox2CheckBoxChanged(Sender: TObject);
  end;

var
  Frame_Meter: TFrame_Meter;


implementation

uses MainUnit;

{$R *.dfm}


procedure TFrame_Meter.sRadioGroup1Click(Sender: TObject);
const
  ContentTypes: array [0..3] of TContentType = (ctGradient, ctValues, ctNone, ctCustomImage);
begin
  sMeter1.ContentType := ContentTypes[sRadioGroup1.ItemIndex];
  sCheckBox4.Enabled := sRadioGroup1.ItemIndex = 0;
  sCheckBox8.Enabled := sCheckBox4.Enabled;

  sColorBox1.Enabled := sRadioGroup1.ItemIndex <> 3;
  sColorBox2.Enabled := sColorBox1.Enabled;
  sColorBox3.Enabled := sColorBox1.Enabled;
  sCheckBox7.Enabled := sColorBox1.Enabled;
  sCheckBox2.Enabled := sColorBox1.Enabled;
  sGroupBox2.Enabled := sColorBox1.Enabled;
  sSpinEdit1.Enabled := sColorBox1.Enabled;
  sSpinEdit2.Enabled := sColorBox1.Enabled;
  sSpinEdit3.Enabled := sColorBox1.Enabled;
  sCheckBox5.Enabled := sColorBox1.Enabled;
  sCheckBox11.Enabled := sColorBox1.Enabled;
  sMeter1.ShowMinMax := sColorBox1.Enabled and sCheckBox2.Checked;
  if sRadioGroup1.ItemIndex = 3 then begin
    sColorBox1.Selected := $FF7744;
    sColorBox1.OnChange(sColorBox1);
  end
  else
    if not sCheckBox4.Enabled then
      sMeter1.PaintData.ArrowColor := sColorBox1.Selected
    else
      sColorBox1.OnChange(sColorBox1);
end;


procedure TFrame_Meter.sTrackBar1Change(Sender: TObject);
begin
  sMeter1.Position := sTrackBar1.Position;
  if sCheckBox9.Checked then // If moved over bounds
    if (sMeter1.Position > sMeter1.Max) or (sMeter1.Position < sMeter1.Min) then begin
      // Set special color
      sMeter1.PaintData.ArrowColor := clRed;
      sMeter1.PaintData.DialColor := clRed;
    end
    else begin // Return usual colors
      sCheckBox4.OnClick(sCheckBox4);
      sCheckBox8.OnClick(sCheckBox8);
    end;
end;


procedure TFrame_Meter.sCheckBox1Click(Sender: TObject);
begin
  sMeter1.ShowCaption := sCheckBox1.Checked;
  sCheckBox10.Enabled := sCheckBox1.Checked;
end;


procedure TFrame_Meter.sCheckBox2Click(Sender: TObject);
begin
  sMeter1.ShowMinMax  := sCheckBox2.Checked;
  sCheckBox11.Enabled := sCheckBox2.Checked;
end;


procedure TFrame_Meter.sSpinEdit1Change(Sender: TObject);
begin
  sMeter1.TickStepBig := sSpinEdit1.Value;
end;


procedure TFrame_Meter.sSpinEdit2Change(Sender: TObject);
begin
  sMeter1.TickStepSmall := sSpinEdit2.Value;
end;


procedure TFrame_Meter.sCheckBox4Click(Sender: TObject);
begin
  sColorBox1.Enabled := not sCheckBox4.Checked;
  if sCheckBox4.Checked then
    sMeter1.PaintData.ArrowColor := clNone
  else
    sMeter1.PaintData.ArrowColor := sColorBox1.Selected;
end;


procedure TFrame_Meter.sColorBox1Change(Sender: TObject);
begin
  sMeter1.PaintData.ArrowColor := sColorBox1.Selected;
end;


procedure TFrame_Meter.sColorBox2Change(Sender: TObject);
begin
  sMeter1.PaintData.Color := sColorBox2.Selected;
end;


procedure TFrame_Meter.sCheckBox5Click(Sender: TObject);
begin
  sMeter1.PaintData.Transparent := sCheckBox5.Checked;
  sColorBox2.Enabled := not sCheckBox5.Checked;
end;


procedure TFrame_Meter.sCheckBox6Click(Sender: TObject);
begin
  sMeter1.PaintData.ArrowShadow.Visible := sCheckBox6.Checked;
end;


procedure TFrame_Meter.sCheckBox7Click(Sender: TObject);
begin
  sMeter1.PaintData.DialShadow.Visible := sCheckBox7.Checked;
end;


procedure TFrame_Meter.sCheckBox8Click(Sender: TObject);
begin
  sColorBox3.Enabled := not sCheckBox8.Checked;
  if sCheckBox8.Checked then
    sMeter1.PaintData.DialColor := clNone
  else
    sMeter1.PaintData.DialColor := sColorBox1.Selected;
end;


procedure TFrame_Meter.sColorBox3Change(Sender: TObject);
begin
  sMeter1.PaintData.DialColor := sColorBox3.Selected;
end;


procedure TFrame_Meter.sCheckBox9Click(Sender: TObject);
begin
  if sCheckBox9.Checked then begin
    sMeter1.IgnoreBounds := True;
    sTrackBar1.Min := -20;
    sTrackBar1.Max := 170;
  end
  else begin
    sMeter1.IgnoreBounds := False;
    sTrackBar1.Min := 0;
    sTrackBar1.Max := 150;
  end;
end;


procedure TFrame_Meter.sCheckBox10Click(Sender: TObject);
begin
  sMeter1.ShowCaptionValue := sCheckBox10.Checked;
end;


procedure TFrame_Meter.sCheckBox11Click(Sender: TObject);
begin
  sMeter1.ShowMinMaxValue := sCheckBox11.Checked;
end;


procedure TFrame_Meter.sCheckBox12Click(Sender: TObject);
begin
  if sCheckBox12.Checked then
    sMeter1.Images := sVirtualImageList1
  else
    sMeter1.Images := nil;
end;


procedure TFrame_Meter.sSpinEdit3Change(Sender: TObject);
begin
  sMeter1.PaintData.DialPenWidth := sSpinEdit3.Value;
  sMeter1.Repaint;
end;


procedure TFrame_Meter.sSpinEdit4Change(Sender: TObject);
begin
  sMeter1.PaintData.ArrowPenWidth := sSpinEdit4.Value;
  sMeter1.Repaint;
end;


procedure TFrame_Meter.sSpinEdit5Change(Sender: TObject);
begin
  sMeter1.PaintData.DialShadow.Size := sSpinEdit5.Value;
  sMeter1.PaintData.ArrowShadow.Size := sSpinEdit5.Value;
  sMeter1.Repaint;
end;


procedure TFrame_Meter.sSpinEdit6Change(Sender: TObject);
begin
  sMeter1.PaintData.DialShadow.Transparency := sSpinEdit6.Value;
  sMeter1.PaintData.ArrowShadow.Transparency := sSpinEdit6.Value;
  sMeter1.Repaint;
end;


procedure TFrame_Meter.sGroupBox2CheckBoxChanged(Sender: TObject);
begin
  sMeter1.ShowTicks := sGroupBox2.Checked;
  sSpinEdit1.Enabled := sMeter1.ShowTicks;
  sSpinEdit2.Enabled := sMeter1.ShowTicks;
end;                        

end.
