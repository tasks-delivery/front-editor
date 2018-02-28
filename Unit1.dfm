object Form1: TForm1
  Left = 237
  Top = 143
  BiDiMode = bdLeftToRight
  Caption = 'VclSkin'
  ClientHeight = 300
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Tag = 7777
    Left = 24
    Top = 8
    Width = 417
    Height = 225
    ActivePage = TabSheet1
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Control'
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 153
        Height = 13
        Caption = 'Press "Up/Down" Change Skin '
      end
      object SpeedButton1: TSpeedButton
        Left = 301
        Top = 51
        Width = 73
        Height = 25
        Caption = 'SpeedBtn'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          0077777777777774EC0777777777774ECC077000000004ECC077833333334ECC
          33078FB780087CC3B3078F787E70833B73078F8FE7E703B7B3078F8EFE7E037B
          73078F8FEFE708B7B3078F78FEF08B7B73078FB78808B7B7B3078FFFFFFFFFFF
          F30787B7B7B788888877787B7B78777777777788888777777777}
        Spacing = 0
        OnClick = SpeedButton1Click
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 59
        Width = 81
        Height = 17
        Hint = 'checkbox1'
        BiDiMode = bdLeftToRight
        Caption = 'CheckBox1'
        Checked = True
        ParentBiDiMode = False
        State = cbChecked
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 83
        Width = 81
        Height = 17
        Hint = 'checkbox2'
        Alignment = taLeftJustify
        Caption = 'CheckBox2'
        TabOrder = 1
      end
      object RadioButton1: TRadioButton
        Left = 104
        Top = 59
        Width = 89
        Height = 17
        Hint = 'radiobutton1'
        Caption = 'RadioButton1'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 104
        Top = 83
        Width = 89
        Height = 17
        Hint = 'radiobutton2'
        Alignment = taLeftJustify
        Caption = 'RadioButton2'
        TabOrder = 3
      end
      object ComboBox1: TComboBox
        Left = 16
        Top = 24
        Width = 177
        Height = 21
        BiDiMode = bdLeftToRight
        ItemHeight = 13
        ParentBiDiMode = False
        TabOrder = 4
        Text = 'Change Skins'
        OnClick = ComboBox1Click
      end
      object LoadBtn: TButton
        Left = 216
        Top = 52
        Width = 73
        Height = 25
        Caption = 'Load Skin'
        TabOrder = 5
        OnClick = LoadBtnClick
      end
      object Button4: TButton
        Left = 216
        Top = 20
        Width = 73
        Height = 25
        Caption = 'UnSkin'
        Default = True
        TabOrder = 6
        OnClick = Button2Click
      end
      object BitBtn1: TBitBtn
        Left = 300
        Top = 20
        Width = 73
        Height = 25
        TabOrder = 7
        Kind = bkClose
        Spacing = 2
      end
      object Edit1: TEdit
        Left = 16
        Top = 104
        Width = 177
        Height = 21
        TabOrder = 8
        Text = 'Edit1'
      end
      object ExceptionBtn: TButton
        Left = 216
        Top = 84
        Width = 73
        Height = 25
        Caption = 'Exception'
        TabOrder = 9
        OnClick = ExceptionBtnClick
      end
      object MessageBtn: TButton
        Left = 216
        Top = 116
        Width = 73
        Height = 25
        Caption = 'MessageBox'
        TabOrder = 10
        OnClick = MessageBtnClick
      end
      object Button1: TButton
        Left = 302
        Top = 84
        Width = 73
        Height = 25
        Caption = 'Form'
        TabOrder = 11
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 16
        Top = 136
        Width = 75
        Height = 25
        Caption = 'OpenDialog'
        TabOrder = 12
        OnClick = LoadBtnClick
      end
      object Button3: TButton
        Left = 104
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Font Dialog'
        TabOrder = 13
        OnClick = Skin21Click
      end
      object Button5: TButton
        Left = 216
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Open Skins'
        TabOrder = 14
        OnClick = Button5Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TMemo'
      ImageIndex = 1
      object RichEdit1: TRichEdit
        Left = 16
        Top = 8
        Width = 361
        Height = 161
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'unit Unit1;'
          ''
          'interface'
          ''
          'uses'
          
            '  Windows, Messages, SysUtils, Classes, Graphics, Controls, Form' +
            's,'
          '  Dialogs, ComCtrls, StdCtrls, Menus, WinSkinForm, WinSkinData,'
          
            '   Buttons, Grids, ToolWin, ExtCtrls, ImgList, ExtDlgs, WinSkinS' +
            'tore;'
          ''
          'type'
          '  TForm1 = class(TForm)'
          '    PageControl1: TPageControl;'
          '    TabSheet1: TTabSheet;'
          '    TabSheet2: TTabSheet;'
          '    CheckBox1: TCheckBox;'
          '    CheckBox2: TCheckBox;'
          '    RadioButton1: TRadioButton;'
          '    RadioButton2: TRadioButton;'
          '    StatusBar1: TStatusBar;'
          '    MainMenu1: TMainMenu;'
          '    File1: TMenuItem;'
          '    DialogM: TMenuItem;'
          '    Help1: TMenuItem;'
          '    Open1: TMenuItem;'
          '    Save1: TMenuItem;'
          '    Close1: TMenuItem;'
          '    N1: TMenuItem;'
          '    Exit1: TMenuItem;'
          '    Skin11: TMenuItem;'
          '    Skin21: TMenuItem;'
          '    Skin31: TMenuItem;'
          '    Content1: TMenuItem;'
          '    Homepage1: TMenuItem;'
          '    About1: TMenuItem;'
          '    sd1: TSkinData;'
          '    ComboBox1: TComboBox;'
          '    Label1: TLabel;'
          '    LoadBtn: TButton;'
          '    Button4: TButton;'
          '    TabSheet3: TTabSheet;'
          '    ListBox1: TListBox;'
          '    BitBtn1: TBitBtn;'
          '    TabSheet4: TTabSheet;'
          '    StringGrid1: TStringGrid;'
          '    SpeedButton1: TSpeedButton;'
          '    Edit1: TEdit;'
          '    ExceptionBtn: TButton;'
          '    MessageBtn: TButton;'
          '    Dialog1: TOpenDialog;'
          '    Panel1: TPanel;'
          '    ProgressBar1: TProgressBar;'
          '    Dialog2: TFontDialog;'
          '    Dialog3: TColorDialog;'
          '    Dialog4: TPrintDialog;'
          '    PrintDialog2: TMenuItem;'
          '    BuildinSkins1: TMenuItem;'
          '    Skin12: TMenuItem;'
          '    Skin22: TMenuItem;'
          '    Skin32: TMenuItem;'
          '    Skin41: TMenuItem;'
          '    Skin51: TMenuItem;'
          '    RichEdit1: TRichEdit;'
          '    ImageList1: TImageList;'
          '    Dialog5: TOpenPictureDialog;'
          '    sd2: TSkinData;'
          '    SkinStore1: TSkinStore;'
          '    Button1: TButton;'
          '    Timer1: TTimer;'
          '    procedure Exit1Click(Sender: TObject);'
          '    procedure Button2Click(Sender: TObject);'
          '    procedure FormCreate(Sender: TObject);'
          '    procedure ComboBox1Click(Sender: TObject);'
          
            '    procedure sf1CaptionBtnClick(Sender: TObject; action: Intege' +
            'r);'
          '    procedure SpeedButton1Click(Sender: TObject);'
          '    procedure LoadBtnClick(Sender: TObject);'
          '    procedure ExceptionBtnClick(Sender: TObject);'
          '    procedure MessageBtnClick(Sender: TObject);'
          '    procedure Skin21Click(Sender: TObject);'
          '    procedure Skin31Click(Sender: TObject);'
          '    procedure PrintDialog2Click(Sender: TObject);'
          '    procedure Skin12Click(Sender: TObject);'
          '    procedure Button1Click(Sender: TObject);'
          '    procedure Timer1Timer(Sender: TObject);'
          '  private'
          '    { Private declarations }'
          '    procedure ReadSkinfile( apath : string );'
          '    procedure Loadskin(aname:string);'
          '  public'
          '    { Public declarations }'
          '    Ep:integer;'
          '  end;'
          ''
          'var'
          '  Form1: TForm1;'
          '  root:string;'
          ''
          'implementation'
          ''
          'uses Unit2;'
          ''
          '{$R *.dfm}'
          ''
          'procedure TForm1.Exit1Click(Sender: TObject);'
          'begin'
          '  close;'
          'end;'
          ''
          'procedure TForm1.Button2Click(Sender: TObject);'
          'begin'
          '//   button1.enabled:= not button1.enabled;'
          '//    sf1.dolog('#39'**************'#39');'
          '   sd1.active:= not sd1.active;'
          '   if sd1.active then button4.caption:='#39'Unskin'#39
          '   else button4.caption:='#39'Skin'#39';'
          'end;'
          ''
          'procedure TForm1.ReadSkinfile( apath : string );'
          'var'
          '  sts: Integer ;'
          '  SR: TSearchRec;'
          '  list: Tstringlist;'
          ''
          '  procedure AddFile;'
          '  begin'
          '    list.add(sr.name);'
          '  end;'
          ''
          'begin'
          '  list:=Tstringlist.create;'
          '  sts := FindFirst( apath + '#39'*.skn'#39' , faAnyFile , SR );'
          '  if sts = 0 then begin'
          '      if ( SR.Name <> '#39'.'#39' ) and ( SR.Name <> '#39'..'#39' ) then begin'
          '          if pos('#39'.'#39', SR.Name) <> 0 then'
          '            Addfile;'
          '      end;'
          '      while FindNext( SR ) = 0 do begin'
          
            '          if ( SR.Name <> '#39'.'#39' ) and ( SR.Name <> '#39'..'#39' ) then beg' +
            'in'
          '              //Put User Feedback here if desired'
          '//              Application.ProcessMessages;'
          '              if Pos('#39'.'#39', SR.Name) <> 0 then  Addfile;'
          '          end;'
          '      end;'
          '  end ;'
          '  FindClose( SR ) ;'
          '  list.sort;'
          '  combobox1.items.assign(list);'
          '  list.free;'
          'end;'
          ''
          'procedure TForm1.FormCreate(Sender: TObject);'
          'var i,j:integer;'
          'begin'
          '    root:= ExtractFilePath(ParamStr(0));'
          '    readskinfile('#39'..\..\skins\'#39');'
          ''
          '//   load skin file from TSkinStore'
          '   Sd1.LoadFromCollection(skinstore1,2);'
          '   Sd2.LoadFromCollection(skinstore1,1);'
          '   if not sd1.active then sd1.active:=true;'
          ''
          '    with stringgrid1 do begin'
          '       rowcount:=combobox1.items.count+1;'
          '       colcount:=7;'
          '       for i:= 0 to colcount-1 do'
          '         cells[i,0]:=format('#39'column%1d'#39',[i]);'
          '       for i:= 1 to rowcount-1 do begin'
          '         cells[0,i]:=format('#39'skin file%1d'#39',[i]);'
          '         cells[1,i]:=combobox1.items[i-1];'
          '       end;'
          '       fixedcolor:=sd1.colors[csButtonFace];'
          '    end;'
          'end;'
          ''
          'procedure TForm1.ComboBox1Click(Sender: TObject);'
          'begin'
          '   sd1.skinfile:='#39'..\..\skins\'#39'+combobox1.text;'
          '   stringgrid1.fixedcolor:=sd1.colors[csButtonFace];'
          '   if not sd1.active then sd1.active:=true;'
          'end;'
          ''
          
            'procedure TForm1.sf1CaptionBtnClick(Sender: TObject; action: Int' +
            'eger);'
          'begin'
          
            '     showmessage('#39'Custom Caption Button Click No:'#39'+inttostr(acti' +
            'on));'
          'end;'
          ''
          'procedure TForm1.SpeedButton1Click(Sender: TObject);'
          'begin'
          '//   sd1.skinfile:='#39'..\skins\'#39'+combobox1.items[1];'
          '//   stringgrid1.fixedcolor:=sd1.colors[csButtonFace];'
          '//    skinaddlog('#39'****************************'#39');'
          '   timer1.enabled:= not timer1.enabled; '
          'end;'
          ''
          'procedure TForm1.LoadBtnClick(Sender: TObject);'
          'begin'
          '  Dialog1.filter:='#39'Skin files (*.skn)|*.SKN'#39';'
          '  Dialog1.initialdir:='#39'..\..\skins\'#39';'
          '  if Dialog1.execute then'
          '     sd1.skinfile:=dialog1.filename;'
          '  if not sd1.Active then'
          '   sd1.Active:=true;'
          ''
          'end;'
          ''
          'procedure TForm1.ExceptionBtnClick(Sender: TObject);'
          'var i:integer;'
          'begin'
          '    i:=1;'
          '    Ep:= 100 div (i-1);'
          'end;'
          ''
          'procedure TForm1.MessageBtnClick(Sender: TObject);'
          'begin'
          '   MessageDlg('#39'VclSkin2.0 Demo !'#39'#13'#39'Message Window Skin Demo.'#39','
          '        mtInformation,[mbOk], 0);'
          'end;'
          ''
          'procedure TForm1.Skin21Click(Sender: TObject);'
          'begin'
          '   Dialog2.execute;'
          'end;'
          ''
          'procedure TForm1.Skin31Click(Sender: TObject);'
          'begin'
          '  Dialog3.execute;'
          'end;'
          ''
          'procedure TForm1.PrintDialog2Click(Sender: TObject);'
          'begin'
          '  Dialog4.execute;'
          'end;'
          ''
          'procedure TForm1.Loadskin(aname:string);'
          'var  RS: TResourceStream;'
          'begin'
          '    RS := TResourceStream.Create(HInstance,aname,RT_RCDATA);'
          '    sd1.loadfromstream(rs);'
          '    rs.free;'
          'end;'
          ''
          'procedure TForm1.Skin12Click(Sender: TObject);'
          'var i:integer;'
          'begin'
          '   i:=Tcomponent(sender).tag;'
          '   Sd1.LoadFromCollection(skinstore1,i);'
          'end;'
          ''
          'procedure TForm1.Button1Click(Sender: TObject);'
          'begin'
          '   if form2=nil then'
          '     Application.CreateForm(TForm2, Form2);'
          '   form2.show;'
          'end;'
          ''
          'procedure TForm1.Timer1Timer(Sender: TObject);'
          'begin'
          '   ProgressBar1.position:=ProgressBar1.position+1;'
          '   if ProgressBar1.position>99 then'
          '      ProgressBar1.position:=0;'
          'end;'
          ''
          'end.')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TListbox'
      ImageIndex = 2
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 409
        Height = 197
        Align = alClient
        ItemHeight = 13
        Items.Strings = (
          'unit Unit1;'
          ''
          'interface'
          ''
          'uses'
          
            '  Windows, Messages, SysUtils, Classes, Graphics, Controls, Form' +
            's,'
          '  Dialogs, ComCtrls, StdCtrls, Menus, WinSkinForm, WinSkinData;'
          ''
          'type'
          '  TForm1 = class(TForm)'
          '    PageControl1: TPageControl;'
          '    TabSheet1: TTabSheet;'
          '    TabSheet2: TTabSheet;'
          '    CheckBox1: TCheckBox;'
          '    CheckBox2: TCheckBox;'
          '    RadioButton1: TRadioButton;'
          '    RadioButton2: TRadioButton;'
          '    StatusBar1: TStatusBar;'
          '    MainMenu1: TMainMenu;'
          '    File1: TMenuItem;'
          '    view1: TMenuItem;'
          '    Help1: TMenuItem;'
          '    Open1: TMenuItem;'
          '    Save1: TMenuItem;'
          '    Close1: TMenuItem;'
          '    N1: TMenuItem;'
          '    Exit1: TMenuItem;'
          '    Skin11: TMenuItem;'
          '    Skin21: TMenuItem;'
          '    Skin31: TMenuItem;'
          '    Content1: TMenuItem;'
          '    Homepage1: TMenuItem;'
          '    About1: TMenuItem;'
          '    sf1: TWinSkinForm;'
          '    sd1: TSkinData;'
          '    ComboBox1: TComboBox;'
          '    ProgressBar1: TProgressBar;'
          '    Label1: TLabel;'
          '    Button3: TButton;'
          '    Button4: TButton;'
          '    Memo1: TMemo;'
          '    procedure Exit1Click(Sender: TObject);'
          '    procedure Button1Click(Sender: TObject);'
          '    procedure Button2Click(Sender: TObject);'
          '    procedure FormCreate(Sender: TObject);'
          '    procedure ComboBox1Click(Sender: TObject);'
          '  private'
          '    { Private declarations }'
          '    procedure ReadSkinfile( apath : string );'
          '  public'
          '    { Public declarations }'
          '    root:string;'
          '  end;'
          ''
          'var'
          '  Form1: TForm1;'
          ''
          'implementation'
          ''
          '{$R *.dfm}'
          ''
          'procedure TForm1.Exit1Click(Sender: TObject);'
          'begin'
          '  close;'
          'end;'
          ''
          'procedure TForm1.Button1Click(Sender: TObject);'
          'begin'
          '   button2.caption :='#39'&Change'#39';'
          'end;'
          ''
          'procedure TForm1.Button2Click(Sender: TObject);'
          'begin'
          '//   button1.enabled:= not button1.enabled; '
          '//    sf1.dolog('#39'**************'#39');'
          'end;'
          ''
          'procedure TForm1.ReadSkinfile( apath : string );'
          'var'
          '  sts: Integer ;'
          '  SR: TSearchRec;'
          ''
          '  procedure AddFile;'
          '  begin'
          '    combobox1.items.add(sr.name);'
          '  end;'
          ''
          'begin'
          '  sts := FindFirst( apath + '#39'*.skn'#39' , faAnyFile , SR );'
          '  if sts = 0 then begin'
          '      if ( SR.Name <> '#39'.'#39' ) and ( SR.Name <> '#39'..'#39' ) then begin'
          '          if pos('#39'.'#39', SR.Name) <> 0 then'
          '            Addfile;'
          '      end;'
          '      while FindNext( SR ) = 0 do begin'
          
            '          if ( SR.Name <> '#39'.'#39' ) and ( SR.Name <> '#39'..'#39' ) then beg' +
            'in'
          '              //Put User Feedback here if desired'
          '              Application.ProcessMessages;'
          '              if Pos('#39'.'#39', SR.Name) <> 0 then  Addfile;'
          '          end;'
          '      end;'
          '  end ;'
          '  FindClose( SR ) ;'
          'end;'
          ''
          'procedure TForm1.FormCreate(Sender: TObject);'
          'begin'
          '    root:= ExtractFilePath(ParamStr(0));'
          '    readskinfile('#39'..\skins\'#39');'
          'end;'
          ''
          'procedure TForm1.ComboBox1Click(Sender: TObject);'
          'begin'
          '   sd1.skinfile:='#39'..\skins\'#39'+combobox1.text;'
          'end;'
          ''
          'end.')
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Grid'
      ImageIndex = 3
      object StringGrid1: TStringGrid
        Left = 16
        Top = 8
        Width = 353
        Height = 161
        DefaultRowHeight = 18
        FixedCols = 0
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 281
    Width = 463
    Height = 19
    Panels = <
      item
        Text = '1111'
        Width = 100
      end
      item
        Style = psOwnerDraw
        Text = '22222'
        Width = 100
      end
      item
        Text = '33333'
        Width = 50
      end>
    SimpleText = '111111111111111111'
    OnDrawPanel = StatusBar1DrawPanel
  end
  object Panel1: TPanel
    Left = 0
    Top = 240
    Width = 463
    Height = 41
    Align = alBottom
    TabOrder = 2
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 16
      Width = 345
      Height = 16
      Position = 50
      TabOrder = 0
    end
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 256
    Top = 24
    object DialogM: TMenuItem
      Caption = '&Dialog'
      object Skin11: TMenuItem
        Caption = 'Open Dialog'
        ImageIndex = 0
        OnClick = LoadBtnClick
      end
      object OpenwithPreview1: TMenuItem
        Caption = 'Open with Preview'
        OnClick = Button5Click
      end
      object Skin21: TMenuItem
        Caption = 'Font Dialog'
        ImageIndex = 3
        OnClick = Skin21Click
      end
      object Skin31: TMenuItem
        Caption = 'Color Dialog'
        ImageIndex = 7
        OnClick = Skin31Click
      end
      object PrintDialog2: TMenuItem
        Caption = 'Print Dialog'
        ImageIndex = 5
        OnClick = PrintDialog2Click
      end
    end
    object BuildinSkins1: TMenuItem
      Caption = 'Build in Skins'
      object Skin12: TMenuItem
        Caption = 'Skin1'
        OnClick = Skin12Click
      end
      object Skin22: TMenuItem
        Tag = 1
        Caption = 'Skin2'
        OnClick = Skin12Click
      end
      object Skin32: TMenuItem
        Tag = 2
        Caption = 'Skin3'
        OnClick = Skin12Click
      end
    end
    object File1: TMenuItem
      Caption = '&File'
      object Open1: TMenuItem
        Caption = '&Open'
      end
      object Save1: TMenuItem
        Caption = '&Save'
      end
      object Close1: TMenuItem
        Caption = '&Close'
        ImageIndex = 11
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object Content1: TMenuItem
        Caption = 'Content'
      end
      object Homepage1: TMenuItem
        Caption = 'Homepage'
        ImageIndex = 9
      end
      object About1: TMenuItem
        Caption = 'About'
        ImageIndex = 11
      end
    end
  end
  object Dialog1: TOpenDialog
    Left = 32
    Top = 216
  end
  object Dialog2: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 136
    Top = 216
  end
  object Dialog3: TColorDialog
    Left = 168
    Top = 216
  end
  object Dialog4: TPrintDialog
    Left = 200
    Top = 216
  end
  object ImageList1: TImageList
    Left = 64
    Top = 216
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B57B00009C63000042290000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFB52100DE9400006B4A0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFB52100DE94000084520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFC65200DE94000084520000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD68400DE9400009C630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD68400DE9400009C630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7CECE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7EFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7EFF70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000736B
      6B009C8C8C00000000009C8C8C0031313100736B6B0031313100313131000000
      000000000000524A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6BD
      BD00E7CECE00393131009C8C8C009C8C8C008C7B7B008C7B7B008C7B7B00736B
      6B0084737300CE9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00DED6D600DED6D600C6BDBD00E7CECE00E7CECE00CEB5BD00CEB5BD00CEB5
      BD00E7CECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000DED6D600DED6D600DED6D600DED6D600DED6D600DED6
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084FFA50000C6390000C6390000000000000000000000
      0000000000000000000000000000000000000000000000000000007BDE00007B
      DE00007BDE00007BDE00007BDE00007BDE00007BDE00007BDE00007BDE0000FF
      FF000000000000000000000000000000000000000000008CEF00008CEF00008C
      EF00008CEF00008CEF00008CEF00008CEF00008CEF00008CEF00008CEF00008C
      EF00008CEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800080808000000000084FFA50052FF7B0000C6390000000000080808000808
      080000000000000000000000000000000000000000000042B5000000000000D6
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000AD
      FF0000FFFF000000000000000000000000000000000000C6FF0000D6FF0000D6
      FF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000FF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      CE00FF1818000000000084FFA50052FF7B0000C639000000000000BDBD0000BD
      BD0000000000000000000000000000000000000000000094F700004ABD000000
      000000EFFF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000DE
      FF0000D6FF0000FFFF0000000000000000000000000000C6FF0000D6FF0000EF
      FF0000EFFF0000EFFF0000EFFF0000EFFF0000EFFF0000EFFF0000EFFF0000FF
      FF006BFFFF000000000000000000000000000000000000C6C60000C6C60000A5
      A500007B7B0000000000000000000000000000C6C60000C6C60000A5A500007B
      7B0000000000000000000000000000000000000000000000000000000000FFCE
      CE00FF8C8C000808080084FFA50052FF7B0000C63900080808006BFFFF0000BD
      BD00000000000000000000000000000000000000000000ADFF0000A5FF00008C
      EF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF004AFFFF00000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF006BFFFF0000000000000000000000000000000000FFFFFF0000FFFF0000FF
      FF0000B5B500000000000000000000000000FFFFFF0000FFFF0000FFFF0000B5
      B50000000000000000000000000000000000000000000000000000000000FFCE
      CE00FF8C8C000808080084FFA50052FF7B0000C63900080808006BFFFF0000BD
      BD00000000000000000000000000000000000000000000C6FF0000EFFF0000D6
      FF0000BDFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF006BFFFF0000000000000000000000000000000000FFFFFF00FFFFFF0084FF
      FF0000DEDE00000000000000000000000000FFFFFF00FFFFFF0084FFFF0000DE
      DE0000000000000000000000000000000000000000000000000008080800FFCE
      CE00FF8C8C000808080084FFA50052FF7B0000C63900080808006BFFFF0000BD
      BD00080808000000000000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000D6FF0000FF
      FF006BFFFF000000000000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800FFCE
      CE00FF8C8C000808080084FFA50052FF7B0000C63900080808006BFFFF0000BD
      BD00080808000000000000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0021FF
      FF006BFFFF000000000000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0021FF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800FFCE
      CE00FF8C8C00FF5252000000000084FFA50000000000DEFFFF006BFFFF0000BD
      BD00080808000000000000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFF
      FF00000000000000000000000000000000000000000000C6FF0000EFFF0000FF
      FF0000FFFF0000FFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFFFF006BFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800FFFF
      FF00FF8C8C00FF525200080808000808080008080800DEFFFF006BFFFF0000BD
      BD00080808000000000000000000000000000000000000C6FF0000FFFF0000FF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000C6FF0000FFFF0000FF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00080808006B6B6B005A5A5A004A4A4A0008080800DEFFFF000000
      00000000000000000000000000000000000000000000000000006BFFFF006BFF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006BFFFF006BFF
      FF006BFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08000808080008080800B5B5B5008C8C8C005A5A5A0008080800080808000808
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808006B6B
      6B005A5A5A0008080800EFEFEF00B5B5B5006B6B6B00080808005A5A5A004A4A
      4A00080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800B5B5
      B5008C8C8C005A5A5A00080808000808080008080800B5B5B5008C8C8C005A5A
      5A00080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008080800EFEF
      EF00B5B5B5006B6B6B00080808000000000008080800EFEFEF00B5B5B5006B6B
      6B00080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800080808000808080000000000000000000000000008080800080808000808
      080000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE3F000000000000FC1F000000000000
      FC1F000000000000FC1F000000000000FC1F000000000000FC1F000000000000
      FC1F000000000000FE3F000000000000FE3F000000000000FE3F000000000000
      E419000000000000C001000000000000C001000000000000C003000000000000
      C007000000000000E40F000000000000FFFFFFFFFFFFFC7F800F8007FFFFF83F
      00070003FFFFE00F00030003870FC007000100030207C007000000030207C007
      000000030207C00700030003870FC00700030003B8EFC00700070007DFF7C007
      000F000FEBFAE00F83FF83FFF7FDE00FC7FFC7FFFFFFC007FFFFFFFFFFFFC007
      FFFFFFFFFFFFC107FFFFFFFFFFFFE38F00000000000000000000000000000000
      000000000000}
  end
  object Opd1: TOpenPictureDialog
    Left = 96
    Top = 216
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 344
    Top = 152
  end
end
