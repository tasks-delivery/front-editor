unit TopMenu;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;


type
  TFrontEd = class(TForm)
    Button1: TButton;
    Menu: TMainMenu;
    MenuFile: TMenuItem;
    MenuAbout: TMenuItem;
    MenuSupport: TMenuItem;
    MenuExit: TMenuItem;
    procedure MenuExitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure MenuExitClick(Sender: TObject);
    Overload;
  end;

var
  FrontEd: TFrontEd;

implementation

procedure TFrontEd.MenuExitClick(Sender: TObject);
begin
 Close;
end;

procedure TFrontEd.Button1Click(Sender: TObject);
begin

end;

end.
