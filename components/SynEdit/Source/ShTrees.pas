{
  File:       ShTrees.pas
  Function:   Descendant of the TCustomTreeView component.
              This is a treeview copying the behaviour of the left pane of
              the Explorer, where you can see all folders in the Shell's
              namespace.
  Language:   Delphi 5 (Object Pascal)
  Author:     Rudolph Velthuis
  Copyright:  (c) 1996-2000 drs. Rudolph Velthuis
  Disclaimer: This code is freeware. All rights are reserved.
              This code is provided as is, expressly without a warranty of any kind.
              You use it at your own risk.
              If you use this code, please credit me.
}

{$include Version.inc}

{$ifndef verCompiler2up}
//'This file will only compile for Win32.'
{$endif}

{ $define Debug}
{$A+,B-,C-,E-,F-,G+,H+,I-,J+,K-,M-,N+,O+,P-,Q-,R-,S-,T-,U-,V-,W-,X+,Z1}
{$ifdef Debug} {$D+,L+,Y+} {$else} {$D-,L-,Y-} {$endif}

unit ShTrees;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CommCtrl, ComCtrls, ActiveX, ShellAPI, ShlObj, ShellIDs, StdCtrls;

type
  TFolderAttribute = (
    faCanCopy, faCanDelete, faCanLink, faCanMove, faCanRename, faDropTarget,
    faHasPropSheet, faGhosted, faLink, faReadOnly, faShare, faHasSubFolder,
    faFileSystem, faFileSysAncestor, faFolder, faRemovable, faValidate);
  TFolderAttributes = set of TFolderAttribute;

  TveltShellTreeView = class(TCustomTreeView)
  private
    FImageList: HImageList;
//    FDirectory: string;
    FDirLabel: TLabel;
    FDesktopIDL: PItemIDList;
    FCurrentIDL: PItemIDList;
    FDesktopFolder: IShellFolder;
    FSaveBits: TBits;
    // function GetRoot: string;
    // procedure SetRoot(Value: string);
    function GetAttributes: TFolderAttributes;
    procedure SaveBits;
    procedure SetAttributes(Value: TFolderAttributes);
    function GetDirectory: string;
    procedure SetDirectory(Value: string);
    procedure SetDirLabel(Value: TLabel);
    procedure SetItemIDList(Value: PItemIDList);
    procedure UpdateDirectory;
    procedure SetCurrentIDL(Value: PItemIDList);
  protected
    function CanExpand(Node: TTreeNode): Boolean; override;
    procedure Change(Node: TTreeNode); override;
    procedure CreateHandle; override;
    procedure DestroyWnd; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
                X, Y: Integer); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
    function ShowContextMenu(Node: TTreeNode;
               const Where: TPoint): Boolean; virtual;
    procedure CMSysColorChange(var Msg: TMessage); message CM_SYSCOLORCHANGE;
    function EnumerateFolder(Node: TTreeNode; Folder: IShellFolder;
      const FindName: PItemIDList; ParentIDL: PItemIDList): TTreeNode; virtual;
    procedure BuildTree; virtual;
    function CreateFullIDList(Node: TTreeNode): PItemIDList; virtual;
    function IDLFromPath(Path: string): PItemIDList;
{$ifdef verCompiler4Up}
    function FindSubNode(Node: TTreeNode; FindName: string): TTreeNode;
      overload;
{$endif}
    function FindSubNode(Node: TTreeNode; FindIDL: PItemIDList): TTreeNode;
{$ifdef verCompiler4Up}
      overload;
{$endif}
    procedure SetupFolders; virtual;
    property ShowButtons stored False;
    property ShowLines stored False;
    property ShowRoot stored False;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Items stored False;
    property ItemIDList: PItemIDList read FCurrentIDL write SetItemIDList;
  published
    property Align;
    property BorderStyle;
    property Color;
    property Ctl3D;
    property Directory: string read GetDirectory write SetDirectory;
    property DirLabel: TLabel read FDirLabel write SetDirLabel;
    property Enabled;
    property FolderAttributes: TFolderAttributes read GetAttributes
             write SetAttributes stored False;
    property Font;
    property HideSelection;
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnCollapsed;
    property OnCollapsing;
    property OnDblClick;
    property OnDeletion;
    property OnDragDrop;
    property OnDragOver;
    property OnEdited;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnExpanded;
    property OnExpanding;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
  {$ifdef verCompiler4up}
    property Action;
    property Anchors;
    property BiDiMode;
    property Constraints;
  {$endif}
  end;

