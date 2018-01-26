unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls;

type
  TMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuFile: TMenuItem;
    OpenProject: TMenuItem;
    CloseApp: TMenuItem;
    MenuAbout: TMenuItem;
    OpenFile: TOpenDialog;
    SaveFile: TSaveDialog;
    SaveProject: TMenuItem;
    Editor: TRichEdit;
    Tree: TMemo;
    TreeView1: TTreeView;
    Timer1: TTimer;
    procedure EditorChange(Sender: TObject);
    procedure SaveProjectClick(Sender: TObject);
   // procedure FormCreate(Sender: TObject);
    procedure CloseAppClick(Sender: TObject);
    procedure OpenProjectClick(Sender: TObject);
//    procedure Podsvet();
  private
  MyArray : array of string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  FName: string;
//  k0: integer = 0;
//  k1: integer;
delim:string = ' ,(){}[]-+*%/="''~!&|<>?:;.'+#$D+#$A;

Reswords : array[0..2] of string = ('div', 'span', 'nav');

implementation

{$R *.dfm}
  {
procedure TMain.Podsvet();
var
i:integer;
longcomm:boolean;
ls:integer;
insidestr1:boolean;
is1:integer;
insidestr2:boolean;
is2:integer;
htmlcomm:boolean;
ema,hs:integer;
s:string;
cwork,work:string;
wl,ss,sl:integer;
n:integer;
nd:boolean;
ri:TRichEdit;
ms: TMemoryStream;
tsih:tagSCROLLINFO;
tsiv:tagSCROLLINFO;
st,en:integer;
begin
//���������� ��� ���� �������� �� �����
ss:=Editor.SelStart;
sl:=Editor.SelLength;
//������, ����� ���� ����������, �� ��������� �� ���������, ���� �� �������� � ������������ ����������������� ����� � �.�.
longcomm:=false;
insidestr1:=false;
insidestr2:=false;
htmlcomm:=false;
//���������� ��� win98 ����� ���� ������ ������� �����
en:=SendMessage(Editor.Handle,EM_GETFIRSTVISIBLELINE,0,0);
//�������� ���������� �����������
Editor.DoubleBuffered:=true;
SendMessage(Editor.Handle,WM_SETREDRAW,0,0);
ema:=SendMessage(Editor.Handle,WM_USER+69,0,0);
//������� TRichEdit � ������
ri:=Editor.CreateParented(TMain.Handle);
//�������� �� ������ �������� TRichEdit ��� ���������� � ��������� TRichEdit
ms := TMemoryStream.Create;
Editor.PlainText:=true;
ri.PlainText:=true;
try
Editor.Lines.SaveToStream(ms) ;
ms.Seek(0, soFromBeginning) ;
ri.Lines.LoadFromStream(ms) ;
finally
ms.Free;
end;
//������� ��� ��������� tagScrollInfo ��� ���������� ��������� ����� ��������� RichEdit
FillChar(tsiv,sizeof(tsiv),0);
tsiv.cbSize := SizeOf(tsiv);
tsiv.fMask := SIF_POS;

FillChar(tsih,sizeof(tsih),0);
tsih.cbSize := SizeOf(tsih);
tsih.fMask := SIF_POS;
//���������� � ��� ��������� ����� ���������
GetScrollInfo(Editor.Handle,SB_VERT,tsiv);
GetScrollInfo(Editor.Handle,SB_HORZ,tsih);

//�������� �������� ��������� � ��������� TRichEdit
try
//������ ��� ���������� ���������
ri.SelStart:=0;
ri.SelLength:=length(ri.Text);
ri.SelAttributes:=Editor.DefAttributes;
ri.SelAttributes.Color:=clBlack;
ri.SelAttributes.Style:=[];

i:=0;
//���� ����� ��������� � ���������� work, �������� � ����� ������ �����������, ���� ������ ����������������� ����� � � ����� ������ ����
work:=ri.Text+#$D#$A;
wl:=length(work);
while (i<=wl) do
begin
i:=i+1;
//����� �� ������

//����� ��������� ������� � �� ����� ����� ��� ���� (������ insidestr1 ����������) - ������ �� ������ ������� �� ��������� ��� � ����������
if insidestr1 and (work='''') then
begin
ri.SelStart:=is1;
ri.SelLength:=i-is1;
ri.SelAttributes.Color:=clPurple;
insidestr1:=false;
continue;
end;

//����� ������� ������� � �� ����� ����� ��� ���� (������ insidestr2 ����������) - ������ �� ������ ������� �� ��������� ��� � �����
if insidestr2 and (work='"') then
begin
ri.SelStart:=is2;
ri.SelLength:=i-is2;
ri.SelAttributes.Color:=RGB(0,0,128);
insidestr2:=false;
continue;
end;

//���� ��� �� ��������� ������ � �� �� ��������� �������� */, � �� ����� �������� /* (������ longcomm ����������) - �� ������ ��� ��� � �������
if i<wl then
if longcomm and (work='*') and (work[i+1]='/') then
begin
ri.SelStart:=ls;
ri.SelLength:=i-ls+1;
ri.SelAttributes.Color:=clGreen;
i:=i+1;
longcomm:=false;
continue;
end;

//���� ������� ��� �������, � ��� ����������� html-������� -->, � �� ����� �������� ����������� <!-- (������ htmlcomm ����������) - �� ������ � �������
if i<wl-1 then
if htmlcomm and (work='-') and (work[i+1]='-') and (work[i+2]='>') then
begin
ri.SelStart:=hs;
ri.SelLength:=i-hs+2;
ri.SelAttributes.Color:=clGreen;
i:=i+2;
htmlcomm:=false;
continue;
end;

//���� ����� �� ������ � �� �� ������ �� ������ �� ��������� - �� ����� ������ ��������� ������� ���� ��������� � ����������������� �����
if (not htmlcomm) and (not longcomm) and (not insidestr1) and (not insidestr2) then
begin
//��������� ������� - ���������� ��� ���� � ������ ������ ������ ��������
if work='''' then
begin
insidestr1:=true;
is1:=i-1;
continue;
end;

//������� ������� - ���������� ��� ���� � ������ ������ ������ ��������
if work='"' then
begin
insidestr2:=true;
is2:=i-1;
continue;
end;

//java-������� - ���������� ��� ��� � ������ ������ ������ ��������
if i<wl then
if (work='/') and (work[i+1]='*') then
begin
longcomm:=true;
ls:=i-1;
i:=i+1;
continue;
end;

//html-������� - ���������� ��� ��� � ������ ������ ������ ��������
if i<wl-2 then
if (work='<') and (work[i+1]='!') and (work[i+2]='-') and (work[i+3]='-') then
begin
htmlcomm:=true;
hs:=i-1;
i:=i+3;
continue;
end;

//������������ java-������� - ����������� ��� ������� �� ����� ������
if i<wl then
if (work='/') and (work[i+1]='/') then
begin
ri.SelStart:=i-1;
ri.SelLength:=PosEx(#$A,work,i)-i;
ri.SelAttributes.Color:=clGreen;
i:=PosEx(#$A,work,i);
Continue;
end;

//���� ����������������� �����
//����� �� ������ ��������� �����, �� ����� ������ ������ �������� ������������������ ����� (12) ���� ��� ����, ��� ������ � ����� ������� �� delim
cwork:=copy(work,i,13);
//���� ��� ����� ������ - �� ������� � ����� ������
if length(cwork)<13 then cwork:=cwork+' ';
//������ "����� ���������" ��������� �����
nd:=false;
//���� ������ ������, ������ ������ - �� ����� �������
if i=1 then nd:=true;
//���� �� ������, �� ����� ���� �������� ���� ����������� - �� ���� �����
if (i>1) then if Pos(work[i-1],delim)>0 then nd:=true;
//����, ���� �����, ��
if nd then
//����� �� ���� ��������� ������ � �������
for n:=0 to length(Reswords)-1 do
begin
//���� ����� �����
if (Pos(Reswords[n],cwork)=1) and (length(cwork)>length(Reswords[n])) then
//� ���� �� ��� ���� �����������
if Pos(cwork[length(Reswords[n])+1],delim)>0 then
begin
//�� ������ ��� ������
ri.SelStart:=i-1;
ri.SelLength:=length(Reswords[n]);
ri.SelAttributes.Style:=[fsBold];
i:=i+length(Reswords[n]);
Continue;
end;
end;

end;
end;

//��������� ������ �� ������

//������� ���� �� ������ ��������� (������������) - ����� ������ ������ ����� �� ������ �����

i:=wl-1;
if insidestr1 then
begin
ri.SelStart:=is1;
ri.SelLength:=i-is1;
ri.SelAttributes.Color:=clPurple;
insidestr1:=false;
end;

if insidestr2 then
begin
ri.SelStart:=is2;
ri.SelLength:=i-is2;
ri.SelAttributes.Color:=RGB(0,0,128);
insidestr2:=false;
end;

if longcomm then
begin
ri.SelStart:=ls;
ri.SelLength:=i-ls;
ri.SelAttributes.Color:=clGreen;
longcomm:=false;
end;

if htmlcomm then
begin
ri.SelStart:=hs;
ri.SelLength:=i-hs;
ri.SelAttributes.Color:=clGreen;
htmlcomm:=false;
end;

except
end;

//��� ���������, �������� �������
ms := TMemoryStream.Create;
ri.PlainText:=false;
Editor.PlainText:=false;
try
ri.Lines.SaveToStream(ms) ;
ms.Seek(0, soFromBeginning) ;
Editor.Lines.LoadFromStream(ms) ;
finally
ms.Free;
end;

//��������������� ������� ��������
Editor.Perform(WM_VSCROLL,SB_THUMBPOSITION+tsiv.nPos*65536,0);
Editor.Perform(WM_HSCROLL,SB_THUMBPOSITION+tsih.nPos*65536,0);

//��� win98 � ������ ������� - �������, ���� �� ��������� ������ �� ���� �����, �� ���������� ��������� ���� ���� ����
st:=SendMessage(Editor.Handle,EM_GETFIRSTVISIBLELINE,0,0);
if st<>en then SendMessage(Editor.Handle,EM_LINESCROLL,0,en-st);

//richedit � ������ �������� ����, ������ ���
ri.Free;

//������ ������ � ��������� ���� ����
Editor.SelStart:=ss;
Editor.SelLength:=sl;

//�������� ����������� ����������� ������� � �������������� ����������
SendMessage(Editor.Handle,WM_SETREDRAW,1,0);
InvalidateRect(Editor.Handle,0,true);
SendMessage(Editor.Handle,WM_USER+69,0,ema);
Editor.DoubleBuffered:=false;
Editor.Repaint;

//��������� ���������
end;


procedure TMain.Timer1Timer(Sender: TObject);
begin
if not ((Word(GetAsyncKeyState(VK_SHIFT)) and $8000)<>0) then
begin
Timer1.Enabled:=false;
Podsvet();
end;
end;

    }
procedure TMain.CloseAppClick(Sender: TObject);
begin
 Close;
end;

  {
function CheckList(InString: string): boolean;
var X: integer;
begin
  Result := false;
  X := 0;
  InString := StringReplace(InString, ' ', '',[rfReplaceAll]);
  InString := StringReplace(InString, #$A, '',[rfReplaceAll]);
  InString := StringReplace(InString, #$D, '',[rfReplaceAll]); 
  while X &lt; BuildStops.Count do
    if AnsiLowerCase(BuildStops.Strings[X]) = AnsiLowerCase(InString) then
      begin
       Result:=true;
       X:=BuildStops.Count;
      end
    else inc(X);
end;

type
TColorer = record
  FontSize: integer;  //������ ������ ��� ���� � ����������
  CurrSize: integer;  //������ ��������� ������
  FontColor: TColor; //���� ���������
  CurrColor: TColor; //���� ��������� ������
end;
   }
procedure TMain.EditorChange(Sender: TObject);
var
  k,i: integer;
 // tags : TStringList;

{
tags := TStringList.Create;
tags.CommaText := '<div> </div> <div div>';   }
      {
  '<span> </span> <span> span>'
  '<ul>', '</ul>', '<ul', 'ul>',
  '<li>', '</li>', '<li', 'li>',
  '<li>', '</li>', '<li', 'li>',
  '<img>', '</img>', '<img', 'img>',
  '<nav>', '</nav>', '<nav', 'nav>',
  '<body>', '</body>', '<body', 'body>',
  '<html>', '</html>', '<html', 'html>',
  '<link>', '</link>', '<link', 'link>',
  '<title>', '</title>', '<title', 'title.',
  '<meta>', '</meta>', '<meta', 'meta>',
  '<head>', '</head>', '<head', 'head>',
  '<title>', '</title>', '<title', 'title>',
  '<script>', '</script>', '<script', 'script>',
  '<button>', '</button>', '<button', 'button>',
  '<input>', '</input>', '<input', 'input>',
  '<h5>', '</h5>', '<h5', 'h5>',
  '<h4>', '</h4>', '<h4', 'h4>',
  '<h3>', '</h3>', '<h3', 'h3>',
  '<h2>', '</h2>', '<h2', 'h2>',
  '<h1>', '</h1>', '<h1', 'h1>',
  '<a>', '</a>', '<a', 'a>',
  '<p>', '</p>', '<p', 'p>',
  '<h>', '</h>', '<h', 'h>',
  '<', '/', '>', '</',
  'class=', 'href=', 'src=', 'id=', 'rel=', 'type=', 'defer src=', '',
  'function';     }
const
  tags: array[1..111] of string[9] = ('<div>', '</div>', '<div', 'div>',
  '<span>', '</span>', '<span>', 'span>',
  '<ul>', '</ul>', '<ul', 'ul>',
  '<li>', '</li>', '<li', 'li>',
  '<li>', '</li>', '<li', 'li>',
  '<img>', '</img>', '<img', 'img>',
  '<nav>', '</nav>', '<nav', 'nav>',
  '<body>', '</body>', '<body', 'body>',
  '<html>', '</html>', '<html', 'html>',
  '<link>', '</link>', '<link', 'link>',
  '<title>', '</title>', '<title', 'title.',
  '<meta>', '</meta>', '<meta', 'meta>',
  '<head>', '</head>', '<head', 'head>',
  '<title>', '</title>', '<title', 'title>',
  '<script>', '</script>', '<script', 'script>',
  '<button>', '</button>', '<button', 'button>',
  '<input>', '</input>', '<input', 'input>',
  '<h5>', '</h5>', '<h5', 'h5>',
  '<h4>', '</h4>', '<h4', 'h4>',
  '<h3>', '</h3>', '<h3', 'h3>',
  '<h2>', '</h2>', '<h2', 'h2>',
  '<h1>', '</h1>', '<h1', 'h1>',
  '<a>', '</a>', '<a', 'a>',
  '<p>', '</p>', '<p', 'p>',
  '<h>', '</h>', '<h', 'h>',
  '<', '/', '>', '</',
  'class=', 'href=', 'src=', 'id=', 'rel=', 'type=', 'defer src=');
  begin

  for i :=1 to length(tags) do
    begin
      k :=-length(tags[i]);
      repeat
        k :=Editor.FindText(tags[i],k+length(tags[i]),
        length(Editor.Text)-k-length(tags[i]),[stWholeWord]);
        Editor.SelStart :=k;
        Editor.SelLength :=length(tags[i]);
         Editor.SelAttributes.Style:=[fsbold];
        Editor.SelAttributes.Color :=clBlue;
        Application.ProcessMessages;
      until k < 0;
          Editor.SelAttributes.Color :=clYellow;
               Application.ProcessMessages;
    end;
end;



{
const
  tags: array[1..18] of string[9] = ('div','span','li','ul','class','img','href',
    'body','<','</','>','case','of','type','var','const','procedure',
    'function');
var
  i: integer;
  ch: char;
  s: string;
begin
  k1:=length(Editor.Text);
  if k1 <> 0 then
    begin
      ch:=Editor.Text[k1];
      s:='';
      if (ch = #62) or  (ch = #60)
      then s:=copy(Editor.Text,k0+1,k1-k0-1);
      if ch = #10 then s:=copy(Editor.Text,k0+1,k1-k0-2);
      for i:=1 to length(tags) do
        if s = tags[i] then
          begin
            Editor.SelStart:=k0;
            Editor.SelLength:=length(s);
            Editor.SelAttributes.Color:=clblue;
            Editor.SelStart:=k1;
            Editor.Refresh;
   //         Editor.Lines.EndUpdate
          end;
      if (ch = #62)   or (ch = #10)
      or (ch = #60) or (ch= #47) then k0:=k1;
    end;
end;

}
{
procedure TMain.FormCreate(Sender: TObject);
begin
    Editor.Text := '';
    Tree.Text := '';
end;
}
procedure TMain.OpenProjectClick(Sender: TObject);
var sr: TSearchRec;
    Text: String;
    i, a: Integer;
    tags : TStringList;
begin
 if OpenFile.Execute then
 begin
  FName := OpenFile.FileName;
  Editor.Lines.LoadFromFile(FName);
 end;

begin
 Tree.Clear;
 if FindFirst('*.*', faAnyFile, sr) = 0 then
  begin
  repeat
  Tree.Lines.Add(sr.Name);
  until FindNext(sr) <> 0;
  FindClose(sr);
end;
end;
end;
{

tags := TStringList.Create;
tags.CommaText := 'div';
for i := 0 to tags.Count-1 do
begin
Text:=tags[i];
      begin
      a:=0;
      While a<=Length(Editor.Text) do
            begin
            Editor.SelStart:=Editor.FindText(Text, a, Length(Editor.Text)-a, [stMatchCase]);
            Editor.SelLength:=Length(Text);
            Editor.SelAttributes.Color:=clBlue;
     //       Editor.SelAttributes.Style:=[fsbold];
            a:=Editor.SelStart+Length(Text);
            Application.ProcessMessages;
            end;
      end
end;
}


procedure TMain.SaveProjectClick(Sender: TObject);
begin
SaveFile.FileName := FName;
if SaveFile.Execute then
 begin
  FName := SaveFile.FileName;
  Editor.Lines.SaveToFile(FName);
end;
end;

end.




