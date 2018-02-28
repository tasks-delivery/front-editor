inherited Frame_ImageLists: TFrame_ImageLists
  Height = 443
  object sStickyLabel1: TsStickyLabel [0]
    Left = 36
    Top = 25
    Width = 109
    Height = 13
    Caption = 'MainForm.ImageList32:'
    AlignTo = altTop
    AttachTo = sSpeedButton1
  end
  object sSpeedButton1: TsSpeedButton [1]
    Left = 36
    Top = 40
    Width = 134
    Height = 129
    ButtonStyle = tbsDropDown
    SkinData.SkinSection = 'SPEEDBUTTON'
    DropdownMenu = PopupMenu1
    Images = sVirtualImageList5
    ImageIndex = 0
    Reflected = True
  end
  object sSpeedButton2: TsSpeedButton [2]
    Tag = 2
    Left = 184
    Top = 40
    Width = 134
    Height = 129
    ButtonStyle = tbsDropDown
    SkinData.SkinSection = 'SPEEDBUTTON'
    DropdownMenu = PopupMenu2
    Images = sVirtualImageList1
    ImageIndex = 0
    Reflected = True
  end
  object sSpeedButton3: TsSpeedButton [3]
    Left = 332
    Top = 40
    Width = 108
    Height = 97
    ButtonStyle = tbsDropDown
    SkinData.SkinSection = 'SPEEDBUTTON'
    DropdownMenu = PopupMenu3
    Images = sVirtualImageList2
    ImageIndex = 0
    Reflected = True
  end
  object sSpeedButton4: TsSpeedButton [4]
    Left = 453
    Top = 40
    Width = 108
    Height = 83
    ButtonStyle = tbsDropDown
    SkinData.SkinSection = 'SPEEDBUTTON'
    DropdownMenu = PopupMenu4
    Images = sVirtualImageList3
    ImageIndex = 0
    Reflected = True
  end
  object sSpeedButton5: TsSpeedButton [5]
    Left = 573
    Top = 40
    Width = 91
    Height = 74
    ButtonStyle = tbsDropDown
    SkinData.SkinSection = 'SPEEDBUTTON'
    DropdownMenu = PopupMenu5
    Images = sVirtualImageList4
    ImageIndex = 0
    Reflected = True
  end
  object sStickyLabel2: TsStickyLabel [6]
    Left = 184
    Top = 25
    Width = 88
    Height = 13
    Caption = 'sVirtualImageList1:'
    AlignTo = altTop
    AttachTo = sSpeedButton2
  end
  object sStickyLabel3: TsStickyLabel [7]
    Left = 332
    Top = 25
    Width = 88
    Height = 13
    Caption = 'sVirtualImageList2:'
    AlignTo = altTop
    AttachTo = sSpeedButton3
  end
  object sStickyLabel4: TsStickyLabel [8]
    Left = 453
    Top = 25
    Width = 88
    Height = 13
    Caption = 'sVirtualImageList3:'
    AlignTo = altTop
    AttachTo = sSpeedButton4
  end
  object sStickyLabel5: TsStickyLabel [9]
    Left = 573
    Top = 25
    Width = 88
    Height = 13
    Caption = 'sVirtualImageList4:'
    AlignTo = altTop
    AttachTo = sSpeedButton5
  end
  object sLabel1: TsLabel [10]
    Tag = 1
    Left = 368
    Top = 264
    Width = 285
    Height = 79
    Alignment = taCenter
    AutoSize = False
    SkinSection = 'SELECTION'
    Caption = 
      'The TsVirtualImageList component'#13#10'Single imagelist with one sour' +
      'ce glyph - '#13#10'many clients with different glyph sizes!'
    Color = 14810367
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object sLabel2: TsLabel [11]
    Left = 88
    Top = 212
    Width = 114
    Height = 13
    Alignment = taRightJustify
    Caption = 'Choose source of glyph:'
  end
  object sGroupBox1: TsGroupBox [12]
    Left = 36
    Top = 264
    Width = 297
    Height = 145
    Caption = 'Glyph size dynamically changed:'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sStickyLabel8: TsStickyLabel
      Left = 68
      Top = 38
      Width = 19
      Height = 13
      Caption = 'Full:'
      AttachTo = sTrackBar1
    end
    object sStickyLabel6: TsStickyLabel
      Left = 56
      Top = 70
      Width = 31
      Height = 13
      Caption = 'Width:'
      AttachTo = sTrackBar2
    end
    object sStickyLabel7: TsStickyLabel
      Left = 53
      Top = 102
      Width = 34
      Height = 13
      Caption = 'Height:'
      AttachTo = sTrackBar3
    end
    object sTrackBar1: TsTrackBar
      Left = 89
      Top = 32
      Width = 150
      Height = 25
      Max = 64
      Min = 16
      Position = 64
      TabOrder = 0
      TickStyle = tsNone
      OnChange = sTrackBar1Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
    end
    object sTrackBar2: TsTrackBar
      Left = 89
      Top = 64
      Width = 150
      Height = 25
      Max = 64
      Min = 16
      Position = 64
      TabOrder = 1
      TickStyle = tsNone
      OnChange = sTrackBar2Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
    end
    object sTrackBar3: TsTrackBar
      Left = 89
      Top = 96
      Width = 150
      Height = 25
      Max = 64
      Min = 16
      Position = 64
      TabOrder = 2
      TickStyle = tsNone
      OnChange = sTrackBar3Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
    end
  end
  object sBitBtn1: TsBitBtn [13]
    Left = 368
    Top = 365
    Width = 285
    Height = 44
    Caption = 'Call source ImageList editor'
    TabOrder = 1
    OnClick = C1Click
    Spacing = 8
    ImageIndex = 24
    Images = MainForm.sCharImageList1
  end
  object sCheckBox1: TsCheckBox [14]
    Left = 360
    Top = 152
    Width = 74
    Height = 17
    Caption = 'Reflected'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = sCheckBox1Click
  end
  object sCheckBox2: TsCheckBox [15]
    Left = 460
    Top = 152
    Width = 93
    Height = 17
    Caption = 'Alphablended'
    TabOrder = 3
    OnClick = sCheckBox2Click
  end
  object sCheckBox3: TsCheckBox [16]
    Left = 580
    Top = 152
    Width = 78
    Height = 17
    Caption = 'Discolored'
    TabOrder = 4
    OnClick = sCheckBox3Click
  end
  object sRadioButton1: TsRadioButton [17]
    Left = 227
    Top = 211
    Width = 134
    Height = 17
    Caption = 'MainForm.ImageList32'
    Checked = True
    TabOrder = 5
    TabStop = True
    OnClick = sRadioButton1Click
  end
  object sRadioButton2: TsRadioButton [18]
    Left = 425
    Top = 211
    Width = 155
    Height = 17
    Caption = 'MainForm.sCharImageList1'
    TabOrder = 6
    OnClick = sRadioButton1Click
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 580
    Top = 4
  end
  object sVirtualImageList1: TsVirtualImageList
    Height = 64
    Width = 64
    AlphaImageList = MainForm.ImageList32
    Left = 200
    Top = 104
    Bitmap = {}
  end
  object sVirtualImageList2: TsVirtualImageList
    Height = 48
    Width = 48
    AlphaImageList = MainForm.ImageList32
    Left = 367
    Top = 104
    Bitmap = {}
  end
  object sVirtualImageList3: TsVirtualImageList
    Height = 32
    Width = 32
    AlphaImageList = MainForm.ImageList32
    Left = 487
    Top = 104
    Bitmap = {}
  end
  object sVirtualImageList4: TsVirtualImageList
    Height = 24
    Width = 24
    AlphaImageList = MainForm.ImageList32
    Left = 607
    Top = 104
    Bitmap = {}
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 104
    object C1: TMenuItem
      Caption = 'Call ImageList editor'
      ImageIndex = 0
      OnClick = C1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Images = sVirtualImageList1
    Left = 232
    Top = 104
    object MenuItem1: TMenuItem
      Caption = 'Call ImageList editor'
      ImageIndex = 0
      OnClick = C1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Images = sVirtualImageList2
    Left = 399
    Top = 104
    object MenuItem2: TMenuItem
      Caption = 'Call ImageList editor'
      ImageIndex = 0
      OnClick = C1Click
    end
  end
  object PopupMenu4: TPopupMenu
    Images = sVirtualImageList3
    Left = 519
    Top = 104
    object MenuItem3: TMenuItem
      Caption = 'Call ImageList editor'
      ImageIndex = 0
      OnClick = C1Click
    end
  end
  object PopupMenu5: TPopupMenu
    Images = sVirtualImageList4
    Left = 639
    Top = 104
    object MenuItem4: TMenuItem
      Caption = 'Call ImageList editor'
      ImageIndex = 0
      OnClick = C1Click
    end
  end
  object sVirtualImageList5: TsVirtualImageList
    Height = 64
    Width = 64
    AlphaImageList = MainForm.ImageList32
    Left = 80
    Top = 104
    Bitmap = {}
  end
end
