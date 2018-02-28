inherited Frame_Forms: TFrame_Forms
  object sGroupBox7: TsGroupBox [0]
    Left = 39
    Top = 144
    Width = 141
    Height = 205
    Caption = 'Border style'
    TabOrder = 0
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object sRadioButton12: TsRadioButton
      Tag = 5
      Left = 14
      Top = 25
      Width = 76
      Height = 20
      Caption = 'bsDialog'
      TabOrder = 0
      OnClick = sRadioButton12Click
    end
    object sRadioButton13: TsRadioButton
      Tag = 5
      Left = 14
      Top = 53
      Width = 70
      Height = 20
      Caption = 'bsNone'
      TabOrder = 1
      OnClick = sRadioButton12Click
    end
    object sRadioButton14: TsRadioButton
      Tag = 5
      Left = 14
      Top = 82
      Width = 76
      Height = 20
      Caption = 'bsSingle'
      TabOrder = 2
      OnClick = sRadioButton12Click
    end
    object sRadioButton15: TsRadioButton
      Tag = 5
      Left = 14
      Top = 111
      Width = 89
      Height = 20
      Caption = 'bsSizeable'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = sRadioButton12Click
    end
    object sRadioButton16: TsRadioButton
      Tag = 5
      Left = 14
      Top = 140
      Width = 112
      Height = 20
      Caption = 'bsSizeToolWin'
      TabOrder = 4
      OnClick = sRadioButton12Click
    end
    object sRadioButton17: TsRadioButton
      Tag = 5
      Left = 14
      Top = 169
      Width = 112
      Height = 20
      Caption = 'bsToolWindow'
      TabOrder = 5
      OnClick = sRadioButton12Click
    end
  end
  object sGroupBox2: TsGroupBox [1]
    Left = 482
    Top = 144
    Width = 185
    Height = 137
    Caption = 'Allow skinning of form'
    TabOrder = 7
    CheckBoxVisible = True
    Checked = True
    OnCheckBoxChanged = sGroupBox2CheckBoxChanged
    object sCheckBox20: TsCheckBox
      Tag = 5
      Left = 17
      Top = 98
      Width = 86
      Height = 20
      Caption = 'Show grip'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object sCheckBox19: TsCheckBox
      Tag = 5
      Left = 17
      Top = 65
      Width = 112
      Height = 20
      Caption = 'Show app icon'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = sCheckBox19Change
    end
    object sCheckBox2: TsCheckBox
      Tag = 5
      Left = 17
      Top = 20
      Width = 165
      Height = 41
      Caption = 'Make a title menu for choosing of skins'
      AutoSize = False
      Checked = True
      State = cbChecked
      TabOrder = 2
      WordWrap = True
    end
  end
  object sComboBox1: TsComboBox [2]
    Tag = 5
    Left = 39
    Top = 89
    Width = 173
    Height = 24
    BoundLabel.Active = True
    BoundLabel.Caption = 'SkinSection name:'
    BoundLabel.Layout = sclTopLeft
    SkinData.SkinSection = 'COMBOBOX'
    ItemIndex = -1
    TabOrder = 5
    Text = 'DIALOG'
    Items.Strings = (
      'FORM'
      'DIALOG'
      'BUTTON'
      'PAGECONTROL')
  end
  object sGroupBox8: TsGroupBox [3]
    Left = 191
    Top = 144
    Width = 141
    Height = 151
    Caption = 'Border icons'
    TabOrder = 2
    CaptionLayout = clTopCenter
    SkinData.SkinSection = 'GROUPBOX'
    object sCheckBox9: TsCheckBox
      Tag = 5
      Left = 16
      Top = 28
      Width = 111
      Height = 20
      Caption = 'biSystemMenu'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object sCheckBox15: TsCheckBox
      Tag = 5
      Left = 16
      Top = 57
      Width = 91
      Height = 20
      Caption = 'biMaximize'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object sCheckBox16: TsCheckBox
      Tag = 5
      Left = 16
      Top = 86
      Width = 88
      Height = 20
      Caption = 'biMinimize'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object sCheckBox17: TsCheckBox
      Tag = 5
      Left = 16
      Top = 116
      Width = 63
      Height = 20
      Caption = 'biHelp'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object sGroupBox9: TsGroupBox [4]
    Left = 341
    Top = 144
    Width = 132
    Height = 125
    Caption = 'Caption alignment'
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object sRadioButton18: TsRadioButton
      Tag = 5
      Left = 14
      Top = 28
      Width = 95
      Height = 20
      Caption = 'taLeftJustify'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = sRadioButton18Change
    end
    object sRadioButton19: TsRadioButton
      Tag = 5
      Left = 14
      Top = 57
      Width = 77
      Height = 20
      Caption = 'taCenter'
      TabOrder = 1
      OnClick = sRadioButton19Change
    end
    object sRadioButton20: TsRadioButton
      Tag = 5
      Left = 14
      Top = 86
      Width = 103
      Height = 20
      Caption = 'taRightJustify'
      TabOrder = 2
      OnClick = sRadioButton20Change
    end
  end
  object sEdit2: TsEdit [5]
    Tag = 5
    Left = 39
    Top = 44
    Width = 173
    Height = 24
    TabOrder = 4
    Text = 'Test form with custom title'
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Caption text:'
    BoundLabel.Layout = sclTopLeft
  end
  object sButton1: TsButton [6]
    Tag = 5
    Left = 471
    Top = 44
    Width = 146
    Height = 66
    Caption = 'Create and show'
    TabOrder = 1
    OnClick = sButton1Click
  end
  object sGroupBox1: TsGroupBox [7]
    Left = 255
    Top = 40
    Width = 173
    Height = 71
    Caption = 'Main form blackout'
    TabOrder = 6
    CaptionLayout = clTopCenter
    CheckBoxVisible = True
    OnCheckBoxChanged = sGroupBox1CheckBoxChanged
    object sColorBox1: TsColorBox
      Tag = 3
      Left = 32
      Top = 32
      Width = 113
      Height = 25
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor]
      PopupMode = pmPickColor
      Enabled = False
      TabOrder = 0
    end
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 424
    Top = 40
  end
end
