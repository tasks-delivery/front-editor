unit UnitFrameDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, ComCtrls, Buttons,

  sFrameAdapter, sTrackBar, sSpeedButton, StdCtrls, sGroupBox, sCheckBox, sLabel;

type
  TFrameDemo = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    PopupMenu1: TPopupMenu;
    Item11: TMenuItem;
    Item1: TMenuItem;
    Item31: TMenuItem;
    Item41: TMenuItem;
    Item111: TMenuItem;
    Item121: TMenuItem;
    Item131: TMenuItem;
    sLabel1: TsLabel;
    sCheckBox1: TsCheckBox;
    sGroupBox1: TsGroupBox;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sTrackBar1: TsTrackBar;
  end;

implementation

{$R *.DFM}

uses MainUnit;

end.
