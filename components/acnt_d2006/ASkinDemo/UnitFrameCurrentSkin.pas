unit UnitFrameCurrentSkin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, ExtCtrls,

  UnitFrameCustom,

  sCheckBox, sPanel, acSlider, sBitBtn, sMaskEdit, sCustomComboEdit, sToolEdit,
  sFrameAdapter, sButton, sLabel, sTrackBar, sSpeedButton, sGroupBox,
  sComboBox;


type
  TFrame_CurrentSkin = class(TCustomInfoFrame)
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sLabel12: TsLabel;

    sTrackBar2: TsTrackBar;
    sTrackBar1: TsTrackBar;
    sTrackBar3: TsTrackBar;

    sGroupBox1: TsGroupBox;
    sHTMLLabel1: TsHTMLLabel;
    SkinsDirectoryEdit: TsDirectoryEdit;
    sGroupBox2: TsGroupBox;
    SliderExtBorders: TsSlider;
    SliderDiscolor: TsSlider;
    SliderNonClient: TsSlider;
    SliderBlendOnMove: TsSlider;
    sComboBox1: TsComboBox;
    sGroupBox3: TsGroupBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    procedure SkinsDirectoryEditChange      (Sender: TObject);
    procedure sTrackBar1Change              (Sender: TObject);
    procedure sTrackBar2Change              (Sender: TObject);
    procedure sStickyLabel2Click            (Sender: TObject);
    procedure SliderExtBordersSliderChange  (Sender: TObject);
    procedure SliderNonClientSliderChange   (Sender: TObject);
    procedure SliderBlendOnMoveSliderChange (Sender: TObject);
    procedure SliderDiscolorSliderChange    (Sender: TObject);
    procedure sTrackBar3Change              (Sender: TObject);
    procedure sTrackBar1SkinPaint           (Sender: TObject; Canvas: TCanvas);
    procedure sComboBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure sComboBox1Change(Sender: TObject);
    procedure sComboBox2Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
  public
    procedure AfterCreation; override;
    procedure AfterSkinChange; override;
  end;


implementation


uses
  sStyleSimply, sGraphUtils, acntUtils, sSkinManager, sConst, acntTypes,
  MainUnit;

{$R *.dfm}

procedure TFrame_CurrentSkin.AfterCreation;
begin
  InInit := True;
  inherited;
  SkinsDirectoryEdit.Text := MainForm.sSkinManager1.SkinDirectory;

  SliderExtBorders .SliderOn := MainForm.sSkinManager1.ExtendedBorders;
  SliderBlendOnMove.SliderOn := MainForm.sSkinManager1.AnimEffects.BlendOnMoving.Active;
  SliderDiscolor   .SliderOn := MainForm.sSkinManager1.Effects.DiscoloredGlyphs;
  SliderNonClient  .SliderOn := MainForm.sSkinProvider1.DrawNonClientArea;

  sTrackBar1.Enabled := MainForm.ActionSkinned.Checked;
  sTrackBar2.Enabled := MainForm.ActionSkinned.Checked;
  sTrackBar3.Enabled := MainForm.ActionSkinned.Checked;

  AfterSkinChange;

  MainForm.sSkinManager1.Fonts.MainFont := sComboBox3.Items[sComboBox3.ItemIndex]; // Custom font - Comic Sans MS
  InInit := False;
end;


procedure TFrame_CurrentSkin.SkinsDirectoryEditChange(Sender: TObject);
begin
  if MainForm.sSkinManager1.SkinDirectory <> SkinsDirectoryEdit.Text then begin
    MainForm.sSkinManager1.SkinDirectory := SkinsDirectoryEdit.Text;
    MainForm.GenerateSkinsList;
  end;
end;


