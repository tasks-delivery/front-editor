inherited Frame_Magn: TFrame_Magn
  object sLabel1: TsLabel [0]
    Left = 80
    Top = 287
    Width = 67
    Height = 13
    Caption = 'Scaling value:'
  end
  object sLabel2: TsLabel [1]
    Left = 152
    Top = 287
    Width = 11
    Height = 13
    Caption = '4x'
  end
  object sSpeedButton1: TsSpeedButton [2]
    Left = 64
    Top = 56
    Width = 145
    Height = 73
    Caption = 'Show magnifier'
    OnClick = sSpeedButton1Click
    Images = MainForm.ImageList32
    ImageIndex = 9
  end
  object sRadioGroup2: TsRadioGroup [3]
    Left = 264
    Top = 56
    Width = 145
    Height = 73
    Caption = 'Style:'
    TabOrder = 2
    CaptionMargin.Right = 0
    ContentVOffset = 4
    Items.Strings = (
      'Rectangular'
      'Round lense')
    OnChange = sRadioGroup2Change
  end
  object sCheckBox1: TsCheckBox [4]
    Left = 72
    Top = 168
    Width = 117
    Height = 17
    Caption = 'Show popup menu'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = sCheckBox1Click
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sTrackBar1: TsTrackBar [5]
    Left = 72
    Top = 304
    Width = 137
    Height = 45
    Max = 8
    Min = 2
    Position = 2
    TabOrder = 4
    OnChange = sTrackBar1Change
    BarOffsetV = 0
    BarOffsetH = 0
  end
  object sCheckBox2: TsCheckBox [6]
    Left = 72
    Top = 202
    Width = 133
    Height = 17
    Caption = 'Custom screen source'
    TabOrder = 5
    OnClick = sCheckBox2Click
    ImgChecked = 0
    ImgUnchecked = 0
  end
  object sRadioGroup1: TsRadioGroup [7]
    Left = 264
    Top = 168
    Width = 145
    Height = 105
    Caption = 'Borders style:'
    TabOrder = 0
    CaptionMargin.Right = 0
    ContentVOffset = 6
    Items.Strings = (
      'Default'
      'Flat'
      'None')
    OnChange = sRadioGroup1Change
  end
  object sColorBox1: TsColorBox [8]
    Left = 264
    Top = 304
    Width = 145
    Height = 22
    BoundLabel.Active = True
    BoundLabel.Caption = 'Border color:'
    BoundLabel.Layout = sclTopLeft
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
    ShowColorName = False
    PopupMode = pmPickColor
    DropDownCount = 8
    Enabled = False
    ItemHeight = 16
    TabOrder = 1
    OnChange = sColorBox1Change
  end
  object sCheckBox3: TsCheckBox [9]
    Left = 72
    Top = 236
    Width = 80
    Height = 17
    Caption = 'Resizeable'
    TabOrder = 6
    OnClick = sCheckBox3Click
    ImgChecked = 0
    ImgUnchecked = 0
  end
end
