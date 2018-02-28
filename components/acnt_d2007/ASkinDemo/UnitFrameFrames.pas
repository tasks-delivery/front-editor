unit UnitFrameFrames;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  sFrameAdapter, sButton,
  {$IFDEF LOGGED} sDebugMsgs, {$ENDIF}
  UnitFrameCustom;

type
  TFrame_Frames = class(TCustomInfoFrame)
    sButton1: TsButton;
    sButton2: TsButton;
    constructor Create(AOwner: TComponent); override;
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
  private
    x,
    y: integer;
    Count: integer;
  end;

implementation

uses UnitFrameTest, MainUnit;

{$R *.DFM}

constructor TFrame_Frames.Create(AOwner: TComponent);
begin
  inherited;
  x := MainForm.sSkinManager1.ScaleInt(260);
  y := MainForm.sSkinManager1.ScaleInt(10);
  Count := 0;
end;


procedure TFrame_Frames.sButton1Click(Sender: TObject);
var
  NewFrame: TFrameTest;
begin
  inc(Count);
  NewFrame := TFrameTest.Create(Self);
  MainForm.sSkinManager1.UpdateScale(NewFrame);
  NewFrame.Tag := 2 + Count;
  NewFrame.Name := 'TFrame16_' + IntToStr(NewFrame.Tag);
  NewFrame.SetBounds(x, y, NewFrame.Width, NewFrame.Height);
  NewFrame.Visible := True;
  NewFrame.Parent := Self;
  dec(x, MainForm.sSkinManager1.ScaleInt(50));
  inc(y, MainForm.sSkinManager1.ScaleInt(80));
  if Count > 5 then
    sButton1.Enabled := False;
    
  sButton2.Enabled := True;
end;


procedure TFrame_Frames.sButton2Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ControlCount - 1 do
    if Controls[i] is TFrame then begin
      Controls[i].Free;
      Break;
    end;
end;

end.
