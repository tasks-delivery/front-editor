inherited Frame_Scrolls: TFrame_Scrolls
  Width = 663
  Height = 415
  object sGauge1: TsGauge [0]
    Left = 140
    Top = 32
    Width = 216
    Height = 23
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    Progress = 47
    Suffix = ' percents'
  end
  object sGauge2: TsGauge [1]
    Left = 43
    Top = 32
    Width = 32
    Height = 189
    Kind = gkVerticalBar
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    Progress = 47
    Suffix = '%'
  end
  object sLabel1: TsLabel [2]
    Left = 432
    Top = 69
    Width = 183
    Height = 16
    Caption = '`ShowProgressFrom` property:'
  end
  object sRadioButton1: TsRadioButton [3]
    Left = 177
    Top = 100
    Width = 69
    Height = 20
    Caption = 'Normal'
    Checked = True
    TabOrder = 7
    TabStop = True
    OnClick = sRadioButton1Click
  end
  object sProgressBar1: TsProgressBar [4]
    Left = 140
    Top = 69
    Width = 216
    Height = 25
    BorderWidth = 1
    Position = 47
    MarqueeInterval = 50
    TabOrder = 5
    SkinData.SkinSection = 'GAUGE'
  end
  object sProgressBar2: TsProgressBar [5]
    Left = 88
    Top = 32
    Width = 20
    Height = 189
    BorderWidth = 1
    Orientation = pbVertical
    Position = 47
    TabOrder = 6
    SkinData.SkinSection = 'GAUGE'
  end
  object sRadioButton2: TsRadioButton [6]
    Left = 249
    Top = 100
    Width = 78
    Height = 20
    Caption = 'Marquee'
    TabOrder = 8
    OnClick = sRadioButton2Click
  end
  object sCheckBox2: TsCheckBox [7]
    Left = 257
    Top = 250
    Width = 85
    Height = 20
    Caption = 'Show text'
    Checked = True
    State = cbChecked
    TabOrder = 10
    OnClick = sCheckBox2Click
  end
  object sScrollBar1: TsScrollBar [8]
    Tag = 5
    Left = 435
    Top = 86
    Width = 181
    Height = 16
    LargeChange = 10
    Max = 120
    PageSize = 20
    TabOrder = 1
    OnChange = sScrollBar1Change
    SkinManager = MainForm.sSkinManager1
  end
  object sEdit1: TsEdit [9]
    Left = 256
    Top = 203
    Width = 100
    Height = 24
    TabOrder = 11
    Text = ' percents'
    OnChange = sEdit1Change
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Gauge suffix:'
  end
  object sTrackBar1: TsTrackBar [10]
    Tag = 5
    Left = 435
    Top = 30
    Width = 181
    Height = 31
    Max = 100
    Frequency = 10
    Position = 47
    TabOrder = 0
    OnChange = sTrackBar1Change
    SkinData.SkinSection = 'TRACKBAR'
    ShowProgress = True
  end
  object sScrollBar3: TsScrollBar [11]
    Tag = 5
    Left = 391
    Top = 34
    Width = 16
    Height = 233
    Kind = sbVertical
    Max = 120
    PageSize = 20
    Position = 47
    TabOrder = 2
    OnChange = sScrollBar2Change
    SkinManager = MainForm.sSkinManager1
  end
  object sGroupBox1: TsGroupBox [12]
    Left = 432
    Top = 120
    Width = 184
    Height = 165
    Caption = 'Some trackbar options'
    TabOrder = 12
    object sCheckBox5: TsCheckBox
      Left = 57
      Top = 33
      Width = 85
      Height = 20
      Caption = 'Reversed'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = sCheckBox5Click
      TextIndent = 4
    end
    object sCheckBox6: TsCheckBox
      Left = 57
      Top = 61
      Width = 108
      Height = 20
      Caption = 'Custom draw'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = sCheckBox6Click
      TextIndent = 4
    end
    object sCheckBox3: TsCheckBox
      Left = 57
      Top = 90
      Width = 110
      Height = 20
      Caption = 'Custom slider'
      TabOrder = 2
      OnClick = sCheckBox3Click
      TextIndent = 4
    end
    object sTrackBar2: TsTrackBar
      Tag = 5
      Left = 3
      Top = 19
      Width = 48
      Height = 134
      Max = 100
      Orientation = trVertical
      Frequency = 10
      Position = 47
      TabOrder = 3
      TickStyle = tsNone
      OnChange = sTrackBar1Change
      SkinData.SkinSection = 'TRACKBAR'
      Reversed = True
      ShowProgress = True
      OnSkinPaint = sTrackBar2SkinPaint
      BarOffsetH = 6
    end
    object sCheckBox4: TsCheckBox
      Left = 57
      Top = 109
      Width = 116
      Height = 39
      Caption = 'Show TrackBar progress'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = sCheckBox4Click
      TextIndent = 4
      WordWrap = True
    end
  end
  object sGroupBox2: TsGroupBox [13]
    Left = 43
    Top = 308
    Width = 573
    Height = 69
    Caption = 'TsRangeSelector'
    TabOrder = 13
    object sRangeSelector1: TsRangeSelector
      Left = 61
      Top = 27
      Width = 199
      Height = 35
      TabOrder = 0
      Max = 100
      Frequency = 10
      Position2 = 90
      Position1 = 20
    end
    object sComboBox3: TsComboBox
      Left = 371
      Top = 28
      Width = 145
      Height = 24
      BoundLabel.Active = True
      BoundLabel.Caption = 'Changing mode:'
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'cmDepended'
      OnChange = sComboBox3Change
      Items.Strings = (
        'cmDepended'
        'cmUndepended'
        'cmIgnoredSecond')
    end
  end
  object sComboBox2: TsComboBox [14]
    Tag = 5
    Left = 256
    Top = 171
    Width = 100
    Height = 24
    BoundLabel.Active = True
    BoundLabel.Caption = 'Progress SkinSection:'
    ItemIndex = -1
    TabOrder = 4
    OnChange = sComboBox2Change
    Items.Strings = (
      'PANEL'
      'BUTTON'
      'GROUPBOX'
      'DIALOG'
      'PROGRESSH'
      'SPEEDBUTTON'
      'PROGRESSV')
  end
  object sCheckBox1: TsCheckBox [15]
    Left = 159
    Top = 250
    Width = 82
    Height = 20
    Caption = 'Animated'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = sCheckBox1Click
  end
  object sComboBox1: TsComboBox [16]
    Tag = 5
    Left = 256
    Top = 139
    Width = 100
    Height = 24
    BoundLabel.Active = True
    BoundLabel.Caption = 'SkinSection property:'
    ItemIndex = -1
    TabOrder = 3
    OnChange = sComboBox1Change
    Items.Strings = (
      'GAUGE'
      'TRANSPARENT'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'EDIT')
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 580
    Top = 4
  end
end
