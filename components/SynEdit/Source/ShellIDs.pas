unit ShellIDs;

{ define UseAsm}

interface

uses ActiveX, ShlObj;

// Returns the size of the first item in the item ID list.
function ItemIDSize(IDL: PItemIDList): Cardinal; register;

// Returns the size of the entire item ID list, including trailing zeroes.
function ItemIDListSize(IDL: PItemIDList): Cardinal; register;

// Gets the next item of a given item ID.
function NextItemID(IDL: PItemIDList): PItemIDList; register;

// Copies a single item to a new item ID list.
// The item ID list must be freed with FreeItemID.
function CopyItemID(IDL: PItemIDList): PItemIDList;

// Frees an item ID list created by CopyItemID.
procedure FreeItemID(IDL: PItemIDList);

// Converts a TStrRet display name to a string
function StrRetToString(IDL: PItemIDList; const StrRet: TStrRet): string;

// Frees any kind of pointer owned by the shell.
procedure ShellFree(P: Pointer);

// Concatenates one item ID to an item ID list.
function ConcatIDList(IDL, ID: PItemIDList): PItemIDList;

// Compares two item IDs on equality
function EqualItems(I1, I2: PItemIDList): Boolean;

// Tries to find SubIDL in IDL. If so, returns pointer in IDl beyond SubIDL.
function ContainsItems(SubIDL: PItemIDList; var IDL: PItemIDList): Boolean;

var
  Malloc: IMalloc;

implementation

{$ifdef UseAsm}

function ItemIDSize(IDL: PItemIDList): Cardinal; register;
asm
        OR      EAX,EAX
        JE      @@1
        MOVZX   EAX,WORD PTR [EAX]
@@1:
end;

function ItemIDListSize(IDL: PItemIDList): Cardinal; register;
asm
        OR      EAX,EAX
        JE      @@3
        MOV     ECX,EAX
        JMP     @@2
@@1:
        ADD     EAX,EDX
@@2:
        MOVZX   EDX,WORD PTR [EAX]
        OR      EDX,EDX
        JNE     @@1
        SUB     EAX,ECX
        ADD     EAX,2
@@3:
end;

function NextItemID(IDL: PItemIDList): PItemIDList; register;
asm
        OR      EAX,EAX
        JZ      @@1
        MOV     EDX,EAX
        MOVZX   EAX,WORD PTR [EAX]
        OR      EAX,EAX
        JZ      @@1
        ADD     EAX,EDX
@@1:
end;

{$else}

function ItemIDSize(IDL: PItemIDList): Cardinal;
begin
  if IDL = nil then
    Result := 0
  else
    Result := IDL.mkid.cb;
end;

function ItemIDListSize(IDL: PItemIDList): Cardinal;
begin
  Result := 0;
  if IDL = nil then
    Exit;
  Result := SizeOf(Word); // For the trailing zeroes.
  repeat
    Inc(Result, IDL.mkid.cb);
    IDL := NextItemID(IDL);
  until IDL = nil;
end;

function NextItemID(IDL: PItemIDList): PItemIDList;
var
  Size: Word;
begin
  Result := nil;
  if IDL = nil then
    Exit;
  Size := IDL.mkid.cb;
  if Size = 0 then
    Exit;
  Result := PItemIDList(PChar(IDL) + Size);
end;

{$endif}

procedure FreeItemID(IDL: PItemIDList);
begin
  CoTaskMemFree(IDL);
end;

function CopyItemID(IDL: PItemIDList): PItemIDList;
var
  Size: Word;
begin
  Result := nil;
  if IDL = nil then Exit;
  Size := IDL.mkid.cb;
  if Size <> 0 then
  begin
    Result := Malloc.Alloc(Size + SizeOf(Word));
    Move(IDL^, Result^, Size);
    PItemIDList(PChar(Result) + Size).mkid.cb := 0;
  end
  else
    Result := nil;
end;

function StrRetToString(IDL: PItemIDList; const StrRet: TStrRet): string;
begin
  with StrRet do
    case uType of
      STRRET_WSTR:
        Result := WideCharToString(pOleStr);
      STRRET_OFFSET:
        Result := PChar(IDL) + uOffset;
      STRRET_CSTR:
        Result := string(cStr);
    end;
end;

procedure ShellFree(P: Pointer);
begin
  Malloc.Free(P);
end;

function ConcatIDList(IDL, ID: PItemIDList): PItemIDList;
var
  ListSize, ItemSize: Word;
begin
  ListSize := ItemIDListSize(IDL) - SizeOf(Word);
  ItemSize := ItemIDListSize(ID);
  Result := CoTaskMemAlloc(ListSize + ItemSize);
  Move(IDL^, Result^, ListSize);
  Move(ID^, (PChar(Result) + ListSize)^, ItemSize);
end;

function EqualItems(I1, I2: PItemIDList): Boolean;
var
  I: Word;
begin
  Result := False;
  if (I1 = nil) or (I2 = nil) or (I1.mkid.cb <> I2.mkid.cb) then
    Exit;
  if I1 = I2 then
  begin
    Result := True;
    Exit;
  end;
  for I := 0 to ItemIDSize(I1) - SizeOf(Word) - 1 do
{$R-}
    if I1.mkid.abID[I] <> I2.mkid.abID[I] then
      Exit;
{$R+}
  Result := True;
end;

function ContainsItems(SubIDL: PItemIDList; var IDL: PItemIDList): Boolean;
begin
  if SubIDL = nil then // Desktop IDL is nil.
    Result := True
  else if IDL = nil then
    Result := False
  else
  begin
    while (SubIDL <> nil) and EqualItems(SubIDL, IDL) do
    begin
      IDL := NextItemID(IDL);
      SubIDL := NextItemID(SubIDL);
    end;
    Result := SubIDL = nil;
  end;
end;

initialization
  SHGetMalloc(Malloc);

end.
