unit acDBCtrlGrid;
{$I sDefs.inc}
//{$DEFINE LOGGED}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DBCtrls, DB, dbcgrids, math,
  {$IFNDEF DELPHI5} Types, {$ENDIF}
  {$IFDEF DELPHI_XE2} UItypes, {$ENDIF}
  sConst, acntUtils, sGraphUtils, sGlyphUtils, sCommonData, sDefaults, acSBUtils;


type
  TsDBCtrlGrid = class;


  TsDBCtrlPanel = class(TDBCtrlPanel)
  private
    FDisabledKind: TsDisabledKind;
    DrawIndex: integer;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure acPaintControls(DC: HDC; First: TControl);
    function GetDBCtrlGrid: TsDBCtrlGrid;
  protected
    function Selected: boolean;
    procedure PaintWindow(DC: HDC); override;
    procedure WndProc(var Message: TMessage); override;
    procedure PrepareCache(pR: TPoint; Selected: boolean);
  public
    FCommonData: TsCommonData;
    constructor CreateLinked2(DBCtrlGrid: TDBCtrlGrid);
    destructor Destroy; override;
    procedure Loaded; override;
    property DBCtrlGrid: TsDBCtrlGrid read GetDBCtrlGrid;
  end;


{$IFDEF DELPHI_XE3}[ComponentPlatformsAttribute(pidWin32 or pidWin64)]{$ENDIF}
  TsDBCtrlGrid = class(TDBCtrlGrid)
  private
    SaveActive: Integer;
    FBitmapCount: Integer;
    FPanelBitmap: HBitmap;
    FSaveBitmap: HBitmap;
    FPanelDC: HDC;
    FAutoMouseWheel: boolean;
    FCommonData: TsScrollWndData;
    FPanelSkin: TsSkinSection;
    FSelectionSkin: TsSkinSection;
    procedure SetDisabledKind(const Value: TsDisabledKind);
    function GetDataLink: TDataLink;
    function GetDisabledKind: TsDisabledKind;
    procedure SetPanelSkin(const Value: TsSkinSection);
    procedure CreatePanelBitmap;
    procedure DestroyPanelBitmap;
    function GetPanelBounds(Index: Integer): TRect;
    procedure DrawPanel(DC: HDC; Index: Integer);
    procedure DrawPanelBackground(DC: HDC; const R: TRect; Erase, Selected: Boolean);
    procedure PrepareCache;
  protected
    procedure PaintWindow(DC: HDC); override;
    procedure WndProc(var Message: TMessage); override;
  public
    ListSW: TacScrollWnd;
    ScrollsUpdating: boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    procedure AfterConstruction; override;
    property DataLink: TDataLink read GetDataLink;
    property Panel;
  published
    property AutoMouseWheel: boolean read FAutoMouseWheel write FAutoMouseWheel default False;
    property DisabledKind:  TsDisabledKind read GetDisabledKind write SetDisabledKind default DefDisabledKind;
    property SkinData:      TsScrollWndData read FCommonData write FCommonData;
    property PanelSkin:     TsSkinSection read FPanelSkin     write SetPanelSkin;
    property SelectionSkin: TsSkinSection read FSelectionSkin write FSelectionSkin;
  end;


implementation

uses sMessages, sMaskData, sStyleSimply, sSkinProps, sVCLUtils, sAlphaGraph{$IFDEF LOGGED}, sDebugMsgs{$ENDIF};


type
  TDBCtrlGrid_ = class(TWinControl)
  private
    FDataLink: TDBCtrlGridLink;
    FPanel: TDBCtrlPanel;
  end;

  TDBCtrlPanel_ = class(TWinControl)
  private
    FDBCtrlGrid: TDBCtrlGrid;
  end;


constructor TsDBCtrlPanel.CreateLinked2(DBCtrlGrid: TDBCtrlGrid);
begin
  inherited CreateLinked(DBCtrlGrid);
  DrawIndex := -1;
  ParentColor := False;
  FCommonData := TsCommonData.Create(Self, True);
  FCommonData.COC := COC_TsPanel;
  FDisabledKind := DefDisabledKind;
end;


destructor TsDBCtrlPanel.Destroy;
begin
  FreeAndNil(FCommonData);
  inherited;
end;