procedure TFrame_CurrentSkin.AfterSkinChange;
begin
  inherited;
  sTrackBar1.Position := MainForm.sSkinManager1.HueOffset;
  sTrackBar2.Position := MainForm.sSkinManager1.Saturation;
  sTrackBar3.Position := MainForm.sSkinManager1.Brightness;

  sLabel1.Caption := IntToStr(sTrackBar1.Position);
  sLabel2.Caption := IntToStr(sTrackBar2.Position);
  sLabel3.Caption := IntToStr(sTrackBar3.Position);

  sTrackBar3.Min := MainForm.sSkinManager1.CommonSkinData.BrightMin;
  sTrackBar3.Max := MainForm.sSkinManager1.CommonSkinData.BrightMax;
  sLabel10.Caption := IntToStr(sTrackBar3.Min);
  sLabel11.Caption := IntToStr(sTrackBar3.Max);
end;


procedure TFrame_CurrentSkin.sComboBox1Change(Sender: TObject);
begin
  MainForm.sSkinManager1.Options.ArrowsStyle := TacArrowsStyle(sComboBox1.ItemIndex);
end;


procedure TFrame_CurrentSkin.sComboBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  R: TRect;
  s: TacSide;
  h, ndx: integer;
begin
  R := Rect;
  h := HeightOf(R);
  R.Left := 3;
  R.Right := R.Left + h;
  h := (h - 4) div 2;
  sComboBox1.Canvas.Font.Assign(sComboBox1.Font);
  if (odSelected in State) and (sComboBox1.SkinData.SkinManager <> nil) then
    ndx := sComboBox1.SkinData.SkinManager.ConstData.Sections[ssSelection]
  else
    ndx := sComboBox1.SkinData.SkinIndex;

  if ndx >= 0 then
    sComboBox1.Canvas.Font.Color := sComboBox1.SkinData.SkinManager.gd[ndx].Props[1].FontColor.Color;

  if Index = ord(arsDefault) then
    acWriteTextEx(sComboBox1.Canvas, PacChar(sComboBox1.Items[Index]), True, R, DT_EXPANDTABS or DT_SINGLELINE or DT_VCENTER or DT_NOCLIP,
                  ndx, odSelected in State, sComboBox1.SkinData.SkinManager)
  else
    for s := High(TacSide) downto Low(TacSide) do begin
      DrawArrow(sComboBox1.Canvas.Handle, sComboBox1.Canvas.Font.Color, clNone, R, s, 2, 0, h, TacArrowsStyle(Index));
      OffsetRect(R, h * 2 + 2, 0);
    end;
end;


procedure TFrame_CurrentSkin.sComboBox2Change(Sender: TObject);
begin
  MainForm.sSkinManager1.BeginUpdate;
  MainForm.sSkinManager1.Fonts.MainMode := TacFontMode(sComboBox2.ItemIndex);
  sComboBox3.Enabled := sComboBox2.ItemIndex = ord(fmCustom);
  MainForm.sSkinManager1.EndUpdate(True, True);
end;


procedure TFrame_CurrentSkin.sComboBox3Change(Sender: TObject);
begin
  MainForm.sSkinManager1.BeginUpdate;
  MainForm.sSkinManager1.Fonts.MainFont := sComboBox3.Items[sComboBox3.ItemIndex];
  MainForm.sSkinManager1.EndUpdate(True, True);
end;


procedure TFrame_CurrentSkin.sTrackBar1Change(Sender: TObject);
begin
  if not aSkinChanging and (MainForm.sSkinManager1.HueOffset <> sTrackBar1.Position) then begin // If not in a skin changing (global variable from AC package used)
    MainForm.sSkinManager1.BeginUpdate;
    sLabel1.Caption := IntToStr(sTrackBar1.Position);
    MainForm.sSkinManager1.HueOffset := sTrackBar1.Position;
    MainForm.sSkinManager1.EndUpdate(True, False); // Repaint without animation
  end;
end;


procedure TFrame_CurrentSkin.sTrackBar2Change(Sender: TObject);
begin
  if not aSkinChanging and (MainForm.sSkinManager1.Saturation <> sTrackBar2.Position) then begin // If not in a skin changing (global variable from AC package used)
    MainForm.sSkinManager1.BeginUpdate;
    sLabel2.Caption := IntToStr(sTrackBar2.Position);
    MainForm.sSkinManager1.Saturation := sTrackBar2.Position;
    MainForm.sSkinManager1.EndUpdate(True, False); // Repaint without animation
  end;