procedure Register;

implementation

resourcestring
  SCouldntFindFolder = 'Couldn''t find folder';

const
  // Flags for SHGetFileInfo.
  // Normal: Index for system imagelist; Returns handle to system imagelist for
  //         small icons.
  SHImgFlags = SHGFI_PIDL or SHGFI_SMALLICON or SHGFI_SYSICONINDEX;
  // Same as above, but for the icon of a selected folder
  SHSelFlags = SHImgFlags or SHGFI_OPENICON;

{ ... TveltShellTreeView ... }

destructor TveltShellTreeView.Destroy;
var
  I: Integer;
begin
  // Free FSaveBits used for HasChildren properties.
  if FSaveBits <> nil then
    FSaveBits.Free;

  // Free memory for all saved ItemIDs.
  with Items do
    for I := Count - 1 downto 1 do
      if Item[I].Data <> nil then
      begin
        ShellFree(Item[I].Data);
        Item[I].Data := nil;
        Delete(Item[I]);
      end;

  // Free memory for DesktopIDL. Since DesktopIDL is in Shell memory
  // it must be freed using ShellFree.
  if FDesktopIDL <> nil then
  begin
    ShellFree(FDesktopIDL);
    FDesktopIDL := nil;
  end;

  inherited Destroy;
end;

// Reads subfolders, where necessary.
function TveltShellTreeView.CanExpand(Node: TTreeNode): Boolean;
var
  Subfolder: IShellFolder;
  HasChildren: Boolean;
  CurrentIDL: PItemIDList;
begin
  // Inherited routine calls OnExpanding.
  Result := inherited CanExpand(Node);

  // If we don't do this, every item added will call this one
  // again --> recursion.
  if csDesigning in ComponentState then
    Exit;

  HasChildren := Node.HasChildren;
  // Try to expand, if we're allowed to.
  if Result then
  begin

    // Read subfolders, if node wasn't expanded.
    if Node.Count = 0 then
    begin

      // Assembler ID list of full path.
      CurrentIDL := CreateFullIDList(Node);

      // Bind to the folder belonging to node.
      if Succeeded(FDesktopFolder.BindToObject(CurrentIDL, nil, IID_IShellFolder,
          Pointer(Subfolder))) then
        // Add child folder.
        EnumerateFolder(Node, Subfolder, nil, CurrentIDL);
    end;
  end;
  Node.HasChildren := HasChildren;
end;

// React to selection change.
procedure TveltShellTreeView.Change(Node: TTreeNode);
var
  FileInfo: TSHFileInfo;
//  FullIDL: PItemIDList;
begin
  SetCurrentIDL(CreateFullIDList(Node));

  // Get icon for selected folder in system imagelist.
  SHGetFileInfo(PChar(FCurrentIDL), 0, FileInfo, SizeOf(FileInfo),
    SHSelFlags);
  Node.SelectedIndex := FileInfo.iIcon;

  // set Directory property and DirLabel.
  if Assigned(FDirLabel) then
    FDirLabel.Caption := GetDirectory;

  // Call OnChange now.
  inherited Change(Node);
end;

procedure TveltShellTreeView.CreateHandle;
begin
  inherited CreateHandle;

  SetupFolders;

  if (not (csLoading in ComponentState)) and
     (csDesigning in ComponentState) then
  // Only in the Designer.
  begin
    BuildTree;
  end;
end;

// Keep all HasChildren bits of all Nodes.
procedure TveltShellTreeView.DestroyWnd;
begin
  SaveBits;
  inherited DestroyWnd;
end;

procedure TveltShellTreeView.Loaded;
begin
  inherited Loaded;

  if not Assigned(FDesktopFolder) then
    SetupFolders;

  // Only call here, if we're not in the Designer.
  BuildTree;