function TsDBCtrlPanel.GetDBCtrlGrid: TsDBCtrlGrid;
begin
  Result := TDBCtrlPanel_(Self).FDBCtrlGrid as TsDBCtrlGrid;
end;


procedure TsDBCtrlPanel.Loaded;
begin
  inherited Loaded;
  if FCommonData.SkinSection = '' then
    FCommonData.SkinSection := TsDBCtrlGrid(DBCtrlGrid).PanelSkin;

  try
    FCommonData.Loaded;
  except
    Application.HandleException(Self);
  end;
end;


procedure TsDBCtrlPanel.acPaintControls(DC: HDC; First: TControl);
var
  I, Count, SaveIndex: Integer;
begin
  if DockSite and UseDockManager and (DockManager <> nil) then
    DockManager.PaintSite(DC);

  I := 0;
  Count := ControlCount;
  while I < Count do begin
    with TControl(Controls[I]) do
      if (Visible or (csDesigning in ComponentState) and not (csNoDesignVisible in ControlStyle)) and RectVisible(DC, Rect(Left, Top, Left + Width, Top + Height)) then begin
        if csPaintCopy in Self.ControlState then
          ControlState := ControlState + [csPaintCopy];

        SaveIndex := SaveDC(DC);
        MoveWindowOrg(DC, Left, Top);
        IntersectClipRect(DC, 0, 0, Width, Height);

        if Controls[I] is TWinControl then begin
          Controls[I].ControlState := Controls[I].ControlState + [csPaintCopy];
          Perform(WM_PRINT, WParam(DC), 0);
          Controls[I].ControlState := Controls[I].ControlState - [csPaintCopy];
        end
        else
          Perform(WM_PAINT, WParam(DC), 0);

        RestoreDC(DC, SaveIndex);
        ControlState := ControlState - [csPaintCopy];
      end;

    inc(I);
  end;
end;


procedure TsDBCtrlPanel.PaintWindow(DC: HDC);
var
  R: TRect;
begin
  if not ControlIsReady(Self) or not FCommonData.Skinned then
    inherited
  else begin
    if DrawIndex < 0 then
      R := DBCtrlGrid.GetPanelBounds(DBCtrlGrid.PanelIndex)
    else
      R := DBCtrlGrid.GetPanelBounds(DrawIndex);

    PrepareCache(Point(R.Left, R.Top), Selected);
    UpdateCorners(FCommonData, 0);

    FCommonData.FCacheBmp.Canvas.Font := Font;
    FCommonData.FCacheBmp.Canvas.Brush.Style := bsSolid;
    FCommonData.FCacheBmp.Canvas.Brush.Color := Color;

    SetParentUpdated(Self);
    BitBlt(DC, 0, 0, Width, Height, FCommonData.FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY);
    if DBCtrlGrid.DataSource <> nil then
      DBCtrlGrid.PaintPanel(DBCtrlGrid.DataLink.ActiveRecord);

    if DBCtrlGrid.ShowFocus and DBCtrlGrid.Focused and Selected then
      DrawFocusRect(DC, Rect(2, 2, Width - 2, Height - 2));
  end;
end;


procedure TsDBCtrlPanel.PrepareCache(pR: TPoint; Selected: boolean);
begin
  DBCtrlGrid.PrepareCache;
  InitCacheBmp(FCommonData);
  if Selected and (DBCtrlGrid.SelectionSkin <> '') then
    PaintItem(FCommonData.SkinManager.GetSkinIndex(DBCtrlGrid.SelectionSkin), GetParentCache(FCommonData), True, integer(DBCtrlGrid.Focused), MkRect(Self), pR, FCommonData.FCacheBmp, FCommonData.SkinManager)
  else
    if '' <> DBCtrlGrid.PanelSkin then
      PaintItem(FCommonData.SkinManager.GetSkinIndex(DBCtrlGrid.PanelSkin), GetParentCache(FCommonData), False, 0, MkRect(Self), pR, FCommonData.FCacheBmp, FCommonData.SkinManager)
    else
      BitBlt(FCommonData.FCacheBmp.Canvas.Handle, 0, 0, Width, Height, DBCtrlGrid.SkinData.FCacheBmp.Canvas.Handle, pR.X, pR.Y, SRCCOPY);

  FCommonData.BGChanged := False;
