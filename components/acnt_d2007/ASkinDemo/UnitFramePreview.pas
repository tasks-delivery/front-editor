unit UnitFramePreview;
{$I sDefs.inc}

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Mask,
  Buttons, ComCtrls, ExtCtrls, ImgList, 

  sFrameAdapter, StdCtrls, sMaskEdit, sCustomComboEdit, sToolEdit, sListBox, sBitBtn, sLabel,
  sTrackBar, sPanel, acAlphaImageList, acSkinPreview, sSkinManager,
  
  UnitFrameCustom;


type
  TFrame_Preview = class(TCustomInfoFrame)
    sListBox1: TsListBox;
    sDirectoryEdit1: TsDirectoryEdit;
    sTrackBar1: TsTrackBar;
    sStickyLabel1: TsLabel;
    sStickyLabel3: TsLabel;
    sTrackBar2: TsTrackBar;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sBitBtn2: TsBitBtn;
    Panel_Preview: TsPanel;
    sBitBtn1: TsBitBtn;
    sAlphaImageList1: TsAlphaImageList;
    SkinManager_Preview: TsSkinManager;
    sTrackBar3: TsTrackBar;
    sStickyLabel2: TsLabel;
    sLabel3: TsLabel;
    sVirtualImageList1: TsVirtualImageList;
    procedure sDirectoryEdit1Change(Sender: TObject);
    procedure sListBox1Click(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure sTrackBar2Change(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sTrackBar3Change(Sender: TObject);
    procedure sListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
  public
    acPreviewForm: TFormSkinPreview;
    procedure AfterCreation; override;
    procedure BeforeDestruct; override;
  end;


implementation

uses
  MainUnit,
  sSkinProvider, sVCLUtils, sConst, sGraphUtils, sStyleSimply, acntUtils, acntTypes;


{$R *.dfm}

procedure TFrame_Preview.AfterCreation;
begin
  if sDirectoryEdit1.Text <> MainForm.sSkinManager1.SkinDirectory then
    sDirectoryEdit1.Text := MainForm.sSkinManager1.SkinDirectory;
end;


procedure TFrame_Preview.sDirectoryEdit1Change(Sender: TObject);
begin
  if SkinManager_Preview.SkinDirectory <> sDirectoryEdit1.Text then
    SkinManager_Preview.SkinDirectory := sDirectoryEdit1.Text;

  sListBox1.Items.BeginUpdate; // Do not repaint while ImageList is not updated
  sVirtualImageList1.AlphaImageList := nil;
  SkinManager_Preview.GetExternalSkinNames(sListBox1.Items, True);
  sVirtualImageList1.AlphaImageList := TacImageList(SkinManager_Preview.SkinListController.ImgList);
  sListBox1.Items.EndUpdate;
  sListBox1Click(nil);
end;


procedure TFrame_Preview.sListBox1Click(Sender: TObject);
begin
  sBitBtn1.Enabled := sListBox1.ItemIndex >= 0;
  PrepareForAnimation(Panel_Preview);

  if sBitBtn1.Enabled then begin
    if acPreviewForm = nil then begin
      acPreviewForm := TFormSkinPreview.Create(nil); // Form will be freed automatically together with this frame
      acPreviewForm.Align := alClient;
      acPreviewForm.Parent := Panel_Preview;
      acPreviewForm.Name := 'FormSkinPreview';
    end;
    acPreviewForm.PreviewManager.SkinDirectory := sDirectoryEdit1.Text;
//    acPreviewForm.PreviewManager.Options.ScaleMode := MainForm.sSkinManager1.Options.ScaleMode;
    acPreviewForm.PreviewManager.SkinName := sListBox1.Items[sListBox1.ItemIndex];
    acPreviewForm.PreviewManager.Active := True;
    acPreviewForm.Visible := True;

    sTrackBar3.Min := acPreviewForm.PreviewManager.CommonSkinData.BrightMin;
    sTrackBar3.Max := acPreviewForm.PreviewManager.CommonSkinData.BrightMax;
    sTrackBar3.Position := 0;
  end
  else begin
    sBitBtn1.Enabled := False;
    sBitBtn2.Enabled := False;
    if acPreviewForm <> nil then
      acPreviewForm.Close;
  end;

  AnimShowControl(Panel_Preview, 100);
  sBitBtn2.Enabled := sBitBtn1.Enabled;
  sTrackBar1.Enabled := sBitBtn1.Enabled;
  sTrackBar2.Enabled := sBitBtn1.Enabled;
  sTrackBar3.Enabled := sBitBtn1.Enabled;
end;


procedure TFrame_Preview.sListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Bmp: TBitmap;
  DrawCanvas: TCanvas;
  iData: TacItemDrawData;
  aRect, rText, imgRect: TRect;
  SectionNdx, ImgWidth, ImgHeight: integer;
begin
  if IsValidIndex(Index, sListBox1.Items.Count) then begin
    ImgHeight := sVirtualImageList1.Height;
    ImgWidth := sVirtualImageList1.Width;

    sListBox1.Canvas.Lock;
    if sListBox1.SkinData.Skinned then begin
      Bmp := CreateBmp32(Rect);
      Bmp.Canvas.Font.Assign(sListBox1.Font);
      Bmp.Canvas.Brush.Style := bsClear;
      Bmp.Canvas.Lock;
      aRect := MkRect(Bmp);
      DrawCanvas := Bmp.Canvas;
      if odSelected in State then begin
        SectionNdx := sListBox1.SkinData.SkinManager.ConstData.Sections[ssSelection];
        if SectionNdx < 0 then begin
          FillDC(Bmp.Canvas.Handle, MkRect(Bmp), sListBox1.SkinData.SkinManager.GetHighLightColor(sListBox1.Focused));
          Bmp.Canvas.Font.Color := sListBox1.SkinData.SkinManager.GetHighLightFontColor(sListBox1.Focused);
        end
        else begin
          PaintItem(SectionNdx, EmptyCI, True, integer(odFocused in State), MkRect(Bmp), Rect.TopLeft, Bmp, sListBox1.SkinData.SkinManager);
          Bmp.Canvas.Font.Color := sListBox1.SkinData.SkinManager.gd[SectionNdx].Props[integer(sListBox1.Focused)].FontColor.Color;
        end;
      end
      else begin
        SectionNdx := sListBox1.SkinData.SkinIndex;
        FillDC(Bmp.Canvas.Handle, MkRect(Bmp), sListBox1.SkinData.SkinManager.gd[SectionNdx].Props[integer(sListBox1.Focused)].Color);
        Bmp.Canvas.Font.Color := sListBox1.SkinData.SkinManager.gd[SectionNdx].Props[integer(sListBox1.Focused)].FontColor.Color;
      end;
    end
    else begin
      Bmp := nil;
      aRect := Rect;
      DrawCanvas := sListBox1.Canvas;
      if odSelected in State then begin
        FillDC(DrawCanvas.Handle, aRect, clHighlight);
        sListBox1.Canvas.Font.Color := clHighlightText;
        SelectObject(sListBox1.Canvas.Handle, sListBox1.Font.Handle);
      end
      else
        FillDC(DrawCanvas.Handle, aRect, sListBox1.Color);
    end;

    rText := Classes.Rect(aRect.Left + acSpacing * 2 + ImgWidth, aRect.Top, aRect.Right, aRect.Bottom);
    DrawText(DrawCanvas.Handle, PChar(sListBox1.Items[Index]), Length(sListBox1.Items[Index]), rText, DT_VCENTER or DT_SINGLELINE);

    iData := TacItemDrawData(SendMessage(sListBox1.Handle, LB_GETITEMDATA, Index, 0));
    if (iData <> nil) and (iData.ImageIndex >= 0) then begin
      imgRect := MkRect(ImgWidth, ImgHeight);
      OffsetRect(imgRect, aRect.Left + acSpacing, aRect.Top + acSpacing);
      sVirtualImageList1.Draw(DrawCanvas, imgRect.Left, imgRect.Top, iData.ImageIndex);
    end;


    if Bmp <> nil then begin
      BitBlt(sListBox1.Canvas.Handle, Rect.Left, Rect.Top, Bmp.Width, Bmp.Height, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
      Bmp.Free;
    end;
    sListBox1.Canvas.UnLock;
  end;
end;


procedure TFrame_Preview.sTrackBar1Change(Sender: TObject);
begin
  acPreviewForm.PreviewManager.HueOffset := sTrackBar1.Position;
  sLabel1.Caption := IntToStr(sTrackBar1.Position);
end;


procedure TFrame_Preview.sTrackBar2Change(Sender: TObject);
begin
  acPreviewForm.PreviewManager.Saturation := sTrackBar2.Position;
  sLabel2.Caption := IntToStr(sTrackBar2.Position);
end;


procedure TFrame_Preview.sTrackBar3Change(Sender: TObject);
begin
  acPreviewForm.PreviewManager.Brightness := sTrackBar3.Position;
  sLabel3.Caption := IntToStr(sTrackBar3.Position);
end;


procedure TFrame_Preview.sBitBtn2Click(Sender: TObject);
var
  NewPrevForm: TForm;
begin
  NewPrevForm := TForm.Create(nil);
  NewPrevForm.Caption := 'Preview form';
  NewPrevForm.Position := poScreenCenter;
  acPreviewForm.PreviewManager.ExtendedBorders := True;
  with TsSkinProvider.Create(NewPrevForm) do
    SkinData.SkinManager := acPreviewForm.PreviewManager;

  NewPrevForm.ShowModal;
  NewPrevForm.Free
end;


procedure TFrame_Preview.sBitBtn1Click(Sender: TObject);
begin
  Mainform.sSkinManager1.BeginUpdate;
  Mainform.sSkinManager1.SkinDirectory := acPreviewForm.PreviewManager.SkinDirectory;
  Mainform.sSkinManager1.SkinName      := acPreviewForm.PreviewManager.SkinName;
  Mainform.sSkinManager1.HueOffset     := acPreviewForm.PreviewManager.HueOffset;
  Mainform.sSkinManager1.Saturation    := acPreviewForm.PreviewManager.Saturation;
  Mainform.sSkinManager1.Brightness    := acPreviewForm.PreviewManager.Brightness;
  Mainform.sSkinManager1.EndUpdate(True);
end;


procedure TFrame_Preview.BeforeDestruct;
var
  i: integer;
begin
  // Kill data objects in the sListBox1
  for i := 0 to sListBox1.Items.Count - 1 do
    sListBox1.Items.Objects[i].Free;

  sListBox1.Items.Clear;
  if acPreviewForm <> nil then begin
    acPreviewForm.Visible := False;
    acPreviewForm.Free;
  end;
end;

end.
