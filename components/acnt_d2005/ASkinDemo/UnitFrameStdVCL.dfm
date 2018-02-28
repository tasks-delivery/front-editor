inherited Frame_StdVCL: TFrame_StdVCL
  Height = 912
  VertScrollBar.Tracking = True
  object Label1: TLabel [0]
    Left = 52
    Top = 91
    Width = 32
    Height = 13
    Caption = 'Label1'
    Transparent = True
  end
  object Label2: TLabel [1]
    Left = 100
    Top = 91
    Width = 32
    Height = 13
    Caption = 'Label2'
    Transparent = True
  end
  object Edit1: TEdit [2]
    Left = 162
    Top = 88
    Width = 216
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Memo1: TMemo [3]
    Left = 40
    Top = 160
    Width = 284
    Height = 121
    Lines.Strings = (
      '    sFrameAdapter1: TsFrameAdapter;'
      '    Edit1: TEdit;'
      '    Memo1: TMemo;'
      '    Label1: TLabel;'
      '    ListBox1: TListBox;'
      '    StringGrid1: TStringGrid;'
      '    MaskEdit1: TMaskEdit;'
      '    DrawGrid1: TDrawGrid;'
      '    CheckListBox1: TCheckListBox;'
      '    RichEdit1: TRichEdit;'
      '    TreeView1: TTreeView;'
      '    ListView1: TListView;')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object ListBox1: TListBox [4]
    Left = 40
    Top = 298
    Width = 284
    Height = 95
    ItemHeight = 13
    Items.Strings = (
      'List Item 0'
      'List Item 1'
      'List Item 2'
      'List Item 3'
      'List Item 4'
      'List Item 5'
      'List Item 6'
      'List Item 7'
      'List Item 8'
      'List Item 9'
      'List Item A'
      'List Item B'
      'List Item C'
      'List Item ...')
    TabOrder = 2
  end
  object StringGrid1: TStringGrid [5]
    Left = 40
    Top = 708
    Width = 616
    Height = 117
    ColCount = 4
    Ctl3D = False
    RowCount = 10
    ParentCtl3D = False
    TabOrder = 3
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object MaskEdit1: TMaskEdit [6]
    Left = 351
    Top = 412
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'MaskEdit1'
  end
  object DrawGrid1: TDrawGrid [7]
    Left = 352
    Top = 298
    Width = 305
    Height = 95
    ColCount = 10
    Ctl3D = False
    RowCount = 4
    ParentCtl3D = False
    TabOrder = 5
    RowHeights = (
      24
      24
      24
      24)
  end
  object CheckListBox1: TCheckListBox [8]
    Left = 40
    Top = 412
    Width = 284
    Height = 169
    ItemHeight = 13
    Items.Strings = (
      'List Item 0'
      'List Item 1'
      'List Item 2'
      'List Item 3'
      'List Item 4'
      'List Item 5'
      'List Item 6'
      'List Item 7'
      'List Item 8'
      'List Item 9'
      'List Item A'
      'List Item B'
      'List Item C'
      'List Item ...')
    TabOrder = 6
  end
  object RichEdit1: TRichEdit [9]
    Left = 40
    Top = 600
    Width = 284
    Height = 89
    Lines.Strings = (
      '    sFrameAdapter1: TsFrameAdapter;'
      '    Edit1: TEdit;'
      '    Memo1: TMemo;'
      '    Label1: TLabel;'
      '    ListBox1: TListBox;'
      '    StringGrid1: TStringGrid;'
      '    MaskEdit1: TMaskEdit;'
      '    DrawGrid1: TDrawGrid;'
      '    CheckListBox1: TCheckListBox;'
      '    RichEdit1: TRichEdit;'
      '    TreeView1: TTreeView;'
      '    ListView1: TListView;')
    ScrollBars = ssBoth
    TabOrder = 7
    WordWrap = False
  end
  object TreeView1: TTreeView [10]
    Left = 352
    Top = 600
    Width = 305
    Height = 89
    Indent = 19
    TabOrder = 8
  end
  object ListView1: TListView [11]
    Left = 352
    Top = 160
    Width = 305
    Height = 121
    Columns = <
      item
        Caption = 'List Item 0'
      end
      item
        Caption = 'List Item 1'
      end
      item
        Caption = 'List Item 2'
      end
      item
        Caption = 'List Item 3'
      end
      item
        Caption = 'List Item 4'
      end
      item
        Caption = 'List Item 5'
      end
      item
        Caption = 'List Item 6'
      end
      item
        Caption = 'List Item 7'
      end>
    LargeImages = MainForm.sCharImageList1
    SmallImages = MainForm.sCharImageList1
    TabOrder = 9
  end
  object GroupBox1: TGroupBox [12]
    Left = 352
    Top = 448
    Width = 305
    Height = 132
    Caption = 'GroupBox1'
    TabOrder = 10
    object RadioGroup1: TRadioGroup
      Left = 56
      Top = 36
      Width = 185
      Height = 73
      Caption = 'RadioGroup1'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Item 1'
        'Item 2'
        'Item 3'
        'Item 4')
      TabOrder = 0
    end
  end
  object ComboBox1: TComboBox [13]
    Left = 491
    Top = 412
    Width = 166
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Text = 'ComboBox1'
    Items.Strings = (
      'Item 1'
      'Item 2'
      'Item 3'
      'Item 4'
      'Item 5'
      'Item 6'
      'Item 7'
      'Item 8'
      'Item 9'
      'Item A'
      'Item B'
      'Item C'
      'Item D'
      'Item E'
      'Item F'
      'Item G'
      'Item H')
  end
  object BitBtn1: TBitBtn [14]
    Left = 265
    Top = 44
    Width = 83
    Height = 29
    Caption = 'BitBtn1'
    TabOrder = 12
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      000014110D0000000011442C0D58754E17909B6926BABB863BD5C99349DECA94
      48DAB3813ABABE823268DE97370CE0A24D00DC983E0000000000000000000000
      0000000000082E282094FBB85AFEFFF9D4FFFFF3CCFFFFE8BDFFFFE3B8FFFFE5
      B4FFB7C7CEFF96B5C7FFF2B868E1DA943725E0A24D00DA973C00000000000000
      00000000002FC4AF96E1F8CA8DFFF8D6A8FFFFE4C6FFFFDBB7FFFFD2A3FFFFCF
      8AFF599FE4FF69A6DEFFFFE5B1FFE8B76EDCD8943609DB994000000000000000
      0000000000174C463BB4FFEAC9FFE5A44FFFFFE0C0FFFFE5C3FFFFEAC8FFF4D1
      9FFF259FFFFF3E9CF5FFFFD08FFFFFDEB2FFD8953B62DB9A4100000000000000
      0000000000020000006AF6E3CAF5EEC285FFF8CD98FFFFF0D1FFF3C787FFEAA5
      4AFF43BBFFFF64A8E0FFFFD796FFFFD3A2FFD8983E90DC9D4800000000000000
      00000202020000000020615B53BBFFFDEBFFE7AA58FFFFDFA9FFF5AD53FFD7AA
      6EFF3FB1FFFFC1A477FFFFBF69FFEAAC5AEADEA04D14DD9F4B00000000000000
      000000000000000000010000004BBAB2ABDBFFFFFDFFDBA65FFF2092D0FF25BE
      F7FF39CCF9FF2BA2DAFFCB9347EFC1884532A2997500DEA15000000000000000
      00000000000001010100000000030000005A5091B8ED0087DDFF16D7FFFF1EDB
      FFFF2FE0FFFF4BEDFFFF1AA1E4E00085DF07438AAA0000000000000000000000
      000000000000000000000000000506151E8D31A8F4FE21BBF5FF42E5FFFF32DA
      FFFF0BCFFFFF0BD2FFFF33D6FCFF0482D244088AD70000000000000000000000
      00000000000000000000000000201D5573D10F76AFFF006194FF1986B1FF6EEF
      FFFF60E5FFFF2DD8FFFF0AD6FFFF0786D485088CD80000000000000000000000
      00000000000000000000000000495F99B5F01273A4FF006497FF005D92FF81EF
      FDFF88FBFFFF72F3FFFF2BE3FFFF058ADA940788D10000000000000000000000
      00000000000000000000000000407DA2B4E7378AB4FF006A9EFF00699DFF3191
      B6FF066D9EFF016B9CFF0D80AFFF0179C06D047BBC0000000000000000000000
      00000000000000000000000000173D4547B1B0D8ECFF00679DFF0076ABFF0B83
      B4FF2B9DC8FF36ABD3FF1D8FBBFD00639634046FA70000000000000000000000
      0000000000000000000000000001000000397A7A7ABD91C2DCFA0478AFFF289B
      CAFF2FA7D3FF1D94C4FE05649494086A9E0105689A0000000000000000000000
      00000000000000000000010101001B1D1D00000000120C070343292F337D1E47
      5DA61144609C08212E450A202D020952770008699B0000000000000000000000
      000000000000000000000000000000000000090A0A000E121400000000010000
      0002000000010A2635000A2939000A2838000000000000000000}
  end
  object Button1: TButton [15]
    Left = 57
    Top = 44
    Width = 83
    Height = 29
    Caption = 'Button1'
    TabOrder = 13
  end
  object PageControl1: TPageControl [16]
    Left = 404
    Top = 28
    Width = 252
    Height = 113
    ActivePage = TabSheet1
    TabOrder = 14
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object CheckBox1: TCheckBox
        Left = 32
        Top = 16
        Width = 97
        Height = 17
        Caption = 'CheckBox1'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 32
        Top = 47
        Width = 97
        Height = 17
        Caption = 'CheckBox2'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object StaticText2: TStaticText
        Left = 148
        Top = 47
        Width = 58
        Height = 17
        Caption = 'StaticText1'
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object RadioButton1: TRadioButton
        Left = 124
        Top = 15
        Width = 101
        Height = 17
        Caption = 'RadioButton1'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 124
        Top = 47
        Width = 101
        Height = 17
        Caption = 'RadioButton2'
        TabOrder = 1
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
  end
  object ScrollBar1: TScrollBar [17]
    Left = 41
    Top = 123
    Width = 336
    Height = 17
    LargeChange = 20
    PageSize = 30
    TabOrder = 15
  end
  object Button2: TButton [18]
    Left = 161
    Top = 44
    Width = 83
    Height = 29
    Caption = 'Button2'
    TabOrder = 16
  end
  inherited sFrameAdapter1: TsFrameAdapter
    SkinData.SkinSection = 'MENUITEM'
    Left = 4
    Top = 4
  end
end
