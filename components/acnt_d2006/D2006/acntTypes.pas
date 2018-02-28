unit acntTypes;
{$I sDefs.inc}
//{$DEFINE LOGGED}

interface

uses
  {$IFDEF TNTUNICODE} TntMenus, {$ENDIF}
{$IFNDEF NOJPG}
  {$IFDEF TINYJPG} acTinyJpg, {$ELSE} Jpeg, {$ENDIF}
{$ENDIF}
  Controls, Menus, Windows, Classes, Forms, Graphics, Messages,
  sConst;

{$IFNDEF NOTFORHELP}

type
  TacArrowsStyle = (arsSolid1, arsLines1, arsSolid2, arsLines2, arsDefault);

  TacItemDrawData = class(TObject)
  public
    ImageIndex: integer;
  end;

  TacBounds = record
    BLeft, BTop, BWidth, BHeight: integer;
  end;

  TSrcRect = packed record
    SLeft, STop, SRight, SBottom: {$IFDEF DELPHI_XE8}FixedInt{$ELSE}Longint{$ENDIF};
  end;

  TDstRect = packed record
    DLeft, DTop, DRight, DBottom: {$IFDEF DELPHI_XE8}FixedInt{$ELSE}Longint{$ENDIF};
  end;

  PacLayerPos = ^TacLayerPos;
  TacLayerPos = record
    Bounds: TacBounds;
    LayerBlend: byte;
  end;

  TStringLists = array of TStringList;
  TRects = array of Windows.TRect;
  TacJpegClass = {$IFDEF TINYJPG}TacTinyJPGImage{$ELSE}TJPEGImage{$ENDIF};
  TacMenuItem = {$IFDEF TNTUNICODE}TTntMenuItem{$ELSE}TMenuItem{$ENDIF};

  TacAccessControl = class(TControl)
  public
    property AutoSize;
    property ParentColor;
    property Color;
    property ParentFont;
    property PopupMenu;
    property Font;
  end;

  TacAccessCanvas = class({$IFDEF D2010}TCustomCanvas{$ELSE}TPersistent{$ENDIF})
  public
    FHandle: HDC;
  end;

  TacGlowForm = class(TCustomForm)
  public
    TransparentMouse: boolean;
    procedure AfterConstruction; override;
    procedure CreateWnd; override;
    procedure WndProc(var Message: TMessage); override;
  end;

  TacButtonPaintData = record
    AColor1,
    AColor2,
    ABorderColor,
    AFontColor: TColor;
    AText: acString;
    AState,
    ABevelWidth,
    ABorderWidth: integer;
    ATransparent: boolean;
  end;

  TacPaintButtonOptions = class;

  TacDataNormal = class(TPersistent)
  private
    FColor1,
    FColor2,
    FFontColor,
    FBorderColor: TColor;
    FOwner: TacPaintButtonOptions;
  public
    constructor Create(AOwner: TacPaintButtonOptions);
    procedure SetColor(const Index: Integer; const Value: TColor);
  published
    property Color1:      TColor index 0 read FColor1       write SetColor default clBtnFace;
    property Color2:      TColor index 1 read FColor2       write SetColor default cl3DLight;
    property FontColor:   TColor index 2 read FFontColor    write SetColor default clBtnText;
    property BorderColor: TColor index 3 read FBorderColor  write SetColor default clActiveBorder;
  end;

  TacDataActive = class(TacDataNormal)
  public
    constructor Create(AOwner: TacPaintButtonOptions);
  published
    property Color1 default clBtnHighlight;
    property Color2 default clBtnFace;
  end;

  TacDataPressed = class(TacDataNormal)
  public
    constructor Create(AOwner: TacPaintButtonOptions);
  published
    property Color1 default cl3DLight;
    property Color2 default cl3DLight;
  end;

  TacPaintButtonOptions = class(TPersistent)
  private
    FBevelWidth,
    FBorderWidth: integer;
    FDataActive:  TacDataActive;
    FDataNormal:  TacDataNormal;
    FDataPressed: TacDataPressed;
    procedure SetInteger(const Index: Integer; const Value: integer);
  protected
    FOnInvalidate: TNotifyEvent;
  public
    constructor Create;
    destructor Destroy; override;
    property OnInvalidate: TNotifyEvent read FOnInvalidate write FOnInvalidate;
  published
    property BevelWidth:  integer index 0 read FBevelWidth  write SetInteger default 2;
    property BorderWidth: integer index 1 read FBorderWidth write SetInteger default 1;
    property DataActive:  TacDataActive  read FDataActive  write FDataActive;
    property DataNormal:  TacDataNormal  read FDataNormal  write FDataNormal;
    property DataPressed: TacDataPressed read FDataPressed write FDataPressed;
  end;