end;


function TsDBCtrlPanel.Selected: boolean;
begin
  with DBCtrlGrid do
    if DataLink.Active then
      Result := DBCtrlGrid.SaveActive = DataLink.ActiveRecord
    else
      Result := False;
end;


procedure TsDBCtrlPanel.WMPaint(var Message: TWMPaint);
var
  DC: HDC;
  i: integer;
  PS: TPaintStruct;
begin
  if not ControlIsReady(Self) or not FCommonData.Skinned then
    inherited
  else
    if not (csDestroying in ComponentState) then
      if Message.DC = 0 then begin
        for i := 0 to ControlCount - 1 do
          Controls[i].ControlState := Controls[i].ControlState + [csPaintCopy];

        DBCtrlGrid.CreatePanelBitmap;
        try
          Message.DC := DBCtrlGrid.FPanelDC;
          PaintHandler(Message);
          Message.DC := 0;
          DC := BeginPaint(Handle, PS);
          BitBlt(DC, 0, 0, Width, Height, DBCtrlGrid.FPanelDC, 0, 0, SRCCOPY);
          EndPaint(Handle, PS);
        finally
          DBCtrlGrid.DestroyPanelBitmap;
        end;
        for i := 0 to ControlCount - 1 do
          Controls[i].ControlState := Controls[i].ControlState - [csPaintCopy];
      end
      else
        PaintHandler(Message);
end;


procedure TsDBCtrlPanel.WndProc(var Message: TMessage);
var
  b: boolean;
begin
  if Message.Msg = SM_ALPHACMD then
    case Message.WParamHi of
      AC_CTRLHANDLED: begin
        Message.Result := 1;
        Exit;
      end; // AlphaSkins supported

      AC_REMOVESKIN:
        if LongWord(Message.LParam) = LongWord(FCommonData.SkinManager) then begin
          CommonMessage(Message, FCommonData);
          AlphaBroadCast(Self,Message);
          Exit;
        end;

      AC_SETNEWSKIN:
        if LongWord(Message.LParam) = LongWord(FCommonData.SkinManager) then begin
          CommonMessage(Message, FCommonData);
          AlphaBroadCast(Self,Message);
          Exit;
        end;

      AC_REFRESH:
        if LongWord(Message.LParam) = LongWord(FCommonData.SkinManager) then begin
          CommonMessage(Message, FCommonData);
          AlphaBroadCast(Self,Message);
          if FCommonData.Skinned then
            Perform(WM_NCPAINT, 0, 0);

          Exit;
        end;

      AC_ENDPARENTUPDATE:
        if FCommonData.Updating then begin
          FCommonData.Updating := False;
          Perform(WM_NCPAINT, 0, 0);
        end;

      AC_GETBG: begin
        if DBCtrlGrid.FCommonData.BGChanged then
          DBCtrlGrid.PrepareCache;

        with PacBGInfo(Message.LParam)^ do begin
          Offset := Point(0, 0);
          Bmp := FCommonData.FCacheBmp;
          BgType := btCache;
        end;
        Exit;
      end;

      AC_GETFONTINDEX:
        if FCommonData.Skinned then begin
          b := Selected and (DBCtrlGrid.SelectionSkin <> '');
          if b then begin
            PacPaintInfo(Message.LParam)^.FontIndex := FCommonData.SkinManager.GetSkinIndex(DBCtrlGrid.SelectionSkin);
            PacPaintInfo(Message.LParam)^.State := integer(DBCtrlGrid.Focused);
          end
          else
            if NeedParentFont(FCommonData.SkinManager, FCommonData.SkinIndex, integer(b), Self) then begin
              inc(PacPaintInfo(Message.LParam)^.R.Left, Left);
              inc(PacPaintInfo(Message.LParam)^.R.Top,  Top);
              Message.Result := GetFontIndex(Parent, PacPaintInfo(Message.LParam))
            end
            else
              PacPaintInfo(Message.LParam)^.FontIndex := FCommonData.SkinIndex;

          Message.Result := 1;
          Exit;
        end;
    end;

  if not ControlIsReady(Self) or not FCommonData.Skinned then
    inherited
  else begin
    case Message.Msg of
      WM_PRINT:
        if not ControlIsReady(Self) or not FCommonData.Skinned then
          inherited
        else begin
          Perform(WM_PAINT, Message.WParam, Message.LParam);
          Perform(WM_NCPAINT, Message.WParam, Message.LParam);
          Exit;
        end;
    end;
    CommonWndProc(Message, FCommonData);
    inherited;
  end;
