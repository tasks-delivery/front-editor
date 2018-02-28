unit UnitFrameSlider;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  UnitFrameCustom,
  sFrameAdapter, ExtCtrls, sPanel, acSlider, ImgList, acAlphaImageList,
  StdCtrls, sGroupBox, sRadioButton, ComCtrls, sTrackBar, sLabel, sCheckBox;

type
  TFrame_Slider = class(TCustomInfoFrame)
    ImageListGlyphs: TsAlphaImageList;
    sGroupBox1: TsGroupBox;
    sRadioButton1: TsRadioButton;
    sRadioButton2: TsRadioButton;
    sTrackBar1: TsTrackBar;
    sSlider1: TsSlider;
    sLabel2: TsLabel;
    sGroupBox2: TsGroupBox;
    sRadioButton3: TsRadioButton;
    sRadioButton4: TsRadioButton;
    sRadioButton5: TsRadioButton;
    sCheckBox1: TsCheckBox;
    sTrackBar2: TsTrackBar;
    sLabel1: TsLabel;
    sCheckBox2: TsCheckBox;
    ImageListSlider: TsAlphaImageList;
    sCheckBox3: TsCheckBox;
    procedure sTrackBar1Change(Sender: TObject);
    procedure sSlider1SliderChange(Sender: TObject);
    procedure sRadioButton1Click(Sender: TObject);
    procedure sRadioButton2Click(Sender: TObject);
    procedure sRadioButton4Click(Sender: TObject);
    procedure sRadioButton3Click(Sender: TObject);
    procedure sRadioButton5Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sTrackBar2Change(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
  private
  public
  end;

const
  DefaultHeight = 21;
  DefaultWidth  = 64;

var
  Frame_Slider: TFrame_Slider;

implementation

{$R *.dfm}

procedure TFrame_Slider.sTrackBar1Change(Sender: TObject);
var
  i: integer;
begin
  i := sTrackBar1.Position * 2;
  sSlider1.Height  := DefaultHeight + i;
  sSlider1.Width   := DefaultWidth  + i;
  ImageListGlyphs.Height := 12 + i;
  ImageListGlyphs.Width  := 12 + i;
end;


procedure TFrame_Slider.sSlider1SliderChange(Sender: TObject);
begin
  if sSlider1.SliderOn then
    sSlider1.BoundLabel.Caption := 'ON'
  else
    sSlider1.BoundLabel.Caption := 'OFF';
end;


procedure TFrame_Slider.sRadioButton1Click(Sender: TObject);
begin
  sSlider1.ContentPlacing := scpThumb;
end;


procedure TFrame_Slider.sRadioButton2Click(Sender: TObject);
begin
  sSlider1.ContentPlacing := scpBackground;
end;


procedure TFrame_Slider.sRadioButton4Click(Sender: TObject);
begin
  sSlider1.UseSymbols := True;
end;


procedure TFrame_Slider.sRadioButton3Click(Sender: TObject);
begin
  sSlider1.UseSymbols := False;
  sSlider1.GlyphIndexOff := -1;
  sSlider1.GlyphIndexOn := -1;
  sSlider1.ShowCaption := True;
end;


procedure TFrame_Slider.sRadioButton5Click(Sender: TObject);
begin
  sSlider1.UseSymbols := False;
  sSlider1.GlyphIndexOff := 0;
  sSlider1.GlyphIndexOn := 1;
  sSlider1.ShowCaption := False;
end;


procedure TFrame_Slider.sCheckBox1Click(Sender: TObject);
begin
  sSlider1.Reversed := sCheckBox1.Checked;
end;


procedure TFrame_Slider.sTrackBar2Change(Sender: TObject);
begin
  sSlider1.ThumbSizeInPercent := sTrackBar2.Position;
end;


procedure TFrame_Slider.sCheckBox2Click(Sender: TObject);

  procedure ChangeCtrlsEnabled(Ctrl: TWinControl; Value: boolean);
  var
    i: integer;
  begin
    for i := 0 to Ctrl.ControlCount - 1 do
      if (Ctrl.Controls[i] <> sSlider1) and (Ctrl.Controls[i] <> sCheckBox2) then begin
        Ctrl.Controls[i].Enabled := Value;
        if Ctrl.Controls[i] is TWinControl then
          ChangeCtrlsEnabled(TWinControl(Ctrl.Controls[i]), Value);
      end;
  end;

begin
  ChangeCtrlsEnabled(Self, not sCheckBox2.Checked);
  sSlider1.BeginUpdate;
  if sCheckBox2.Checked then begin // Customizing of slider looking with own images
    // Offsets of thumb
    sSlider1.ThumbOffsetX1 := 3;
    sSlider1.ThumbOffsetY1 := 1;
    sSlider1.ThumbOffsetX2 := 4;
    sSlider1.ThumbOffsetY2 := 1;
    // Indexes of control images in the ImageListSlider
    sSlider1.ImageIndexOff := 0;
    sSlider1.ImageIndexOn  := 1;
    sSlider1.ThumbIndexOff := 3;
    sSlider1.ThumbIndexOn  := 3;
    // Remove glyph indexes
    sSlider1.GlyphIndexOff := -1;
    sSlider1.GlyphIndexOn := -1;
    sSlider1.Images := ImageListSlider;
    sSlider1.Width := 78;
    sSlider1.Height := 38;
    sSlider1.ShowCaption := False;
    sSlider1.ThumbSizeInPercent := 50;
    sSlider1.Reversed := True;
  end
  else begin
    // Default offsets of thumb
    sSlider1.ThumbOffsetX1 := 1;
    sSlider1.ThumbOffsetY1 := 1;
    sSlider1.ThumbOffsetX2 := 1;
    sSlider1.ThumbOffsetY2 := 1;
    // Remove indexes of control images
    sSlider1.ImageIndexOff := -1;
    sSlider1.ImageIndexOn  := -1;
    sSlider1.ThumbIndexOff := -1;
    sSlider1.ThumbIndexOn  := -1;
    // Define glyph indexes
    sSlider1.GlyphIndexOff := 0;
    sSlider1.GlyphIndexOn := 1;
    sSlider1.Images := ImageListGlyphs;
    sTrackBar1Change(sTrackBar1);
    sTrackBar2Change(sTrackBar2);
    sRadioButton3.OnClick(sRadioButton3);
    sSlider1.Reversed := sCheckBox1.Checked;
  end;
  sSlider1.EndUpdate(True);
end;


procedure TFrame_Slider.sCheckBox3Click(Sender: TObject);
begin
  sSlider1.KeepThumbAspectRatio := sCheckBox3.Checked;
end;

end.
