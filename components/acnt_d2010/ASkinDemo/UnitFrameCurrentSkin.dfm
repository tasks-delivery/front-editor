inherited Frame_CurrentSkin: TFrame_CurrentSkin
  Width = 714
  Height = 419
  object sHTMLLabel1: TsHTMLLabel [0]
    Left = 358
    Top = 304
    Width = 343
    Height = 97
    AutoSize = False
    Caption = 
      '<a href="http://www.alphaskins.com/showdoc.php?l=en&n=0&d=1000">' +
      'Learn more</a> about the package features, tips and tricks<br>'#13'D' +
      'ownload and try <a href="http://www.alphaskins.com/ademos.php?d=' +
      '1000">more demo programs</a>'
    Layout = tlCenter
  end
  object SkinsDirectoryEdit: TsDirectoryEdit [1]
    Tag = 5
    Left = 358
    Top = 18
    Width = 320
    Color = clWhite
    MaxLength = 255
    TabOrder = 0
    Text = ''
    OnChange = SkinsDirectoryEditChange
    CheckOnExit = True
    BoundLabel.Active = True
    BoundLabel.Indent = 2
    BoundLabel.Caption = 'Path to external skins: (*.asz files)'
    SkinData.SkinSection = 'EDIT'
    SkinData.OuterEffects.Visibility = ovAlways
    Root = 'rfDesktop'
    ShowRootBtns = True
  end
  object sGroupBox2: TsGroupBox [2]
    Left = 20
    Top = 68
    Width = 320
    Height = 313
    Caption = 'Some options'
    TabOrder = 2
    CaptionLayout = clTopCenter
    CaptionMargin.Left = 6
    CaptionMargin.Top = 3
    CaptionMargin.Right = 6
    CaptionMargin.Bottom = 3
    SkinData.SkinSection = 'PANEL_LOW'
    SkinData.OuterEffects.Visibility = ovAlways
    CaptionSkin = 'PANEL'
    ImageIndex = 3
    object SliderExtBorders: TsSlider
      Tag = 5
      Left = 271
      Top = 99
      Width = 35
      Height = 17
      TabOrder = 0
      SkinData.OuterEffects.Visibility = ovAlways
      BoundLabel.Active = True
      BoundLabel.AllowClick = True
      BoundLabel.Indent = 4
      BoundLabel.Caption = 'Enable the Extended Borders mode:'
      ImageIndexOff = 0
      ImageIndexOn = 0
      ContentPlacing = scpBackground
      ThumbSizeInPercent = 45
      UseSymbols = True
      OnSliderChange = SliderExtBordersSliderChange
    end
    object SliderDiscolor: TsSlider
      Tag = 5
      Left = 271
      Top = 41
      Width = 35
      Height = 17
      TabOrder = 1
      SkinData.OuterEffects.Visibility = ovAlways
      BoundLabel.Active = True
      BoundLabel.AllowClick = True
      BoundLabel.Indent = 4
      BoundLabel.Caption = 'Discolored glyphs in buttons, menus, etc:'
      GlyphIndexOff = 5
      GlyphIndexOn = 6
      ImageIndexOff = 5
      ImageIndexOn = 6
      ContentPlacing = scpBackground
      ThumbSizeInPercent = 45
      UseSymbols = True
      OnSliderChange = SliderDiscolorSliderChange
    end
    object SliderNonClient: TsSlider
      Tag = 5
      Left = 271
      Top = 70
      Width = 35
      Height = 17
      TabOrder = 2
      SkinData.OuterEffects.Visibility = ovAlways
      BoundLabel.Active = True
      BoundLabel.AllowClick = True
      BoundLabel.Indent = 4
      BoundLabel.Caption = 'Draw non-client area of forms:'
      ImageIndexOff = 0
      ImageIndexOn = 0
      ContentPlacing = scpBackground
      ThumbSizeInPercent = 45
      UseSymbols = True
      OnSliderChange = SliderNonClientSliderChange
    end
    object SliderBlendOnMove: TsSlider
      Tag = 5
      Left = 271
      Top = 127
      Width = 35
      Height = 17
      TabOrder = 3
      SkinData.OuterEffects.Visibility = ovAlways
      BoundLabel.Active = True
      BoundLabel.AllowClick = True
      BoundLabel.Indent = 4
      BoundLabel.Caption = 'Blend a form when this form is moved:'
      ImageIndexOff = 0
      ImageIndexOn = 0
      ContentPlacing = scpBackground
      ThumbSizeInPercent = 45
      UseSymbols = True
      OnSliderChange = SliderBlendOnMoveSliderChange
    end
    object sComboBox1: TsComboBox
      Left = 176
      Top = 275
      Width = 109
      Height = 22
      BoundLabel.Active = True
      BoundLabel.Caption = 'Arrows style:'
      SkinData.SkinSection = 'GROUPBOX'
      Style = csOwnerDrawFixed
      ItemIndex = 4
      TabOrder = 4
      Text = 'Default'
      OnChange = sComboBox1Change
      OnDrawItem = sComboBox1DrawItem
      Items.Strings = (
        '0'
        '1'
        '2'
        '3'
        'Default')
    end
    object sGroupBox3: TsGroupBox
      Left = 28
      Top = 164
      Width = 269
      Height = 97
      Caption = 'Fonts management'
      TabOrder = 5
      CaptionLayout = clTopCenter
      Images = MainForm.sCharImageList1
      ImageIndex = 9
      object sComboBox2: TsComboBox
        Left = 68
        Top = 27
        Width = 189
        BoundLabel.Active = True
        BoundLabel.Caption = 'Mode:'
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 0
        Text = 'Font stored in the skin'
        OnChange = sComboBox2Change
        Items.Strings = (
          'Default font (do not change)'
          'Font stored in the skin'
          'Custom...')
      end
      object sComboBox3: TsComboBox
        Left = 68
        Top = 59
        Width = 189
        BoundLabel.Active = True
        BoundLabel.Caption = 'Custom:'
        Style = csDropDownList
        Enabled = False
        ItemIndex = 2
        TabOrder = 1
        Text = 'Comic Sans MS'
        OnChange = sComboBox3Change
        Items.Strings = (
          'Arial'
          'Calibri'
          'Comic Sans MS')
      end
    end
  end
  object sGroupBox1: TsGroupBox [3]
    Left = 358
    Top = 68
    Width = 320
    Height = 213
    Caption = 'Skin colorization'
    TabOrder = 1
    CaptionLayout = clTopCenter
    CaptionMargin.Left = 6
    CaptionMargin.Top = 3
    CaptionMargin.Right = 6
    CaptionMargin.Bottom = 3
    SkinData.SkinSection = 'PANEL_LOW'
    SkinData.OuterEffects.Visibility = ovAlways
    CaptionSkin = 'PANEL'
    ImageIndex = 8
    object sLabel2: TsLabel
      Left = 285
      Top = 98
      Width = 7
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '0'
    end
    object sLabel1: TsLabel
      Left = 285
      Top = 38
      Width = 7
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '0'
    end
    object sLabel3: TsLabel
      Left = 285
      Top = 154
      Width = 7
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '0'
    end
    object sLabel4: TsLabel
      Left = 51
      Top = 63
      Width = 7
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '0'
      Enabled = False
    end
    object sLabel5: TsLabel
      Left = 265
      Top = 63
      Width = 21
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '360'
      Enabled = False
    end
    object sLabel6: TsLabel
      Left = 42
      Top = 119
      Width = 26
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '-100'
      Enabled = False
    end
    object sLabel7: TsLabel
      Left = 265
      Top = 119
      Width = 21
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = '100'
      Enabled = False
    end
    object sLabel8: TsLabel
      Left = 142
      Top = 63
      Width = 61
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = 'HUE Offset'
    end
    object sLabel9: TsLabel
      Left = 143
      Top = 119
      Width = 59
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = 'Saturation'
    end
    object sLabel10: TsLabel
      Left = 44
      Top = 175
      Width = 19
      Height = 16
      Alignment = taCenter
      SkinManager = MainForm.sSkinManager1
      Caption = '-50'
      Enabled = False
    end
    object sLabel11: TsLabel
      Left = 265
      Top = 175
      Width = 14
      Height = 16
      Alignment = taCenter
      SkinManager = MainForm.sSkinManager1
      Caption = '50'
      Enabled = False
    end
    object sLabel12: TsLabel
      Left = 142
      Top = 175
      Width = 59
      Height = 16
      SkinManager = MainForm.sSkinManager1
      Caption = 'Brightness'
    end
    object sTrackBar2: TsTrackBar
      Tag = 5
      Left = 40
      Top = 93
      Width = 243
      Height = 24
      Max = 100
      Min = -100
      PageSize = 24
      Frequency = 20
      TabOrder = 1
      TickStyle = tsNone
      OnChange = sTrackBar2Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
      ShowProgressFrom = -100
    end
    object sTrackBar1: TsTrackBar
      Tag = 5
      Left = 40
      Top = 33
      Width = 243
      Height = 28
      Max = 360
      PageSize = 24
      Frequency = 36
      TabOrder = 0
      TickStyle = tsNone
      OnChange = sTrackBar1Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
      OnSkinPaint = sTrackBar1SkinPaint
    end
    object sTrackBar3: TsTrackBar
      Tag = 5
      Left = 40
      Top = 149
      Width = 243
      Height = 24
      Max = 100
      Min = -100
      PageSize = 24
      Frequency = 20
      TabOrder = 2
      TickStyle = tsNone
      OnChange = sTrackBar3Change
      SkinData.SkinSection = 'TRACKBAR'
      ShowProgress = True
      ShowProgressFrom = -100
    end
  end
end
