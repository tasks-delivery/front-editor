unit UnitFrameEditAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ComCtrls,

  sFrameAdapter, sComboBoxes, sTooledit, sCurrencyEdit, sComboEdit, sCurrEdit, sMaskEdit, sCustomComboEdit,
  sComboBox, sFileCtrl, sGroupBox, acShellCtrls, sCheckBox, sFontCtrls, sListBox, sCheckListBox,

  UnitFrameCustom, sTreeView;


type
  TFrame_EditAdd = class(TCustomInfoFrame)
    sCheckListBox1: TsCheckListBox;
    sListBox1: TsListBox;
    sColorBox1: TsColorBox;
    sComboBoxEx1: TsComboBoxEx;
    sComboBox1: TsComboBox;
    sCheckBox1: TsCheckBox;
    sFilterComboBox1: TsFilterComboBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    sColorBox2: TsColorBox;
    sTreeViewEx1: TsTreeViewEx;
    procedure sCheckBox1Click(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
  public
    procedure AfterCreation; override;
  end;


implementation

uses sVCLUtils, MainUnit;

{$R *.DFM}

procedure TFrame_EditAdd.sCheckBox1Click(Sender: TObject);
begin
  sListBox1.AutoHideScroll := sCheckBox1.Checked
end;


procedure TFrame_EditAdd.sComboBox1Change(Sender: TObject);
var
  i: integer;
begin
  // Change SkinSection in all controls in this frame
  for i := 0 to ControlCount - 1 do
    if Controls[i] is TWinControl then
      TrySetSkinSection(TWinControl(Controls[i]), sComboBox1.Text);
end;


procedure TFrame_EditAdd.sCheckBox2Click(Sender: TObject);
var
  i: integer;
begin
  sCheckListBox1.MultiSelect := sCheckBox2.Checked;
  sListBox1.MultiSelect := sCheckBox2.Checked;
  for i := 3 to 7 do begin
    sCheckListBox1.Selected[i] := sCheckBox2.Checked;
    sListBox1.Selected[i] := sCheckBox2.Checked;
  end;
end;


procedure TFrame_EditAdd.sCheckBox3Click(Sender: TObject);
var
  i: integer;
begin
  for i := 10 to 14 do
    sCheckListBox1.ItemEnabled[i] := not sCheckBox3.Checked;
end;


procedure TFrame_EditAdd.AfterCreation;
var
  i: integer;
begin
  for i := 1 to 100 do
    sTreeViewEx1.Items.Add(nil, 'Item ' + IntToStr(i));
end;

end.
