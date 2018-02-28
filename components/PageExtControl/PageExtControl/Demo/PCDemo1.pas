unit PCDemo1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PageExtControl, StdCtrls, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    PageExtControl1: TPageExtControl;
    TabExtSheet1: TTabExtSheet;
    TabExtSheet2: TTabExtSheet;
    TabExtSheet3: TTabExtSheet;
    PageExtControl2: TPageExtControl;
    TabExtSheet4: TTabExtSheet;
    TabExtSheet5: TTabExtSheet;
    TabExtSheet6: TTabExtSheet;
    PageExtControl3: TPageExtControl;
    TabExtSheet7: TTabExtSheet;
    TabExtSheet8: TTabExtSheet;
    TabExtSheet9: TTabExtSheet;
    PageExtControl4: TPageExtControl;
    TabExtSheet10: TTabExtSheet;
    TabExtSheet11: TTabExtSheet;
    TabExtSheet12: TTabExtSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PageExtControl5: TPageExtControl;
    Panel1: TPanel;
    Label13: TLabel;
    procedure PageExtControl2TabClick(Sender: TObject; TabIndex: Integer);
    procedure PageExtControl3TabClose(Sender: TObject; TabIndex: Integer;
      var CanClose: Boolean);
    procedure PageExtControl3TabDelete(Sender: TObject; TabIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.PageExtControl2TabClick(Sender: TObject; TabIndex: Integer);
begin
   ShowMessage('You just click on '+#13+
   Trim((Sender as TPageExtControl).Pages[TabIndex].Caption));
end;

procedure DoSomethingHere;
begin
end;

Function DoSomethingThere: Boolean;
Begin
  Result := False;
end;
procedure TForm1.PageExtControl3TabClose(Sender: TObject;
  TabIndex: Integer; var CanClose: Boolean);
begin
 // CanClose := False;
  Case MessageDlg('Are you sure you want to close '+
  Trim((Sender as TPageExtControl).Pages[TabIndex].Caption)+' ?',
  mtConfirmation,[mbYes,mbNo, mbCancel],0) of
  mrNo : CanClose := False;
  mrCancel: Abort;
  end;
  if CanClose then
  DoSomethingHere else
  DoSomethingThere;
end;

procedure TForm1.PageExtControl3TabDelete(Sender: TObject;
  TabIndex: Integer);
begin
  ShowMessage(Trim((Sender as TPageExtControl).Pages[TabIndex].Caption)+' was deleted');
end;

end.
