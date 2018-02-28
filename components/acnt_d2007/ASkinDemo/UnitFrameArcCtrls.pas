unit UnitFrameArcCtrls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, StdCtrls, Graphics, ComCtrls, Controls, Forms, Dialogs, Buttons,
  UnitFrameCustom,
  sFrameAdapter, sPageControl, acArcControls, sCheckBox, acAlphaImageList, sLabel,
  sTrackBar, sComboBox, sSpeedButton, ImgList, sGroupBox, sComboBoxes, acntTypes,
  sEdit;

type
  TFrame_ArcCtrls = class(TCustomInfoFrame)
    sPageControl1: TsPageControl;
    TabArcGauge: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sArcGauge1: TsArcGauge;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sAlphaImageList1: TsAlphaImageList;
    sTrackBar2: TsTrackBar;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sTrackBar1: TsTrackBar;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sTrackBar3: TsTrackBar;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sTrackBar4: TsTrackBar;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sArcPreloader1: TsArcPreloader;
    sTrackBar5: TsTrackBar;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    sTrackBar6: TsTrackBar;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    sTrackBar7: TsTrackBar;
    sCheckBox4: TsCheckBox;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sCheckBox5: TsCheckBox;
    sTrackBar8: TsTrackBar;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    sTabSheet1: TsTabSheet;
    sArcHandle1: TsArcHandle;
    sComboBox3: TsComboBox;
    sTrackBar9: TsTrackBar;
    sLabel17: TsLabel;
    sLabel18: TsLabel;
    sTrackBar10: TsTrackBar;
    sLabel19: TsLabel;
    sLabel20: TsLabel;
    sTabSheet3: TsTabSheet;
    sArcDial1: TsArcDial;
    sLabel21: TsLabel;
    sLabel22: TsLabel;
    sTrackBar11: TsTrackBar;
    sLabel23: TsLabel;
    sLabel24: TsLabel;
    sTrackBar12: TsTrackBar;
    sTabSheet4: TsTabSheet;
    sRoundBtn1: TsRoundBtn;
    sTrackBar13: TsTrackBar;
    sLabel25: TsLabel;
    sLabel26: TsLabel;
    sLabel27: TsLabel;
    sLabel28: TsLabel;
    sTrackBar14: TsTrackBar;
    sLabel29: TsLabel;
    sLabel30: TsLabel;
    sTrackBar15: TsTrackBar;
    sComboBox4: TsComboBox;
    sGroupBox1: TsGroupBox;
    sPageControl2: TsPageControl;
    sTabSheet5: TsTabSheet;
    sTabSheet6: TsTabSheet;
    sTabSheet7: TsTabSheet;
    sColorBox1: TsColorBox;
    sColorBox2: TsColorBox;
    sColorBox3: TsColorBox;
    sColorBox4: TsColorBox;
    sColorBox5: TsColorBox;
    sColorBox6: TsColorBox;
    sColorBox7: TsColorBox;
    sColorBox8: TsColorBox;
    sColorBox9: TsColorBox;
    sColorBox10: TsColorBox;
    sColorBox11: TsColorBox;
    sColorBox12: TsColorBox;
    sTrackBar16: TsTrackBar;
    sLabel31: TsLabel;
    sLabel32: TsLabel;
    sTrackBar17: TsTrackBar;
    sLabel33: TsLabel;
    sLabel34: TsLabel;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sComboBox5: TsComboBox;
    sComboBox6: TsComboBox;
    sCheckBox8: TsCheckBox;
    sEdit1: TsEdit;
    sCheckBox9: TsCheckBox;
    sLabel35: TsLabel;
    sLabel36: TsLabel;
    sTrackBar18: TsTrackBar;
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sTrackBar2Change(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure sTrackBar3Change(Sender: TObject);
    procedure sTrackBar4Change(Sender: TObject);
    procedure sTrackBar5Change(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
    procedure sCheckBox5Click(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sComboBox2Change(Sender: TObject);
    procedure sTrackBar7Change(Sender: TObject);
    procedure sTrackBar8Change(Sender: TObject);
    procedure sTrackBar6Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
    procedure sTrackBar9Change(Sender: TObject);
    procedure sTrackBar10Change(Sender: TObject);
    procedure sTrackBar11Change(Sender: TObject);
    procedure sTrackBar12Change(Sender: TObject);
    procedure sTrackBar13Change(Sender: TObject);
    procedure sTrackBar14Change(Sender: TObject);
    procedure sTrackBar15Change(Sender: TObject);
    procedure sComboBox4Change(Sender: TObject);
    procedure sColorBox1Change(Sender: TObject);
    procedure sColorBox2Change(Sender: TObject);
    procedure sColorBox3Change(Sender: TObject);
    procedure sColorBox4Change(Sender: TObject);
    procedure sColorBox5Change(Sender: TObject);
    procedure sColorBox6Change(Sender: TObject);
    procedure sColorBox7Change(Sender: TObject);
    procedure sColorBox8Change(Sender: TObject);
    procedure sColorBox9Change(Sender: TObject);
    procedure sColorBox10Change(Sender: TObject);
    procedure sColorBox11Change(Sender: TObject);
    procedure sColorBox12Change(Sender: TObject);
    procedure sGroupBox1CheckBoxChanged(Sender: TObject);
    procedure sTrackBar16Change(Sender: TObject);
    procedure sTrackBar17Change(Sender: TObject);
    procedure sCheckBox6Click(Sender: TObject);
    procedure sCheckBox7Click(Sender: TObject);
    procedure sComboBox5Change(Sender: TObject);
    procedure sComboBox6Change(Sender: TObject);
    procedure sCheckBox8Click(Sender: TObject);
    procedure sPageControl1Change(Sender: TObject);
    procedure sEdit1Change(Sender: TObject);
    procedure sPageControl1PageChanging(Sender: TObject; NewPage: TsTabSheet; var AllowChange: Boolean);
    procedure sRoundBtn1GetButtonPaintData(Sender: TObject; var PaintData: TacButtonPaintData);
    procedure sArcGauge1GetPaintData(Sender: TObject; var PaintData: TacGaugePaintData);
    procedure sArcPreloader1GetPaintData(Sender: TObject; var PaintData: TacPreloaderPaintData);
    procedure sArcHandle1GetHandlePaintData(Sender: TObject;
      var PaintData: TacButtonPaintData);
    procedure sArcDial1GetHandlePaintData(Sender: TObject;
      var PaintData: TacButtonPaintData);
    procedure sCheckBox9Click(Sender: TObject);
    procedure sTrackBar18Change(Sender: TObject);
  public
  end;

var
  Frame_ArcCtrls: TFrame_ArcCtrls;

implementation

uses sVCLUtils, acntUtils;

{$R *.dfm}

procedure UseSkinColors(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsArcControl then begin
    TsArcControl(Ctrl).SkinData.CustomColor := (Data = 0);
    TsArcControl(Ctrl).SkinData.CustomFont := (Data = 0);
  end;
end;


procedure TFrame_ArcCtrls.sArcDial1GetHandlePaintData(Sender: TObject; var PaintData: TacButtonPaintData);
begin
  PaintData.AText := PaintData.AText + sEdit1.Text;
end;


procedure TFrame_ArcCtrls.sArcGauge1GetPaintData(Sender: TObject; var PaintData: TacGaugePaintData);
begin
  PaintData.AText := PaintData.AText + sEdit1.Text;
end;


procedure TFrame_ArcCtrls.sArcHandle1GetHandlePaintData(Sender: TObject; var PaintData: TacButtonPaintData);
begin
  PaintData.AText := PaintData.AText + sEdit1.Text;
end;


procedure TFrame_ArcCtrls.sArcPreloader1GetPaintData(Sender: TObject; var PaintData: TacPreloaderPaintData);
begin
  PaintData.AText := PaintData.AText + sEdit1.Text;
end;


procedure TFrame_ArcCtrls.sCheckBox1Click(Sender: TObject);
begin
  IterateControls(sPageControl1, integer(sCheckBox1.Checked), UseSkinColors);
  sGroupBox1.Checked := not sCheckBox1.Checked;
end;


procedure ShowGlyph(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsRoundBtn then
    TsRoundBtn(Ctrl).ImageIndex := Data
  else
    if Ctrl is TsArcControl then
      TsArcControl(Ctrl).GlyphIndex := Data;
end;           

procedure TFrame_ArcCtrls.sCheckBox2Click(Sender: TObject);
begin
  IterateControls(sPageControl1, iff(sCheckBox2.Checked, 0, -1), ShowGlyph);
end;


procedure ShowCaption(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsRoundBtn then
    TsRoundBtn(Ctrl).ShowCaption := (Data = 1)
  else
    if Ctrl is TsArcControl then
      TsArcControl(Ctrl).ShowText := (Data = 1);
end;

procedure TFrame_ArcCtrls.sCheckBox3Click(Sender: TObject);
begin
  IterateControls(sPageControl1, integer(sCheckBox3.Checked), ShowCaption);
end;


procedure TFrame_ArcCtrls.sCheckBox4Click(Sender: TObject);
begin
  sArcPreloader1.Animated := sCheckBox4.Checked;
end;


procedure TFrame_ArcCtrls.sCheckBox5Click(Sender: TObject);
begin
  sArcPreloader1.Stretched := sCheckBox5.Checked;
end;


procedure TFrame_ArcCtrls.sCheckBox6Click(Sender: TObject);
begin
  sArcHandle1.Transparent := sCheckBox6.Checked;
  sComboBox5.Enabled  := not sCheckBox6.Checked;
  sTrackBar16.Enabled := not sCheckBox6.Checked;
  sLabel31.Enabled    := not sCheckBox6.Checked;
  sLabel32.Enabled    := not sCheckBox6.Checked;
end;


procedure TFrame_ArcCtrls.sCheckBox7Click(Sender: TObject);
begin
  sArcDial1.Transparent := sCheckBox7.Checked;
  sComboBox6.Enabled  := not sCheckBox7.Checked;
  sTrackBar17.Enabled := not sCheckBox7.Checked;
  sLabel33.Enabled    := not sCheckBox7.Checked;
  sLabel34.Enabled    := not sCheckBox7.Checked;
end;


procedure ReflectedProc(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsArcControl then
    TsArcControl(Ctrl).GlyphReflected := boolean(Data);
end;


procedure TFrame_ArcCtrls.sCheckBox8Click(Sender: TObject);
begin
  IterateControls(sPageControl1, integer(sCheckBox8.Checked), ReflectedProc);
end;


procedure TFrame_ArcCtrls.sColorBox10Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataPressed.Color2 := sColorBox10.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox11Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataPressed.BorderColor := sColorBox11.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox12Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataPressed.FontColor := sColorBox12.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox1Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataNormal.Color1 := sColorBox1.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox2Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataNormal.Color2 := sColorBox2.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox3Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataNormal.BorderColor := sColorBox3.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox4Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataNormal.FontColor := sColorBox4.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox5Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataActive.Color1 := sColorBox5.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox6Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataActive.Color2 := sColorBox6.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox7Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataActive.BorderColor := sColorBox7.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox8Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataActive.FontColor := sColorBox8.Selected;
end;


procedure TFrame_ArcCtrls.sColorBox9Change(Sender: TObject);
begin
  sRoundBtn1.PaintOptions.DataPressed.Color1 := sColorBox9.Selected;
end;


procedure TFrame_ArcCtrls.sComboBox1Change(Sender: TObject);
begin
  sArcPreloader1.MotionType := TacMotionType(sComboBox1.ItemIndex);
end;


procedure TFrame_ArcCtrls.sComboBox2Change(Sender: TObject);
begin
  sArcPreloader1.ImageType := TacImageType(sComboBox2.ItemIndex);
end;


procedure TFrame_ArcCtrls.sComboBox3Change(Sender: TObject);
begin
  sArcHandle1.TextContent := TacTextContent(sComboBox3.ItemIndex);
end;


procedure TFrame_ArcCtrls.sComboBox4Change(Sender: TObject);
begin
  sRoundBtn1.Layout := TButtonLayout(sComboBox4.ItemIndex);
end;


procedure TFrame_ArcCtrls.sComboBox5Change(Sender: TObject);
begin
  sArcHandle1.KnobPosition := TacKnobPosition(sComboBox5.ItemIndex);
end;


procedure TFrame_ArcCtrls.sComboBox6Change(Sender: TObject);
begin
  sArcDial1.KnobPosition := TacKnobPosition(sComboBox6.ItemIndex);
end;


procedure TFrame_ArcCtrls.sEdit1Change(Sender: TObject);
begin
  sArcDial1.Repaint;
  sRoundBtn1.Repaint;
  sArcGauge1.Repaint;
  sArcHandle1.Repaint;
  sArcPreloader1.Repaint;
end;


procedure EnableDisableProc(Ctrl: TControl; Data: integer);
begin
  Ctrl.Enabled := boolean(Data);
end;


procedure TFrame_ArcCtrls.sGroupBox1CheckBoxChanged(Sender: TObject);
begin
  sRoundBtn1.SkinData.CustomColor := sGroupBox1.Checked;
  sRoundBtn1.SkinData.CustomFont := sGroupBox1.Checked;
  IterateControls(sGroupBox1, integer(sGroupBox1.Checked), EnableDisableProc);
end;


procedure TFrame_ArcCtrls.sPageControl1Change(Sender: TObject);
begin
  sGroupBox1.Checked := not sCheckBox1.Checked;
end;


procedure TFrame_ArcCtrls.sPageControl1PageChanging(Sender: TObject; NewPage: TsTabSheet; var AllowChange: Boolean);
var
  b: boolean;
begin
  b := NewPage.PageIndex in [1..3];
  sTrackBar3.Enabled := b;
  sLabel5.Enabled := b;
  sLabel6.Enabled := b;
end;


procedure TFrame_ArcCtrls.sRoundBtn1GetButtonPaintData(Sender: TObject; var PaintData: TacButtonPaintData);
begin
  PaintData.AText := PaintData.AText + sEdit1.Text;
end;


procedure TFrame_ArcCtrls.sTrackBar10Change(Sender: TObject);
begin
  sLabel20.Caption := IntToStr(sTrackBar10.Position);
  sArcHandle1.KnobSize := sTrackBar10.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar11Change(Sender: TObject);
begin
  sLabel22.Caption := IntToStr(sTrackBar11.Position);
  sArcDial1.PaintOptions.BorderWidth := sTrackBar11.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar12Change(Sender: TObject);
begin
  sLabel24.Caption := IntToStr(sTrackBar12.Position);
  sArcDial1.KnobSize := sTrackBar12.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar1Change(Sender: TObject);
begin
  sLabel4.Caption := IntToStr(sTrackBar1.Position);
  sArcGauge1.Progress := sTrackBar1.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar2Change(Sender: TObject);
begin
  sLabel2.Caption := IntToStr(sTrackBar2.Position);
  sArcGauge1.LineWidth := sTrackBar2.Position;
end;


procedure BaseAngle(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsArcControl then
    TsArcControl(Ctrl).BaseAngle := Data;
end;


procedure TFrame_ArcCtrls.sTrackBar3Change(Sender: TObject);
begin
  sLabel6.Caption := IntToStr(sTrackBar3.Position);
  IterateControls(sPageControl1, sTrackBar3.Position, BaseAngle);
end;


procedure TFrame_ArcCtrls.sTrackBar4Change(Sender: TObject);
begin
  sLabel8.Caption := IntToStr(sTrackBar4.Position);
  sArcGauge1.BaseBlend := sTrackBar4.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar5Change(Sender: TObject);
begin
  sLabel10.Caption := IntToStr(sTrackBar5.Position);
  sArcPreloader1.LineWidth := sTrackBar5.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar6Change(Sender: TObject);
begin
  sLabel12.Caption := IntToStr(sTrackBar6.Position);
  sArcPreloader1.Text := IntToStr(sTrackBar6.Position);
end;


procedure TFrame_ArcCtrls.sTrackBar7Change(Sender: TObject);
begin
  sLabel14.Caption := IntToStr(sTrackBar7.Position);
  sArcPreloader1.BaseBlend := sTrackBar7.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar8Change(Sender: TObject);
begin
  sLabel16.Caption := IntToStr(sTrackBar8.Position);
  sArcPreloader1.LineAngle := sTrackBar8.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar9Change(Sender: TObject);
begin
  sLabel18.Caption := IntToStr(sTrackBar9.Position);
  sArcHandle1.PaintOptions.BorderWidth := sTrackBar9.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar13Change(Sender: TObject);
begin
  sLabel26.Caption := IntToStr(sTrackBar13.Position);
  sRoundBtn1.SetBounds(sRoundBtn1.Left, sRoundBtn1.Top, sTrackBar13.Position, sTrackBar13.Position);
end;


procedure TFrame_ArcCtrls.sTrackBar14Change(Sender: TObject);
begin
  sLabel28.Caption := IntToStr(sTrackBar14.Position);
  sRoundBtn1.PaintOptions.BorderWidth := sTrackBar14.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar15Change(Sender: TObject);
begin
  sLabel30.Caption := IntToStr(sTrackBar15.Position);
  sRoundBtn1.PaintOptions.BevelWidth := sTrackBar15.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar16Change(Sender: TObject);
begin
  sLabel32.Caption := IntToStr(sTrackBar16.Position);
  sArcHandle1.PaintOptions.BevelWidth := sTrackBar16.Position;
end;


procedure TFrame_ArcCtrls.sTrackBar17Change(Sender: TObject);
begin
  sLabel34.Caption := IntToStr(sTrackBar17.Position);
  sArcDial1.PaintOptions.BevelWidth := sTrackBar17.Position;
end;

procedure TFrame_ArcCtrls.sCheckBox9Click(Sender: TObject);
begin
  sRoundBtn1.Transparent := sCheckBox9.Checked;
end;


procedure GlyphBlend(Ctrl: TControl; Data: integer);
begin
  if Ctrl is TsArcControl then
    TsArcControl(Ctrl).GlyphBlend := Data;
end;


procedure TFrame_ArcCtrls.sTrackBar18Change(Sender: TObject);
begin
  sLabel36.Caption := IntToStr(sTrackBar18.Position);
  IterateControls(sPageControl1, sTrackBar18.Position, GlyphBlend);
end;

end.
