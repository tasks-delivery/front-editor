unit MainUnit;
{$I sDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, ExtDlgs, ComCtrls, StdCtrls,
  FileCtrl, ImgList, Buttons, Menus, Mask, ActnList, StdActns, ToolWin, CheckLst,// XPMan,
  {$IFNDEF DELPHI5} Types, {$ENDIF}
  {$IFDEF DELPHI_XE2} UITypes, {$ENDIF}

  sSkinProvider, sSkinManager, sPanel, sScrollBox, sStatusBar, sGauge, sCheckbox, acImage, sBevel, sSpeedButton, sBitBtn, sSpinEdit,
  sComboBox, sDialogs, sMemo, sFrameBar, sLabel, sComboBoxes, acTitleBar, sMaskEdit, sCustomComboEdit, sTooledit, acPageScroller,
  sTrackBar, sEdit, acMagn, sListBox, sComboEdit, acProgressBar, sButton, acAlphaImageList, acAlphaHints, acPNG, sPageControl, sSplitter,

  UnitFrameDemo, UnitFrameCustom;


type
  TFrameClass = class of TCustomInfoFrame;

  TMainForm = class(TForm)
    ImageList32: TsAlphaImageList;
    sAlphaImageList1: TsAlphaImageList;

    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    A1: TMenuItem;
    S1: TMenuItem;
    S2: TMenuItem;
    Exit2: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    Hints2: TMenuItem;
    Custom1: TMenuItem;
    Skinned3: TMenuItem;
    Skinned1: TMenuItem;
    Enabled1: TMenuItem;
    Skinned2: TMenuItem;
    Enabled2: TMenuItem;
    Disabled1: TMenuItem;
    Standard2: TMenuItem;
    Standard3: TMenuItem;
    Hintskind1: TMenuItem;
    Additional1: TMenuItem;
    Customhints1: TMenuItem;
    miSysDialogs: TMenuItem;
    miFindDialog1: TMenuItem;
    Skinnedhints1: TMenuItem;
    Hintsshowing1: TMenuItem;
    miOpenDialog1: TMenuItem;
    miSaveDialog1: TMenuItem;
    Builtinskins1: TMenuItem;
    Externalskins1: TMenuItem;
    miColorDialog1: TMenuItem;
    miPrintDialog1: TMenuItem;
    Allowanimation1: TMenuItem;
    Allowanimation2: TMenuItem;
    miReplaceDialog1: TMenuItem;
    Standarddlgsamples1: TMenuItem;
    miAlphaColordialog1: TMenuItem;
    miSelectSkindialog1: TMenuItem;
    miOpenPictureDialog1: TMenuItem;
    miSavePictureDialog1: TMenuItem;
    miPrinterSetupDialog1: TMenuItem;

    ActionSkinned: TAction;
    ActionEnabled: TAction;
    ActionHintsStd: TAction;
    ActionCloseForm: TAction;
    ActionAnimation: TAction;
    ActionHintsCustom: TAction;
    ActionHintsDisable: TAction;
    ActionHintsSkinned: TAction;

    sStatusBar1: TsStatusBar;
    sGauge3: TsGauge;
    MainMenu1: TMainMenu;

    sMenuTab: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sTabSheet3: TsTabSheet;
    sTabSheet4: TsTabSheet;

    sSpeedButton9:  TsSpeedButton;
    sSpeedButton8:  TsSpeedButton;
    sSpeedButton2:  TsSpeedButton;
    sSpeedButton1:  TsSpeedButton;
    sSpeedButton5:  TsSpeedButton;
    sSpeedButton4:  TsSpeedButton;
    sSpeedButton3:  TsSpeedButton;
    sSpeedButton6:  TsSpeedButton;
    sSpeedButton12: TsSpeedButton;

    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel6: TsPanel;
    sPanel3: TsPanel;
    sPanel5: TsPanel;
    PanelMiddle: TsPanel;
    PanelContainer: TsPanel;
    PanelToolButtons: TsPanel;

    sSkinProvider1: TsSkinProvider;
    PopupMenu1: TPopupMenu;
    MainActionList: TActionList;
    ActionClose: TWindowClose;
    sSkinManager1: TsSkinManager;
    sMagnifier1: TsMagnifier;
    sTrackBar3: TsTrackBar;
    sPageControl1: TsPageControl;
    PopupDialogs: TPopupMenu;
    sTitleBar1: TsTitleBar;
    sFrameBar1: TsFrameBar;
    sImage1: TsImage;
    sPageScroller1: TsPageScroller;
    sAlphaHints1: TsAlphaHints;
    sSplitter1: TsSplitter;
    sSkinSelector1: TsSkinSelector;
    sVirtualImageList1: TsVirtualImageList;
    sCharImageList1: TsCharImageList;
    sStickyLabel1: TsStickyLabel;
    sWebLabel5: TsWebLabel;
    sStickyLabel5: TsStickyLabel;
    sWebLabel6: TsWebLabel;
    sStickyLabel7: TsStickyLabel;
    sWebLabel7: TsWebLabel;
    sStickyLabel8: TsStickyLabel;
    sWebLabel8: TsWebLabel;
    C1: TMenuItem;
    sStickyLabel12: TsStickyLabel;
    sWebLabel9: TsWebLabel;
    sWebLabel10: TsWebLabel;
    sStickyLabel9: TsStickyLabel;
    sStickyLabel10: TsStickyLabel;
    sWebLabel11: TsWebLabel;
    sStickyLabel11: TsStickyLabel;
    sWebLabel12: TsWebLabel;

    procedure FormCreate                (Sender: TObject);
    procedure FormShow                  (Sender: TObject);
    procedure sSkinManager1AfterChange  (Sender: TObject);
    procedure sSpeedButton1Click        (Sender: TObject);
    procedure SkinMenuClick             (Sender: TObject);
    procedure ActionSkinnedExecute      (Sender: TObject);
    procedure ActionCloseExecute        (Sender: TObject);
    procedure ActionAnimationExecute    (Sender: TObject);

    procedure ActionHintsSkinnedExecute (Sender: TObject);
    procedure ActionHintsCustomExecute  (Sender: TObject);
    procedure ActionHintsDisableExecute (Sender: TObject);
    procedure ActionHintsStdExecute     (Sender: TObject);

    procedure miOpenDialog1Click        (Sender: TObject);
    procedure miSaveDialog1Click        (Sender: TObject);
    procedure miOpenPictureDialog1Click (Sender: TObject);
    procedure miSavePictureDialog1Click (Sender: TObject);
    procedure miColorDialog1Click       (Sender: TObject);
    procedure miPrintDialog1Click       (Sender: TObject);
    procedure miPrinterSetupDialog1Click(Sender: TObject);
    procedure miFindDialog1Click        (Sender: TObject);
    procedure miReplaceDialog1Click     (Sender: TObject);
    procedure miAlphaColorDialog1Click  (Sender: TObject);
    procedure sMagnifier1DblClick       (Sender: TObject);
    procedure ActionCloseFormExecute    (Sender: TObject);
    procedure sTrackBar3Change          (Sender: TObject);
    procedure sSpeedButton5Click        (Sender: TObject);
    procedure sSpeedButton4Click        (Sender: TObject);
    procedure sSpeedButton8Click        (Sender: TObject);
    procedure sTitleBar1Items0Click     (Sender: TObject);
    procedure sSpeedButton9Click        (Sender: TObject);
    procedure miSysDialogsClick         (Sender: TObject);
    procedure sTitleBar1Items10Click    (Sender: TObject);
    procedure sSkinManager1BeforeChange (Sender: TObject);
    procedure sSpeedButton2Click        (Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FrameDemo1Items0CreateFrame(Sender: TObject; var Frame: TCustomFrame);
    procedure sFrameBar1Items2CreateFrame(Sender: TObject; var Frame: TCustomFrame);
    procedure sStatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure sSkinManager1GetPopupItemData(Item: TMenuItem; State: TOwnerDrawState; ItemData: TacMenuItemData);
    procedure sAlphaHints1ShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo; var Frame: TFrame);
    procedure sSkinManager1GetMenuExtraLineData(FirstItem: TMenuItem; var SkinSection, Caption: string; var Glyph: TBitmap; var LineVisible: Boolean);
    procedure sTitleBar1Items13Click(Sender: TObject);
    procedure sMagnifier1GetSourceCoords(var ATopLeft: TPoint);
    procedure sSkinManager1FontChanged(Sender: TObject; const DefOldFontName, FontName: string);
    procedure sSkinManager1ScaleChanged(Sender: TObject);
    procedure C1Click(Sender: TObject);
  public
    DoNotUpdate: boolean;
    CustomMagnifierSource: boolean;
    PressedBtn: TObject;
    procedure CreateNewFrame(FrameType: TFrameClass; Sender: TObject = nil);
    procedure GenerateSkinsList;
    procedure UpdateFrame(Sender: TObject = nil);
    procedure UpdateFrameControls;
  end;


var
  IniName:    string;          // Form positions and skin name are saved in Ini
  Loading:    boolean;
  MainForm:   TMainForm;
  Animated:   boolean = True;
  AppLoading: boolean = False; // Prevent of frame animating while app is in loading
  FormShowed: boolean = False; // This variable used in a first form initialization
  // in the OnShow event. Used for preventing of repeated init after each form recreating.
  // Form.OnShow event is processed after each switching to skinned or non-skinned mode.


implementation

uses
  sMaskData, sStyleSimply, sSkinProps, sMessages, sStoreUtils, sGraphUtils,
  sVclUtils, acntUtils, sConst, acSelectSkin, sCommonData, sSkinMenus, sCalculator,

  UnitBarPanel_Visible, UnitBarPanel_AppStyle, UnitFrameFrameBar;


var
  OldFrame, CurrentFrame: TCustomInfoFrame;


{$R *.DFM}

procedure TMainForm.C1Click(Sender: TObject);
begin
  TsCalculator.Create(Self).Execute;
end;


procedure TMainForm.CreateNewFrame(FrameType: TFrameClass; Sender: TObject = nil);
begin
  if Assigned(CurrentFrame) then
    OldFrame := CurrentFrame;

  if OldFrame <> nil then begin
    if Animated and sSkinManager1.Active and not AppLoading then
      PrepareForAnimation(OldFrame, atcBlur); // Prepare Image for animation (from old frame)

    if OldFrame is FrameType then // Release if exists already
      FreeAndNil(OldFrame);
  end;
  CurrentFrame := FrameType.Create(MainForm);
  sSkinManager1.UpdateScale(CurrentFrame);
  MainForm.UpdateFrame(Sender);
end;


procedure TMainForm.FormShow(Sender: TObject);
begin
  if not FormShowed then begin
    AppLoading := True;
    FormShowed := True; // preventing of repeated initialization
    // Open the first framebar item (TBarPanel_AppStyle)
    sFrameBar1.OpenItem(0, False {Without animation});
    // Example of access to the frame (click on spdBtn_CurrSkin)
    TBarPanel_AppStyle(sFrameBar1.Items[0].Frame).spdBtn_CurrSkin.OnClick(TBarPanel_AppStyle(sFrameBar1.Items[0].Frame).spdBtn_CurrSkin);
    // Searching of available skins
    GenerateSkinsList;
    AppLoading := False;
  end;
end;


procedure TMainForm.sSkinManager1AfterChange(Sender: TObject);
var
  i: integer;
begin
  if (CurrentFrame <> nil) and not DoNotUpdate then begin
    CurrentFrame.AfterSkinChange;
    if sSkinManager1.CommonSkinData.Active then begin // If form is really skinned
      for i := 0 to Builtinskins1.Count - 1 do begin // Search item with current skin name
        Builtinskins1.Items[i].Checked := DelChars(Builtinskins1.Items[i].Caption, '&') = sSkinManager1.SkinName;
        Builtinskins1.Items[i].Default := Builtinskins1.Items[i].Checked;
      end;
      for i := 0 to Externalskins1.Count - 1 do begin // Search item with current skin name
        Externalskins1.Items[i].Checked := DelChars(Externalskins1.Items[i].Caption, '&') = sSkinManager1.SkinName;
        Externalskins1.Items[i].Default := Externalskins1.Items[i].Checked;
      end;
    end;
  end;
end;


const
  sDemoName = 'Demo';

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CurrentFrame.BeforeDestruct;
  if not IsZoomed(Handle) then
    try // Save window position in Ini-file if it's possible
      sStoreUtils.WriteIniStr(sDemoName, 'Top', IntToStr(Top), IniName);
    finally
      sStoreUtils.WriteIniStr(sDemoName, 'Left', IntToStr(Left), IniName);
    end;

  // Save skin data if exists in Ini
  sStoreUtils.WriteIniStr(sDemoName, 'SkinDirectory', sSkinManager1.SkinDirectory, IniName);  // Skin directory
  sStoreUtils.WriteIniStr(sDemoName, 'SkinName', sSkinManager1.SkinName, IniName);            // Skin name
  sStoreUtils.WriteIniStr(sDemoName, 'SkinActive', iff(sSkinManager1.Active, '1', '0'), IniName); // Skin activity

  // Check if custom skin has been defined in the "Menus" frame
  if sSkinMenus.CustomMenuFont <> nil then
    FreeAndNil(sSkinMenus.CustomMenuFont);
end;


procedure TMainForm.UpdateFrame(Sender: TObject);
var
  wTime: word;
begin
  wTime := iff(Animated, 200, 0);
  if Assigned(CurrentFrame) then begin
    if (Sender is TsSpeedButton) and (TsSpeedButton(Sender).ImageIndex >= 0) then
      TsSpeedButton(Sender).ImageIndex := 2;

    CurrentFrame.Visible := False;
    // Set position of the new frame
    CurrentFrame.Align := alClient;
    CurrentFrame.Parent := PanelContainer;
    UpdateFrameControls;
    if Animated and sSkinManager1.Active and not AppLoading then begin
      CurrentFrame.SendToBack;
      CurrentFrame.Visible := True;
      if Assigned(OldFrame) then
        OldFrame.Visible := False;

      AnimShowControl(CurrentFrame, wTime, MaxByte, atcBlur);
    end
    else begin
      CurrentFrame.Visible := True;
{$IFNDEF DELPHI_XE}
      CurrentFrame.Repaint; // Repaint graphic controls, workaround for old Delphi refresh prob
{$ENDIF}      
    end;            
    if Assigned(OldFrame) then begin
      OldFrame.BeforeDestruct;
      FreeAndNil(OldFrame);
    end;
    sStatusBar1.Panels[3].Text := 'Opened frame: ' + CurrentFrame.ClassName;
  end;
end;


procedure TMainForm.FrameDemo1Items0CreateFrame(Sender: TObject; var Frame: TCustomFrame);
begin
  Frame := TBarPanel_Visible.Create(nil);
  TBarPanel_Visible(Frame).FillTreeView;
  sSkinManager1.UpdateScale(Frame);
end;


procedure TMainForm.sFrameBar1Items2CreateFrame(Sender: TObject; var Frame: TCustomFrame);
begin
  Frame := TBarPanel_AppStyle.Create(nil);
  sSkinManager1.UpdateScale(Frame);
end;


procedure TMainForm.sSpeedButton1Click(Sender: TObject);
begin
  ActionAnimation.Execute;
end;


procedure TMainForm.SkinMenuClick(Sender: TObject);
begin
  sSkinManager1.SkinName := DelChars(TMenuItem(Sender).Caption, '&');
end;


procedure TMainForm.GenerateSkinsList;
var
  i: integer;
  mi: TMenuItem;
  sl: TacStringList;
begin
  // Menu update
  Builtinskins1.Clear;
  // Build-in skins list
  for i := 0 to sSkinManager1.InternalSkins.Count - 1 do begin
    mi := TMenuItem.Create(Application);
    mi.Caption := sSkinManager1.InternalSkins[i].Name;
    if mi.Caption = sSkinManager1.SkinName then
      mi.Checked := True;

    mi.OnClick := SkinMenuClick;
    mi.RadioItem := True;
    Builtinskins1.Add(mi);
  end;
  // External skins list
  Externalskins1.Clear;
  sl := TacStringList.Create;
  sSkinManager1.GetExternalSkinNames(sl);
  if sl.Count > 0 then begin
    sl.Sort;
    for i := 0 to sl.Count - 1 do begin
      mi := TMenuItem.Create(Application);
      mi.Caption := sl[i];
      if mi.Caption = sSkinManager1.SkinName then begin
        mi.Checked := True;
        mi.Default := True;
      end;

      mi.OnClick := SkinMenuClick;
      mi.RadioItem := True;
      if (i <> 0) and (i mod 20 = 0) then
        mi.Break := mbBreak;

      Externalskins1.Add(mi);
    end;
  end;
  FreeAndNil(sl);
end;


procedure TMainForm.sSkinManager1GetMenuExtraLineData(FirstItem: TMenuItem; var SkinSection, Caption: string; var Glyph: TBitmap; var LineVisible: Boolean);
const
  iGlyphSize = 22;

  function GetSectionTextColor: TColor; // Get text color for colorizing of glyph received from CharImageList
  var
    Ndx: integer;
  begin
    Ndx := sSkinManager1.GetSkinIndex(SkinSection);
    if Ndx >= 0 then
      Result := sSkinManager1.gd[Ndx].Props[0].FontColor.Color
    else
      Result := clBlack;
  end;

begin
  LineVisible := True; // External line is visible
  if (sSkinProvider1.SystemMenu.Items[0].Name = s_SkinSelectItemName) and // If item is a first subitem of 'Available skins' (in system menu)
       (sSkinProvider1.SystemMenu.Items[0].Count > 8) and // Height of popup-menu must be higher then extra-line width...
         (FirstItem = sSkinProvider1.SystemMenu.Items[0].Items[0]) then begin
    Caption := sSkinProvider1.SystemMenu.Items[0].Caption;
    Glyph := sCharImageList1.CreateBitmap32Color(7, iGlyphSize, iGlyphSize, GetSectionTextColor);
  end
  else
    if (Externalskins1.Count > 8) and (FirstItem = Externalskins1.Items[0]) then begin
      Caption := Externalskins1.Caption;
      Glyph := sCharImageList1.CreateBitmap32Color(7, iGlyphSize, iGlyphSize, GetSectionTextColor);
    end
    else
      if (FirstItem = PopupMenu1.Items[0]) then begin
        Caption := 'Example of skinned menu';
        Glyph := sCharImageList1.CreateBitmap32Color(33, iGlyphSize, iGlyphSize, GetSectionTextColor);
      end
      else
        if (FirstItem = miSysDialogs) then begin
          Caption := 'Most sys dialogs are skinned';
          Glyph := sCharImageList1.CreateBitmap32Color(34, iGlyphSize, iGlyphSize, GetSectionTextColor);
        end
        else
          LineVisible := False;
end;


procedure TMainForm.ActionSkinnedExecute(Sender: TObject);
begin
  ActionSkinned.Checked := not ActionSkinned.Checked;
  sSkinManager1.Active := ActionSkinned.Checked;
  if CurrentFrame <> nil then
    CurrentFrame.SkinActiveChanged;
end;


procedure TMainForm.ActionHintsDisableExecute(Sender: TObject);
begin
  if not ActionHintsDisable.Checked then begin
    ActionHintsDisable.Checked := True;
    ActionHintsCustom.Checked := False;
    ActionHintsSkinned.Checked := False;
    ActionHintsStd.Checked := False;
    ShowHint := False;
    UpdateFrameControls;
  end;
end;


procedure TMainForm.ActionCloseExecute(Sender: TObject);
begin
  Close
end;


procedure TMainForm.ActionAnimationExecute(Sender: TObject);
begin
  Animated := not ActionAnimation.Checked; // Saving option in variable
  ActionAnimation.Checked := Animated;
  if Animated then begin
    sSpeedButton1.Caption := 'Stop'#13#10'animation';
    sSpeedButton1.ImageIndex := 0;
  end
  else begin
    sSpeedButton1.Caption := 'Allow'#13#10'animation';
    sSpeedButton1.ImageIndex := 1;
  end;
  sSkinManager1.Effects.AllowAnimation := Animated; // Control all animation
end;


procedure TMainForm.FormCreate(Sender: TObject);
var
  l, t: integer;
  s: string;
begin
  IniName := ExtractFilePath(Application.ExeName) + 'ASkinDemo.ini';
  if not acDirExists(sSkinManager1.SkinDirectory) then
    sSkinManager1.SkinDirectory := ExtractFilePath(Application.ExeName) + 'Skins';
{$IFNDEF DISABLEPREVIEWMODE}
  if (ParamCount > 0) and (ParamStr(1) = s_PreviewKey) then begin
    ActionAnimation.Execute; // If called from the SkinEditor for a skin preview (Skin Edit mode)
    sSkinManager1.Effects.DiscoloredGlyphs := True;
  end;
{$ENDIF}
  // Disable hints on start
  ActionHintsDisable.Execute;
  sTitleBar1.Items[6].Caption := 'v' + sSkinManager1.Version;
  s := '?d=' + sSkinManager1.Version;
  sWebLabel9.URL := sWebLabel9.URL + s;
  sWebLabel10.URL := sWebLabel10.URL + s;
  sWebLabel11.URL := sWebLabel11.URL + s;
  sWebLabel12.URL := sWebLabel12.URL + '&d=' + sSkinManager1.Version;
  // Restore the form position
  t := sStoreUtils.ReadIniInteger(sDemoName, 'Top',  -1, IniName);
  l := sStoreUtils.ReadIniInteger(sDemoName, 'Left', -1, IniName);
  if (t <> -1) and (l <> -1) then begin
    SetBounds(l, t, Width, Height);
    Position := poDesigned;
  end;
  // Load skin data if exists in Ini
  s := sStoreUtils.ReadIniString(sDemoName, 'SkinDirectory', IniName); // Skin directory is stored?
  if s <> '' then
    sSkinManager1.SkinDirectory := s;

  s := sStoreUtils.ReadIniString(sDemoName, 'SkinName', IniName); // Skin name is stored?
  if s <> '' then
    sSkinManager1.SkinName := s;

  t := sStoreUtils.ReadIniInteger(sDemoName, 'SkinActive', 1, IniName); // Skin is active? Default value is True (1)

  Application.HintPause := 800; // Define own hint pause
  Application.HintShortPause := 0;

  sSkinManager1.Active := (t = 1);
  if not sSkinManager1.Active then
    ActionSkinned.Execute;

  if sSkinManager1.Options.ScaleMode = smAuto then
    case sSkinManager1.GetScale of
      0: sTitleBar1.Items[7].Down := True;
      1: sTitleBar1.Items[8].Down := True;
      2: sTitleBar1.Items[9].Down := True;
    end;
end;


procedure TMainForm.ActionHintsSkinnedExecute(Sender: TObject);
begin
  if not ActionHintsSkinned.Checked then begin
    ActionHintsSkinned.Checked := True;
    ActionHintsCustom.Checked  := False;
    ActionHintsDisable.Checked := False;
    ActionHintsStd.Checked     := False;
    sAlphaHints1.UseSkinData   := True;
    ShowHint := True;
    sAlphaHints1.Active := not ActionHintsStd.Checked;
    UpdateFrameControls;
  end;
end;


procedure TMainForm.ActionHintsCustomExecute(Sender: TObject);
begin
  if not ActionHintsCustom.Checked then begin
    ActionHintsCustom.Checked  := True;
    ActionHintsSkinned.Checked := False;
    ActionHintsDisable.Checked := False;
    ActionHintsStd.Checked     := False;
    sAlphaHints1.UseSkinData   := False;
    ShowHint := True;
    sAlphaHints1.Active := not ActionHintsStd.Checked;
    UpdateFrameControls;
  end;
end;


procedure TMainForm.miOpenDialog1Click(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.miSaveDialog1Click(Sender: TObject);
begin
  with TSaveDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.miOpenPictureDialog1Click(Sender: TObject);
begin
  with TOpenPictureDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.miSavePictureDialog1Click(Sender: TObject);
begin
  with TSavePictureDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.miColorDialog1Click(Sender: TObject);
begin
  with TColorDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.miPrintDialog1Click(Sender: TObject);
begin
  with TPrintDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.miPrinterSetupDialog1Click(Sender: TObject);
begin
  with TPrinterSetupDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.miFindDialog1Click(Sender: TObject);
begin
  TFindDialog.Create(Self).Execute;
end;


procedure TMainForm.miReplaceDialog1Click(Sender: TObject);
begin
  TReplaceDialog.Create(Self).Execute;
end;


procedure TMainForm.miAlphaColorDialog1Click(Sender: TObject);
begin
  with TsColorDialog.Create(Self) do begin
    Execute;
    Free;
  end;
end;


procedure TMainForm.sMagnifier1DblClick(Sender: TObject);
begin
  sMagnifier1.Hide
end;


procedure TMainForm.sMagnifier1GetSourceCoords(var ATopLeft: TPoint);
begin
  if CustomMagnifierSource then begin
    ATopLeft := acMousePos; // Current coords of mouse cursor
    if Assigned(acMagnForm) then begin // If magnifier window is created
      dec(ATopLeft.X, acMagnForm.Width  div (sMagnifier1.Scaling * 2)); // Offset a position for showing in the magnifier center
      dec(ATopLeft.Y, acMagnForm.Height div (sMagnifier1.Scaling * 2));
    end;
  end;
end;


procedure TMainForm.ActionCloseFormExecute(Sender: TObject);
begin
  Close
end;


procedure TMainForm.ActionHintsStdExecute(Sender: TObject);
begin
  if not ActionHintsStd.Checked then begin
    ActionHintsStd.Checked     := True;
    ActionHintsSkinned.Checked := False;
    ActionHintsDisable.Checked := False;
    ActionHintsCustom.Checked  := False;
    sAlphaHints1.UseSkinData   := False;
    ShowHint := True;
    // Remove temporary hint windows if exists, when switched to std hints
    if sAlphaHints1.NewWindow <> nil then
      FreeAndNil(sAlphaHints1.NewWindow);

    if sAlphaHints1.AnimWindow <> nil then
      FreeAndNil(sAlphaHints1.AnimWindow);

    sAlphaHints1.Active := not ActionHintsStd.Checked;
    UpdateFrameControls;
  end;
end;


procedure TMainForm.sTrackBar3Change(Sender: TObject);
begin
  sGauge3.Progress := sTrackBar3.Position;
end;


procedure TMainForm.sSpeedButton5Click(Sender: TObject);
begin
  sSkinManager1.BeginUpdate;
  sSkinManager1.ExtendedBorders := not sSkinManager1.ExtendedBorders;
  sSkinManager1.EndUpdate(True, False);
  UpdateFrameControls;
end;


procedure TMainForm.sSpeedButton4Click(Sender: TObject);
begin
  if not sSpeedButton4.Down then
    ActionHintsDisable.Execute {enable hints}
  else
    ActionHintsSkinned.Execute {disable hints};
end;


procedure TMainForm.sStatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 2 then begin// Paint glyph on a status panel
    StatusBar.Canvas.Font.Color := sSkinManager1.Palette[pcLabelText];
    sCharImageList1.Draw(StatusBar.Canvas, Rect.Left + 2, Rect.Top + 4, 30);
  end;
end;


procedure TMainForm.sSpeedButton8Click(Sender: TObject);
begin
  sMagnifier1.Execute;
end;


procedure TMainForm.sTitleBar1Items0Click(Sender: TObject);
begin
  sSkinProvider1.TitleIcon.Visible := not sSkinProvider1.TitleIcon.Visible; // Title icon
  sTitleBar1.Items[3].Enabled := False;
end;


procedure TMainForm.sSkinManager1GetPopupItemData(Item: TMenuItem; State: TOwnerDrawState; ItemData: TacMenuItemData);
begin
  // Example of custom font in menu items
  if (Item = Builtinskins1) or (Item = miAlphaColordialog1) then begin
    ItemData.Font.Style := [fsBold];
    ItemData.Font.Size := ItemData.Font.Size + 2;
  end;
end;


procedure TMainForm.sSkinManager1ScaleChanged(Sender: TObject);
begin
  sSkinManager1FontChanged(sSkinManager1, '', '');
end;


procedure TMainForm.sTitleBar1Items10Click(Sender: TObject);
begin
  sMagnifier1.Execute;
end;


procedure TMainForm.sTitleBar1Items13Click(Sender: TObject);
begin
  MainForm.sSkinManager1.Options.ScaleMode := TacScaleMode(TacTitleBarItem(Sender).Tag);
end;


procedure TMainForm.sSpeedButton9Click(Sender: TObject);
begin
  Enabled := False; // Form Blackout works if form is not Enabled TsSkinProvider.DisabledBlendValue is not 255
  SelectSkin(sSkinManager1); // Dialog showing
  Enabled := True;
end;


procedure TMainForm.miSysDialogsClick(Sender: TObject);
begin
  miSysDialogs.Checked := not miSysDialogs.Checked;
  if miSysDialogs.Checked then
    sSkinManager1.SkinningRules := sSkinManager1.SkinningRules + [srStdDialogs]
  else
    sSkinManager1.SkinningRules := sSkinManager1.SkinningRules - [srStdDialogs];
end;


procedure ChangeHUE(sm: TsSkinManager; Value: integer; DoRepaint: boolean);
begin
  sm.BeginUpdate;
  sm.HueOffset := Value;
  sm.EndUpdate(DoRepaint, False {no animation});
end;


procedure TMainForm.UpdateFrameControls;
begin
  sSpeedButton4.Down := ShowHint;
  if CurrentFrame <> nil then
    CurrentFrame.AfterCreation;
end;


procedure TMainForm.sAlphaHints1ShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo; var Frame: TFrame);
var
  si: TacSectionInfo;
begin
  if (HintInfo.HintControl = nil) or (HintInfo.HintControl.Height < 200) and (HintInfo.HintControl.Width < 400) then // Make hints for small controls only
    if HintStr = '' then
      if sAlphaHints1.Active and sAlphaHints1.HTMLMode then begin
        // Hints can use some Html tags if sHintManager1.HTMLMode = True
        HintStr := 'Class name = <b><u>' + HintInfo.HintControl.ClassName + '</u></b><br>Component name = ' + HintInfo.HintControl.Name;
        si.siSkinIndex := -1;
        HintInfo.HintControl.Perform(SM_ALPHACMD, MakeWParam(0, AC_GETSKININDEX), integer(@si));
        if si.siSkinIndex >= 0 then
          HintStr := HintStr + '<br>' + 'SkinData.SkinSection = <b>' + sSkinManager1.gd[si.siSkinIndex].ClassName + '<b>';
      end
      else
        HintStr := 'Class name = ' + HintInfo.HintControl.ClassName + #13#10 + 'Component name = ' + HintInfo.HintControl.Name;
end;


procedure TMainForm.sSkinManager1BeforeChange(Sender: TObject);
begin
  // Reset colorization
  sSkinManager1.FHueOffset  := 0;
  sSkinManager1.FSaturation := 0;
  sSkinManager1.FBrightness := 0;
  if CurrentFrame <> nil then
    CurrentFrame.BeforeSkinChange;
end;


procedure TMainForm.sSkinManager1FontChanged(Sender: TObject; const DefOldFontName, FontName: string);
begin
  sStatusBar1.Panels[4].Text := Font.Name + '; ' + IntToStr(Font.Size) + 'px';
end;


procedure TMainForm.sSpeedButton2Click(Sender: TObject);
begin
  sSkinManager1.SkinName := sSkinManager1.GetRandomSkin;
  sSkinManager1.Active := True;
end;

end.
