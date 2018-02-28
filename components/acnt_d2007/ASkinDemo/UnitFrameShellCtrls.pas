unit UnitFrameShellCtrls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, 

  sListView, acShellCtrls, sTreeView, sComboBoxes, sFrameAdapter, sComboBox,

  UnitFrameCustom;

type
  TFrame_ShellControls = class(TCustomInfoFrame)
    sShellComboBox1: TsShellComboBox;
    sShellTreeView1: TsShellTreeView;
    sShellListView1: TsShellListView;
    sComboBox1: TsComboBox;
    procedure sComboBox1Change(Sender: TObject);
  end;

implementation

uses sVCLUtils;

{$R *.DFM}

procedure TFrame_ShellControls.sComboBox1Change(Sender: TObject);
const
  ViewStyles: array [0..3] of TViewStyle = (vsIcon, vsList, vsReport, vsSmallIcon);
begin
  sShellListView1.ViewStyle := ViewStyles[sComboBox1.ItemIndex];
end;

end.
