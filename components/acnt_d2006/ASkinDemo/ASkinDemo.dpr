program ASkinDemo;

uses
//  FastMM4,
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  UnitFrameDemo in 'UnitFrameDemo.pas' {FrameDemo: TFrame},
  UnitFrameEditCtrls in 'UnitFrameEditCtrls.pas' {Frame_EditCtrls: TFrame},
  UnitFramePanels in 'UnitFramePanels.pas' {Frame_Panels: TFrame},
  UnitFrameCheckBoxes in 'UnitFrameCheckBoxes.pas' {Frame_CheckBoxes: TFrame},
  UnitFrameScrolls in 'UnitFrameScrolls.pas' {Frame_Scrolls: TFrame},
  UnitFrameButtons in 'UnitFrameButtons.pas' {Frame_Buttons: TFrame},
  UnitFrameForms in 'UnitFrameForms.pas' {Frame_Forms: TFrame},
  UnitFrameScrollBoxes in 'UnitFrameScrollBoxes.pas' {Frame_ScrollBoxes: TFrame},
  UnitFrameTabControls in 'UnitFrameTabControls.pas' {Frame_TabControls: TFrame},
  UnitFrameListView in 'UnitFrameListView.pas' {Frame_ListView: TFrame},
  UnitFrameFrames in 'UnitFrameFrames.pas' {Frame_Frames: TFrame},
  UnitFrameTest in 'UnitFrameTest.pas' {FrameTest: TFrame},
  UnitFrameDialogs in 'UnitFrameDialogs.pas' {Frame_Dialogs: TFrame},
  UnitBarPanel_Visible in 'UnitBarPanel_Visible.pas' {BarPanel_Visible: TFrame},
  UnitFrameEditAdd in 'UnitFrameEditAdd.pas' {Frame_EditAdd: TFrame},
  UnitFrameFrameBar in 'UnitFrameFrameBar.pas' {Frame_FrameBar: TFrame},
  UnitFrameOthers in 'UnitFrameOthers.pas' {Frame_Others: TFrame},
  UnitBarPanel_AppStyle in 'UnitBarPanel_AppStyle.pas' {BarPanel_AppStyle: TFrame},
  UnitFrameHints in 'UnitFrameHints.pas' {Frame_Hints: TFrame},
  UnitFrameShellCtrls in 'UnitFrameShellCtrls.pas' {Frame_ShellControls: TFrame},
  UnitFrameStdVCL in 'UnitFrameStdVCL.pas' {Frame_StdVCL: TFrame},
  UnitFrameCurrentSkin in 'UnitFrameCurrentSkin.pas' {Frame_CurrentSkin: TFrame},
  UnitFrameCustom in 'UnitFrameCustom.pas' {CustomInfoFrame: TFrame},
  UnitFrameMenus in 'UnitFrameMenus.pas' {Frame_Menus: TFrame},
  UnitFramePreview in 'UnitFramePreview.pas' {Frame_Preview: TFrame},
  UnitFrameOuterEffects in 'UnitFrameOuterEffects.pas' {Frame_OuterEffects: TFrame},
  UnitFrameScrollBars in 'UnitFrameScrollBars.pas' {Frame_ScrollBars: TFrame},
  UnitFrameImageLists in 'UnitFrameImageLists.pas' {Frame_ImageLists: TFrame},
  UnitFrameButtons2 in 'UnitFrameButtons2.pas' {Frame_Buttons2: TFrame},
  UnitFrameMeter in 'UnitFrameMeter.pas' {Frame_Meter: TFrame},
  UnitFrameSlider in 'UnitFrameSlider.pas' {Frame_Slider: TFrame},
  UnitFramePopupForms in 'UnitFramePopupForms.pas' {Frame_PopupForms: TFrame},
  UnitCustomPopup in 'UnitCustomPopup.pas' {FormCustomPopup},
  UnitFrameArcCtrls in 'UnitFrameArcCtrls.pas' {Frame_ArcCtrls: TFrame},
  UnitFrameMagn in 'UnitFrameMagn.pas' {Frame_Magn: TFrame};

{$R *.RES}
{$i sDefs.inc}

begin
  Application.Initialize;
{$IFDEF D2007}
  Application.MainFormOnTaskBar := True;
{$ENDIF}
  Application.Title := 'AlphaControls 2017 demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
