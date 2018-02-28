unit UnitFrameScrolls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  {$IFNDEF DELPHI5} Types, {$ENDIF}

  sScrollBar, sGauge, sTrackBar, sFrameAdapter, ComCtrls, StdCtrls,
  sComboBox, acProgressBar, sRadioButton, sCheckBox, sEdit,

  UnitFrameCustom, sLabel, sGroupBox;


type
  TFrame_Scrolls = class(TCustomInfoFrame)
    sEdit1: TsEdit;
    sGauge2: TsGauge;
    sGauge1: TsGauge;
    sTrackBar1: TsTrackBar;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sScrollBar1: TsScrollBar;
    sScrollBar3: TsScrollBar;
    sProgressBar1: TsProgressBar;
    sProgressBar2: TsProgressBar;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sLabel1: TsLabel;
    sGroupBox1: TsGroupBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sTrackBar2: TsTrackBar;
    sCheckBox4: TsCheckBox;
    sGroupBox2: TsGroupBox;
    sRangeSelector1: TsRangeSelector;
    sComboBox3: TsComboBox;
    procedure sScrollBar2Change (Sender: TObject);
    procedure sTrackBar1Change  (Sender: TObject);
    procedure sComboBox2Change  (Sender: TObject);
    procedure sComboBox1Change  (Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure sCheckBox1Click   (Sender: TObject);
    procedure sCheckBox2Click   (Sender: TObject);
    procedure sEdit1Change      (Sender: TObject);
    procedure sCheckBox3Click   (Sender: TObject);
    procedure sCheckBox4Click   (Sender: TObject);
    procedure sCheckBox5Click(Sender: TObject);
    procedure sTrackBar2SkinPaint(Sender: TObject; Canvas: TCanvas);
    procedure sCheckBox6Click(Sender: TObject);
    procedure sScrollBar1Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
  end;


implementation

uses MainUnit, acPNG, sGraphUtils, acntUtils, math, sSkinManager;


{$R *.DFM}


procedure TFrame_Scrolls.sScrollBar2Change(Sender: TObject);
begin
  if not (csLoading in TComponent(Sender).ComponentState) then begin
    sGauge1.Progress := TsScrollBar(Sender).Position;

    sTrackBar1.Position  := sGauge1.Progress;
    sTrackBar2.Position  := sGauge1.Progress;

    sProgressBar1.Position := sGauge1.Progress;
    sProgressBar2.Position := sGauge1.Progress;
    sGauge2.Progress := sGauge1.Progress;
    Mainform.sGauge3.Progress := sGauge1.Progress;
  end;
end;


procedure TFrame_Scrolls.sTrackBar1Change(Sender: TObject);
begin
  if not (csLoading in TComponent(Sender).ComponentState) then begin
    if (Sender is TsTrackBar) then
      sGauge1.Progress := TsTrackBar(Sender).Position;

    sTrackBar1.Position  := sGauge1.Progress;
    sTrackBar2.Position  := sGauge1.Progress;
    sScrollBar3.Position := sGauge1.Progress;
    sProgressBar1.Position := sGauge1.Progress;
    sProgressBar2.Position := sGauge1.Progress;
    sGauge2.Progress := sGauge1.Progress;
    Mainform.sGauge3.Progress := sGauge1.Progress;
  end;
end;


procedure TFrame_Scrolls.sComboBox2Change(Sender: TObject);
begin
  sGauge1.ProgressSkin := sComboBox2.Text;
  sGauge2.ProgressSkin := sComboBox2.Text;
  sProgressBar1.ProgressSkin := sComboBox2.Text;
  sProgressBar2.ProgressSkin := sComboBox2.Text;
end;


procedure TFrame_Scrolls.sComboBox3Change(Sender: TObject);
begin
  sRangeSelector1.ChangingMode := TacChangingMode(sComboBox3.ItemIndex);
end;


procedure TFrame_Scrolls.sComboBox1Change(Sender: TObject);
begin
  sGauge1.Skindata.SkinSection := sComboBox1.Text;
  sGauge2.Skindata.SkinSection := sComboBox1.Text;
  sProgressBar1.Skindata.SkinSection := sComboBox1.Text;
  sProgressBar2.Skindata.SkinSection := sComboBox1.Text;
end;


procedure TFrame_Scrolls.sRadioButton1Click(Sender: TObject);
begin
  sProgressBar1.Style := pbstNormal
end;


procedure TFrame_Scrolls.sRadioButton2Click(Sender: TObject);
begin
  sProgressBar1.Style := pbstMarquee
end;


procedure TFrame_Scrolls.sCheckBox1Click(Sender: TObject);
begin
  sGauge1.Animated := sCheckBox1.Checked;
  sGauge2.Animated := sCheckBox1.Checked;
end;


procedure TFrame_Scrolls.sCheckBox2Click(Sender: TObject);
begin
  sGauge1.ShowText := sCheckBox2.Checked;
  sGauge2.ShowText := sCheckBox2.Checked;
end;


procedure TFrame_Scrolls.sEdit1Change(Sender: TObject);
begin
  sGauge1.Suffix := sEdit1.Text;
end;


procedure TFrame_Scrolls.sCheckBox3Click(Sender: TObject);
begin
  if sCheckBox3.Checked then begin
    // Load an image from AlphaImageList component
    if (MainForm.ImageList32.Items[9].ImgData <> nil) and (MainForm.ImageList32.Items[9].ImgData.Size > 0) then begin
      sTrackBar2.ThumbGlyph.Width := 28;
      sTrackBar2.ThumbGlyph.Height := 28;
      MainForm.ImageList32.GetBitmap32(9, sTrackBar2.ThumbGlyph);
    end;
  end
  else
    sTrackBar2.ThumbGlyph.Assign(nil);

  sTrackBar2.Repaint;
end;


procedure TFrame_Scrolls.sCheckBox4Click(Sender: TObject);
begin
  sTrackBar2.ShowProgress := sCheckBox4.Checked;
end;


procedure TFrame_Scrolls.sCheckBox5Click(Sender: TObject);
begin
  sTrackBar2.Reversed := sCheckBox5.Checked;
end;


procedure DrawAntialisedLine(Canvas: TCanvas; const AX1, AY1, AX2, AY2: real; const LineColor: TColor);
var
  swapped: boolean;

  procedure plot(const x, y, c: real);
  var
    resclr: TColor;
  begin
    if swapped then
      resclr := Canvas.Pixels[round(y), round(x)]
    else
      resclr := Canvas.Pixels[round(x), round(y)];

    resclr := RGB(round(GetRValue(resclr) * (1-c) + GetRValue(LineColor) * c),
                  round(GetGValue(resclr) * (1-c) + GetGValue(LineColor) * c),
                  round(GetBValue(resclr) * (1-c) + GetBValue(LineColor) * c));

    if swapped then
      Canvas.Pixels[round(y), round(x)] := resclr
    else
      Canvas.Pixels[round(x), round(y)] := resclr;
  end;

  function rfrac(const x: real): real;
  begin
    rfrac := 1 - frac(x);
  end;

  procedure swap(var a, b: real);
  var
    tmp: real;
  begin
    tmp := a;
    a := b;
    b := tmp;
  end;

var
  x1, x2, y1, y2, dx, dy, gradient, xend, yend, xgap, xpxl1, ypxl1, xpxl2, ypxl2, intery: real;
  x: integer;
begin
  x1 := AX1;
  x2 := AX2;
  y1 := AY1;
  y2 := AY2;

  dx := x2 - x1;
  dy := y2 - y1;
  swapped := abs(dx) < abs(dy);
  if swapped then begin
    swap(x1, y1);
    swap(x2, y2);
    swap(dx, dy);
  end;
  if x2 < x1 then begin
    swap(x1, x2);
    swap(y1, y2);
  end;

  gradient := dy / dx;

  xend := round(x1);
  yend := y1 + gradient * (xend - x1);
  xgap := rfrac(x1 + 0.5);
  xpxl1 := xend;
  ypxl1 := floor(yend);
  plot(xpxl1, ypxl1, rfrac(yend) * xgap);
  plot(xpxl1, ypxl1 + 1, frac(yend) * xgap);
  intery := yend + gradient;

  xend := round(x2);
  yend := y2 + gradient * (xend - x2);
  xgap := frac(x2 + 0.5);
  xpxl2 := xend;
  ypxl2 := floor(yend);
  plot(xpxl2, ypxl2, rfrac(yend) * xgap);
  plot(xpxl2, ypxl2 + 1, frac(yend) * xgap);

  for x := round(xpxl1) + 1 to round(xpxl2) - 1 do begin
    plot(x, floor(intery), rfrac(intery));
    plot(x, floor(intery) + 1, frac(intery));
    intery := intery + gradient;
  end;
end;


procedure TFrame_Scrolls.sTrackBar2SkinPaint(Sender: TObject; Canvas: TCanvas);
var
  Points: array [0..2] of TPoint;
  C: TColor;
  R: TRect;
begin
  if sCheckBox6.Checked then begin
    R := sTrackBar2.ChannelRect;
    OffsetRect(R, WidthOf(R), 0);
    InflateRect(R, 0, -HeightOf(sTrackBar2.ThumbRect) div 2);
    Points[0] := R.TopLeft;
    Points[1] := Point(R.Left, R.Bottom);
    if sTrackBar2.Reversed then
      Points[2] := Point(R.Right, R.Top)
    else
      Points[2] := Point(R.Right, R.Bottom);

    C := BlendColors(MainForm.sSkinManager1.Palette[pcMainColor], MainForm.sSkinManager1.Palette[pcLabelText], 205);
    Canvas.Brush.Color := C;
    Canvas.Brush.Style := bsSolid;
    Canvas.Pen.Style := psClear;
    Canvas.Polygon(Points);
    if sTrackBar2.Reversed then
      DrawAntialisedLine(Canvas, Points[2].X, Points[2].Y, Points[1].X, Points[1].Y, C)
    else
      DrawAntialisedLine(Canvas, Points[0].X, Points[0].Y, Points[2].X, Points[2].Y - 1, C)
  end;
end;


procedure TFrame_Scrolls.sCheckBox6Click(Sender: TObject);
const
  TickStyles: array [boolean] of TTickStyle = (tsAuto, tsNone);
begin
  sTrackBar2.TickStyle := TickStyles[sCheckBox6.Checked];
end;


procedure TFrame_Scrolls.sScrollBar1Change(Sender: TObject);
begin
  sTrackBar1.ShowProgressFrom := sScrollBar1.Position;
end;

end.
