inherited Frame_Buttons2: TFrame_Buttons2
  Height = 399
  object sRadioGroup1: TsRadioGroup [0]
    Left = 32
    Top = 116
    Width = 154
    Height = 105
    Caption = 'Alignment'
    TabOrder = 1
    OnClick = sRadioGroup1Click
    SkinData.SkinSection = 'GROUPBOX'
    ItemIndex = 2
    ContentVOffset = 6
    Items.Strings = (
      'taLeftJustify'
      'taRightJustify'
      'taCenter')
  end
  object sSpinEdit2: TsSpinEdit [1]
    Left = 368
    Top = 72
    Width = 81
    TabOrder = 9
    Text = '4'
    OnChange = sSpinEdit2Change
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Spacing:'
    MaxValue = 14
    MinValue = 0
    Value = 4
  end
  object sCheckBox1: TsCheckBox [2]
    Left = 488
    Top = 40
    Width = 105
    Height = 20
    Caption = 'Show caption'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = sCheckBox1Click
  end
  object sRadioGroup3: TsRadioGroup [3]
    Left = 432
    Top = 116
    Width = 154
    Height = 105
    Caption = 'Text alignment'
    Enabled = False
    TabOrder = 4
    OnClick = sRadioGroup3Click
    SkinData.SkinSection = 'GROUPBOX'
    ItemIndex = 2
    ContentVOffset = 6
    Items.Strings = (
      'taLeftJustify'
      'taRightJustify'
      'taCenter')
  end
  object sCheckBox2: TsCheckBox [4]
    Left = 488
    Top = 72
    Width = 94
    Height = 20
    Caption = 'Show glyph'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnClick = sCheckBox2Click
  end
  object sRadioGroup2: TsRadioGroup [5]
    Left = 224
    Top = 116
    Width = 170
    Height = 105
    Caption = 'Vertical alignment'
    TabOrder = 2
    OnClick = sRadioGroup2Click
    SkinData.SkinSection = 'GROUPBOX'
    ItemIndex = 2
    ContentVOffset = 6
    Items.Strings = (
      'taAlignTop'
      'taAlignBottom'
      'taVerticalCenter')
  end
  object sGroupBox1: TsGroupBox [6]
    Left = 224
    Top = 248
    Width = 170
    Height = 129
    Caption = 'Disable control'
    TabOrder = 6
    SkinData.SkinSection = 'GROUPBOX'
    CheckBoxVisible = True
    OnCheckBoxChanged = sGroupBox1CheckBoxChanged
    object sCheckBox3: TsCheckBox
      Left = 14
      Top = 26
      Width = 105
      Height = 20
      Caption = 'AlphaBlended'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 0
      OnClick = sCheckBox3Click
    end
    object sCheckBox4: TsCheckBox
      Left = 14
      Top = 50
      Width = 68
      Height = 20
      Caption = 'Grayed'
      Enabled = False
      TabOrder = 1
      OnClick = sCheckBox4Click
    end
    object sCheckBox5: TsCheckBox
      Left = 14
      Top = 74
      Width = 139
      Height = 20
      Caption = 'AlphaBlended glyph'
      Enabled = False
      TabOrder = 2
      OnClick = sCheckBox5Click
    end
    object sCheckBox6: TsCheckBox
      Left = 14
      Top = 98
      Width = 102
      Height = 20
      Caption = 'Grayed glyph'
      Enabled = False
      TabOrder = 3
      OnClick = sCheckBox6Click
    end
  end
  object sComboBox1: TsComboBox [7]
    Left = 480
    Top = 359
    Width = 121
    BoundLabel.Active = True
    BoundLabel.Caption = 'Section:'
    Style = csDropDownList
    ItemIndex = -1
    TabOrder = 11
    OnChange = sComboBox1Change
    Items.Strings = (
      'TOOLBUTTON'
      'SPEEDBUTTON'
      'BUTTON')
  end
  object sBitBtn2: TsBitBtn [8]
    Tag = 5
    Left = 424
    Top = 248
    Width = 185
    Height = 97
    Caption = 'Button with child '#13#10'controls'
    Margin = 10
    Spacing = 8
    TabOrder = 10
    AcceptsControls = True
    Reflected = True
    ShowFocus = False
    ImageIndex = 9
    Images = MainForm.ImageList32
    VerticalAlignment = taAlignTop
    SkinData.SkinSection = 'SPEEDBUTTON'
    object sWebLabel1: TsWebLabel
      Left = 68
      Top = 47
      Width = 100
      Height = 13
      Caption = 'www.alphaskins.com'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HoverFont.Charset = DEFAULT_CHARSET
      HoverFont.Color = clWindowText
      HoverFont.Height = -11
      HoverFont.Name = 'Tahoma'
      HoverFont.Style = []
      URL = 'http://www.alphaskins.com'
    end
    object sGauge1: TsGauge
      Left = 16
      Top = 70
      Width = 154
      Height = 15
      SkinData.SkinSection = 'GAUGE'
      ForeColor = clBlack
      Animated = False
      Progress = 47
      Suffix = '%'
    end
  end
  object sGroupBox2: TsGroupBox [9]
    Left = 32
    Top = 248
    Width = 153
    Height = 129
    Caption = 'Glyph layout'
    TabOrder = 7
    SkinData.SkinSection = 'GROUPBOX'
    object sRadioButton1: TsRadioButton
      Left = 16
      Top = 26
      Width = 90
      Height = 20
      Caption = 'blGlyphLeft'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = sRadioButton1Click
    end
    object sRadioButton2: TsRadioButton
      Tag = 1
      Left = 16
      Top = 50
      Width = 98
      Height = 20
      Caption = 'blGlyphRight'
      TabOrder = 1
      OnClick = sRadioButton1Click
    end
    object sRadioButton3: TsRadioButton
      Tag = 2
      Left = 16
      Top = 74
      Width = 91
      Height = 20
      Caption = 'blGlyphTop'
      TabOrder = 2
      OnClick = sRadioButton1Click
    end
    object sRadioButton4: TsRadioButton
      Tag = 3
      Left = 16
      Top = 98
      Width = 109
      Height = 20
      Caption = 'blGlyphBottom'
      TabOrder = 3
      OnClick = sRadioButton1Click
    end
  end
  object sBitBtn1: TsBitBtn [10]
    Tag = 5
    Left = 32
    Top = 24
    Width = 242
    Height = 73
    Caption = 'Test of content alignment'
    Spacing = 8
    TabOrder = 0
    Reflected = True
    ShowFocus = False
    ImageIndex = 9
    Images = MainForm.ImageList32
  end
  object sSpinEdit1: TsSpinEdit [11]
    Left = 368
    Top = 40
    Width = 81
    Height = 24
    Enabled = False
    TabOrder = 8
    Text = '-1'
    OnChange = sSpinEdit1Change
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Margin:'
    MaxValue = 22
    MinValue = -1
    Value = -1
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 4
  end
end