function acBounds(Left, Top, Width, Height: integer): TacBounds;

{$ENDIF}

implementation

{$IFDEF LOGGED}
uses
  sDebugMsgs;
{$ENDIF}

function acBounds(Left, Top, Width, Height: integer): TacBounds;
begin
  with Result do begin
    BLeft := Left;
    BTop := Top;
    BWidth := Width;
    BHeight := Height;
  end;
end;


procedure TacGlowForm.AfterConstruction;
begin
  inherited;
  Tag := ExceptTag;
  BorderStyle := bsNone;
  TransparentMouse := True;
end;


procedure TacGlowForm.CreateWnd;
begin
  inherited;
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW or WS_EX_NOACTIVATE);
  SetClassLong(Handle, GCL_STYLE, GetClassLong(Handle, GCL_STYLE) and not NCS_DROPSHADOW);
end;


procedure TacGlowForm.WndProc(var Message: TMessage);
begin
{$IFDEF LOGGED}
  if Tag = 2 then
    AddToLog(Message);
{$ENDIF}
  case Message.Msg of
    // Removing of blinking
    CM_VISIBLECHANGED, WM_SHOWWINDOW:
      if (Message.WParam = 0) and HandleAllocated and IsWindowVisible(Handle) then // If hide
        SetWindowPos(Handle, 0, 0, 0, 0, 0, SWPA_HIDE or SWP_NOMOVE or SWP_NOSIZE);

    WM_NCHITTEST: if TransparentMouse then
      Message.Result := HTTRANSPARENT;
  end;
  inherited;
end;


constructor TacPaintButtonOptions.Create;
begin
  FBorderWidth := 1;
  FBevelWidth := 2;
  FDataActive  := TacDataActive.Create(Self);
  FDataNormal  := TacDataNormal.Create(Self);
  FDataPressed := TacDataPressed.Create(Self);
end;


destructor TacPaintButtonOptions.Destroy;
begin
  FDataActive.Free;
  FDataNormal.Free;
  FDataPressed.Free;
  inherited;
end;


procedure TacPaintButtonOptions.SetInteger(const Index, Value: integer);

  procedure ChangeProp(var Prop: integer; Value: integer);
  begin
    if Prop <> Value then begin
      Prop := Value;
      if Assigned(FOnInvalidate) then
        FOnInvalidate(Self);
    end;
  end;

begin
  case Index of
    0: ChangeProp(FBevelWidth, Value);
    1: ChangeProp(FBorderWidth, Value);
  end;
end;


constructor TacDataNormal.Create(AOwner: TacPaintButtonOptions);
begin
  FOwner        := AOwner;
  FColor1       := clBtnFace;
  FColor2       := cl3DLight;
  FFontColor    := clBtnText;
  FBorderColor := clActiveBorder;
end;


procedure TacDataNormal.SetColor(const Index: Integer; const Value: TColor);

  procedure ChangeProp(var Prop: TColor; Value: integer);
  begin
    if Prop <> Value then begin
      Prop := Value;
      if Assigned(FOwner.FOnInvalidate) then
        FOwner.FOnInvalidate(FOwner);
    end;
  end;

begin
  case Index of
    0: ChangeProp(FColor1, Value);
    1: ChangeProp(FColor2, Value);
    2: ChangeProp(FFontColor, Value);
    3: ChangeProp(FBorderColor, Value);
  end;
end;


constructor TacDataActive.Create(AOwner: TacPaintButtonOptions);
begin
  inherited;
  Color1 := clBtnHighlight;
  Color2 := clBtnFace;
end;


constructor TacDataPressed.Create(AOwner: TacPaintButtonOptions);
begin
  inherited;
  Color1 := cl3DLight;
  Color2 := cl3DLight;
end;

end.