end;


procedure TFrame_CurrentSkin.sStickyLabel2Click(Sender: TObject);
begin
  if TsStickyLabel(Sender).AttachTo <> nil then
    TsSlider(TsStickyLabel(Sender).AttachTo).Click;
end;


procedure TFrame_CurrentSkin.SliderExtBordersSliderChange(Sender: TObject);
begin
  if not InInit then MainForm.sSpeedButton5Click(nil);
end;


procedure TFrame_CurrentSkin.SliderNonClientSliderChange(Sender: TObject);
begin
  if not InInit then MainForm.sSkinProvider1.DrawNonClientArea := SliderNonClient.SliderOn;
  SliderExtBorders.Enabled := SliderNonClient.SliderOn;
  SliderBlendOnMove.Enabled := SliderNonClient.SliderOn;
end;


procedure TFrame_CurrentSkin.SliderBlendOnMoveSliderChange(Sender: TObject);
begin
  if not InInit then MainForm.sSkinManager1.AnimEffects.BlendOnMoving.Active := SliderBlendOnMove.SliderOn;
end;


procedure TFrame_CurrentSkin.SliderDiscolorSliderChange(Sender: TObject);
begin
  if not InInit then begin
    MainForm.sSkinManager1.BeginUpdate;
    MainForm.sSkinManager1.Effects.DiscoloredGlyphs := SliderDiscolor.SliderOn;
    MainForm.sSkinManager1.EndUpdate(True, False);
  end;
end;


procedure TFrame_CurrentSkin.sTrackBar3Change(Sender: TObject);
begin
  if not aSkinChanging and (MainForm.sSkinManager1.Brightness <> sTrackBar3.Position) then begin // If not in a skin changing (global variable from AC package used)
    MainForm.sSkinManager1.BeginUpdate;
    sLabel3.Caption := IntToStr(sTrackBar3.Position);
    MainForm.sSkinManager1.Brightness := sTrackBar3.Position;
    MainForm.sSkinManager1.EndUpdate(True, False); // Repaint without animation
  end;
end;


procedure TFrame_CurrentSkin.sTrackBar1SkinPaint(Sender: TObject; Canvas: TCanvas);
const
  LineHeight = 3;
var
  R: TRect;
  x: integer;
  C: TsColor;
  Bmp: TBitmap;
  HUEValue, HUEStep: real;
begin
  R := sTrackBar1.ChannelRect;
  OffsetRect(R, 0, HeightOf(R) + 4);
  InflateRect(R, -WidthOf(sTrackBar1.ThumbRect) div 2, 0);
  R.Bottom := R.Top + LineHeight;

  HUEValue := 0;

  HUEStep := 360 / WidthOf(R);

  Bmp := CreateBmp32(WidthOf(R), HeightOf(R));

  with Bmp do begin
    Canvas.Brush.Style := bsClear;
    Canvas.Pen.Style := psSolid;
    for x := 0 to Width - 1 do begin
      Canvas.Pen.Color := ChangeHue(Round(HUEValue), 5460991);
      Canvas.MoveTo(X, 0);
      Canvas.LineTo(X, LineHeight);
      HUEValue := HUEValue + HUEStep;
    end;

    if sTrackBar1.SkinData.Skinned then begin
      C.C := sTrackBar1.SkinData.SkinManager.GetGlobalColor;
      // Receive a HUE value of the current skin global color
      HUEValue := Rgb2Hsv(C).h;
      HUEValue := HUEValue - sTrackBar1.SkinData.SkinManager.HueOffset;
      if HUEValue < 0 then
        HUEValue := HUEValue + 360;

      ChangeBitmapPixels(Bmp, ChangeColorHUE, Round(HUEValue), clFuchsia);
    end;
  end;
  BitBlt(Canvas.Handle, R.Left, R.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
  Bmp.Free;
end;

end.