end;


constructor TsDBCtrlGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCommonData := TsScrollWndData.Create(Self, True);
  FCommonData.COC := COC_TsScrollBox;
  FAutoMouseWheel := False;
  FreeAndNil(TDBCtrlGrid_(Self).FPanel);
  TDBCtrlGrid_(Self).FPanel := TsDBCtrlPanel.CreateLinked2(Self);
  AdjustSize;
end;


procedure TsDBCtrlGrid.Loaded;
begin
  inherited Loaded;
  if FPanelSkin = '' then
    FPanelSkin := s_GroupBox;

  try
    FCommonData.Loaded;
    TsDBCtrlPanel(Panel).Loaded;
  except
    Application.HandleException(Self);
  end;
  RefreshScrolls(FCommonData, ListSW);
end;


destructor TsDBCtrlGrid.Destroy;
begin
  FreeAndNil(ListSW);
  FreeAndNil(FCommonData);
  inherited;
end;


procedure TsDBCtrlGrid.DrawPanel(DC: HDC; Index: Integer);
var
  R: TRect;
begin
  R := GetPanelBounds(Index);
  if Index < PanelCount then begin
    SaveActive := DataLink.ActiveRecord;
    DataLink.ActiveRecord := Index;
    TsDBCtrlPanel(Panel).DrawIndex := Index;
    if Index <> PanelIndex then begin
      Panel.ControlState := Panel.ControlState + [csPaintCopy];
      TsDBCtrlPanel(Panel).PaintWindow(FPanelDC);
      TsDBCtrlPanel(Panel).acPaintControls(FPanelDC, nil);
      Panel.ControlState := Panel.ControlState - [csPaintCopy];
    end;

    DataLink.ActiveRecord := SaveActive;
  end
  else
    DrawPanelBackground(FPanelDC, Panel.ClientRect, True, False);

  BitBlt(DC, R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top, FPanelDC, 0, 0, SRCCOPY);
end;


procedure TsDBCtrlGrid.DrawPanelBackground(DC: HDC; const R: TRect; Erase, Selected: Boolean);
begin
  TsDBCtrlPanel(Panel).PrepareCache(R.TopLeft, Selected);
  PaintItem(TsDBCtrlPanel(Panel).FCommonData, GetParentCache(FCommonData), False, 0, Panel.ClientRect, R.TopLeft, TsDBCtrlPanel(Panel).FCommonData.FCacheBmp, True);
  BitBlt(DC, R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top, TsDBCtrlPanel(Panel).FCommonData.FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY);
end;


function TsDBCtrlGrid.GetPanelBounds(Index: Integer): TRect;
var
  Col, Row: Integer;
begin
  if Orientation = goVertical then begin
    Col := Index mod ColCount;
    Row := Index div ColCount;
  end
  else begin
    Col := Index div RowCount;
    Row := Index mod RowCount;
  end;
  Result.Left := PanelWidth * Col;
  Result.Top := PanelHeight * Row;
  Result.Right := Result.Left + PanelWidth;
  Result.Bottom := Result.Top + PanelHeight;
end;


procedure TsDBCtrlGrid.PaintWindow(DC: HDC);
var
  I: Integer;
  Brush: HBrush;
  M : TMessage;
