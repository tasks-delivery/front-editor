unit UnitBarPanel_AppStyle;
{$I sDefs.inc}

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, ExtCtrls, StdCtrls,
  {$IFNDEF DELPHI5} Types, {$ENDIF}
  {$IFDEF DELPHI_XE2} UITypes, {$ENDIF}
  sFrameAdapter, sSpeedButton, sGroupBox, acImage, sLabel;


type
  TBarPanel_AppStyle = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    spdBtn_Preview: TsSpeedButton;
    spdBtn_Menus: TsSpeedButton;
    spdBtn_CurrSkin: TsSpeedButton;
    spdBtn_Hints: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sBitBtn1: TsSpeedButton;
    sBitBtn3: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    spdBtn_ScrollBars: TsSpeedButton;
    spdBtn_ImageLists: TsSpeedButton;
    sImage1: TsImage;
    spdBtn_OuterEffects: TsSpeedButton;
    spdBtn_PopupForms: TsSpeedButton;
    sLabelFX1: TsLabelFX;
    procedure spdBtn_CurrSkinClick(Sender: TObject);
    procedure spdBtn_MenusClick(Sender: TObject);
    procedure spdBtn_PreviewClick(Sender: TObject);
    procedure spdBtn_HintsClick(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sSpeedButton6Click(Sender: TObject);
    procedure spdBtn_OuterEffectsClick(Sender: TObject);
    procedure spdBtn_ScrollBarsClick(Sender: TObject);
    procedure spdBtn_ImageListsClick(Sender: TObject);
    procedure spdBtn_PopupFormsClick(Sender: TObject);
    procedure sLabelFX1MouseLeave(Sender: TObject);
    procedure sLabelFX1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sLabelFX1MouseEnter(Sender: TObject);
  end;


implementation

uses
  ShellApi,

  sSkinManager,

  UnitFrameCurrentSkin, MainUnit, UnitFrameMenus, UnitFramePreview,
  UnitFrameHints, UnitFrameDialogs, UnitFrameForms, UnitFrameFrames,
  UnitFrameStdVCL, UnitFrameOuterEffects, UnitFrameScrollBars,
  UnitFrameImageLists, UnitFramePopupForms;


{$R *.DFM}

procedure TBarPanel_AppStyle.spdBtn_CurrSkinClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_CurrentSkin, Sender);
end;


procedure TBarPanel_AppStyle.spdBtn_MenusClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_Menus, Sender);
end;


procedure TBarPanel_AppStyle.spdBtn_PopupFormsClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_PopupForms, Sender);
end;


procedure TBarPanel_AppStyle.spdBtn_PreviewClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_Preview, Sender);
end;


procedure TBarPanel_AppStyle.spdBtn_HintsClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_Hints, Sender);
end;


procedure TBarPanel_AppStyle.sSpeedButton3Click(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_Dialogs, Sender);
end;


procedure TBarPanel_AppStyle.sBitBtn1Click(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_Forms, Sender);
end;


procedure TBarPanel_AppStyle.sBitBtn3Click(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_Frames, Sender);
end;


procedure TBarPanel_AppStyle.sLabelFX1MouseEnter(Sender: TObject);
begin
  if MainForm.sSkinManager1.Active then
    sLabelFX1.Kind.Color := MainForm.sSkinManager1.Palette[pcWebTextHot]
  else
    sLabelFX1.Kind.Color := clRed;

  sLabelFX1.Kind.KindType := ktCustom;
  sLabelFX1.Font.Style := sLabelFX1.Font.Style + [fsUnderLine];
end;


procedure TBarPanel_AppStyle.sLabelFX1MouseLeave(Sender: TObject);
begin
  sLabelFX1.Font.Style := sLabelFX1.Font.Style - [fsUnderLine];
  if MainForm.sSkinManager1.Active then
    sLabelFX1.Kind.KindType := ktSkin;

  sLabelFX1.Kind.Color := clBtnFace;
end;


procedure TBarPanel_AppStyle.sLabelFX1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and PtInRect(Rect(0, 0, sLabelFX1.Width, sLabelFX1.Height), Point(x, y)) then
    ShellExecute(Application.Handle, 'open', PChar('http://www.alphaskins.com?d=' + MainForm.sSkinManager1.Version), nil, nil, SW_SHOWNORMAL);
end;


procedure TBarPanel_AppStyle.sSpeedButton6Click(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_StdVCL, Sender);
end;


procedure TBarPanel_AppStyle.spdBtn_OuterEffectsClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_OuterEffects, Sender);
end;


procedure TBarPanel_AppStyle.spdBtn_ScrollBarsClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_ScrollBars, Sender);
end;


procedure TBarPanel_AppStyle.spdBtn_ImageListsClick(Sender: TObject);
begin
  MainForm.CreateNewFrame(TFrame_ImageLists, Sender);
end;

end.
