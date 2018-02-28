inherited Frame_TabControls: TFrame_TabControls
  Height = 421
  object sPageControl1: TsPageControl [0]
    Left = 0
    Top = 0
    Width = 704
    Height = 386
    ActivePage = sTabSheet1
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    HotTrack = True
    Images = MainForm.sCharImageList1
    MultiLine = True
    TabHeight = 28
    TabOrder = 0
    ActiveIsBold = True
    ShowCloseBtns = True
    AllowTabsDrag = True
    TabAlignment = taLeftJustify
    OnCloseBtnClick = sPageControl1CloseBtnClick
    object sTabSheet1: TsTabSheet
      Caption = '1'
      ImageIndex = 15
      SkinData.SkinSection = 'TABSHEET'
      object sPageControl2: TsPageControl
        Tag = 2
        Left = 30
        Top = 16
        Width = 339
        Height = 181
        ActivePage = sTabSheet8
        HotTrack = True
        MultiLine = True
        TabHeight = 100
        TabOrder = 0
        TabPosition = tpLeft
        TabWidth = 27
        AccessibleDisabledPages = False
        ActiveIsBold = True
        RotateCaptions = True
        ShowCloseBtns = True
        ShowFocus = False
        ActiveTabEnlarged = False
        TabAlignment = taLeftJustify
        object sTabSheet8: TsTabSheet
          Caption = 'Blue'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 8
          ParentFont = False
          SkinData.CustomFont = True
          object sPanel1: TsPanel
            Tag = 10
            Left = 71
            Top = 58
            Width = 89
            Height = 57
            Anchors = []
            BevelOuter = bvNone
            Color = clBlue
            TabOrder = 0
            SkinData.CustomColor = True
          end
        end
        object sTabSheet9: TsTabSheet
          Caption = 'Red'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 10
          ParentFont = False
          SkinData.CustomFont = True
          object sPanel2: TsPanel
            Left = 71
            Top = 58
            Width = 89
            Height = 57
            Anchors = []
            BevelOuter = bvNone
            Color = clRed
            TabOrder = 0
            SkinData.CustomColor = True
          end
        end
        object sTabSheet10: TsTabSheet
          Caption = 'Green'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 9
          ParentFont = False
          SkinData.CustomFont = True
          object sPanel3: TsPanel
            Left = 71
            Top = 58
            Width = 89
            Height = 57
            Anchors = []
            BevelOuter = bvNone
            Color = clGreen
            TabOrder = 0
            SkinData.CustomColor = True
          end
        end
        object sTabSheet11: TsTabSheet
          Caption = 'Yellow'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clOlive
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ImageIndex = 11
          ParentFont = False
          SkinData.CustomFont = True
          object sPanel4: TsPanel
            Left = 71
            Top = 58
            Width = 89
            Height = 57
            Anchors = []
            BevelOuter = bvNone
            Color = clYellow
            ParentBackground = False
            TabOrder = 0
            SkinData.CustomColor = True
          end
        end
      end
      object sCheckBox17: TsCheckBox
        Left = 416
        Top = 122
        Width = 114
        Height = 20
        Caption = 'RotateCaptions'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = sCheckBox17Click
      end
      object sCheckBox4: TsCheckBox
        Left = 416
        Top = 76
        Width = 132
        Height = 20
        Caption = 'Use the Font color'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = sCheckBox4Click
      end
      object sCheckBox5: TsCheckBox
        Left = 416
        Top = 99
        Width = 138
        Height = 20
        Caption = 'Active tab enlarged'
        TabOrder = 3
        OnClick = sCheckBox5Click
      end
      object sCheckBox6: TsCheckBox
        Left = 416
        Top = 53
        Width = 103
        Height = 20
        Caption = 'Active is bold'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = sCheckBox6Click
      end
      object sRadioGroup1: TsRadioGroup
        Left = 15
        Top = 216
        Width = 121
        Height = 112
        Caption = 'Tab alignment'
        Enabled = False
        TabOrder = 5
        OnClick = sRadioGroup1Click
        SkinData.SkinSection = 'GROUPBOX'
        ItemIndex = 0
        ContentVOffset = 4
        Items.Strings = (
          'taLeftJustify'
          'taRightJustify'
          'taCenter')
      end
      object sCheckBox8: TsCheckBox
        Tag = 5
        Left = 416
        Top = 30
        Width = 75
        Height = 20
        Caption = 'Multiline'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 6
        OnClick = sCheckBox8Change
      end
      object sRadioGroup2: TsRadioGroup
        Tag = 5
        Left = 413
        Top = 189
        Width = 103
        Height = 139
        Caption = 'Tabs position'
        TabOrder = 7
        OnClick = sRadioGroup2Click
        SkinData.SkinSection = 'GROUPBOX'
        ItemIndex = 2
        ContentVOffset = 8
        Items.Strings = (
          'tpTop'
          'tpBottom'
          'tpLeft'
          'tpRight')
      end
      object sRadioGroup3: TsRadioGroup
        Left = 143
        Top = 216
        Width = 119
        Height = 112
        Caption = 'Tab style'
        Enabled = False
        TabOrder = 8
        OnClick = sRadioGroup3Click
        SkinData.SkinSection = 'GROUPBOX'
        ItemIndex = 0
        ContentVOffset = 4
        Items.Strings = (
          'tsTabs'
          'tsButtons'
          'tsFlatButtons')
      end
      object sGroupBox1: TsGroupBox
        Left = 269
        Top = 216
        Width = 137
        Height = 112
        Caption = 'Disable last 2 tabs'
        TabOrder = 9
        SkinData.SkinSection = 'GROUPBOX'
        CheckBoxVisible = True
        OnCheckBoxChanged = sGroupBox1CheckBoxChanged
        object sCheckBox3: TsCheckBox
          Left = 16
          Top = 32
          Width = 105
          Height = 65
          Caption = 'Accessible disabled pages'
          AutoSize = False
          Enabled = False
          TabOrder = 0
          OnClick = sCheckBox3Click
          TextIndent = 4
          WordWrap = True
        end
      end
      object sRadioGroup4: TsRadioGroup
        Left = 523
        Top = 189
        Width = 158
        Height = 139
        Caption = 'Show Close buttons'
        TabOrder = 10
        SkinData.SkinSection = 'GROUPBOX'
        CheckBoxVisible = True
        Checked = True
        OnCheckBoxChanged = sRadioGroup4CheckBoxChanged
        ItemIndex = 0
        ContentVOffset = 8
        Items.Strings = (
          'Always'
          'ActiveTab'
          'UnactiveTabs'
          'MouseHovered')
        DisableItemsIfUnchecked = True
        OnChange = sRadioGroup4Change
      end
      object sCheckBox1: TsCheckBox
        Left = 416
        Top = 145
        Width = 198
        Height = 20
        Caption = 'Use Close button on this page'
        Checked = True
        State = cbChecked
        TabOrder = 11
        OnClick = sCheckBox1Click
      end
    end
    object sTabSheet3: TsTabSheet
      Caption = '2'
    end
    object sTabSheet4: TsTabSheet
      Caption = '3'
      ImageIndex = 4
    end
    object sTabSheet2: TsTabSheet
      ImageIndex = 22
      TabType = ttButton
      TabSkin = 'SPEEDBUTTON'
      SkinData.SkinSection = 'TABSHEET'
      UseCloseBtn = False
      OnClickBtn = sTabSheet2ClickBtn
    end
  end
  object sComboBox1: TsComboBox [1]
    Left = 553
    Top = 392
    Width = 140
    Anchors = [akRight, akBottom]
    BoundLabel.Active = True
    BoundLabel.Caption = 'SkinSection:'
    Style = csDropDownList
    ItemIndex = -1
    TabOrder = 1
    OnChange = sComboBox1Change
    Items.Strings = (
      'TRANSPARENT'
      'PAGECONTROL'
      'PANEL'
      'PANEL_LOW'
      'GROUPBOX'
      'TOOLBAR'
      'BARPANEL')
  end
  inherited sFrameAdapter1: TsFrameAdapter
    Left = 12
    Top = 36
  end
end