begin
  if not ((Panel is TsDBCtrlPanel) and TsDBCtrlPanel(Panel).FCommonData.Skinned) then
    inherited
  else begin
    if csDesigning in ComponentState then begin
      Panel.Update;
      Brush := CreateHatchBrush(HS_BDIAGONAL, ColorToRGB(clBtnShadow));
      SetBkColor(DC, ColorToRGB(Color));
      FillRect(DC, ClientRect, Brush);
      DeleteObject(Brush);
      for I := 1 to ColCount * RowCount - 1 do
        DrawPanelBackground(DC, GetPanelBounds(I), False, DataLink.Active and (I = DataLink.ActiveRecord));
    end
    else begin
      CreatePanelBitmap;
      try
        for I := 0 to ColCount * RowCount - 1 do begin
          m := MakeMessage(SM_ALPHACMD, AC_SETBGCHANGED_HI + 1, 0, 0);
          Panel.Broadcast(m);
          DrawPanel(DC, I);
        end;
      finally
        TsDBCtrlPanel(Panel).DrawIndex := -1;
        DestroyPanelBitmap;
      end;
    end;
    { When width or height are not evenly divisible by panel size, fill the gaps }
    if HandleAllocated then begin
      if Height <> Panel.Height * RowCount then
        BitBlt(DC, 0, Panel.Height * RowCount, Width, Height, FCommonData.FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY);

      if Width <> Panel.Width * ColCount then
        BitBlt(DC, Panel.Width * ColCount, 0, Width, Height, FCommonData.FCacheBmp.Canvas.Handle, 0, 0, SRCCOPY);
    end;
  end;
end;


procedure TsDBCtrlGrid.SetDisabledKind(const Value: TsDisabledKind);
begin
  with TsDBCtrlPanel(Panel) do
    if FDisabledKind <> Value then begin
      FDisabledKind := Value;
      FCommonData.Invalidate;
    end;
end;


function TsDBCtrlGrid.GetDisabledKind: TsDisabledKind;
begin
  with TsDBCtrlPanel(Panel) do
    Result := FDisabledKind;
end;


procedure TsDBCtrlGrid.PrepareCache;
begin
  InitCacheBmp(FCommonData);
  PaintItem(FCommonData, GetParentCache(FCommonData), False, 0, MkRect(Self), MkPoint(Self), FCommonData.FCacheBmp, False);
  FCommonData.BGChanged := False;
end;


var
  bacWheelFlag: boolean = False;

procedure TsDBCtrlGrid.WndProc(var Message: TMessage);
begin
{$IFDEF LOGGED}
  AddToLog(Message);
{$ENDIF}
   case Message.Msg of
    SM_ALPHACMD:
      case Message.WParamHi of
        AC_CTRLHANDLED: begin
          Message.Result := 1;
          Exit;
        end; // AlphaSkins supported

        AC_REMOVESKIN:
          if LongWord(Message.LParam) = LongWord(FCommonData.SkinManager) then begin
            if ListSW <> nil then
              FreeAndNil(ListSW);

            CommonMessage(Message, FCommonData);
            AlphaBroadCast(Self,Message);
            RecreateWnd;
            Exit;
          end;

        AC_SETNEWSKIN:
          if LongWord(Message.LParam) = LongWord(FCommonData.SkinManager) then begin
            CommonMessage(Message, FCommonData);
            AlphaBroadCast(Self,Message);
            Exit;
          end;

        AC_REFRESH:
          if LongWord(Message.LParam) = LongWord(FCommonData.SkinManager) then begin
            CommonMessage(Message, FCommonData);
            RefreshScrolls(FCommonData, ListSW);
            AlphaBroadCast(Self,Message);
            RedrawWindow(Handle, nil, 0, RDWA_ALLNOW);
            Exit;
          end;

        AC_ENDPARENTUPDATE:
          if InUpdating(FCommonData) then begin
            FCommonData.Updating := False;
            Perform(WM_NCPAINT, 0, 0);
          end;

        AC_GETBG: begin
          if (SkinData.BGChanged or SkinData.HalfVisible) and not SkinData.Updating then
            PrepareCache;

          with PacBGInfo(Message.LParam)^ do begin
            Offset := Point(0, 0);
            Bmp := FCommonData.FCacheBmp;
            BgType := btCache;
          end;
          Exit;
        end;

        AC_GETDEFINDEX: begin
          if FCommonData.SkinManager <> nil then
            Message.Result := 1 + FCommonData.SkinManager.ConstData.Sections[ssTransparent];

          Exit;
        end;

        AC_GETFONTINDEX:
          if FCommonData.Skinned then begin
            PacPaintInfo(Message.LParam)^.FontIndex := FCommonData.SkinIndex;
            Message.Result := 1;
            Exit;
          end;
      end;
