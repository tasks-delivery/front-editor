inherited Frame_Buttons: TFrame_Buttons
  object sLabel5: TsLabel [0]
    Tag = 5
    Left = 455
    Top = 189
    Width = 68
    Height = 16
    SkinManager = MainForm.sSkinManager1
    Caption = 'HUE offset: '
  end
  object sLabel6: TsLabel [1]
    Tag = 5
    Left = 645
    Top = 189
    Width = 7
    Height = 16
    SkinManager = MainForm.sSkinManager1
    Caption = '0'
  end
  object sLabel7: TsLabel [2]
    Tag = 5
    Left = 48
    Top = 292
    Width = 360
    Height = 16
    SkinManager = MainForm.sSkinManager1
    Caption = 'Buttons with SkinData.SkinSection property = '#39'BUTTON_HUGE'#39':'
  end
  object sSpeedButton3: TsSpeedButton [3]
    Left = 610
    Top = 150
    Width = 41
    Height = 22
    Caption = 'Reset'
    Enabled = False
    OnClick = sSpeedButton3Click
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object sGroupBox2: TsGroupBox [4]
    Tag = 5
    Left = 439
    Top = 224
    Width = 221
    Height = 155
    Caption = ' Glyphs: '
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Tag = 5
      Left = 15
      Top = 55
      Width = 53
      Height = 16
      Alignment = taRightJustify
      SkinManager = MainForm.sSkinManager1
      Caption = 'Blending:'
    end
    object sLabel2: TsLabel
      Tag = 5
      Left = 189
      Top = 55
      Width = 7
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '0'
    end
    object sLabel3: TsLabel
      Tag = 5
      Left = 189
      Top = 26
      Width = 14
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '32'
    end
    object sLabel4: TsLabel
      Tag = 5
      Left = 36
      Top = 26
      Width = 29
      Height = 16
      Alignment = taRightJustify
      SkinManager = MainForm.sSkinManager1
      Caption = 'Size:'
    end
    object sSpeedButton4: TsSpeedButton
      Left = 151
      Top = 114
      Width = 41
      Height = 22
      Caption = 'Reset'
      Enabled = False
      OnClick = sSpeedButton4Click
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sCheckBox1: TsCheckBox
      Tag = 5
      Left = 36
      Top = 84
      Width = 68
      Height = 20
      Caption = 'Grayed'
      TabOrder = 0
      OnClick = sCheckBox1Click
    end
    object sTrackBar1: TsTrackBar
      Tag = 5
      Left = 69
      Top = 50
      Width = 116
      Height = 25
      Max = 100
      Frequency = 5
      TabOrder = 1
      OnChange = sTrackBar1Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
    end
    object sCheckBox2: TsCheckBox
      Tag = 5
      Left = 120
      Top = 84
      Width = 81
      Height = 20
      Caption = 'Reflected'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = sCheckBox2Click
    end
    object sTrackBar2: TsTrackBar
      Tag = 5
      Left = 69
      Top = 22
      Width = 116
      Height = 25
      Max = 32
      Min = 8
      Position = 32
      TabOrder = 3
      OnChange = sTrackBar2Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
    end
    object sColorBox2: TsColorBox
      Left = 88
      Top = 114
      Width = 57
      BoundLabel.Active = True
      BoundLabel.Caption = 'Color tone:'
      Style = [cbStandardColors, cbExtendedColors, cbIncludeNone, cbCustomColor]
      ShowColorName = False
      Selected = clNone
      NoneColorColor = clNone
      PopupMode = pmPickColor
      TabOrder = 4
      OnChange = sColorBox2Change
    end
  end
  object sColorBox1: TsColorBox [5]
    Left = 516
    Top = 150
    Width = 89
    BoundLabel.Active = True
    BoundLabel.Caption = 'Color tone:'
    Style = [cbStandardColors, cbExtendedColors, cbIncludeNone, cbCustomColor]
    ShowColorName = False
    Selected = clNone
    NoneColorColor = clNone
    PopupMode = pmPickColor
    TabOrder = 9
    OnChange = sColorBox1Change
  end
  object sCheckBox3: TsCheckBox [6]
    Left = 13
    Top = 64
    Width = 49
    Height = 20
    Caption = 'Flat'
    Checked = True
    State = cbChecked
    TabOrder = 8
    OnClick = sCheckBox3Click
  end
  object sBitBtn8: TsBitBtn [7]
    Tag = 5
    Left = 187
    Top = 315
    Width = 64
    Height = 64
    TabOrder = 2
    Reflected = True
    ImageIndex = 1
    Images = MainForm.ImageList32
    SkinData.SkinSection = 'BUTTON_HUGE'
  end
  object sBitBtn4: TsBitBtn [8]
    Tag = 5
    Left = 44
    Top = 315
    Width = 64
    Height = 64
    TabOrder = 11
    Reflected = True
    ImageIndex = 3
    Images = MainForm.ImageList32
    SkinData.SkinSection = 'BUTTON_HUGE'
  end
  object sTrackBar3: TsTrackBar [9]
    Tag = 5
    Left = 516
    Top = 182
    Width = 129
    Height = 29
    Max = 360
    Frequency = 10
    TabOrder = 7
    TickStyle = tsNone
    OnChange = sTrackBar3Change
    SkinData.SkinSection = 'TRACKBAR'
    ShowProgress = True
  end
  object sPanel2: TsPanel [10]
    Left = 44
    Top = 104
    Width = 341
    Height = 169
    BevelOuter = bvLowered
    TabOrder = 4
    SkinData.SkinSection = 'PANEL_LOW'
    SkinData.OuterEffects.Visibility = ovAlways
    object sSpeedButton1: TsSpeedButton
      Tag = 5
      Left = 276
      Top = 12
      Width = 54
      Height = 45
      Flat = True
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'SPEEDBUTTON'
      Images = MainForm.ImageList32
      TextAlignment = taLeftJustify
      ImageIndex = 6
      ShowCaption = False
    end
    object sSpeedButton2: TsSpeedButton
      Tag = 5
      Left = 276
      Top = 62
      Width = 54
      Height = 45
      Flat = True
      Layout = blGlyphTop
      Spacing = 0
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'SPEEDBUTTON'
      DropdownMenu = PopupMenu1
      Images = MainForm.ImageList32
      TextAlignment = taLeftJustify
      ImageIndex = 7
      ShowCaption = False
    end
    object sBitBtn1: TsBitBtn
      Tag = 5
      Left = 12
      Top = 116
      Width = 100
      Height = 45
      Caption = 'Default'#13#10'button'
      Default = True
      Spacing = 5
      TabOrder = 0
      ImageIndex = 9
      Images = MainForm.ImageList32
    end
    object sButton1: TsButton
      Tag = 5
      Left = 12
      Top = 12
      Width = 252
      Height = 96
      Caption = 'bsCommandLink'
      CommandLinkHint = 
        'This style is supported in TsButton in all Delphi and Windows ve' +
        'rsions'
      DisabledImageIndex = 2
      HotImageIndex = 1
      ImageIndex = 0
      ImageMargins.Left = 2
      ImageMargins.Right = 2
      Images = MainForm.ImageList32
      PressedImageIndex = 3
      SelectedImageIndex = 4
      Style = bsCommandLink
      TabOrder = 1
      ShowFocus = False
      Reflected = True
      ContentMargin = 12
    end
    object sBitBtn2: TsBitBtn
      Tag = 5
      Left = 121
      Top = 116
      Width = 100
      Height = 45
      Caption = 'Red'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Spacing = 5
      TabOrder = 2
      ImageIndex = 5
      Images = MainForm.ImageList32
      SkinData.CustomFont = True
    end
    object sBitBtn5: TsBitBtn
      Tag = 5
      Left = 230
      Top = 116
      Width = 100
      Height = 45
      Caption = 'Blue'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Spacing = 5
      TabOrder = 3
      ImageIndex = 2
      Images = MainForm.ImageList32
      SkinData.CustomFont = True
    end
  end
  object sBitBtn3: TsBitBtn [11]
    Tag = 5
    Left = 259
    Top = 315
    Width = 146
    Height = 64
    Caption = 'Exit'
    TabOrder = 0
    OnClick = sBitBtn3Click
    Reflected = True
    ImageIndex = 4
    Images = MainForm.ImageList32
    SkinData.SkinSection = 'BUTTON_HUGE'
  end
  object sBitBtn6: TsBitBtn [12]
    Tag = 5
    Left = 116
    Top = 315
    Width = 64
    Height = 64
    TabOrder = 5
    Reflected = True
    ImageIndex = 8
    Images = MainForm.ImageList32
    SkinData.SkinSection = 'BUTTON_HUGE'
  end
  object sComboBox2: TsComboBox [13]
    Tag = 5
    Left = 556
    Top = 64
    Width = 137
    BoundLabel.Active = True
    BoundLabel.Indent = 2
    BoundLabel.Caption = 'Parent controls SkinData.SkinSection property value:'
    Style = csDropDownList
    ItemIndex = 3
    TabOrder = 1
    Text = 'PANEL'
    OnChange = sComboBox2Change
    Items.Strings = (
      'BUTTON_BIG'
      'TRANSPARENT'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'BAR'
      'DRAGBAR'
      'PROGRESSH'
      'TOOLBAR'
      'GRIPH')
  end
  object sCoolBar1: TsCoolBar [14]
    Left = 0
    Top = 0
    Width = 703
    Height = 57
    Align = alNone
    BandBorderStyle = bsNone
    Bands = <
      item
        Break = False
        Control = sToolBar1
        ImageIndex = -1
        MinHeight = 36
        Width = 163
      end
      item
        Break = False
        Control = sToolBar2
        ImageIndex = -1
        MinHeight = 36
        Width = 520
      end>
    BorderWidth = 4
    EdgeBorders = []
    SkinData.SkinSection = 'TOOLBAR'
    SkinData.OuterEffects.Visibility = ovAlways
    object sToolBar2: TsToolBar
      Left = 176
      Top = 0
      Width = 511
      Height = 36
      Align = alNone
      ButtonHeight = 38
      ButtonWidth = 39
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.sCharImageList1
      TabOrder = 0
      Transparent = True
      SkinData.SkinSection = 'TRANSPARENT'
      object ToolButton1: TToolButton
        Tag = 5
        Left = 0
        Top = 0
        ImageIndex = 15
      end
      object ToolButton8: TToolButton
        Tag = 5
        Left = 39
        Top = 0
        Grouped = True
        ImageIndex = 14
        Style = tbsCheck
      end
      object ToolButton6: TToolButton
        Tag = 5
        Left = 78
        Top = 0
        Grouped = True
        ImageIndex = 13
        Style = tbsCheck
      end
      object ToolButton5: TToolButton
        Left = 117
        Top = 0
        Width = 8
        ImageIndex = 4
        Style = tbsDivider
      end
      object ToolButton7: TToolButton
        Tag = 5
        Left = 125
        Top = 0
        Grouped = True
        ImageIndex = 6
        Style = tbsCheck
      end
      object ToolButton4: TToolButton
        Tag = 5
        Left = 164
        Top = 0
        DropdownMenu = PopupMenu1
        ImageIndex = 16
      end
    end
    object sToolBar1: TsToolBar
      Left = 11
      Top = 0
      Width = 150
      Height = 36
      Align = alNone
      ButtonHeight = 38
      ButtonWidth = 39
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = MainForm.sCharImageList1
      TabOrder = 1
      Transparent = True
      SkinData.SkinSection = 'TRANSPARENT'
      object ToolButton2: TToolButton
        Tag = 5
        Left = 0
        Top = 0
        ImageIndex = 17
      end
      object ToolButton10: TToolButton
        Tag = 5
        Left = 39
        Top = 0
        ImageIndex = 4
      end
      object ToolButton12: TToolButton
        Tag = 5
        Left = 78
        Top = 0
        ImageIndex = 18
      end
    end
  end
  object sComboBox4: TsComboBox [15]
    Tag = 5
    Left = 516
    Top = 115
    Width = 137
    Height = 24
    BoundLabel.Active = True
    BoundLabel.Indent = 2
    BoundLabel.Caption = 'SkinSection:'
    Style = csDropDownList
    ItemIndex = 4
    TabOrder = 6
    Text = 'BUTTON'
    OnChange = sComboBox4Change
    Items.Strings = (
      'TOOLBUTTON'
      'BUTTON_BIG'
      'BUTTON_HUGE'
      'TRANSPARENT'
      'BUTTON'
      'SPEEDBUTTON'
      'SPEEDBUTTON_SMALL'
      'WEBBUTTON')
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 84
    Top = 36
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 505
    Top = 78
    object Item11: TMenuItem
      Caption = 'Item 1'
    end
    object Item21: TMenuItem
      Caption = 'Item 2'
    end
    object Item31: TMenuItem
      Caption = 'Item 3'
    end
    object Item41: TMenuItem
      Caption = 'Item 4'
      object Subitem411: TMenuItem
        Caption = 'Subitem 41'
      end
      object Subitem421: TMenuItem
        Caption = 'Subitem 42'
      end
      object Subitem431: TMenuItem
        Caption = 'Subitem 43'
      end
      object Subitem441: TMenuItem
        Caption = 'Subitem 44'
      end
      object Subitem451: TMenuItem
        Caption = 'Subitem 45'
      end
      object Subitem461: TMenuItem
        Caption = 'Subitem 46'
      end
      object Subitem471: TMenuItem
        Caption = 'Subitem 47'
      end
    end
  end
end
