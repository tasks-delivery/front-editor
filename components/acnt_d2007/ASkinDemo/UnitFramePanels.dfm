inherited Frame_Panels: TFrame_Panels
  Width = 618
  Height = 465
  object sComboBox2: TsComboBox [0]
    Tag = 5
    Left = 180
    Top = 377
    Width = 89
    BoundLabel.Active = True
    BoundLabel.Caption = 'GroupBox.CaptionSkin:'
    DropDownCount = 10
    Style = csDropDownList
    ItemIndex = -1
    TabOrder = 2
    OnChange = sComboBox2Change
    Items.Strings = (
      'BUTTON_BIG'
      'TRANSPARENT'
      'PANEL_LOW'
      'PANEL'
      'BUTTON'
      'SPEEDBUTTON'
      'GROUPBOX'
      'DIALOG'
      'FORMTITLE'
      'DRAGBAR'
      'EDIT'
      'PROGRESSH'
      'GRIPH'
      'EXTRALINE'
      'HINT')
  end
  object sCheckBox1: TsCheckBox [1]
    Left = 304
    Top = 377
    Width = 153
    Height = 20
    Caption = 'Click splitter for sizing'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = sCheckBox1Click
  end
  object sPanel1: TsPanel [2]
    Left = 28
    Top = 16
    Width = 560
    Height = 350
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 0
    object sSplitter3: TsSplitter
      Left = 257
      Top = 0
      Width = 8
      Height = 350
      SizingByClick = True
      ShowGrip = True
      SkinData.SkinSection = 'SPLITTER'
    end
    object sContainer2: TsPanel
      Left = 265
      Top = 0
      Width = 295
      Height = 350
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 8
      Caption = ' '
      TabOrder = 0
      object sSplitter1: TsSplitter
        Left = 9
        Top = 192
        Width = 277
        Height = 8
        Cursor = crVSplit
        Align = alBottom
        ShowGrip = True
        SkinData.SkinSection = 'SPLITTER'
      end
      object sSplitter2: TsSplitter
        Left = 83
        Top = 9
        Width = 8
        Height = 183
        ShowGrip = True
        SkinData.SkinSection = 'SPLITTER'
      end
      object sPanel2: TsPanel
        Left = 9
        Top = 200
        Width = 277
        Height = 141
        Align = alBottom
        BorderWidth = 5
        Caption = ' '
        TabOrder = 0
        object sPanel6: TsPanel
          Left = 6
          Top = 6
          Width = 265
          Height = 129
          Align = alClient
          BevelOuter = bvLowered
          BorderWidth = 5
          Caption = ' '
          TabOrder = 0
          object sPanel7: TsPanel
            Left = 6
            Top = 6
            Width = 253
            Height = 117
            Align = alClient
            BorderWidth = 5
            TabOrder = 0
            SkinData.SkinSection = 'PANEL'
          end
        end
      end
      object sPanel3: TsPanel
        Left = 9
        Top = 9
        Width = 74
        Height = 183
        Align = alLeft
        TabOrder = 2
      end
      object sPanel4: TsPanel
        Left = 91
        Top = 9
        Width = 195
        Height = 183
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
      end
    end
    object sGroupBox1: TsGroupBox
      Left = 0
      Top = 0
      Width = 257
      Height = 350
      Align = alLeft
      Caption = 'Panel sample'
      TabOrder = 1
      CaptionLayout = clTopCenter
      SkinData.SkinSection = 'GROUPBOX'
      object sPanel8: TsPanel
        Left = 20
        Top = 18
        Width = 221
        Height = 212
        TabOrder = 0
        object sRollOutPanel1: TsRollOutPanel
          Left = 45
          Top = 10
          Width = 128
          Height = 128
          Caption = 'sRollOutPanel1'
          TabOrder = 0
          ImageIndexCollapsed = 9
          ImageIndexExpanded = 11
          Collapsed = True
          AutoHide = True
          AutoShow = True
          Placement = asLeft
          object sLabel1: TsLabel
            Left = 16
            Top = 16
            Width = 43
            Height = 16
            Caption = 'sLabel1'
          end
          object sButton1: TsButton
            Left = 16
            Top = 74
            Width = 73
            Height = 25
            Caption = 'sButton1'
            TabOrder = 0
          end
          object sEdit1: TsEdit
            Left = 16
            Top = 38
            Width = 73
            TabOrder = 1
            Text = 'sEdit1'
          end
        end
        object sComboBox3: TsComboBox
          Left = 120
          Top = 178
          Width = 80
          BoundLabel.Active = True
          BoundLabel.Caption = 'Title placement:'
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 1
          Text = 'asLeft'
          OnChange = sComboBox3Change
          Items.Strings = (
            'asLeft'
            'asTop'
            'asRight'
            'asBottom')
        end
        object sCheckBox2: TsCheckBox
          Left = 35
          Top = 152
          Width = 79
          Height = 20
          Caption = 'AutoHide'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = sCheckBox2Click
        end
        object sCheckBox3: TsCheckBox
          Left = 120
          Top = 152
          Width = 86
          Height = 20
          Caption = 'AutoShow'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = sCheckBox3Click
        end
      end
      object sComboBox1: TsComboBox
        Tag = 5
        Left = 168
        Top = 315
        Width = 73
        BoundLabel.Active = True
        BoundLabel.Caption = 'SkinSection property:'
        DropDownCount = 10
        Style = csDropDownList
        ItemIndex = -1
        TabOrder = 1
        OnChange = sComboBox1Change
        Items.Strings = (
          ''
          'BUTTON_BIG'
          'TRANSPARENT'
          'PANEL_LOW'
          'PANEL'
          'BUTTON'
          'SPEEDBUTTON'
          'GROUPBOX'
          'DIALOG'
          'FORMTITLE'
          'DRAGBAR'
          'EDIT'
          'PROGRESSH'
          'GRIPH'
          'EXTRALINE'
          'HINT'
          'BUTTON_HUGE')
      end
      object sRadioGroup1: TsRadioGroup
        Left = 20
        Top = 236
        Width = 221
        Height = 69
        Caption = 'Bevel'
        TabOrder = 2
        OnClick = sRadioGroup1Click
        SkinData.SkinSection = 'GROUPBOX'
        Columns = 2
        ItemIndex = 2
        ContentVOffset = 4
        Items.Strings = (
          'bvNone'
          'bvLowered'
          'bvRaised'
          'bvSpace')
      end
    end
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 8
    Top = 10
  end
end
