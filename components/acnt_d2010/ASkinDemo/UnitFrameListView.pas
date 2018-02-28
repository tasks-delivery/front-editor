unit UnitFrameListView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons,

  sRadioButton, sPanel, sGroupBox, sListView, sFrameAdapter, sComboBox, sButton, sSpeedButton, sCheckBox,

  UnitFrameCustom;


type
  TFrame_ListView = class(TCustomInfoFrame)
    sListView1: TsListView;
    sGroupBox10: TsGroupBox;
    sRadioButton21: TsRadioButton;
    sRadioButton22: TsRadioButton;
    sRadioButton23: TsRadioButton;
    sRadioButton24: TsRadioButton;
    sButton1: TsButton;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    procedure sRadioButton21Change(Sender: TObject);
    procedure sRadioButton22Change(Sender: TObject);
    procedure sRadioButton23Change(Sender: TObject);
    procedure sRadioButton24Change(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
    procedure sListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure AddNewItems(Count: integer);
    procedure sCheckBox5Click(Sender: TObject);
    procedure sCheckBox6Click(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;

implementation

uses MainUnit, sSkinManager;

{$R *.DFM}

procedure TFrame_ListView.sRadioButton21Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsIcon;
end;


procedure TFrame_ListView.sRadioButton22Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsList;
end;


procedure TFrame_ListView.sRadioButton23Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsReport;
end;


procedure TFrame_ListView.sRadioButton24Change(Sender: TObject);
begin
  sListView1.ViewStyle := vsSmallIcon;
end;


procedure TFrame_ListView.sButton1Click(Sender: TObject);
begin
  AddNewItems(1000);
end;


procedure TFrame_ListView.sCheckBox1Click(Sender: TObject);
begin
  if sCheckBox1.Checked then begin
    sListView1.SmallImages := MainForm.sCharImageList1;
    sListView1.LargeImages := MainForm.sCharImageList1;
  end
  else begin
    sListView1.SmallImages := nil;
    sListView1.LargeImages := nil;
  end;
end;


procedure TFrame_ListView.sCheckBox2Click(Sender: TObject);
begin
  sListView1.Checkboxes := sCheckBox2.Checked;
end;


procedure TFrame_ListView.sCheckBox3Click(Sender: TObject);
begin
  sListView1.GridLines := sCheckBox3.Checked;
end;


procedure TFrame_ListView.sCheckBox4Click(Sender: TObject);
begin
  sListView1.RowSelect := sCheckBox4.Checked;
end;


procedure TFrame_ListView.sCheckBox5Click(Sender: TObject);
begin
  sListView1.HotTrack := sCheckBox5.Checked;
end;


procedure TFrame_ListView.sCheckBox6Click(Sender: TObject);
begin
  sListView1.Repaint;
end;


procedure TFrame_ListView.sListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
const
  ColorsText: array [4..6] of TacPaletteColors = (pcEditText_Ok, pcEditText_Warning, pcEditText_Alert);
  ColorsBG:   array [4..6] of TacPaletteColors = (pcEditBG_Ok,   pcEditBG_Warning,   pcEditBG_Alert);
begin
  if MainForm.sSkinManager1.Active and sCheckBox6.Checked {Colored rows} then
    case Item.Index of
      4, 5, 6: begin // Rows with special colors
        Sender.Canvas.Font.Color  := MainForm.sSkinManager1.Palette[ColorsText[Item.Index]];
        Sender.Canvas.Brush.Color := MainForm.sSkinManager1.Palette[ColorsBg[Item.Index]];
      end

      else begin // Rows with "Odd/Even" colors
        Sender.Canvas.Font.Color  := MainForm.sSkinManager1.Palette[pcEditText];
        if Item.Index mod 2 = 0 then
          Sender.Canvas.Brush.Color := MainForm.sSkinManager1.Palette[sSkinManager.pcEditBG_OddRow]
        else
          Sender.Canvas.Brush.Color := MainForm.sSkinManager1.Palette[sSkinManager.pcEditBG_EvenRow];
      end;
    end;
end;


procedure TFrame_ListView.AddNewItems(Count: integer);
var
  i, l: integer;
begin
  sListView1.SkinData.BeginUpdate; // Disable an updating of skinned scrolls
  sListView1.Items.BeginUpdate;
  l := sListView1.Items.Count;
  for i := l + 1 to l + Count do
    with sListView1.Items.Add do begin
      Caption := 'Item ' + IntToStr(i);
      if sListView1.SmallImages <> nil then
        ImageIndex := Random(sListView1.SmallImages.Count - 1);

      SubItems.Add('SubItem 1');
      SubItems.Add('SubItem 2');
      if sListView1.SmallImages <> nil then
        SubItemImages[0] := Random(sListView1.SmallImages.Count - 1);
    end;
    
  sListView1.Items.EndUpdate;
  sListView1.SkinData.EndUpdate;
end;


procedure TFrame_ListView.AfterCreation;
begin
  AddNewItems(20);
end;

end.