end;

procedure TveltShellTreeView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  // Takes care that a deleted DirLabel is not updated anymore.
  if (AComponent = DirLabel) and (Operation = opRemove) then
    DirLabel := nil;
end;

// Saves all HasChildren properties of all Nodes in a bit field.
procedure TveltShellTreeView.SaveBits;
var
  I: Integer;
begin
  FSaveBits := TBits.Create;
  FSaveBits.Size := Items.Count;

  // I know this can be slow - perhaps there is a better way, using
  // recursion into the tree.
  for I := 0 to Items.Count - 1 do
    FSaveBits[I] := Items[I].HasChildren;
end;

procedure TveltShellTreeView.SetAttributes;
begin
end;

// Sorts nodes using IShellFolder.CompareIDs.
function SortCompareID(Node1, Node2: TTreeNode;
  Folder: Longint): Integer; stdcall;
begin
  Result := SmallInt(IShellFolder(Folder).CompareIDs(0,
              PItemIDList(Node1.Data), PItemIDList(Node2.Data)));
end;

// Expands all nodes up to the new directory (folder).
procedure TveltShellTreeView.SetDirectory(Value: string);
var
  IDL: PItemIDList;
begin
  if Value <> GetDirectory then
  begin
//    SetDirectory(Value);
    if Value <> '' then
      IDL := IDLFromPath(Value)
    else
      IDL := IDLFromPath('C:\');
    if IDL <> nil then
      SetCurrentIDL(IDL);

    if not (csLoading in ComponentState) then
    begin

      // In the Designer, the list will be collapsed, so a frequent change
      // of the Directory property doesn't obfuscate the treeview, since one
      // can't manually collapse nodes in design mode.
      if csDesigning in ComponentState then
        FullCollapse;

      // Expand up to new directory.
       BuildTree;
    end;
  end;
end;

// If a DirLabel is set, its Caption will be set in return.
procedure TveltShellTreeView.SetDirLabel(Value: TLabel);
begin
  FDirLabel := Value;
  if Value <> nil then
    Value.Caption := GetDirectory;
end;

{$ifdef verCompiler4Up}
// Find subnode of Node that has text FindName, returns nil if not found.
function TveltShellTreeView.FindSubNode(Node: TTreeNode; FindName: string): TTreeNode;
var
  I: Integer;
begin
  Result := nil;
  if (Node.Count > 0) and (FindName <> '') then
  begin
    for I := 0 to Node.Count - 1 do
      if Node.Item[I].Text = FindName then
      begin
        Result := Node.Item[I];
        Exit;
      end;
  end;
end;
{$endif}

// Find subnode of Node that contains FindIDL
function TveltShellTreeView.FindSubNode(Node: TTreeNode; FindIDL: PItemIDList): TTreeNode;
var
  I: Integer;
  IDL: PItemIDList;
  Folder: IShellFolder;
begin
  Result := nil;
  IDL := CreateFullIDList(Node);
  if IDL <> nil then
  try
    if Succeeded(FDesktopFolder.BindToObject(IDL, nil, IShellFolder, Pointer(Folder))) then
      if (Node.Count > 0) and (FindIDL <> nil) then
      begin
        for I := 0 to Node.Count - 1 do
          if Succeeded(Folder.CompareIDs(0, PItemIDList(Node.Item[I].Data), FindIDL)) then
          begin
            Result := Node.Item[I];
            Exit;
          end;
      end;
  finally
    ShellFree(IDL);
  end;
end;

// Enumerate all subfolders of a node. Returns the node that contains FindName
// if it exists.
function TveltShellTreeView.EnumerateFolder(Node: TTreeNode; Folder: IShellFolder;
  const FindName: PItemIDList; ParentIDL: PItemIDList): TTreeNode;
var
  EnumIDList: IEnumIDList;      // zählt ItemIDs auf
  SubIDL: PItemIDList;          // Unterordner
  Count: ULONG;                 // Anzahl der Items; Schleifenzähler
  I: Integer;
  FileInfo: TSHFileInfo;        // Struktur für SHGetFileInfo
  CurrentNode: TTreeNode;
  FullIDL: PItemIDList;         // ID-Liste des ganzen Pfades
begin
  Result := nil;

  // If the node already has children, it was done already, so we only try to
  // find the desired subfolder.
  if (Node.Count > 0) and (FindName <> nil) then
  begin
    for I := 0 to Node.Count - 1 do
      if SmallInt(Folder.CompareIDs(0,
           PItemIDList(Node.Item[I].Data), FindName)) = 0 then
      begin
        Result := Node.Item[I];
        Exit;
      end;
    Exit;
  end;

  if ParentIDL = nil then
    ParentIDL := CreateFullIDList(Node);

  // Get interface for the enumator of the subfolder.
  if Succeeded(Folder.EnumObjects(Parent.Handle,
              SHCONTF_FOLDERS or SHCONTF_INCLUDEHIDDEN, EnumIDList)) then
  begin
    repeat

      // Trying to enumerate more than one object at once doesn't seem
      // to be possible for folders.
      if EnumIDList.Next(1, SubIDL, Count) <> NOERROR then Break;

      FullIDL := ConcatIDList(ParentIDL, SubIDL);
      try

        // Get display name, icon index in system image list and attributes.
        SHGetFileInfo(PChar(FullIDL), 0, FileInfo, SizeOf(FileInfo),
          SHImgFlags or SHGFI_DISPLAYNAME or SHGFI_ATTRIBUTES);

        // Create a new node, storing the SubIDL in Data.
        CurrentNode := Items.AddChildObject(Node, FileInfo.szDisplayName, SubIDL);

        // Is there a subfolder to check for?
        if (FindName <> nil) and
           (Folder.CompareIDs(0, SubIDL, FindName) and $FFFF = 0) then
          Result := CurrentNode;

        // If appropriate, display a [+] box. Nodes without a [+] can't be
        // epxanded.
        CurrentNode.HasChildren :=
          (FileInfo.dwAttributes and SFGAO_HASSUBFOLDER) <> 0;

        // Normal (unselected) icon index
        CurrentNode.ImageIndex := FileInfo.iIcon;

      finally
        ShellFree(FullIDL);
      end;
    until Count = 0;

    // Sort the subfolders to Shell criteria. The folder is passed as a
    // parameter to SortCompareID.
    Node.CustomSort(@SortCompareID, Longint(Folder));
  end;
  if Node.Count = 0 then
    Node.HasChildren := False;
end;

// Create the tree up to the desired folder.
procedure TveltShellTreeView.BuildTree;
var
  Folder, Subfolder: IShellFolder;
  FullIDL, SourceIDL, TargetIDL, SubIDL, IDLBuffer: PItemIDList;
  FullSize: Cardinal;
  Node: TTreeNode;
  OldCursor: HCursor;
{$ifdef debug}
  SFI: TSHFileInfo; //$$debug
{$endif}
begin
  // Show the wait cursor during the build.
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try

    // Sort is prohibited, otherwise a little more complex tree
    // can take minutes.
    SortType := stNone;
    Folder := nil;

    // Now walk through the single folders in the path.

    // Start from Desktop folder (until now --> will be changed)
    Node := Items.GetFirstNode;
    Folder := FDesktopFolder;

    if FCurrentIDL = nil then
    begin
      SHGetSpecialFolderLocation(Handle, CSIDL_DRIVES, FullIDL);
      SetCurrentIDL(FullIDL);
    end;

{$ifdef debug}
    SHGetFileInfo(PChar(FCurrentIDL), 0, SFI, SizeOf(SFI),
      SHGFI_DISPLAYNAME or SHGFI_PIDL);
    ShowMessage(SFI.szDisplayName);
{$endif}

    if FCurrentIDL <> nil then
    begin

      // Memory for ParentIDL parameter of EnumerateFolder
      FullSize := ItemIDListSize(FCurrentIDL) + 4;
      IDLBuffer := CoTaskMemAlloc(FullSize);
      FullIDL := CoTaskMemAlloc(FullSize);
      Move(FCurrentIDL^, FullIDL^, FullSize);
      try
        TargetIDL := IDLBuffer; // Pointer in IDLBuffer
        SourceIDL := FullIDL;   // Pointer in FullIDL

        repeat
          // Store zero word at end.
          TargetIDL^.mkid.cb := 0;

          SubIDL := CopyItemID(SourceIDL);
          if (SubIDL = nil) or (SubIDL^.mkid.cb = 0) then Break;
          try
            // Bind to subfolder which belongs to SubIDL.
            if Succeeded(Folder.BindToObject(SubIDL, nil, IID_IShellFolder,
                 Pointer(Subfolder))) then
            begin
              // Create subtree.
              Node := EnumerateFolder(Node, Folder, SubIDL, IDLBuffer);
              Node.Expand(False);
              Node.Selected := True;
            end;
          finally
            ShellFree(SubIDL);
          end;
          Folder := Subfolder;

          // Expand IDLBuffer by one ItemID.
          Move(SourceIDL^, TargetIDL^, SourceIDL^.mkid.cb);

          // Continue with next ItemID.
          SourceIDL := NextItemID(SourceIDL);
          TargetIDL := NextItemID(TargetIDL);
        until (SourceIDL = nil) or (SourceIDL.mkid.cb = 0);
      finally
        ShellFree(FullIDL);
        ShellFree(IDLBuffer);
      end;
    end;

  // Restore original cursor.
  finally
    Screen.Cursor := OldCursor;
  end;
end;

function TveltShellTreeView.GetAttributes: TFolderAttributes;
const
  // Conversion of TFolderAttribute to attribute masks.
  AttrMask: array[TFolderAttribute] of ULONG = (
    SFGAO_CANCOPY, SFGAO_CANDELETE, SFGAO_CANLINK, SFGAO_CANMOVE,
    SFGAO_CANRENAME, SFGAO_DROPTARGET, SFGAO_HASPROPSHEET, SFGAO_GHOSTED,
    SFGAO_LINK, SFGAO_READONLY, SFGAO_SHARE, ULONG(SFGAO_HASSUBFOLDER),
    SFGAO_FILESYSTEM, SFGAO_FILESYSANCESTOR, SFGAO_FOLDER, SFGAO_REMOVABLE,
    SFGAO_VALIDATE);
var
  I: TFolderAttribute;
  IDL: PItemIDList;
  FileInfo: TSHFileInfo;
begin

  // Get full ID list of selected folder...
  IDL := CreateFullIDList(Selected);
  try

    // ... find information we need ...
    SHGetFileInfo(PChar(IDL), 0, FileInfo, SizeOf(FileInfo),
      SHGFI_PIDL or SHGFI_ATTRIBUTES);
  finally

    // ... und free ID list again.
    ShellFree(IDL);
  end;

  // Assemble bits of TFolderAttribute.
  Result := [];
  for I := Low(TFolderAttribute) to High(TFolderAttribute) do
    if FileInfo.dwAttributes and AttrMask[I] <> 0 then
      Include(Result, I);
end;

// Assembles an ItemIDList from the Single ItemIDs of the folder and its
// superfolders.
function TveltShellTreeView.CreateFullIDList(Node: TTreeNode): PItemIDList;
var
  Buffer: PItemIDList;
  BufPtr: PChar;
  Size: Word;
  CurNode: TTreeNode;

  // It's possbile not to use recursion, but it would complicate the
  // routine and not necessarily make it faster.
  procedure InsertParentIDs(CurNode: TTreeNode);
  begin
    if CurNode.Parent <> nil then
    begin
      // First process Parent folder.
      InsertParentIDs(CurNode.Parent);

      // Add current ItemID at the end.
      Move(CurNode.Data^, BufPtr^, PItemIDList(CurNode.Data)^.mkid.cb);

      // And update pointer to end of buffer.
      Inc(BufPtr, PItemIDList(CurNode.Data)^.mkid.cb);
    end;
  end;

begin
  // Make room for terminating zero word.
  Size := SizeOf(Word);

  // Add the Single sizes of the ItemIDs.
  CurNode := Node;
  while CurNode <> nil do
  begin
    Inc(Size, ItemIDListSize(CurNode.Data) - SizeOf(Word));

    // Continue with parent folder
    CurNode := CurNode.Parent;
  end;

  // Allocate buffer.
  Buffer := CoTaskMemAlloc(Size);
  BufPtr := PChar(Buffer);

  // Insert parent folders recursively.
  InsertParentIDs(Node);

  // Add terminating zero word.
  PItemIDList(BufPtr)^.mkid.cb := 0;

  Result := Buffer;
end;

procedure TveltShellTreeView.SetupFolders;
var
  FileInfo: TSHFileInfo;
  DataIDL: PItemIDList;
  Node: TTreeNode;
  Size, I: Integer;
begin

  // If we're still loading, we're not allowed to set properties here.
  if not (csLoading in ComponentState) then
  begin
    ShowLines := True;
    ShowRoot := True;
    ShowButtons := True;
  end;

  // If the treeview window doesn't exist, FDesktopFolder is nil.
  // Otherwise RecreateWnd was called.
  if FDesktopFolder = nil then
    if Failed(SHGetDesktopFolder(FDesktopFolder)) then
      FDesktopFolder := nil;

  // Get Desktop folder.
  if FDesktopIDL = nil then
    if Failed(SHGetSpecialFolderLocation(0, CSIDL_DESKTOP, FDesktopIDL)) then
      raise Exception.Create(SCouldntFindFolder);

  SetCurrentIDL(CopyItemID(FDesktopIDL));

  // Read Displayname, Attribute und Icon.
  // FImageList is the system imagelist. Of course it shouldn't be changed
  // That's why it isn't kept as a property, but set indirectly with a Windows
  // message, so it can't be changed inadvertantly in the Object Inspector.
  FImageList := SHGetFileInfo(PChar(FDesktopIDL), 0, FileInfo,
    SizeOF(FileInfo), SHImgFlags or SHGFI_DISPLAYNAME or SHGFI_ATTRIBUTES);
  TreeView_SetImageList(Handle, FImageList, TVSIL_NORMAL);

  // If we already read folders, the call was caused by a RecreateWnd.
  if Items.Count <> 0 then
  begin

    // If FSaveBits exists, we have saved all HasChildren properties,
    // so they must be restored.
    if FSaveBits <> nil then
    begin
      for I := 0 to Items.Count - 1 do
        Items[I].HasChildren := FSaveBits[I];

      // It might be advantageous to change this to a recursive
      // routine that doesn't use Items[Index].

    {$ifdef verCompiler5up}
      FreeAndNil(FSaveBits);
    {$else}
      FSaveBits.Free;
      FSaveBits := nil;
    {$endif}
    end;

    // Expand up to the desired folder.
    BuildTree;

    // and Exit
    Exit;
  end;

  Items.Clear;
  begin
    // Copy Root-IDL to Root node. Since the Root node can have more
    // than one ItemID, it's not enough to call CopyItemID.
    Size := ItemIDListSize(FDesktopIDL);
    DataIDL := CoTaskMemAlloc(Size);
    Move(FDesktopIDL^, DataIDL^, Size);

    // Add Root node.
    Node := Items.AddObject(nil, FileInfo.szDisplayName, DataIDL);

    // Set indexes for the icons.
    Node.ImageIndex := FileInfo.iIcon;
    Node.HasChildren := FileInfo.dwAttributes and SFGAO_HASSUBFOLDER <> 0;
    SHGetFileInfo(PChar(FDesktopIDL), 0, FileInfo, SizeOf(FileInfo),
      SHSelFlags);
    Node.SelectedIndex := FileInfo.iIcon;

    // Draw the [+] box in front of the root folder if necessary.
    if (FileInfo.dwAttributes and SFGAO_HASSUBFOLDER) <> 0 then
      Node.HasChildren := True;
  end;

end;

// Must be done, otherwise some parts will not be redrawn.
procedure TveltShellTreeView.CMSysColorChange;
begin
  inherited;
  RecreateWnd;
end;

function TveltShellTreeView.ShowContextMenu(Node: TTreeNode;
           const Where: TPoint): Boolean;
var
  ContextMenu: IContextMenu;
  Popup: HMenu;
  CommandInfo: TCMInvokeCommandInfo;
  CmdID: Integer;
  IDL, SubIDL: PItemIDList;
  Folder: IShellFolder;
begin
  Result := False;

  // We obtain the context menu from the parent folder
  if Node.Parent = nil then Exit;

  // Get full IDlist of parent
  IDL := CreateFullIDList(Node.Parent);

  try
    // Folder is obtained by either binding to the full IDlist or the desktop
    if (Node.Parent.Parent <> nil) then
      FDesktopFolder.BindToObject(IDL, nil, IID_IShellFolder, Pointer(Folder))
    else
      Folder := FDesktopFolder;
    SubIDL := PItemIDList(Node.Data);

    // If we still failed, use the desktop
    if SubIDL = nil then
      SHGetSpecialFolderLocation(0, CSIDL_DESKTOP, SubIDL);

    // Obtain the context menu interface
    if Succeeded(Folder.GetUIObjectOf(0, 1, SubIDL, IID_IContextMenu,
         nil, Pointer(ContextMenu))) then
    begin
      // make a popup...
      Popup := CreatePopupMenu;
      try
        // have the interface fill it...
        if Succeeded(ContextMenu.QueryContextMenu(Popup, 0, 1, $7FFF,
             CMF_NORMAL)) then
        begin
          // and use it.
          CmdID := Integer(TrackPopupMenu(Popup,
                     TPM_LEFTALIGN or TPM_RETURNCMD or TPM_RIGHTBUTTON,
                     Where.X, Where.Y, 0, Handle, nil));

          // In case an item was pressed, call it.
          if CmdID <> 0 then
          begin
            with CommandInfo do
            begin
              cbSize := SizeOf(CommandInfo);
              fMask := 0;
              hwnd := 0;
              lpVerb := MakeIntResource(CmdID - 1);
              lpParameters := nil;
              lpDirectory := nil;
              nShow := SW_SHOWNORMAL;
              dwHotKey := 0;
              hIcon := 0;
            end;
            Result := Succeeded(ContextMenu.InvokeCommand(CommandInfo));
          end;
        end;
      finally
        DestroyMenu(Popup);
      end;
    end;
  finally
    ShellFree(IDL);
  end;
end;

// Copied from SystemTreeView by Brad Towers.
procedure TveltShellTreeView.MouseDown(Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if ssRight in Shift then
  begin
    Selected := GetNodeAt(X, Y);
    if Selected <> nil then
      ShowContextMenu(Selected, ClientToScreen(Point(X, Y)));
  end;
end;

procedure TveltShellTreeView.SetItemIDList(Value: PItemIDList);
begin
  SetCurrentIDL(Value);
  BuildTree;
end;

procedure TveltShellTreeView.SetCurrentIDL(Value: PItemIDList);
begin
  if Value <> FCurrentIDL then
  begin
    ShellFree(FCurrentIDL);
    FCurrentIDL := Value;
    UpdateDirectory;
  end;
end;

// Updates the directory.

//$$ Why not just have a GetDirectory, that decodes the directory on the fly.
//   No need to worry about updating all the time then.
procedure TveltShellTreeView.UpdateDirectory;
begin
end;

// converts a path to a PItemIDList
function TveltShellTreeView.IDLFromPath(Path: string): PItemIDList;
var
  WideBuffer: array[0..MAX_PATH] of WideChar;
  Eaten, Attr: ULONG;
begin
  Result := nil;
  if not Assigned(FDesktopFolder) then
    Exit;
  StringToWideChar(Path, WideBuffer, MAX_PATH);
  if Failed(FDesktopFolder.ParseDisplayName(Parent.Handle, nil, WideBuffer, Eaten,
       Result, Attr)) then
    Result := nil;
end;

procedure Register;
begin
  RegisterComponents('Win32', [TveltShellTreeView]);
end;

constructor TveltShellTreeView.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csDesignInteractive];
end;

function TveltShellTreeView.GetDirectory: string;
begin
  SetLength(Result, MAX_PATH);
  if SHGetPathFromIDList(FCurrentIDL, PChar(Result)) then
    Result := PChar(Result)
  else
    Result := '*';
end;

end.
