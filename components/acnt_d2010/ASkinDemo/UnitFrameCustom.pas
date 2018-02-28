unit UnitFrameCustom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sFrameAdapter, Buttons;

type
  TCustomInfoFrame = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
  protected
    InInit: boolean;
  public
    procedure AfterCreation;     virtual; // Called after creation of the frame
    procedure BeforeDestruct;    virtual;
    procedure AfterSkinChange;   virtual;
    procedure BeforeSkinChange;  virtual;
    procedure SkinActiveChanged; virtual; // Called when SkinManager.Active switched on/off
  end;

implementation

uses MainUnit;

{$R *.dfm}

procedure TCustomInfoFrame.AfterCreation;
begin
  // Methods are not abstract (sometimes they may be called)
end;


procedure TCustomInfoFrame.AfterSkinChange;
begin
  //
end;


procedure TCustomInfoFrame.BeforeDestruct;
begin
  //
end;


procedure TCustomInfoFrame.BeforeSkinChange;
begin
  //
end;


procedure TCustomInfoFrame.SkinActiveChanged;
begin
  //
end;

end.
