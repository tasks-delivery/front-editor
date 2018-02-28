object FormCharListEditor: TFormCharListEditor
  Left = 393
  Top = 304
  Caption = 'FormCharListEditor'
  ClientHeight = 392
  ClientWidth = 796
  Color = clBtnFace
  Constraints.MinHeight = 430
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 505
    Top = 0
    Width = 291
    Height = 373
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object sPanel2: TsPanel
      Tag = 2
      Left = 0
      Top = 0
      Width = 291
      Height = 373
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        291
        373)
      object sButton1: TsBitBtn
        Left = 121
        Top = 338
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = sButton1Click
        ImageIndex = 0
        Images = acDM.sCharImageList1
      end
      object sButton2: TsBitBtn
        Left = 202
        Top = 338
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
        ImageIndex = 12
        Images = acDM.sCharImageList1
      end
      object sPageControl1: TsPageControl
        Left = 12
        Top = 4
        Width = 265
        Height = 325
        ActivePage = sTabSheet2
        Anchors = [akLeft, akTop, akBottom]
        Images = acDM.sCharImageList1
        TabHeight = 26
        TabOrder = 2
        OnChange = sPageControl1Change
        AccessibleDisabledPages = False
        TabPadding = 2
        object sTabSheet1: TsTabSheet
          BorderWidth = 3
          Caption = 'System fonts'
          ImageIndex = 5
          object sListBox1: TsListBox
            Left = 0
            Top = 25
            Width = 251
            Height = 258
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            Columns = 2
            ParentFont = False
            TabOrder = 0
            OnClick = sListBox1Click
            BoundLabel.Caption = 'Font name:'
            BoundLabel.Layout = sclLeftTop
          end
          object sComboBox1: TsComboBox
            Left = 0
            Top = 0
            Width = 251
            Height = 21
            Align = alTop
            BoundLabel.Caption = 'Charset:'
            DropDownCount = 20
            Style = csDropDownList
            ItemIndex = -1
            ParentFont = False
            TabOrder = 1
            OnChange = sComboBox1Change
            Items.Strings = (
              'ANSI_CHARSET'
              'DEFAULT_CHARSET'
              'SYMBOL_CHARSET'
              'SHIFTJIS_CHARSET'
              'HANGEUL_CHARSET'
              'GB2312_CHARSET'
              'CHINESEBIG5_CHARSET'
              'OEM_CHARSET'
              'JOHAB_CHARSET'
              'HEBREW_CHARSET'
              'ARABIC_CHARSET'
              'GREEK_CHARSET'
              'TURKISH_CHARSET'
              'VIETNAMESE_CHARSET'
              'THAI_CHARSET'
              'EASTEUROPE_CHARSET'
              'RUSSIAN_CHARSET'
              'MAC_CHARSET'
              'BALTIC_CHARSET')
          end
        end
        object sTabSheet2: TsTabSheet
          BorderWidth = 3
          Caption = 'Embedded fonts'
          ImageIndex = 1
          object sListBox2: TsListBox
            Left = 0
            Top = 29
            Width = 251
            Height = 254
            Align = alClient
            ParentFont = False
            TabOrder = 0
            OnClick = sListBox2Click
            BoundLabel.Layout = sclLeftTop
            OnBeforeItemDraw = sListBox2BeforeItemDraw
          end
          object sPanel4: TsPanel
            Left = 0
            Top = 0
            Width = 251
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object sSpeedButton5: TsSpeedButton
              Left = 0
              Top = 0
              Width = 105
              Height = 25
              Align = alClient
              Caption = 'Add fonts...'
              Flat = True
              OnClick = sSpeedButton5Click
              Images = acDM.sCharImageList1
              ImageIndex = 2
            end
            object sSpeedButton6: TsSpeedButton
              Left = 172
              Top = 0
              Width = 79
              Height = 25
              Align = alRight
              Caption = 'Clear all'
              Flat = True
              OnClick = sSpeedButton6Click
              Images = acDM.sCharImageList1
              ImageIndex = 6
            end
            object sSpeedButton7: TsSpeedButton
              Left = 105
              Top = 0
              Width = 67
              Height = 25
              Align = alRight
              Caption = 'Delete'
              Enabled = False
              Flat = True
              OnClick = sSpeedButton7Click
              Images = acDM.sCharImageList1
              ImageIndex = 3
            end
          end
          object sPanel5: TsPanel
            Left = 0
            Top = 25
            Width = 251
            Height = 4
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
          end
        end
      end
    end
  end
  object sStatusBar1: TsStatusBar
    Left = 0
    Top = 373
    Width = 796
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Panels = <
      item
        Alignment = taRightJustify
        Text = 'Size:'
        Width = 46
      end
      item
        Width = 80
      end
      item
        Alignment = taRightJustify
        Text = 'CharCode:'
        Width = 80
      end
      item
        Width = 70
      end
      item
        Alignment = taRightJustify
        Text = 'Font name:'
        Width = 110
      end
      item
        Width = 1000
      end>
    UseSystemFont = False
  end
  object sPanel3: TsPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 373
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object sPanel6: TsPanel
      Left = 0
      Top = 0
      Width = 505
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 0
      object sSpeedButton1: TsSpeedButton
        Left = 4
        Top = 4
        Width = 101
        Height = 25
        Align = alLeft
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Add new'
        Flat = True
        OnMouseDown = sSpeedButton1MouseDown
        OnMouseUp = sSpeedButton1MouseUp
        ButtonStyle = tbsDropDown
        Images = acDM.sCharImageList1
        ImageIndex = 2
      end
      object sSpeedButton2: TsSpeedButton
        Left = 202
        Top = 4
        Width = 92
        Height = 25
        Align = alLeft
        Caption = 'Delete'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4013373
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = sSpeedButton2Click
        Images = acDM.sCharImageList1
        ImageIndex = 3
      end
      object sSpeedButton4: TsSpeedButton
        Left = 294
        Top = 4
        Width = 92
        Height = 25
        Align = alLeft
        Caption = 'Remove all'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4013373
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = sSpeedButton4Click
        Images = acDM.sCharImageList1
        ImageIndex = 6
      end
      object sSpeedButton3: TsSpeedButton
        Tag = 1
        Left = 105
        Top = 4
        Width = 97
        Height = 25
        Align = alLeft
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Replace'
        Flat = True
        OnMouseDown = sSpeedButton3MouseDown
        OnMouseUp = sSpeedButton1MouseUp
        ButtonStyle = tbsDropDown
        Images = acDM.sCharImageList1
        ImageIndex = 19
      end
    end
    object sListView1: TsListView
      Left = 4
      Top = 34
      Width = 501
      Height = 335
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <>
      DragMode = dmAutomatic
      HideSelection = False
      ReadOnly = True
      ParentFont = False
      TabOrder = 1
      ViewStyle = vsSmallIcon
      OnClick = sListView1Click
      OnDragDrop = sListView1DragDrop
      OnDragOver = sListView1DragOver
    end
  end
  object sCharImageList1: TsCharImageList
    EmbeddedFonts = <>
    Items = <>
    Left = 202
    Top = 129
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 230
    Top = 129
  end
  object sOpenDialog1: TsOpenDialog
    DefaultExt = '*.ttf'
    Filter = 'TrueType fonts|*.ttf'
    Options = [ofAllowMultiSelect, ofEnableSizing]
    Left = 259
    Top = 129
  end
end
