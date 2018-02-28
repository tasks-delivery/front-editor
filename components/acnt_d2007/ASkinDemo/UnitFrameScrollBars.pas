unit UnitFrameScrollBars;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls,
  UnitFrameCustom,
  sTreeView, StdCtrls, sMemo, sCheckBox, sGroupBox, sTrackBar, sFrameAdapter, sLabel,
  acArcControls;


type
  TFrame_ScrollBars = class(TCustomInfoFrame)
    sTreeView1: TsTreeView;
    sGroupBox1: TsGroupBox;
    sTreeView2: TsTreeView;
    sGroupBox2: TsGroupBox;
    sCheckBox3: TsCheckBox;
    sTrackBar2: TsTrackBar;
    sGroupBox3: TsGroupBox;
    sTrackBar1: TsTrackBar;
    sGroupBox4: TsGroupBox;
    sGroupBox5: TsGroupBox;
    sCheckBox5: TsCheckBox;
    sTrackBar3: TsTrackBar;
    sGroupBox6: TsGroupBox;
    sTrackBar4: TsTrackBar;
    sTrackBar5: TsTrackBar;
    sStickyLabel3: TsStickyLabel;
    sStickyLabel4: TsStickyLabel;
    procedure sTrackBar2Change(Sender: TObject);
    procedure sCheckBox3Click (Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
    procedure sCheckBox5Click (Sender: TObject);
    procedure sTrackBar3Change(Sender: TObject);
    procedure sTrackBar4Change(Sender: TObject);
    procedure sTrackBar5Change(Sender: TObject);
    procedure sGroupBox3CheckBoxChanged(Sender: TObject);
    procedure sGroupBox6CheckBoxChanged(Sender: TObject);
    procedure sGroupBox2CheckBoxChanged(Sender: TObject);
    procedure sGroupBox5CheckBoxChanged(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;


implementation

uses MainUnit;

{$R *.dfm}


procedure TFrame_ScrollBars.AfterCreation;

  procedure PopulateTree(Ctrl: TsTreeView);
  var
    i, j, c: integer;
    Parent1, Parent2: TTreeNode;
  begin
    for i := 0 to 4 do begin
      Parent1 := Ctrl.Items.Add(nil, 'Item ' + IntToStr(i));
      for j := 0 to 4 do begin
        Parent2 := Ctrl.Items.AddChild(Parent1, 'SubItem ' + IntToStr(j));
        for c := 0 to 4 do
          Ctrl.Items.AddChild(Parent2, 'Long caption item for horizontal scroll testing ' + IntToStr(c));
      end;
    end;
    Ctrl.FullExpand; // Expand for showing of scrolls
    Ctrl.TopItem := Ctrl.Items[0];
  end;

begin
  PopulateTree(sTreeView1);
  PopulateTree(sTreeView2);

  sGroupBox2.Checked := MainForm.sSkinManager1.ScrollsOptions.ButtonsSize <> 0;
  sCheckBox3.Enabled := sGroupBox2.Checked;
  sCheckBox3.Checked := MainForm.sSkinManager1.ScrollsOptions.ButtonsSize = -1;
  sTrackBar2.Enabled := not sCheckBox3.Checked;
  if sTrackBar2.Enabled then
    sTrackBar2.Position := MainForm.sSkinManager1.ScrollsOptions.ButtonsSize;

  sGroupBox3.Checked := MainForm.sSkinManager1.ScrollsOptions.ScrollSize = -1;
  sTrackBar1.Enabled := not sGroupBox3.Checked;
  if sTrackBar1.Enabled then
    sTrackBar1.Position := MainForm.sSkinManager1.ScrollsOptions.ScrollSize;
end;


procedure TFrame_ScrollBars.sTrackBar2Change(Sender: TObject);
begin
  MainForm.sSkinManager1.ScrollsOptions.ButtonsSize := sTrackBar2.Position
end;


procedure TFrame_ScrollBars.sCheckBox3Click(Sender: TObject);
begin
  sTrackBar2.Enabled := not sCheckBox3.Checked;
  if sCheckBox3.Checked then
    MainForm.sSkinManager1.ScrollsOptions.ButtonsSize := -1 // Default size
  else
    MainForm.sSkinManager1.ScrollsOptions.ButtonsSize := sTrackBar2.Position
end;


procedure TFrame_ScrollBars.sTrackBar1Change(Sender: TObject);
begin
  MainForm.sSkinManager1.ScrollsOptions.ScrollSize := sTrackBar1.Position
end;


procedure TFrame_ScrollBars.sCheckBox5Click(Sender: TObject);
begin
  sTrackBar3.Enabled := not sCheckBox5.Checked;
  if sCheckBox5.Checked then
    sTreeView2.SkinData.VertScrollData.ButtonsSize := -1 // Default size
  else
    sTreeView2.SkinData.VertScrollData.ButtonsSize := sTrackBar3.Position;

  sTreeView2.SkinData.HorzScrollData.ButtonsSize := sTreeView2.SkinData.VertScrollData.ButtonsSize;
end;


procedure TFrame_ScrollBars.sTrackBar3Change(Sender: TObject);
begin
  sTreeView2.SkinData.VertScrollData.ButtonsSize := sTrackBar3.Position;
  sTreeView2.SkinData.HorzScrollData.ButtonsSize := sTreeView2.SkinData.VertScrollData.ButtonsSize;
end;


procedure TFrame_ScrollBars.sTrackBar4Change(Sender: TObject);
begin
  sTreeView2.SkinData.VertScrollData.ScrollWidth := sTrackBar4.Position;
end;


procedure TFrame_ScrollBars.sTrackBar5Change(Sender: TObject);
begin
  sTreeView2.SkinData.HorzScrollData.ScrollWidth := sTrackBar5.Position;
end;


procedure TFrame_ScrollBars.sGroupBox3CheckBoxChanged(Sender: TObject);
var
  NewValue: integer;
begin
  sTrackBar1.Enabled := not sGroupBox3.Checked;
  if sGroupBox3.Checked then
    NewValue := -1 // Default system size will be used
  else
    NewValue := sTrackBar1.Position;

  if MainForm.sSkinManager1.ScrollsOptions.ScrollSize <> NewValue then begin
    MainForm.sSkinManager1.BeginUpdate;
    MainForm.sSkinManager1.ScrollsOptions.ScrollSize := NewValue;
    MainForm.sSkinManager1.EndUpdate(True, False);
  end;
end;


procedure TFrame_ScrollBars.sGroupBox6CheckBoxChanged(Sender: TObject);
begin
  sTrackBar4.Enabled := not sGroupBox6.Checked;
  sTrackBar5.Enabled := not sGroupBox6.Checked;
  if sGroupBox6.Checked then begin
    sTreeView2.SkinData.VertScrollData.ScrollWidth := -1; // Default system size will be used
    sTreeView2.SkinData.HorzScrollData.ScrollWidth := -1;
  end
  else begin
    sTreeView2.SkinData.VertScrollData.ScrollWidth := sTrackBar4.Position;
    sTreeView2.SkinData.HorzScrollData.ScrollWidth := sTrackBar5.Position;
  end;
end;


procedure TFrame_ScrollBars.sGroupBox2CheckBoxChanged(Sender: TObject);
begin
  sCheckBox3.Enabled := sGroupBox2.Checked;
  sTrackBar2.Enabled := not sCheckBox3.Checked and sCheckBox3.Enabled;
  if sGroupBox2.Checked then
    if sCheckBox3.Checked then
      MainForm.sSkinManager1.ScrollsOptions.ButtonsSize := -1 // Default size
    else
      MainForm.sSkinManager1.ScrollsOptions.ButtonsSize := sTrackBar2.Position
  else
    MainForm.sSkinManager1.ScrollsOptions.ButtonsSize := 0; // Not visible
end;


procedure TFrame_ScrollBars.sGroupBox5CheckBoxChanged(Sender: TObject);
begin
  sCheckBox5.Enabled := sGroupBox5.Checked;
  sTrackBar3.Enabled := not sCheckBox5.Checked and sCheckBox5.Enabled;
  if sGroupBox5.Checked then
    if sCheckBox5.Checked then
      sTreeView2.SkinData.VertScrollData.ButtonsSize := -1 // Default size
    else
      sTreeView2.SkinData.VertScrollData.ButtonsSize := sTrackBar3.Position
  else
    sTreeView2.SkinData.VertScrollData.ButtonsSize := 0; // Not visible

  sTreeView2.SkinData.HorzScrollData.ButtonsSize := sTreeView2.SkinData.VertScrollData.ButtonsSize;
end;

end.
