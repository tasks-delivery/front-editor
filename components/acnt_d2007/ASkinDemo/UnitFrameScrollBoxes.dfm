inherited Frame_ScrollBoxes: TFrame_ScrollBoxes
  Height = 475
  object sComboBox1: TsComboBox [0]
    Tag = 5
    Left = 148
    Top = 17
    Width = 141
    BoundLabel.Active = True
    BoundLabel.Caption = 'SkinSection property:'
    DropDownCount = 10
    ItemIndex = -1
    TabOrder = 1
    OnChange = sComboBox1Change
    Items.Strings = (
      'ALPHAEDIT'
      'EDIT'
      'TRANSPARENT'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'DIALOG'
      'DRAGBAR'
      'EDIT'
      'PROGRESSH'
      'GRIPH'
      'EXTRALINE'
      'HINT')
  end
  object sCheckBox1: TsCheckBox [1]
    Left = 304
    Top = 18
    Width = 127
    Height = 20
    Caption = 'AutoMouseWheel'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = sCheckBox1Click
  end
  object sScrollBox1: TsScrollBox [2]
    Left = 17
    Top = 51
    Width = 672
    Height = 408
    HorzScrollBar.Increment = 38
    HorzScrollBar.Range = 800
    HorzScrollBar.Tracking = True
    VertScrollBar.Increment = 26
    VertScrollBar.Range = 800
    VertScrollBar.Tracking = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoMouseWheel = True
    AutoScroll = False
    TabOrder = 0
    SkinData.SkinSection = 'PANEL_LOW'
    object sGauge1: TsGauge
      Left = 430
      Top = 186
      Width = 177
      Height = 21
      SkinData.SkinSection = 'GAUGE'
      ForeColor = clBlack
      Progress = 47
      Suffix = '%'
    end
    object sSpinEdit2: TsSpinEdit
      Tag = 5
      Left = 314
      Top = 97
      Width = 95
      TabOrder = 0
      Text = '0'
      SkinData.SkinSection = 'EDIT'
      MaxValue = 0
      MinValue = 0
      Value = 0
    end
    object sMemo2: TsMemo
      Tag = 5
      Left = 13
      Top = 17
      Width = 283
      Height = 100
      Lines.Strings = (
        'sMemo2')
      TabOrder = 1
      Text = 'sMemo2'
      SkinData.SkinSection = 'EDIT'
    end
    object sCurrencyEdit2: TsCurrencyEdit
      Tag = 5
      Left = 314
      Top = 17
      Width = 95
      Height = 21
      AutoSize = False
      TabOrder = 2
      SkinData.SkinSection = 'EDIT'
    end
    object sCurrencyEdit3: TsCurrencyEdit
      Tag = 5
      Left = 314
      Top = 44
      Width = 95
      Height = 21
      AutoSize = False
      TabOrder = 3
      SkinData.SkinSection = 'EDIT'
    end
    object sSpinEdit3: TsSpinEdit
      Tag = 5
      Left = 314
      Top = 70
      Width = 95
      TabOrder = 4
      Text = '0'
      SkinData.SkinSection = 'EDIT'
      MaxValue = 0
      MinValue = 0
      Value = 0
    end
    object sTrackBar2: TsTrackBar
      Tag = 5
      Left = 21
      Top = 127
      Width = 388
      Height = 33
      Max = 100
      Frequency = 10
      Position = 47
      TabOrder = 5
      OnChange = sTrackBar2Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
    end
    object sGroupBox3: TsGroupBox
      Left = 430
      Top = 13
      Width = 179
      Height = 162
      Caption = 'sGroupBox3'
      TabOrder = 6
      SkinData.SkinSection = 'GROUPBOX'
      object sCheckBox10: TsCheckBox
        Tag = 5
        Left = 28
        Top = 29
        Width = 102
        Height = 20
        Caption = 'sCheckBox10'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object sCheckBox11: TsCheckBox
        Tag = 5
        Left = 28
        Top = 54
        Width = 102
        Height = 20
        Caption = 'sCheckBox11'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object sCheckBox12: TsCheckBox
        Tag = 5
        Left = 28
        Top = 79
        Width = 102
        Height = 20
        Caption = 'sCheckBox12'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object sCheckBox13: TsCheckBox
        Tag = 5
        Left = 28
        Top = 104
        Width = 102
        Height = 20
        Caption = 'sCheckBox13'
        TabOrder = 3
      end
      object sCheckBox14: TsCheckBox
        Tag = 5
        Left = 28
        Top = 129
        Width = 102
        Height = 20
        Caption = 'sCheckBox14'
        TabOrder = 4
      end
    end
    object sPageControl1: TsPageControl
      Tag = 5
      Left = 16
      Top = 272
      Width = 592
      Height = 271
      ActivePage = sTabSheet1
      HotTrack = True
      Images = MainForm.sCharImageList1
      TabHeight = 26
      TabOrder = 7
      SkinData.SkinSection = 'PAGECONTROL'
      object sTabSheet1: TsTabSheet
        Caption = 'sTabSheet1'
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet2: TsTabSheet
        Caption = 'sTabSheet2'
        ImageIndex = 1
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet3: TsTabSheet
        Caption = 'sTabSheet3'
        ImageIndex = 2
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet4: TsTabSheet
        Caption = 'sTabSheet4'
        ImageIndex = 3
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet5: TsTabSheet
        Caption = 'sTabSheet5'
        ImageIndex = 4
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet6: TsTabSheet
        Caption = 'sTabSheet6'
        ImageIndex = 5
        SkinData.SkinSection = 'TABSHEET'
      end
      object sTabSheet7: TsTabSheet
        Caption = 'sTabSheet7'
        ImageIndex = 6
      end
      object sTabSheet8: TsTabSheet
        Caption = 'sTabSheet8'
        ImageIndex = 7
      end
    end
    object sPanel1: TsPanel
      Tag = 5
      Left = 430
      Top = 220
      Width = 177
      Height = 41
      Caption = ' '
      TabOrder = 8
      SkinData.SkinSection = 'PANEL'
      object sButton4: TsButton
        Tag = 5
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'sButton4'
        TabOrder = 0
      end
      object sButton5: TsButton
        Tag = 5
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = 'sButton5'
        TabOrder = 1
      end
    end
    object sPanel2: TsPanel
      Left = 12
      Top = 176
      Width = 397
      Height = 85
      Caption = ' '
      TabOrder = 9
      SkinData.SkinSection = 'PANEL'
      object sPanel3: TsPanel
        Left = 4
        Top = 4
        Width = 261
        Height = 57
        Caption = ' '
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object sButton1: TsButton
          Tag = 5
          Left = 9
          Top = 8
          Width = 75
          Height = 25
          Caption = 'sButton1'
          TabOrder = 0
        end
        object sButton2: TsButton
          Tag = 5
          Left = 88
          Top = 8
          Width = 75
          Height = 25
          Caption = 'sButton2'
          TabOrder = 1
        end
        object sButton3: TsButton
          Tag = 5
          Left = 168
          Top = 8
          Width = 75
          Height = 25
          Caption = 'sButton3'
          TabOrder = 2
        end
      end
    end
  end
end
