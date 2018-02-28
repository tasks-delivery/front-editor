inherited Frame_ListView: TFrame_ListView
  Anchors = [akLeft, akTop, akBottom]
  object sListView1: TsListView [0]
    Left = 22
    Top = 122
    Width = 661
    Height = 258
    SkinData.SkinSection = 'EDIT'
    Anchors = [akLeft, akTop, akRight, akBottom]
    Checkboxes = True
    Columns = <
      item
        Caption = 'Column 1'
        ImageIndex = 0
        Width = 200
      end
      item
        Caption = 'Column 2'
        ImageIndex = 1
        Width = 100
      end
      item
        Alignment = taCenter
        AutoSize = True
        Caption = 'Column 3'
        ImageIndex = 6
      end>
    DragMode = dmAutomatic
    FullDrag = True
    HideSelection = False
    LargeImages = MainForm.sCharImageList1
    MultiSelect = True
    RowSelect = True
    ShowWorkAreas = True
    SmallImages = MainForm.sCharImageList1
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = sListView1CustomDrawItem
  end
  object sGroupBox10: TsGroupBox [1]
    Left = 22
    Top = 21
    Width = 219
    Height = 84
    Caption = 'ViewStyle'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    Images = MainForm.sCharImageList1
    ImageIndex = 6
    object sRadioButton21: TsRadioButton
      Tag = 5
      Left = 19
      Top = 26
      Width = 64
      Height = 20
      Caption = 'vsIcon'
      TabOrder = 0
      OnClick = sRadioButton21Change
    end
    object sRadioButton22: TsRadioButton
      Tag = 5
      Left = 108
      Top = 26
      Width = 59
      Height = 20
      HelpContext = 1
      Caption = 'vsList'
      TabOrder = 1
      OnClick = sRadioButton22Change
    end
    object sRadioButton23: TsRadioButton
      Tag = 5
      Left = 19
      Top = 52
      Width = 78
      Height = 20
      HelpContext = 2
      Caption = 'vsReport'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = sRadioButton23Change
    end
    object sRadioButton24: TsRadioButton
      Tag = 5
      Left = 108
      Top = 52
      Width = 96
      Height = 20
      HelpContext = 3
      Caption = 'vsSmallIcon'
      TabOrder = 3
      OnClick = sRadioButton24Change
    end
  end
  object sButton1: TsButton [2]
    Left = 512
    Top = 48
    Width = 125
    Height = 37
    Caption = 'Add 1000 items'
    TabOrder = 2
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sCheckBox1: TsCheckBox [3]
    Left = 268
    Top = 29
    Width = 100
    Height = 20
    Caption = 'Show glyphs'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = sCheckBox1Click
  end
  object sCheckBox2: TsCheckBox [4]
    Left = 268
    Top = 56
    Width = 95
    Height = 20
    Caption = 'Checkboxes'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = sCheckBox2Click
  end
  object sCheckBox3: TsCheckBox [5]
    Left = 376
    Top = 29
    Width = 81
    Height = 20
    Caption = 'Grid lines'
    TabOrder = 5
    OnClick = sCheckBox3Click
  end
  object sCheckBox4: TsCheckBox [6]
    Left = 268
    Top = 82
    Width = 90
    Height = 20
    Caption = 'Row select'
    Checked = True
    State = cbChecked
    TabOrder = 6
    OnClick = sCheckBox4Click
  end
  object sCheckBox5: TsCheckBox [7]
    Left = 376
    Top = 56
    Width = 79
    Height = 20
    Caption = 'HotTrack'
    TabOrder = 7
    OnClick = sCheckBox5Click
  end
  object sCheckBox6: TsCheckBox [8]
    Left = 376
    Top = 82
    Width = 104
    Height = 20
    Caption = 'Colored rows'
    Checked = True
    State = cbChecked
    TabOrder = 8
    OnClick = sCheckBox6Click
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 8
    Top = 8
  end
end
