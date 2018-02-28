unit UnitFrameStdVCL;

interface

uses
  StdCtrls, ComCtrls, Buttons, ExtCtrls, CheckLst, Mask, Controls, Grids, Classes, SysUtils,

  sCheckBox, sButton, sLabel, sCheckListBox, sFrameAdapter,

  UnitFrameCustom;


type
  TFrame_StdVCL = class(TCustomInfoFrame)
    Edit1: TEdit;
    Memo1: TMemo;
    Label1: TLabel;
    ListBox1: TListBox;
    StringGrid1: TStringGrid;
    MaskEdit1: TMaskEdit;
    DrawGrid1: TDrawGrid;
    CheckListBox1: TCheckListBox;
    RichEdit1: TRichEdit;
    TreeView1: TTreeView;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ScrollBar1: TScrollBar;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    StaticText2: TStaticText;
    Button2: TButton;
  public
    procedure AfterCreation; override;
  end;


implementation

uses MainUnit;

{$R *.DFM}


procedure TFrame_StdVCL.AfterCreation;
var
  x, y: integer;
  i, j, c: integer;
  Parent1, Parent2: TTreeNode;
begin
  for x := 0 to StringGrid1.ColCount - 1 do
    for y := 0 to StringGrid1.RowCount - 1 do
      StringGrid1.Cells[x, y] := 'Cell ' + IntToStr(x) + ':' + IntToStr(y);

  for i := 0 to 4 do begin
    Parent1 := TreeView1.Items.Add(nil, 'Item ' + IntToStr(i));
    for j := 0 to 4 do begin
      Parent2 := TreeView1.Items.AddChild(Parent1, 'SubItem ' + IntToStr(j));
      for c := 0 to 4 do
        TreeView1.Items.AddChild(Parent2, 'Long caption item for horizontal scroll testing ' + IntToStr(c));
    end;
  end;
  TreeView1.FullExpand; // Expand for showing of scrolls
  TreeView1.Selected := TreeView1.Items[0];

  for i := 0 to 44 do
    with ListView1.Items.Add do begin
      Caption := 'Item ' + IntToStr(i);
      ImageIndex := Random(ListView1.SmallImages.Count);
    end;
end;


end.