(*
    WM_NCCALCSIZE:
      if True{not ShowScrollBars} then begin
        Style := GetWindowLong(Handle, GWL_STYLE);
        If Style and (WS_VSCROLL or WS_HSCROLL) <> 0 Then
          SetWindowLong(Handle, GWL_STYLE, style and not (WS_VSCROLL or WS_HSCROLL));

        Exit;
      end;*)
   end;

  if not ControlIsReady(Self) or not FCommonData.Skinned then
    inherited
  else begin
    case Message.Msg of
      WM_PRINT: begin
        Perform(WM_PAINT, Message.WParam, Message.LParam);
        Exit;
      end;
    end;
    CommonWndProc(Message, FCommonData);
    inherited;
    case Message.Msg of
      WM_KILLFOCUS, WM_SETFOCUS:
        RedrawWindow(TDBCtrlGrid_(Self).FPanel.Handle, nil, 0, RDWA_ALLNOW);

      WM_SETFONT, CM_ENABLEDCHANGED, CM_VISIBLECHANGED:
        FCommonData.Invalidate;

      WM_SIZE, WM_MOVE:
        UpdateScrolls(ListSW, True);

      WM_PASTE, WM_CUT, WM_CLEAR, WM_UNDO, WM_SETTEXT:
        UpdateScrolls(ListSW, True);

      WM_HSCROLL, WM_VSCROLL:
        UpdateScrolls(ListSW, True);

      CM_CANCELMODE, CM_CHANGED, CN_KEYDOWN, CN_KEYUP:
        UpdateScrolls(ListSW, True);

      WM_PARENTNOTIFY:
        if Message.WParam and $FFFF in [WM_CREATE, WM_DESTROY] then
          RefreshScrolls(FCommonData, ListSW);

      CM_CONTROLLISTCHANGE, CM_CONTROLCHANGE:
        if not SkinData.Updating then
          UpdateScrolls(ListSW, True);

      CM_INVALIDATE:
        UpdateScrolls(ListSW, True);

      WM_MOUSEWHEEL:
        if AutoMouseWheel and (DataLink <> nil) and (DataLink.DataSet <> nil) then
          if TCMMouseWheel(Message).WheelDelta < 0 then
            GetDataLink.DataSet.Next
          else
            GetDataLink.DataSet.Prior;
    end;
  end;
end;


function TsDBCtrlGrid.GetDataLink: TDataLink;
begin
  Result := TDBCtrlGrid_(Self).FDataLink;
end;


procedure TsDBCtrlGrid.CreatePanelBitmap;
var
  DC: HDC;
begin
  if FBitmapCount = 0 then begin
    DC := GetDC(0);
    FPanelBitmap := CreateCompatibleBitmap(DC, Panel.Width, Panel.Height);
    ReleaseDC(0, DC);
    FPanelDC := CreateCompatibleDC(0);
    FSaveBitmap := SelectObject(FPanelDC, FPanelBitmap);
  end;
  Inc(FBitmapCount);
end;


procedure TsDBCtrlGrid.DestroyPanelBitmap;
begin
  Dec(FBitmapCount);
  if FBitmapCount = 0 then begin
    SelectObject(FPanelDC, FSaveBitmap);
    DeleteDC(FPanelDC);
    DeleteObject(FPanelBitmap);
  end;
end;


procedure TsDBCtrlGrid.AfterConstruction;
begin
  inherited AfterConstruction;
  FCommonData.Loaded;
  if HandleAllocated then
    RefreshScrolls(FCommonData, ListSW);
end;


procedure TsDBCtrlGrid.SetPanelSkin(const Value: TsSkinSection);
begin
  if FPanelSkin <> Value then begin
    FPanelSkin := Value;
    TsDBCtrlPanel(TDBCtrlGrid_(Self).FPanel).FCommonData.SkinSection := Value;
    FCommonData.BGChanged := True;
    RedrawWindow(Handle, nil, 0, RDWA_ALLNOW);
  end;
end;


function acGetDBFieldCheckState(AObj: TObject): TCheckBoxState;
begin
  if AObj is TFieldDataLink then begin
    with TFieldDataLink(AObj) do begin
      Result := cbGrayed;
      if not Field.IsNull then
        if Field.DataType = ftBoolean then
          Result := CheckBoxStates[integer(Field.AsBoolean)]
        else
          Result := cbGrayed
    end;
  end
  else
    Result := cbGrayed;
end;


initialization
  GetDBFieldCheckState := acGetDBFieldCheckState;

end.
