unit UnitFrameMenus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitFrameCustom,

  sFrameAdapter, StdCtrls, sCheckBox, sComboBox, sLabel, ComCtrls,
  sTrackBar, Buttons, sBitBtn, ImgList, acAlphaImageList;


type
  TFrame_Menus = class(TCustomInfoFrame)
    CheckBox_SkinnedMenus: TsCheckBox;
    CheckBox_ShowExtraLine: TsCheckBox;
    ComboBox_IcoLineSkin: TsComboBox;
    TrackBar_AlphaBlend: TsTrackBar;
    sStickyLabel1: TsStickyLabel;
    TrackBar_Margins: TsTrackBar;
    sStickyLabel2: TsStickyLabel;
    sBitBtn1: TsBitBtn;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    FontDialog1: TFontDialog;
    sAlphaImageList1: TsAlphaImageList;
    procedure TrackBar_MarginsChange(Sender: TObject);
    procedure TrackBar_AlphaBlendChange(Sender: TObject);
    procedure CheckBox_SkinnedMenusClick(Sender: TObject);
    procedure CheckBox_ShowExtraLineClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure ComboBox_IcoLineSkinChange(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;

implementation

uses
  MainUnit,
  sSkinMenus;

{$R *.dfm}  

procedure TFrame_Menus.AfterCreation;
begin
  InInit := True;
  inherited;
  TrackBar_Margins.Position := MainForm.sSkinManager1.SkinableMenus.Margin;
  TrackBar_AlphaBlend.Position := MainForm.sSkinManager1.MenuSupport.AlphaBlend;
  sLabel1.Caption := IntToStr(TrackBar_AlphaBlend.Position);
  sLabel2.Caption := IntToStr(TrackBar_Margins.Position);
  CheckBox_SkinnedMenus.Checked := MainForm.sSkinManager1.SkinnedPopups;
  CheckBox_ShowExtraLine.Checked := MainForm.sSkinManager1.MenuSupport.UseExtraLine;
  ComboBox_IcoLineSkin.ItemIndex := ComboBox_IcoLineSkin.IndexOf(MainForm.sSkinManager1.MenuSupport.IcoLineSkin);
  InInit := False;
end;


procedure TFrame_Menus.TrackBar_MarginsChange(Sender: TObject);
begin
  MainForm.sSkinManager1.SkinableMenus.Margin := TrackBar_Margins.Position;
  sLabel2.Caption := IntToStr(TrackBar_Margins.Position);
end;


procedure TFrame_Menus.TrackBar_AlphaBlendChange(Sender: TObject);
begin
  MainForm.sSkinManager1.MenuSupport.AlphaBlend := TrackBar_AlphaBlend.Position;
  sLabel1.Caption := IntToStr(TrackBar_AlphaBlend.Position);
end;


procedure TFrame_Menus.CheckBox_SkinnedMenusClick(Sender: TObject);
begin
  MainForm.sSkinManager1.SkinnedPopups := CheckBox_SkinnedMenus.Checked;
end;


procedure TFrame_Menus.CheckBox_ShowExtraLineClick(Sender: TObject);
begin
  MainForm.sSkinManager1.MenuSupport.UseExtraLine := CheckBox_ShowExtraLine.Checked;
end;


procedure TFrame_Menus.sBitBtn1Click(Sender: TObject);
begin
  if CustomMenuFont = nil then begin
    CustomMenuFont := TFont.Create;
    CustomMenuFont.Assign(Screen.MenuFont);
    CustomMenuFont.Name := 'Comic sans MS';
  end;

  FontDialog1.Font.Assign(CustomMenuFont);
  if FontDialog1.Execute then
    CustomMenuFont.Assign(FontDialog1.Font);
end;


procedure TFrame_Menus.ComboBox_IcoLineSkinChange(Sender: TObject);
begin
  MainForm.sSkinManager1.MenuSupport.IcoLineSkin := ComboBox_IcoLineSkin.Text;
end;

end.

